From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 06 Aug 2019 14:16:40 +0000
Subject: [PATCH] nfc: st-nci: Fix an incorrect skb_buff size in 'st_nci_i2c_read()'
Message-Id: <20190806141640.13197-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de, gregkh@linuxfoundation.org, colin.king@canonical.com, davem@davemloft.net, allison@lohutok.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In 'st_nci_i2c_read()', we allocate a sk_buff with a size of
ST_NCI_I2C_MIN_SIZE + len.

However, later on, we first 'skb_reserve()' ST_NCI_I2C_MIN_SIZE bytes, then
we 'skb_put()' ST_NCI_I2C_MIN_SIZE bytes.
Finally, if 'len' is not 0, we 'skb_put()' 'len' bytes.

So we use ST_NCI_I2C_MIN_SIZE*2 + len bytes.

This is incorrect and should already panic. I guess that it does not occur
because of extra memory allocated because of some rounding.

Fix it and allocate enough room for the 'skb_reserve()' and the 'skb_put()'
calls.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is LIKELY INCORRECT. So think twice to what is the correct
solution before applying it.
Maybe the skb_reserve should be axed or some other sizes are incorrect.
There seems to be an issue, that's all I can say.
---
 drivers/nfc/st-nci/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 55d600cd3861..12e0425131c8 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -126,7 +126,7 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *phy,
 		return -EBADMSG;
 	}
 
-	*skb = alloc_skb(ST_NCI_I2C_MIN_SIZE + len, GFP_KERNEL);
+	*skb = alloc_skb(ST_NCI_I2C_MIN_SIZE * 2 + len, GFP_KERNEL);
 	if (*skb = NULL)
 		return -ENOMEM;
 
-- 
2.20.1
