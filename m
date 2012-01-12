From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 12 Jan 2012 21:49:27 +0000
Subject: [PATCH v2 1/5] drivers/staging: adjust double test
Message-Id: <1326404970-1084-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326404970-1084-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1326404970-1084-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Rewrite a duplicated test to test the correct value

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E;
@@

(
* E
  || ... || E
|
* E
  && ... && E
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The array has 4 elements, so my guess is that the one in position 3 should
be tested rather than testing the one in position 1 again.

 drivers/staging/rtl8192e/rtllib_rx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 6c5061f..13979b5 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2453,7 +2453,7 @@ static inline void update_network(struct rtllib_network *dst,
 	if (src->wmm_param[0].ac_aci_acm_aifsn ||
 	   src->wmm_param[1].ac_aci_acm_aifsn ||
 	   src->wmm_param[2].ac_aci_acm_aifsn ||
-	   src->wmm_param[1].ac_aci_acm_aifsn)
+	   src->wmm_param[3].ac_aci_acm_aifsn)
 		memcpy(dst->wmm_param, src->wmm_param, WME_AC_PRAM_LEN);
 
 	dst->SignalStrength = src->SignalStrength;
