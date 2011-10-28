From: Julia Lawall <julia@diku.dk>
Date: Fri, 28 Oct 2011 23:58:13 +0000
Subject: [PATCH 1/5] drivers/staging/rtl8712/rtl871x_mlme.c: eliminate a null pointer dereference
Message-Id: <1319846297-2985-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: kernel-janitors@vger.kernel.org, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If ibss_wlan is NULL, it is not correct to memcpy into its field.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression E, E1;
identifier f;
statement S1,S2,S3;
@@

if (E = NULL)
{
  ... when != if (E = NULL || ...) S1 else S2
      when != E = E1
*E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
I have no idea whether this is the correct fix.

 drivers/staging/rtl8712/rtl871x_mlme.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index ef8eb6c..4277d03 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -551,7 +551,7 @@ void r8712_survey_event_callback(struct _adapter *adapter, u8 *pbuf)
 			ibss_wlan = r8712_find_network(
 						&pmlmepriv->scanned_queue,
 						pnetwork->MacAddress);
-			if (!ibss_wlan) {
+			if (ibss_wlan) {
 				memcpy(ibss_wlan->network.IEs,
 					pnetwork->IEs, 8);
 				goto exit;

