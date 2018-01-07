From: Colin King <colin.king@canonical.com>
Date: Sun, 07 Jan 2018 23:50:26 +0000
Subject: [PATCH] ipv6: use ARRAY_SIZE for array sizing calculation on array seg6_action_table
Message-Id: <20180107235026.8387-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use the ARRAY_SIZE macro on array seg6_action_table to determine size of
the array. Improvement suggested by coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/seg6_local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 825b8e01f947..ba3767ef5e93 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -501,7 +501,7 @@ static struct seg6_action_desc *__get_action_desc(int action)
 	struct seg6_action_desc *desc;
 	int i, count;
 
-	count = sizeof(seg6_action_table) / sizeof(struct seg6_action_desc);
+	count = ARRAY_SIZE(seg6_action_table);
 	for (i = 0; i < count; i++) {
 		desc = &seg6_action_table[i];
 		if (desc->action = action)
-- 
2.15.1

