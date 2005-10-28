From: Greg KH <greg@kroah.com>
Date: Fri, 28 Oct 2005 20:18:35 +0000
Subject: Re: [KJ] [PATCH] add printk KERN_ constants
Message-Id: <20051028201835.GE17693@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33991444233299095=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <fe441c360510281315k6fdf011dx914dae0648e41952@mail.gmail.com>
In-Reply-To: <fe441c360510281315k6fdf011dx914dae0648e41952@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============33991444233299095==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2005 at 09:15:28PM +0100, Matthew Whitworth wrote:
> Hi,
> 
> I'm just testing the water, here's my first patch. If that's ok,
> there's a lot of things to fix in arch/sh.
> 
> Description:
> printk() calls should include appropriate KERN_* constant.
> 
> Signed-off-by: Matthew Whitworth <mwhitworth@gmail.com>
> 
> diff -uprN linux-2.6.14/arch/sh/mm/fault-nommu.c mod/arch/sh/mm/fault-nommu.c
> --- linux-2.6.14/arch/sh/mm/fault-nommu.c       2005-10-28
> 01:02:08.000000000 +0100

Patch is line-wrapped :(

> +++ mod/arch/sh/mm/fault-nommu.c        2005-10-28 20:09:18.000000000 +0100
> @@ -59,7 +59,7 @@ asmlinkage void do_page_fault(struct pt_
>                printk(KERN_ALERT "Unable to handle kernel paging request");
>        }
> 
> -       printk(" at virtual address %08lx\n", address);
> +       printk(KERN_ALERT " at virtual address %08lx\n", address);

The tabs were all eaten by your email client :(

please try again.

thanks,

greg k-h

--===============33991444233299095==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33991444233299095==--
