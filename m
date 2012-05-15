From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 May 2012 09:00:27 +0000
Subject: [patch] brcm80211: brcmu_pkt_buf_free_skb() should handle NULL
Message-Id: <20120515090027.GG30265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Roland Vossen <rvossen@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Greg Kroah-Hartman <gregkh@suse.de>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This is potentially called with NULL pointers, for example, look at
brcmf_c_prec_enq().  Since it's a free() function, probably people
expect it to handle NULL pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmutil/utils.c b/drivers/net/wireless/brcm80211/brcmutil/utils.c
index b45ab34..3e6405e 100644
--- a/drivers/net/wireless/brcm80211/brcmutil/utils.c
+++ b/drivers/net/wireless/brcm80211/brcmutil/utils.c
@@ -43,6 +43,8 @@ EXPORT_SYMBOL(brcmu_pkt_buf_get_skb);
 /* Free the driver packet. Free the tag if present */
 void brcmu_pkt_buf_free_skb(struct sk_buff *skb)
 {
+	if (!skb)
+		return;
 	WARN_ON(skb->next);
 	if (skb->destructor)
 		/* cannot kfree_skb() on hard IRQ (net/core/skbuff.c) if
