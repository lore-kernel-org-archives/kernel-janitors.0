From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 28 Oct 2005 20:50:25 +0000
Subject: Re: [KJ] [PATCH] add printk KERN_ constants
Message-Id: <20051028205025.GA7629@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12733849481010395=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <fe441c360510281315k6fdf011dx914dae0648e41952@mail.gmail.com>
In-Reply-To: <fe441c360510281315k6fdf011dx914dae0648e41952@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============12733849481010395==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2005 at 09:15:28PM +0100, Matthew Whitworth wrote:
> --- linux-2.6.14/arch/sh/mm/fault-nommu.c
> +++ mod/arch/sh/mm/fault-nommu.c
> @@ -59,7 +59,7 @@ asmlinkage void do_page_fault(struct pt_
>                printk(KERN_ALERT "Unable to handle kernel paging request");
>        }
>
> -       printk(" at virtual address %08lx\n", address);
> +       printk(KERN_ALERT " at virtual address %08lx\n", address);

Obviously wrong. This printk is a continuation of

	"Unable to handle kernel paging request"

printk and one before it. You should do nothing in this case.

Not every printk() should start with KERN_*. TODO explicitly says:

	- printk() calls should include appropriate KERN_* constant (of
	  course only at beginning of lines).

At the beginning. "at virtual address" is not at the beggining.

> --- linux-2.6.14/arch/sh/mm/fault.c
> +++ mod/arch/sh/mm/fault.c
> @@ -136,7 +136,7 @@ no_context:
>                printk(KERN_ALERT "Unable to handle kernel NULL pointer
> dereference");
>        else
>                printk(KERN_ALERT "Unable to handle kernel paging request");
> -       printk(" at virtual address %08lx\n", address);
> +       printk(KERN_ALERT " at virtual address %08lx\n", address);

Double check your arch/sh/* patchbomb.


--===============12733849481010395==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12733849481010395==--
