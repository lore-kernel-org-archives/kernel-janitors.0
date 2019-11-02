From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 02 Nov 2019 15:59:45 +0000
Subject: [PATCH v2] staging: wfx: Fix a memory leak in 'wfx_upload_beacon'
Message-Id: <20191102155945.20205-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jerome.pouiller@silabs.com, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The current code is a no-op, because all it can do is 'dev_kfree_skb(NULL)'
Remove the test before 'dev_kfree_skb()'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
V2: remove the 'if(...)', 'dev_kfree_skb()' can handle NULL.
---
 drivers/staging/wfx/sta.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
index 688586e823c0..93f3739b5f3a 100644
--- a/drivers/staging/wfx/sta.c
+++ b/drivers/staging/wfx/sta.c
@@ -906,8 +906,7 @@ static int wfx_upload_beacon(struct wfx_vif *wvif)
 	wfx_fwd_probe_req(wvif, false);
 
 done:
-	if (!skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 	return ret;
 }
 
-- 
2.20.1
