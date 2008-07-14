From: Jes Sorensen <jes@sgi.com>
Date: Mon, 14 Jul 2008 09:29:23 +0000
Subject: Re: [PATCH] qla1280: use request_firmware
Message-Id: <487B1C73.5000202@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215770284.2733.10.camel@jaswinder.satnam>
In-Reply-To: <1215770284.2733.10.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, kernel-janitors <kernel-janitors@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, linux-scsi@vger.kernel.org, hch@infradead.org

Jaswinder Singh wrote:
> this is a first draft; please be kind :)
> 
> Firmware blob is little endian looks like this...
> 	unsigned char  Version1
> 	unsigned char  Version2
> 	unsigned char  Version3
> 	unsigned char  Padding
> 	unsigned short start_address
> 	unsigned short data

Hello,

As the maintainer of this driver I am going to say that I think this is
a stupid change. Yes I know that politically there's a move to make
everything use request firmware. However for my boot device, this is
going to be a royal pain in the butt for developers who wish to boot
test kernels with a / sitting on a 1280.

IMHO this patch brings us nothing, but provides a lot of unnecessary
hassle for users.

Nacked-By: Jes Sorensen <jes@sgi.com>

Regards,
Jes
