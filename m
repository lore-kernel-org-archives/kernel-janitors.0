From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 17:50:21 +0000
Subject: [PATCH] staging: rtl8723bs: core: make array op_class static const, makes object smaller
Message-Id: <20190906175021.25103-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array op_class on the stack but instead make it
static const. Makes the object code smaller by 64 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  93553	   7944	   5056	 106553	  1a039	rtl8723bs/core/rtw_mlme_ext.o

After:
   text	   data	    bss	    dec	    hex	filename
  93425	   8008	   5056	 106489	  19ff9	rtl8723bs/core/rtw_mlme_ext.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 2128886c9924..814b7a6bf4ea 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -344,7 +344,7 @@ static void init_channel_list(struct adapter *padapter, RT_CHANNEL_INFO *channel
 							  struct p2p_channels *channel_list)
 {
 
-	struct p2p_oper_class_map op_class[] = {
+	static const struct p2p_oper_class_map op_class[] = {
 		{ IEEE80211G,  81,   1,  13,  1, BW20 },
 		{ IEEE80211G,  82,  14,  14,  1, BW20 },
 		{ IEEE80211A, 115,  36,  48,  4, BW20 },
@@ -363,7 +363,7 @@ static void init_channel_list(struct adapter *padapter, RT_CHANNEL_INFO *channel
 
 	for (op = 0; op_class[op].op_class; op++) {
 		u8 ch;
-		struct p2p_oper_class_map *o = &op_class[op];
+		const struct p2p_oper_class_map *o = &op_class[op];
 		struct p2p_reg_class *reg = NULL;
 
 		for (ch = o->min_chan; ch <= o->max_chan; ch += o->inc) {
-- 
2.20.1
