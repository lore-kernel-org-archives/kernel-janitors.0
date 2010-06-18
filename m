From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 18 Jun 2010 17:52:10 +0000
Subject: Re: Strange behavior for create_proc_read_entry
Message-Id: <20100618105210.af9bf8f1.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 18 Jun 2010 23:16:29 +0530 Prashant Shah wrote:

> Hi,
> 
> Below is a small module that I was trying out (code at the end of message)
> 
> This module creates a file called /proc/jiffies that adds a message to
> the log file using printk and shows the current jiffies value to the
> user when it is read.
> 
> If I cat the /proc/jiffies file once, in the dmesg log there are three
> entries. The function create_proc_read_entry() is calling the
> my_proc_read() thrice.
> 
> o/p :
> [  997.261195] ******** Reading jiffies files *********
> [  997.261205] ******** Reading jiffies files *********
> [  997.261233] ******** Reading jiffies files *********


Is there a question here??

Here's what I would try:  in my_proc_read(), printk the values of
off and count.

> -------------- module code ---------------
> 
> #include <linux/module.h>
> #include <linux/init.h>
> #include <linux/jiffies.h>
> #include <linux/delay.h>
> #include <linux/proc_fs.h>
> 
> #define SUCCESS 0
> static char modname[] = "jiffies";
> 
> static int my_proc_read(char *buf, char **start, off_t off,
>                 int count, int *eof, void *data)
> {
>         printk("******** Reading jiffies files *********\n");
>         return sprintf(buf, "jiffies = %lu\n", jiffies);
> }
> 
> static int __init mod_entry(void)
> {
>         printk(KERN_INFO "***** START *******\n");
>         create_proc_read_entry(modname, 0, NULL, my_proc_read, NULL);
>         return SUCCESS;
> }
> 
> static void __exit mod_exit(void)
> {
>         printk("******** END *********\n");
>         remove_proc_entry(modname, NULL);
>         return;
> }
> MODULE_LICENSE("GPL");
> module_init(mod_entry);
> module_exit(mod_exit);
> --

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
