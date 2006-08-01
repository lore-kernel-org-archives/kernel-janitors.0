From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 01 Aug 2006 21:45:45 +0000
Subject: Re: [KJ] [PATCH] apm: clean up module initalization
Message-Id: <20060801214545.GA6827@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 01, 2006 at 12:25:48PM -0400, Neil Horman wrote:
> Patch to clean up module initalization for apm.c.  I had started by auditing for
> proper return code checks in misc_register, but I found that in the event of an
> initalization failure, a proc file and a kernel thread were left hanging out.
> this patch properly cleans up those loose ends on any initalization failure.

> --- a/arch/i386/kernel/apm.c
> +++ b/arch/i386/kernel/apm.c

> -	misc_register(&apm_device);
> +	if (misc_register(&apm_device)) {
> +		printk(KERN_ERR "apm: Unable to register misc device\n");
> +		ret = -ENOMEM;
> +		goto out_thread;

misc_register() can fail for reasons other than ENOMEM.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
