From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 09 Aug 2020 11:18:46 +0000
Subject: [PATCH] staging: ks7010: Do not use GFP_KERNEL in atomic context
Message-Id: <20200809111846.745826-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, sfr@canb.auug.org.au, longman@redhat.com, akpm@linux-foundation.org, mhocko@suse.com, hannes@cmpxchg.org
Cc: devel@driverdev.osuosl.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

A possible call chain is as follow:
  ks_wlan_start_xmit                    (ks_wlan_net.c)
    --> hostif_data_request             (ks_hostif.c)
      --> michael_mic                   (ks_hostif.c)

'ks_wlan_start_xmit()' is a '.ndo_start_xmit()' function (see
net_device_ops structure). Such calls are guarded by the __netif_tx_lock
spinlock. So memory allocation must be atomic.

So, use GFP_ATOMIC instead of GFP_KERNEL 'in michael_mic()'

Fixes: ???
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is completely speculative. I don't know if the call chain given above
if possible in RL application.
So review carefully :)

If the fix is correct, it is also more the starting point of a bigger
change, because in 'michael_mic()' there is a call to
'crypto_alloc_shash()' and this function uses GFP_KERNEL internally (in
'crypto_create_tfm()')
Should this need to be changed, I don't know how 'ks_hostif.c' should be
fixed. Changing allocation in 'crypto/api.c' looks like an overkill.

In other word, I think that my patch is wrong, but don't know what else to
propose :).
---
 drivers/staging/ks7010/ks_hostif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index d70b671b06aa..c66f50e4a158 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -212,7 +212,7 @@ michael_mic(u8 *key, u8 *data, unsigned int len, u8 priority, u8 *result)
 	if (ret < 0)
 		goto err_free_tfm;
 
-	desc = kmalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
+	desc = kmalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_ATOMIC);
 	if (!desc) {
 		ret = -ENOMEM;
 		goto err_free_tfm;
-- 
2.25.1
