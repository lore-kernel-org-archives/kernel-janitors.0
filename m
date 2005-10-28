From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Fri, 28 Oct 2005 20:30:28 +0000
Subject: Re: [KJ] [PATCH] add printk KERN_ constants
Message-Id: <Pine.LNX.4.58.0510281328150.31903@shark.he.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14936868514345214=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <fe441c360510281315k6fdf011dx914dae0648e41952@mail.gmail.com>
In-Reply-To: <fe441c360510281315k6fdf011dx914dae0648e41952@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============14936868514345214==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 28 Oct 2005, Matthew Whitworth wrote:

> Hi,
>
> I'm just testing the water, here's my first patch. If that's ok,
> there's a lot of things to fix in arch/sh.
>
> Description:
> printk() calls should include appropriate KERN_* constant.

but KERN_* constants only go at the beginning of a printed line
and some (or all) of these are "continuation" lines, which
don't get the KERN* constants.
I.e.,
	printk(KERN_DEBUG "beginning of a line"); // no newline
	printk("more of the same line");
	printk("end of the line\n");
is correct.  Don't add to these.

>
> Signed-off-by: Matthew Whitworth <mwhitworth@gmail.com>
>
> diff -uprN linux-2.6.14/arch/sh/mm/fault-nommu.c mod/arch/sh/mm/fault-nommu.c
> --- linux-2.6.14/arch/sh/mm/fault-nommu.c       2005-10-28
> 01:02:08.000000000 +0100
> +++ mod/arch/sh/mm/fault-nommu.c        2005-10-28 20:09:18.000000000 +0100
> @@ -59,7 +59,7 @@ asmlinkage void do_page_fault(struct pt_
>                printk(KERN_ALERT "Unable to handle kernel paging request");
>        }
>
> -       printk(" at virtual address %08lx\n", address);
> +       printk(KERN_ALERT " at virtual address %08lx\n", address);
>        printk(KERN_ALERT "pc = %08lx\n", regs->pc);
>
>        die("Oops", regs, writeaccess);
> diff -uprN linux-2.6.14/arch/sh/mm/fault.c mod/arch/sh/mm/fault.c
> --- linux-2.6.14/arch/sh/mm/fault.c     2005-10-28 01:02:08.000000000 +0100
> +++ mod/arch/sh/mm/fault.c      2005-10-28 20:12:33.000000000 +0100
> @@ -136,7 +136,7 @@ no_context:
>                printk(KERN_ALERT "Unable to handle kernel NULL pointer
> dereference");
>        else
>                printk(KERN_ALERT "Unable to handle kernel paging request");
> -       printk(" at virtual address %08lx\n", address);
> +       printk(KERN_ALERT " at virtual address %08lx\n", address);
>        printk(KERN_ALERT "pc = %08lx\n", regs->pc);
>        asm volatile("mov.l     %1, %0"
>                     : "=r" (page)
> @@ -165,7 +165,7 @@ out_of_memory:
>                down_read(&mm->mmap_sem);
>                goto survive;
>        }
> -       printk("VM: killing process %s\n", tsk->comm);
> +       printk(KERN_ALERT "VM: killing process %s\n", tsk->comm);
>        if (user_mode(regs))
>                do_exit(SIGKILL);
>        goto no_context;

-- 
~Randy

--===============14936868514345214==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14936868514345214==--
