From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:12 +0000
Subject: [PATCH 09/23] zr36067: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-9-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>

This kind of memcpy() is error-prone. Its replacement with a struct
assignment is prefered because it's type-safe and much easier to read.

Found by coccinelle. Hand patched and reviewed.
Tested by compilation only.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier struct_name;
struct struct_name to;
struct struct_name from;
expression E;
@@
-memcpy(&(to), &(from), E);
+to = from;
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/pci/zoran/zoran_card.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index fffc54b..cea325d 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -708,8 +708,7 @@ static const struct i2c_algo_bit_data zoran_i2c_bit_data_template = {
 static int
 zoran_register_i2c (struct zoran *zr)
 {
-	memcpy(&zr->i2c_algo, &zoran_i2c_bit_data_template,
-	       sizeof(struct i2c_algo_bit_data));
+	zr->i2c_algo = zoran_i2c_bit_data_template;
 	zr->i2c_algo.data = zr;
 	strlcpy(zr->i2c_adapter.name, ZR_DEVNAME(zr),
 		sizeof(zr->i2c_adapter.name));
-- 
1.7.4.4

