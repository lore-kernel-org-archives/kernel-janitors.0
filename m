From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 17 Aug 2017 05:14:05 +0000
Subject: [PATCH] mcb: Fix an error handling path in 'chameleon_parse_cells()'
Message-Id: <20170817051405.24946-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: morbidrsa@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'chameleon_get_bar()' fails, we will return 0, which mean success.
We should return the corresponding error code instead.

Remove the useless initialisation of 'ret' which was hiding the issue.
(if 'ret' is not set, gcc generates a warning ("warning: ‘ret’ may be used
uninitialized in this function"))

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mcb/mcb-parse.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mcb/mcb-parse.c b/drivers/mcb/mcb-parse.c
index ee7fb6ec96bd..7369bda3442f 100644
--- a/drivers/mcb/mcb-parse.c
+++ b/drivers/mcb/mcb-parse.c
@@ -182,7 +182,7 @@ int chameleon_parse_cells(struct mcb_bus *bus, phys_addr_t mapbase,
 	int num_cells = 0;
 	uint32_t dtype;
 	int bar_count;
-	int ret = 0;
+	int ret;
 	u32 hsize;
 
 	hsize = sizeof(struct chameleon_fpga_header);
@@ -210,8 +210,10 @@ int chameleon_parse_cells(struct mcb_bus *bus, phys_addr_t mapbase,
 		 header->filename);
 
 	bar_count = chameleon_get_bar(&p, mapbase, &cb);
-	if (bar_count < 0)
+	if (bar_count < 0) {
+		ret = bar_count;
 		goto free_header;
+	}
 
 	for_each_chameleon_cell(dtype, p) {
 		switch (dtype) {
-- 
2.11.0

