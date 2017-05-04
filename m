From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 04 May 2017 20:10:47 +0000
Subject: [PATCH 2/9] mtd: physmap_of: Drop unnecessary static
Message-Id: <1493928654-18768-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

Drop static on a local variable, when the variable is initialized before
any use on every possible execution path through the function.  The static
has no benefit, and dropping it reduces the code size.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@bad exists@
position p;
identifier x;
type T;
@@

static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@

-static
 T x@p;
 ... when != x
     when strict
?x = e;
// </smpl>

The change in code size is indicates by the following output from the size
command.

before:
   text    data     bss     dec     hex filename
    835      80       8     923     39b drivers/mtd/maps/physmap_of_gemini.o

after:
   text    data     bss     dec     hex filename
    823      80       0     903     387 drivers/mtd/maps/physmap_of_gemini.o

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/maps/physmap_of_gemini.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap_of_gemini.c b/drivers/mtd/maps/physmap_of_gemini.c
index 9d371cd..05b286b 100644
--- a/drivers/mtd/maps/physmap_of_gemini.c
+++ b/drivers/mtd/maps/physmap_of_gemini.c
@@ -59,7 +59,7 @@ int of_flash_probe_gemini(struct platform_device *pdev,
 			  struct device_node *np,
 			  struct map_info *map)
 {
-	static struct regmap *rmap;
+	struct regmap *rmap;
 	struct device *dev = &pdev->dev;
 	u32 val;
 	int ret;

