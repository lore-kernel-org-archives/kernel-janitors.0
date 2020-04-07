From: Alex Dewar <alex.dewar@gmx.co.uk>
Date: Tue, 07 Apr 2020 16:03:30 +0000
Subject: Re: [PATCH] Coccinelle: zalloc-simple: Fix patch mode for dma_alloc_coherent()
Message-Id: <20200407160330.5m75sfkhrrx3wgrl@lenovo-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <beeed2c8-1b5a-66a8-ec41-f5770c04bae9@web.de>
In-Reply-To: <beeed2c8-1b5a-66a8-ec41-f5770c04bae9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr, Allison Randal <allison@lohutok.net>

On Sat, Apr 04, 2020 at 09:06:46AM +0200, Markus Elfring wrote:
> > Commit dfd32cad146e ("dma-mapping: remove dma_zalloc_coherent()"), in
> > removing dma_zalloc_coherent() treewide, inadvertently removed the patch
> > rule for dma_alloc_coherent(), leaving Coccinelle unable to auto-generate
> > patches for this case. Fix this.
>
> I suggest to reconsider also the distribution of recipients for your patch
> according to the fields “Cc” and “To”.

Good point.

>
> Will the software development attention grow in a way so that further
> implementation details can be adjusted also for the mentioned SmPL script?

I'm not sure I understand what you mean. Would you mind clarifying?

Best,
Alex

>
> Regards,
> Markus
