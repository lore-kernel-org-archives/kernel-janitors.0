From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Jun 2017 09:00:23 +0000
Subject: [PATCH][mtd-next] mtd: parser: print hex size_t value using correct %zx printk format specifier
Message-Id: <20170623090023.9482-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use %zx instead of %X for size_t variable offset, fixes build warning:

warning: format '%X' expects argument of type 'unsigned int', but argument
2 has type 'size_t {aka long unsigned int}' [-Wformat=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/parsers/parser_trx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index e805108afd31..c0539555fac3 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -39,7 +39,7 @@ static const char *parser_trx_data_part_name(struct mtd_info *master,
 	err  = mtd_read(master, offset, sizeof(buf), &bytes_read,
 			(uint8_t *)&buf);
 	if (err && !mtd_is_bitflip(err)) {
-		pr_err("mtd_read error while parsing (offset: 0x%X): %d\n",
+		pr_err("mtd_read error while parsing (offset: 0x%zx): %d\n",
 			offset, err);
 		goto out_default;
 	}
-- 
2.11.0

