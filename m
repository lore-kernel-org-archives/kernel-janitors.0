From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2020 07:08:58 +0000
Subject: Re: [PATCH] m68k/PCI: Fix a memory leak in an error handling path
Message-Id: <CAMuHMdUDO_rTzZbtOsMvH=uFG1oytTYDdJY_WSE7+70EERDNSw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418070751.25420-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200418070751.25420-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Apr 18, 2020 at 9:07 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> If 'ioremap' fails, we must free 'bridge', as done in other error handling
> path bellow.
>
> Fixes: 19cc4c843f40 ("m68k/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
