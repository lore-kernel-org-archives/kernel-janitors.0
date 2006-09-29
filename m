From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 29 Sep 2006 18:41:04 +0000
Subject: Re: [KJ] [PATCH] ioremap balanced with iounmap for drivers/video
Message-Id: <20060929114104.56b08a74.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158842563.28299.145.camel@amol.verismonetworks.com>
In-Reply-To: <1158842563.28299.145.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 29 Sep 2006 11:43:28 -0300 Mauro Carvalho Chehab wrote:

> Amol,
> 
> We are not responsible for video adapter drivers, but, instead, for
> video capture adapters. I suggest you to send your patch to LKML, where
> all kernel maintainers are (linux-kernel@vger.kernel.org).

SCSI maintainer doesn't follow lkml.  There could be others as well.
network drivers definitely should go to netdev mailing list.
video adapter drivers could also go to linux-fbdev mailing list...

lkml is not the answer for everything IHHO.

However, if Andrew Morton picks up the patch, he will likely
test it in -mm for awhile and then forward it to the correct
people so that they can merge it.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
