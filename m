From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Apr 2020 15:25:50 +0000
Subject: Re: Coccinelle: zalloc-simple: Fix patch mode for dma_alloc_coherent()
Message-Id: <6f0fee23-2de9-d322-0e11-2a117e56cdf4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <beeed2c8-1b5a-66a8-ec41-f5770c04bae9@web.de>
 <20200407160330.5m75sfkhrrx3wgrl@lenovo-laptop>
 <045a4a1a-c841-2979-c899-b632ca418b3b@web.de>
 <20200409114450.io57vlnrzotsemqp@medion>
In-Reply-To: <20200409114450.io57vlnrzotsemqp@medion>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alex Dewar <alex.dewar@gmx.co.uk>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>

> What should I be looking for in the archives?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/coccinelle/api/alloc/zalloc-simple.cocci?id=dfd32cad146e3624970eee9329e99d2c6ef751b3

Several software development discussions might be interesting
also before the change “dma-mapping: remove dma_zalloc_coherent()”.


> I've referenced what I think is the relevant commit here.

How do you think about the extend the software development background
another bit?


> I have replied to these messages now.

Do you refer to your response from 2020-04-07?
https://systeme.lip6.fr/pipermail/cocci/2020-April/007102.html
https://lore.kernel.org/cocci/20200407155005.rdyiu7xqss57rzhq@lenovo-laptop/

* You proposed a change for this SmPL script which contains programming mistakes.

* Would you like to achieve the restore of a SmPL code variant
  from a published patch hunk instead?

* Will the software development attention grow also around the recurring topic
  “Code duplications in SmPL disjunctions”?

Regards,
Markus
