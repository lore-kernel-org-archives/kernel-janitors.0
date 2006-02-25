From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Sat, 25 Feb 2006 12:41:44 +0000
Subject: Re: [KJ] linux-2.6.15.4/drivers/i2c/i2c-core.c.bak:  EPERM -> EINVAL
Message-Id: <200602251341.44871.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44004DD8.2040606@bfs.de>
In-Reply-To: <44004DD8.2040606@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 25 February 2006 13:30, walter harms wrote:
>   			pr_debug("i2c-core: %s used one too many times\n",
>   				__FUNCTION__);
> -			return -EPERM;
> +			return -EINVAL;
I think EBUSY would be more apprioriate here.  I'm not sure, though.  
include/asm-generic/errno-base.h has a short description for each errno.

Tim
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
