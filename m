From: Jaswinder Singh <jaswinder@infradead.org>
Date: Mon, 14 Jul 2008 12:50:08 +0000
Subject: Re: [PATCH] qla1280: use request_firmware
Message-Id: <1216039088.10198.8.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215770284.2733.10.camel@jaswinder.satnam>
	 <487B1C73.5000202@sgi.com>
In-Reply-To: <487B1C73.5000202@sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jes Sorensen <jes@sgi.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, kernel-janitors <kernel-janitors@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, linux-scsi@vger.kernel.org, hch@infradead.org

Hello Jes,

On Mon, 2008-07-14 at 11:29 +0200, Jes Sorensen wrote:
> Jaswinder Singh wrote:
> > this is a first draft; please be kind :)
> > 
> > Firmware blob is little endian looks like this...
> > 	unsigned char  Version1
> > 	unsigned char  Version2
> > 	unsigned char  Version3
> > 	unsigned char  Padding
> > 	unsigned short start_address
> > 	unsigned short data
> 
> Hello,
> 
> As the maintainer of this driver I am going to say that I think this is
> a stupid change. 

We have not changed the data.
We are passing risc_code01 data by using request_firmware when required.

If you found some problem in the code, Please let me know.

Thank you,

Jaswinder Singh.


