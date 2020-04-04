From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 04 Apr 2020 07:06:46 +0000
Subject: Re: [PATCH] Coccinelle: zalloc-simple: Fix patch mode for dma_alloc_coherent()
Message-Id: <beeed2c8-1b5a-66a8-ec41-f5770c04bae9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alex Dewar <alex.dewar@gmx.co.uk>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>

> Commit dfd32cad146e ("dma-mapping: remove dma_zalloc_coherent()"), in
> removing dma_zalloc_coherent() treewide, inadvertently removed the patch
> rule for dma_alloc_coherent(), leaving Coccinelle unable to auto-generate
> patches for this case. Fix this.

I suggest to reconsider also the distribution of recipients for your patch
according to the fields “Cc” and “To”.

Will the software development attention grow in a way so that further
implementation details can be adjusted also for the mentioned SmPL script?

Regards,
Markus
