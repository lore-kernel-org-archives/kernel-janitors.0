From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 09 Oct 2009 15:21:53 +0000
Subject: Re: [PATCH] media/video:  adding __init/__exit macros to various
Message-Id: <alpine.LSU.2.00.0910091721260.19284@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200909290219.01623.PeterHuewe@gmx.de>
In-Reply-To: <200909290219.01623.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Andy Walls <awalls@radix.net>, Mauro Carvalho Chehab <mchehab@infradead.org>, Steven Toth <stoth@kernellabs.com>, Michael Krufky <mkrufky@kernellabs.com>, Laurent Pinchart <laurent.pinchart@skynet.be>, Muralidharan Karicheri <m-karicheri2@ti.com>, Martin Dauskardt <martin.dauskardt@gmx.de>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.orgkernel-janitors@vger.kernel.org

On Tue, 29 Sep 2009, Peter Huewe wrote:

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Trivial patch which adds the __init/__exit macros to the module_init/
> module_exit functions of the following drivers in media video:
>     drivers/media/video/ivtv/ivtv-driver.c
>     drivers/media/video/cx18/cx18-driver.c
>     drivers/media/video/davinci/dm355_ccdc.c
>     drivers/media/video/davinci/dm644x_ccdc.c
>     drivers/media/video/saa7164/saa7164-core.c
>     drivers/media/video/saa7134/saa7134-core.c
>     drivers/media/video/cx23885/cx23885-core.c

This doesn't seem to be present in linux-next as of today. I have queued 
in in trivial tree.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
