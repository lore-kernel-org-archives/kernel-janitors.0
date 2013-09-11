From: "Miller, Mike (OS Dev)" <Mike.Miller@hp.com>
Date: Wed, 11 Sep 2013 18:13:31 +0000
Subject: RE: [patch -resend] cciss: info leak in cciss_ioctl32_passthru()
Message-Id: <48275AD710FCA34184C2B6186B4016B32D0FD7E5@G6W2491.americas.hpqcorp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130603092645.GD16171@debian> <20130911073832.GB25349@mwanda>
In-Reply-To: <20130911073832.GB25349@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: ISS StorageDev <iss_storagedev@hp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Moritz Muehlenhoff <jmm@debian.org>



-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
Sent: Wednesday, September 11, 2013 2:39 AM
To: Miller, Mike (OS Dev); Andrew Morton
Cc: ISS StorageDev; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Moritz Muehlenhoff
Subject: [patch -resend] cciss: info leak in cciss_ioctl32_passthru()

The arg64 struct has a hole after ->buf_size which isn't cleared.
Or if any of the calls to copy_from_user() fail then that would cause an information leak as well.

This was assigned CVE-2013-2147.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Mike Miller <mike.miller@hp.com>

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c index 6374dc1..34971aa 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -1189,6 +1189,7 @@ static int cciss_ioctl32_passthru(struct block_device *bdev, fmode_t mode,
 	int err;
 	u32 cp;
 
+	memset(&arg64, 0, sizeof(arg64));
 	err = 0;
 	err | 	    copy_from_user(&arg64.LUN_info, &arg32->LUN_info,
