From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2012 17:33:30 +0000
Subject: [patch] [SCSI] csiostor: remove unneeded memset()
Message-Id: <20121127173330.GD1059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: Naresh Kumar Inna <naresh@chelsio.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

No need to memset() this when we just copy over it on the next line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/csiostor/csio_lnode.c b/drivers/scsi/csiostor/csio_lnode.c
index 551959e..8b54976 100644
--- a/drivers/scsi/csiostor/csio_lnode.c
+++ b/drivers/scsi/csiostor/csio_lnode.c
@@ -245,7 +245,6 @@ csio_append_attrib(uint8_t **ptr, uint16_t type, uint8_t *val, uint16_t len)
 	len += 4;		/* includes attribute type and length */
 	len = (len + 3) & ~3;	/* should be multiple of 4 bytes */
 	ae->len = htons(len);
-	memset(ae->value, 0, len - 4);
 	memcpy(ae->value, val, len);
 	*ptr += len;
 }
