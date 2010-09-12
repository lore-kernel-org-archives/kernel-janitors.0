From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 12 Sep 2010 18:56:51 +0000
Subject: [PATCH] staging: crystalhd: fix signed bug
Message-Id: <1284317813-4895-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Jarod Wilson <jarod@redhat.com>, Manu Abraham <abraham.manu@gmail.com>, Scott Davilla <davilla@4pi.com>, Lars Lindley <lindley@coyote.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

chd_dec_major is unsigned, so check chd_dec_major < 0 doesn't make sense.
Since it is used as signed, declare it as int.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/crystalhd/crystalhd_lnx.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.h b/drivers/staging/crystalhd/crystalhd_lnx.h
index c951e43..a2b5a56 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.h
+++ b/drivers/staging/crystalhd/crystalhd_lnx.h
@@ -76,7 +76,7 @@ struct crystalhd_adp {
 	spinlock_t		lock;
 
 	/* API Related */
-	unsigned int		chd_dec_major;
+	int		chd_dec_major;
 	unsigned int		cfg_users;
 
 	struct crystalhd_ioctl_data	*idata_free_head;	/* ioctl data pool */
-- 
1.7.0.4

