From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:22 +0000
Subject: [PATCH 19/23] bttv: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-19-git-send-email-elezegarcia@gmail.com>
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
 drivers/media/pci/bt8xx/bttv-i2c.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-i2c.c b/drivers/media/pci/bt8xx/bttv-i2c.c
index 580c8e6..7398afa 100644
--- a/drivers/media/pci/bt8xx/bttv-i2c.c
+++ b/drivers/media/pci/bt8xx/bttv-i2c.c
@@ -366,8 +366,7 @@ int __devinit init_bttv_i2c(struct bttv *btv)
 
 		strlcpy(btv->c.i2c_adap.name, "bttv",
 			sizeof(btv->c.i2c_adap.name));
-		memcpy(&btv->i2c_algo, &bttv_i2c_algo_bit_template,
-		       sizeof(bttv_i2c_algo_bit_template));
+		btv->i2c_algo = bttv_i2c_algo_bit_template;
 		btv->i2c_algo.udelay = i2c_udelay;
 		btv->i2c_algo.data = btv;
 		btv->c.i2c_adap.algo_data = &btv->i2c_algo;
-- 
1.7.4.4

