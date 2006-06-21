From: Domen Puncer <domen@coderock.org>
Date: Wed, 21 Jun 2006 05:36:04 +0000
Subject: Re: [KJ] [PATCH] Add missing printk() log-level constants in
Message-Id: <20060621053603.GB4805@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060621032727.72bd5e4c.volz@hrz.tu-chemnitz.de>
In-Reply-To: <20060621032727.72bd5e4c.volz@hrz.tu-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 21/06/06 03:27 +0200, Julius Volz wrote:
> Hi,
> 
> with my second patch I'll try adding some printk() log-level constants.
> Please enlighten me about any mistakes I might have made and whether
> the log-levels I chose seem appropriate...
> 
> Description:
> This patch adds some missing printk() log-level constants in
> drivers/acpi/pci_link.c.
> 
> Signed-Off-By: Julius Volz <juliusrv@gmail.com>
> 
> --- pci_link.c.orig	2006-06-21 02:39:27.000000000 +0200
> +++ pci_link.c	2006-06-21 03:19:39.000000000 +0200

Not a -p1 appliable patch (just send it to yourself, and try
to patch -p1 -i your_email when in kernel source dir).

Other than this it looks fine to me.


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
