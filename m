From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 15:48:05 +0000
Subject: [patch] ath9k: fix some debugfs output
Message-Id: <20141029154805.GC5290@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

The right shift operation has higher precedence than the mask so we
left shift by "(i * 3)" and then immediately right shift by "(i * 3)"
then we mask.  It should be left shift, mask, and then right shift.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath9k/debug.c b/drivers/net/wireless/ath/ath9k/debug.c
index 2a2a17d..c9afc15 100644
--- a/drivers/net/wireless/ath/ath9k/debug.c
+++ b/drivers/net/wireless/ath/ath9k/debug.c
@@ -455,7 +455,7 @@ static ssize_t read_file_dma(struct file *file, char __user *user_buf,
 			 "%2d          %2x      %1x     %2x           %2x\n",
 			 i, (*qcuBase & (0x7 << qcuOffset)) >> qcuOffset,
 			 (*qcuBase & (0x8 << qcuOffset)) >> (qcuOffset + 3),
-			 val[2] & (0x7 << (i * 3)) >> (i * 3),
+			 (val[2] & (0x7 << (i * 3))) >> (i * 3),
 			 (*dcuBase & (0x1f << dcuOffset)) >> dcuOffset);
 	}
 
