From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Sun, 27 Mar 2016 19:13:03 +0000
Subject: [PATCH 5/5] staging: xgifb: fix bare use of 'unsigned'
Message-Id: <1459105983-17251-5-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnaud.patard@rtp-net.org
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'Prefer 'unsigned int' to bare use of
'unsigned''

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
 drivers/staging/xgifb/XGI_main_26.c | 5 +++--
 drivers/staging/xgifb/vb_util.h     | 8 +++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_main_26.c b/drivers/staging/xgifb/XGI_main_26.c
index 7eadf92..d56ef14 100644
--- a/drivers/staging/xgifb/XGI_main_26.c
+++ b/drivers/staging/xgifb/XGI_main_26.c
@@ -1130,8 +1130,9 @@ static int XGIfb_get_cmap_len(const struct fb_var_screeninfo *var)
 	return (var->bits_per_pixel = 8) ? 256 : 16;
 }
 
-static int XGIfb_setcolreg(unsigned regno, unsigned red, unsigned green,
-		unsigned blue, unsigned transp, struct fb_info *info)
+static int XGIfb_setcolreg(unsigned int regno, unsigned int red,
+			   unsigned int green, unsigned int blue,
+			   unsigned int transp, struct fb_info *info)
 {
 	struct xgifb_video_info *xgifb_info = info->par;
 
diff --git a/drivers/staging/xgifb/vb_util.h b/drivers/staging/xgifb/vb_util.h
index f613f54..08db58b 100644
--- a/drivers/staging/xgifb/vb_util.h
+++ b/drivers/staging/xgifb/vb_util.h
@@ -13,7 +13,7 @@ static inline u8 xgifb_reg_get(unsigned long port, u8 index)
 }
 
 static inline void xgifb_reg_and_or(unsigned long port, u8 index,
-				    unsigned data_and, unsigned data_or)
+				    unsigned int data_and, unsigned int data_or)
 {
 	u8 temp;
 
@@ -22,7 +22,8 @@ static inline void xgifb_reg_and_or(unsigned long port, u8 index,
 	xgifb_reg_set(port, index, temp);
 }
 
-static inline void xgifb_reg_and(unsigned long port, u8 index, unsigned data_and)
+static inline void xgifb_reg_and(unsigned long port, u8 index,
+				 unsigned int data_and)
 {
 	u8 temp;
 
@@ -31,7 +32,8 @@ static inline void xgifb_reg_and(unsigned long port, u8 index, unsigned data_and
 	xgifb_reg_set(port, index, temp);
 }
 
-static inline void xgifb_reg_or(unsigned long port, u8 index, unsigned data_or)
+static inline void xgifb_reg_or(unsigned long port, u8 index,
+				unsigned int data_or)
 {
 	u8 temp;
 
-- 
1.9.1

