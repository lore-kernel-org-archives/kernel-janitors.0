From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Thu, 16 Nov 2006 08:36:37 +0000
Subject: Re: [KJ] adds some more checks to values returned by function
Message-Id: <b6fcc0a0611160036x48858ba8w3f33d233723ac99@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aac3c260611081502t6f1f7d0atbc25d8f4e843c8@mail.gmail.com>
In-Reply-To: <2aac3c260611081502t6f1f7d0atbc25d8f4e843c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/16/06, Randy Dunlap <rdunlap@xenotime.net> wrote:
> > From f80156a683beb0d2e580cb95fc6c78f7934335e0 Mon Sep 17 00:00:00 2001
> > From: Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com>
>
> What does the first From line mean?

That must be git-email output or something.

> +			printk("hppfs_read : copy_to_user failed, returned %d\n", err);
>
> a.  printk() calls should use a KERN_* level.
> b.  We try to limit source lines to <= 80 columns, so this one needs
> 	to be split.
> c.  However, this is noise.  There shouldn't be a printk() call here
> 	at all.

Especially if they can be used to fill logs by localhost lusers.

> Drop it
>
> +			return(err);
>
> no parens around the return value. (ugh, uses source file style)

Compared to not returning -EFAULT that's OK :-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
