From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 24 Aug 2007 19:15:30 +0000
Subject: Re: [PATCH] /drivers/char sx.c ioremap -> pci_ioremap api
Message-Id: <20070824201530.5d741b37@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46CF2849.2090008@gmail.com>
	<4af2d03a0708241159v56b46299h46df9777a98590e5@mail.gmail.com>
In-Reply-To: <4af2d03a0708241159v56b46299h46df9777a98590e5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: postfail@hushmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

ase, 0x80);
> 
> remove also the hwbase var.
> 
> > +	rebase = pci_iomap(pdev, 0, 0x80);
> >   	t = readl(rebase + CNTRL_REG_OFFSET);

Switch to ioread* if you are using the iomap interface. Its not a trivial
conversion and its slower and bulkier - the original ioremap was much
better

NAK this change therefore
