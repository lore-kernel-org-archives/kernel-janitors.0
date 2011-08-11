From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Aug 2011 09:40:33 +0000
Subject: [PATCH] net/netlabel/netlabel_kapi.c: add missing cleanup code
Message-Id: <1313055633-25327-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use the same cleanup code for the failure of kzalloc as for the failure of
kstrdup just below.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/netlabel/netlabel_kapi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
index 58107d0..225e12c 100644
--- a/net/netlabel/netlabel_kapi.c
+++ b/net/netlabel/netlabel_kapi.c
@@ -341,7 +341,7 @@ int netlbl_cfg_cipsov4_map_add(u32 doi,
 
 	entry = kzalloc(sizeof(*entry), GFP_ATOMIC);
 	if (entry = NULL)
-		return -ENOMEM;
+		goto cfg_cipsov4_map_add_failure;
 	if (domain != NULL) {
 		entry->domain = kstrdup(domain, GFP_ATOMIC);
 		if (entry->domain = NULL)

