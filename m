From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 12 Jul 2008 07:35:04 +0000
Subject: Re: [PATCH] init: fix sparse warnings
Message-Id: <20080712073504.GA31600@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 12, 2008 at 01:00:40PM +0530, Jaswinder Singh wrote:
> --- a/init/do_mounts_initrd.c
> +++ b/init/do_mounts_initrd.c
> @@ -16,6 +16,26 @@ unsigned int real_root_dev;	/* do_proc_dointvec cannot handle kdev_t */
>  static int __initdata old_fd, root_fd;
>  static int __initdata mount_initrd = 1;
>  
> +const char __user cuold[] = "/old";
> +char __user uold[] = "/old";
> +const char __user curoot[] = "/";
> +char __user uroot[] = "/";
> +const char __user curootroot[] = "/root";
> +char __user urootroot[] = "/root";
> +const char __user cudot[] = ".";
> +char __user udot[] = ".";
> +const char __user cuinitrd[] = "/root/initrd";
> +char __user uinitrd[] = "/root/initrd";
> +/* devs */
> +const char __user cudevram[] = "/dev/ram";
> +char __user udevram[] = "/dev/ram";
> +const char __user cudevconsole[] = "/dev/console";
> +char __user udevconsole[] = "/dev/console";
> +const char __user cudevroot[] = "/dev/root";
> +char __user udevroot[] = "/dev/root";
> +const char __user cudevrootold[] = "/dev/root.old";
> +char __user udevrootold[] = "/dev/root.old";

Oh, c'mon!

