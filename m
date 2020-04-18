From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 18 Apr 2020 20:00:11 +0000
Subject: Re: [PATCH] m68k/PCI: Fix a memory leak in an error handling path
Message-Id: <2e00c1f1-8faa-5045-ddf5-2bf943f714f2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418070751.25420-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200418070751.25420-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-m68k@lists.linux-m68k.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

> If 'ioremap' fails, we must free 'bridge', as done in other error handling
> path bellow.

I suggest to improve this change description.

* Please avoid a typo.

* Is an imperative wording preferred?


…
> +++ b/arch/m68k/coldfire/pci.c
> @@ -216,8 +216,10 @@ static int __init mcf_pci_init(void)
…

I propose to move the pci_free_host_bridge() call for the desired
exception handling to the end of this function implementation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=c0d73a868d9b411bd2d0c8e5ff9d98bfa8563cb1#n450

Regards,
Markus
