From: Alex Dewar <alex.dewar@gmx.co.uk>
Date: Thu, 09 Apr 2020 11:44:50 +0000
Subject: Re: Coccinelle: zalloc-simple: Fix patch mode for dma_alloc_coherent()
Message-Id: <20200409114450.io57vlnrzotsemqp@medion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <beeed2c8-1b5a-66a8-ec41-f5770c04bae9@web.de>
 <20200407160330.5m75sfkhrrx3wgrl@lenovo-laptop>
 <045a4a1a-c841-2979-c899-b632ca418b3b@web.de>
In-Reply-To: <045a4a1a-c841-2979-c899-b632ca418b3b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr, Allison Randal <allison@lohutok.net>

On Tue, Apr 07, 2020 at 07:10:46PM +0200, Markus Elfring wrote:
> >> Will the software development attention grow in a way so that further
> >> implementation details can be adjusted also for the mentioned SmPL script?
> >
> > I'm not sure I understand what you mean. Would you mind clarifying?
>
> You would like to a change a file for which some software development
> discussions happened a while ago.
> Do you get any further ideas from available information in message archives?

Hi Markus,

What should I be looking for in the archives? I've referenced what I
think is the relevant commit here.

>
> Julia Lawall (and me) pointed special development concerns out.
>
> Example:
> Code duplications in SmPL disjunctions
> https://lore.kernel.org/cocci/alpine.DEB.2.21.2004062115000.10239@hadrien/
> https://systeme.lip6.fr/pipermail/cocci/2020-April/007099.html

I have replied to these messages now.

Best,
Alex

>
> Regards,
> Markus
