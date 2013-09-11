From: "Miller, Mike (OS Dev)" <Mike.Miller@hp.com>
Date: Wed, 11 Sep 2013 17:23:06 +0000
Subject: RE: [patch -resend] cpqarray: info leak in ida_locked_ioctl()
Message-Id: <48275AD710FCA34184C2B6186B4016B32D0FD6A5@G6W2491.americas.hpqcorp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130603092516.GC16171@debian> <20130911073800.GA25349@mwanda>
In-Reply-To: <20130911073800.GA25349@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chirag Kantharia <chirag.kantharia@hp.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: ISS StorageDev <iss_storagedev@hp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Moritz Muehlenhoff <jmm@debian.org>



-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
Sent: Wednesday, September 11, 2013 2:38 AM
To: Chirag Kantharia; Andrew Morton
Cc: ISS StorageDev; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Moritz Muehlenhoff
Subject: [patch -resend] cpqarray: info leak in ida_locked_ioctl()

The pciinfo struct has a two byte hole after ->dev_fn so stack information could be leaked to the user.

This was assigned CVE-2013-2147.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Mike Miller <mike.miller@hp.com>

diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c index 639d26b..2b94403 100644
--- a/drivers/block/cpqarray.c
+++ b/drivers/block/cpqarray.c
@@ -1193,6 +1193,7 @@ out_passthru:
 		ida_pci_info_struct pciinfo;
 
 		if (!arg) return -EINVAL;
+		memset(&pciinfo, 0, sizeof(pciinfo));
 		pciinfo.bus = host->pci_dev->bus->number;
 		pciinfo.dev_fn = host->pci_dev->devfn;
 		pciinfo.board_id = host->board_id;
