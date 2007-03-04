From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sun, 04 Mar 2007 05:31:38 +0000
Subject: Re: [KJ] What does (P) in /proc/modules mean?
Message-Id: <20070303213138.4ee60f0a.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
In-Reply-To: <4b4be04a0703032005j69da5ddch208f375fc8e3e12e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 4 Mar 2007 14:05:24 +1000 Badai Aqrandista wrote:

> Hi,
> 
> I have a plain kernel module like this:
> 
> #include <linux/module.h>
> #include <linux/init.h>
> 
> MODULE_AUTHOR("Badai Aqrandista");
> MODULE_LICENSE("Dual BSD/GPL");
> 
> static int cheepy_init(void)
> {
>         printk(KERN_ALERT "cheepy: Module loaded\n");
>         return 0;
> }
> 
> static void cheepy_cleanup(void)
> {
>         printk(KERN_ALERT "cheepy: Module unloaded\n");
> }
> 
> module_init(cheepy_init);
> module_exit(cheepy_cleanup);
> 
> When I load and unload it with insmod or rmmod, it does not print
> anything on the console or log. On /proc/modules, there is (P) next to
> its entry, like this:
> 
> cheepy 2560 0 - Live 0xd0a37000 (P)
> 
> What does (P) mean there?

It means Proprietary.  What kernel version are you using?

It could be a kernel bug.  What other modules do you have loaded?

I'll do some checking with your sample module.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
