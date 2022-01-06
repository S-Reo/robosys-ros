/*
 * copyright © 2021 S-Reo (https://github.com/S-Reo) All rights reserved
 */

#include <linux/module.h> 
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/uaccess.h>
#include <linux/io.h>
#include <linux/kernel.h>

MODULE_AUTHOR("Reo Sato & Ryuichi Ueda");
MODULE_DESCRIPTION("driver for LED Random control");
MODULE_LICENSE("GPL");
MODULE_VERSION("0.1");

#define GPFSEL0 0

static void gpio_register_init(void);

static dev_t dev;
static struct cdev cdv;
static struct class *cls = NULL;
static volatile u32 *gpio_base = NULL;

static void gpio_register_init(void)
{
	//gpiaのリマップ
	gpio_base = ioremap_nocache(0xfe200000, 0xA0);
	//0-5Highに設定
	int led=0, mask0 =0;
	for(led = 0; led < 6; led++)
	{
		
		mask0 = ~(0x07 << led*3);
		
		gpio_base[GPFSEL0] = ( (gpio_base[GPFSEL0] & mask0) | (0x01 << (led * 3)) );
		
	}
	//出力をオールクリア
	gpio_base[10] = 0x3F;

}
static ssize_t led_random_write(struct file*filp, const char* buf, size_t count, loff_t* pos)
{
	char r;
	if(copy_from_user(&r,buf,sizeof(char)))
		return -EFAULT;

	if(r!='\n')//echoで改行が入力されないようにする
	{
		u32 num = 0;
		int cast_return=10;
		//文字型の数値を数値型に変換	
		cast_return = kstrtou32(&r,10,&num);
		//gpio出力をクリア
		gpio_base[10] = 0x3F;
		//gpio出力に、取得した値を代入
		gpio_base[7] = num;
		//printk("戻り値 : %d, 変換後の値 : %d",cast_return, num);
	}
	return 1;
}
static struct file_operations led_random_fops = {
	.owner = THIS_MODULE,
	.write = led_random_write,
};

//insmodされたときに、module_initから呼び出される
static int __init init_mod(void)//カーネルモジュールの初期化
{
	int retval;

	retval = alloc_chrdev_region(&dev, 0, 1, "manyled");
	if(retval < 0){
		printk(KERN_INFO "alloc_chrdev_region failed.\n");
		return retval;
	}
	printk(KERN_INFO "%s is loaded. major:%d\n", __FILE__,MAJOR(dev));
	
	cdev_init(&cdv, &led_random_fops);
	retval = cdev_add(&cdv, dev, 1);
	if(retval < 0){
		printk(KERN_ERR "cdev_add failed. major:%d, minor:%d", MAJOR(dev), MINOR(dev));
		return retval;
	}

	cls = class_create(THIS_MODULE, "manyled");
	if(IS_ERR(cls)){
		printk(KERN_ERR "class_create failed.");
		return PTR_ERR(cls);
	}
	device_create(cls, NULL, dev, NULL, "manyled%d",MINOR(dev));

	//gpioのリマップと初期化
	gpio_register_init();
	
	return 0;
}
//rmmodしたときに、一番下の関数が実行されて呼び出される関数。
static void __exit cleanup_mod(void)//後始末
{
	cdev_del(&cdv);
	device_destroy(cls, dev);
	class_destroy(cls);
	unregister_chrdev_region(dev, 1);
	printk(KERN_INFO "%s is unloaded. major:%d\n", __FILE__,MAJOR(dev));

}
module_init(init_mod);  //マクロで関数を登録
module_exit(cleanup_mod); //同上
