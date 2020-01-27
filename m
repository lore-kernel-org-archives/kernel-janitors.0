From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Jan 2020 22:36:09 +0000
Subject: [PATCH] Bluetooth: SMP: Fix SALT value in some comments
Message-Id: <20200127223609.15066-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marcel@holtmann.org, johan.hedberg@gmail.com, kuba@kernel.org, davem@davemloft.net
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Salts are 16 bytes long.
Remove some extra and erroneous '0' in the human readable format used
in comments.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/bluetooth/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 4ece170c518e..a2e9492391fe 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -1145,7 +1145,7 @@ static void sc_generate_link_key(struct smp_chan *smp)
 		return;
 
 	if (test_bit(SMP_FLAG_CT2, &smp->flags)) {
-		/* SALT = 0x00000000000000000000000000000000746D7031 */
+		/* SALT = 0x000000000000000000000000746D7031 */
 		const u8 salt[16] = { 0x31, 0x70, 0x6d, 0x74 };
 
 		if (smp_h7(smp->tfm_cmac, smp->tk, salt, smp->link_key)) {
@@ -1203,7 +1203,7 @@ static void sc_generate_ltk(struct smp_chan *smp)
 		set_bit(SMP_FLAG_DEBUG_KEY, &smp->flags);
 
 	if (test_bit(SMP_FLAG_CT2, &smp->flags)) {
-		/* SALT = 0x00000000000000000000000000000000746D7032 */
+		/* SALT = 0x000000000000000000000000746D7032 */
 		const u8 salt[16] = { 0x32, 0x70, 0x6d, 0x74 };
 
 		if (smp_h7(smp->tfm_cmac, key->val, salt, smp->tk))
-- 
2.20.1
