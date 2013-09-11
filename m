From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Sep 2013 07:38:32 +0000
Subject: [patch -resend] cciss: info leak in cciss_ioctl32_passthru()
Message-Id: <20130911073832.GB25349@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20130603092645.GD16171@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Miller <mike.miller@hp.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: iss_storagedev@hp.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Moritz Muehlenhoff <jmm@debian.org>

The arg64 struct has a hole after ->buf_size which isn't cleared.
Or if any of the calls to copy_from_user() fail then that would
cause an information leak as well.

This was assigned CVE-2013-2147.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 6374dc1..34971aa 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -1189,6 +1189,7 @@ static int cciss_ioctl32_passthru(struct block_device *bdev, fmode_t mode,
 	int err;
 	u32 cp;
 
+	memset(&arg64, 0, sizeof(arg64));
 	err = 0;
 	err | 	    copy_from_user(&arg64.LUN_info, &arg32->LUN_info,
