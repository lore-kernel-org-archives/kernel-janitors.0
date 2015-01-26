From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Date: Mon, 26 Jan 2015 05:40:58 +0000
Subject: [PATCH] crypto: omap: Free memory in error path
Message-Id: <1422250858-22516-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe Jaillet <christophe.jaillet@wanadoo.fr>

If only one of the 2 __get_free_pages fails, then there is a memory leak

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/omap-aes.c | 2 ++
 drivers/crypto/omap-des.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index f79dd41..c2f9333 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -577,6 +577,8 @@ static int omap_aes_copy_sgs(struct omap_aes_dev *dd)
 	buf_out = (void *)__get_free_pages(GFP_ATOMIC, pages);
 
 	if (!buf_in || !buf_out) {
+		free_page((unsigned long)buf_out);
+		free_page((unsigned long)buf_in);
 		pr_err("Couldn't allocated pages for unaligned cases.\n");
 		return -1;
 	}
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index 0b8dcf5..a2f6ca1 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -570,6 +570,8 @@ static int omap_des_copy_sgs(struct omap_des_dev *dd)
 	buf_out = (void *)__get_free_pages(GFP_ATOMIC, pages);
 
 	if (!buf_in || !buf_out) {
+		free_page((unsigned long)buf_out);
+		free_page((unsigned long)buf_in);
 		pr_err("Couldn't allocated pages for unaligned cases.\n");
 		return -1;
 	}
-- 
2.1.0

