From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 10 Mar 2005 10:57:13 +0000
Subject: Re: [KJ] [PATCH 1/] init/do_mounts_initrd.c: fix sparse warning
Message-Id: <200503101353.14372.adobriyan@mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503100122.28432.adobriyan@mail.ru>
In-Reply-To: <200503100122.28432.adobriyan@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[walter, I got "Sender address rejected: Access denied", replying to the list]

On Thursday 10 March 2005 10:12, walter harms wrote:

> pid  should be pid_t

Well, yes.

> because different architectures have different sizes for it.

No. pid_t => __kernel_pid_t => int => 32 bit an all archs. Look at
include/asm-*/types.h and see what s32 is always typedef'ed to.

	Alexey

> > --- linux-2.6.11-bk1-sparse.orig/init/do_mounts_initrd.c
> > +++ linux-2.6.11-bk1-sparse/init/do_mounts_initrd.c

> > -	int i, pid;
> > +	int pid;

> > -		while (pid != sys_wait4(-1, &i, 0, NULL))
> > +		while (pid != sys_wait4(-1, NULL, 0, NULL))
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
