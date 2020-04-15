From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Apr 2020 22:54:11 +0000
Subject: [PATCH] media: davinci: remove redundant assignment to pointer 'common'
Message-Id: <20200415225411.1565933-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lad Prabhakar <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'common' is being assigned with a value that is never read,
the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/davinci/vpif_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index ead14c49d4f5..7d55fd45240e 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -1225,7 +1225,6 @@ static int vpif_probe_complete(void)
 probe_out:
 	for (k = 0; k < j; k++) {
 		ch = vpif_obj.dev[k];
-		common = &ch->common[k];
 		video_unregister_device(&ch->video_dev);
 	}
 	return err;
-- 
2.25.1
