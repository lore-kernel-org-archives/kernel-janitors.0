From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 24 Aug 2007 20:34:39 +0000
Subject: Re: [PATCH] /drivers/char sx.c ioremap -> pci_ioremap api
Message-Id: <20070824213439.0007e653@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46CF2849.2090008@gmail.com>
	<4af2d03a0708241159v56b46299h46df9777a98590e5@mail.gmail.com>
	<20070824201530.5d741b37@the-village.bc.nu>
	<46CF399E.3010808@gmail.com>
In-Reply-To: <46CF399E.3010808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: postfail@hushmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 24 Aug 2007 22:03:42 +0200
Jiri Slaby <jirislaby@gmail.com> wrote:

> Alan Cox napsal(a):
> > ase, 0x80);
> >> remove also the hwbase var.
> >>
> >>> +	rebase = pci_iomap(pdev, 0, 0x80);
> >>>   	t = readl(rebase + CNTRL_REG_OFFSET);
> > 
> > Switch to ioread* if you are using the iomap interface. Its not a trivial
> 
> Why, if you know it's surely a mem region (and thus you rely on it and do
> ioremap)? There are many places in the kernel, where this approach is used, e.g.
> libata piix.

Every single one of them is wrong. The encoding of iomap values is
platform dependant. Fixed in my tree.
> 
> > conversion and its slower and bulkier - the original ioremap was much
> > better
> 
> at least get rid of the reading the hwbase address from pci conf space, use
> pci_resource_start instead.

Agreed entirely
