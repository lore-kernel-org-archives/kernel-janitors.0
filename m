From: Andrew Morton <akpm@linux-foundation.org>
Date: Sun, 25 Mar 2007 22:36:09 +0000
Subject: Re: [KJ] [PATCH] aoe, tb0219: fix late spin_lock_init() and friends
Message-Id: <20070325143609.75165bf6.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070325190221.GA5308@martell.zuzino.mipt.ru>
In-Reply-To: <20070325190221.GA5308@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: ecashin@coraid.com, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Sun, 25 Mar 2007 23:02:21 +0400 Alexey Dobriyan <adobriyan@gmail.com> wrote:

> Some drivers do register_chrdev() before lock or semaphore used in
> corresponding file_operations is initialized.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
>  drivers/block/aoe/aoechr.c |    4 ++--
>  drivers/char/tb0219.c      |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/drivers/block/aoe/aoechr.c
> +++ b/drivers/block/aoe/aoechr.c
> @@ -246,13 +246,13 @@ aoechr_init(void)
>  {
>  	int n, i;
>  
> +	sema_init(&emsgs_sema, 0);
> +	spin_lock_init(&emsgs_lock);
>  	n = register_chrdev(AOE_MAJOR, "aoechr", &aoe_fops);
>  	if (n < 0) { 
>  		printk(KERN_ERR "aoe: can't register char device\n");
>  		return n;
>  	}
> -	sema_init(&emsgs_sema, 0);
> -	spin_lock_init(&emsgs_lock);
>  	aoe_class = class_create(THIS_MODULE, "aoe");
>  	if (IS_ERR(aoe_class)) {
>  		unregister_chrdev(AOE_MAJOR, "aoechr");
> --- a/drivers/char/tb0219.c
> +++ b/drivers/char/tb0219.c
> @@ -287,6 +287,8 @@ static int __devinit tb0219_probe(struct
>  {
>  	int retval;
>  
> +	spin_lock_init(&tb0219_lock);
> +
>  	if (request_mem_region(TB0219_START, TB0219_SIZE, "TB0219") = NULL)
>  		return -EBUSY;
>  
> @@ -304,8 +306,6 @@ static int __devinit tb0219_probe(struct
>  		return retval;
>  	}
>  
> -	spin_lock_init(&tb0219_lock);
> -
>  	old_machine_restart = _machine_restart;
>  	_machine_restart = tb0219_restart;
>  

These locks can and should be initialised at compile-time.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
