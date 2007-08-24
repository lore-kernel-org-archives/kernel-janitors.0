From: "Jiri Slaby" <jirislaby@gmail.com>
Date: Fri, 24 Aug 2007 18:59:58 +0000
Subject: Re: [PATCH] /drivers/char sx.c ioremap -> pci_ioremap api
Message-Id: <4af2d03a0708241159v56b46299h46df9777a98590e5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46CF2849.2090008@gmail.com>
In-Reply-To: <46CF2849.2090008@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/24/07, Scott Thompson <postfailathushmail@gmail.com> wrote:
>
> patchset against 2.6.23-rc3.
>
> moves the iomap/iounmap call to pci 'flavor'.  this was a
> recommendation from a previously submitted patch that handles
> the unchecked iomap (or, now, pci_iomap) return code.
>
> Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
> ----------------------------------------------------------
>
> diff --git a/drivers/char/sx.c b/drivers/char/sx.c
> index 85a2328..481334f 100644
> --- a/drivers/char/sx.c
> +++ b/drivers/char/sx.c
> @@ -2626,14 +2626,14 @@ static void __devinit fix_sx_pci(struct pci_dev
> *pdev, struct sx_board *board)
>
>   	pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0, &hwbase);
>   	hwbase &= PCI_BASE_ADDRESS_MEM_MASK;
> -	rebase = ioremap(hwbase, 0x80);

remove also the hwbase var.

> +	rebase = pci_iomap(pdev, 0, 0x80);
>   	t = readl(rebase + CNTRL_REG_OFFSET);
>   	if (t != CNTRL_REG_GOODVALUE) {
>   		printk(KERN_DEBUG "sx: performing cntrl reg fix: %08x -> "
>   			"%08x\n", t, CNTRL_REG_GOODVALUE);
>   		writel(CNTRL_REG_GOODVALUE, rebase + CNTRL_REG_OFFSET);
>   	}
> -	iounmap(rebase);
> +	pci_iounmap(pdev, rebase);
>   }
>   #endif
>


-- 
http://www.fi.muni.cz/~xslaby/            Jiri Slaby
faculty of informatics, masaryk university, brno, cz
e-mail: jirislaby gmail com, gpg pubkey fingerprint:
B674 9967 0407 CE62 ACC8  22A0 32CC 55C3 39D4 7A7E
