From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Dec 2020 14:45:03 +0000
Subject: [PATCH][next] seg6: fix unintentional integer overflow on left shift
Message-Id: <20201207144503.169679-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, Andrea Mayer <andrea.mayer@uniroma2.it>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting the integer value 1 is evaluated using 32-bit arithmetic
and then used in an expression that expects a unsigned long value
leads to a potential integer overflow. Fix this by using the BIT
macro to perform the shift to avoid the overflow.

Addresses-Coverity: ("Uninitentional integer overflow")
Fixes: 964adce526a4 ("seg6: improve management of behavior attributes")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/seg6_local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index b07f7c1c82a4..d68de8cd1207 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -1366,7 +1366,7 @@ static void __destroy_attrs(unsigned long parsed_attrs, int max_parsed,
 	 * attribute; otherwise, we call the destroy() callback.
 	 */
 	for (i = 0; i < max_parsed; ++i) {
-		if (!(parsed_attrs & (1 << i)))
+		if (!(parsed_attrs & BIT(i)))
 			continue;
 
 		param = &seg6_action_params[i];
-- 
2.29.2
