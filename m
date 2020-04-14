From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Apr 2020 14:35:02 +0000
Subject: [PATCH][next] staging: vt6656: remove redundant assignment to variable ed_inx
Message-Id: <20200414143502.237803-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ed_inx is being initialized with a value that is never
read and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vt6656/baseband.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6656/baseband.c b/drivers/staging/vt6656/baseband.c
index 512d2a5b0b8e..a8bd7f9f8ada 100644
--- a/drivers/staging/vt6656/baseband.c
+++ b/drivers/staging/vt6656/baseband.c
@@ -655,7 +655,7 @@ void vnt_update_pre_ed_threshold(struct vnt_private *priv, int scanning)
 	const struct vnt_threshold *threshold = NULL;
 	u8 length;
 	u8 cr_201, cr_206;
-	u8 ed_inx = priv->bb_pre_ed_index;
+	u8 ed_inx;
 
 	switch (priv->rf_type) {
 	case RF_AL2230:
-- 
2.25.1
