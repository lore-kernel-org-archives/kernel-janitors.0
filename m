From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 18 Apr 2016 14:55:35 +0000
Subject: [PATCH 2/5] arcnet: com90xx: add __init attribute
Message-Id: <1460991338-9845-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>, Josh Triplett <josh@joshtriplett.org>

Add __init attribute on a function that is only called from other __init
functions and that is not inlined, at least with gcc version 4.8.4 on an
x86 machine with allyesconfig.  Currently, the function is put in the
.text.unlikely segment.  Declaring it as __init will cause it to be put in
the .init.text and to disappear after initialization.

The result of objdump -x on the function before the change is as follows:

0000000000000000 l     F .text.unlikely 00000000000000bf check_mirror

And after the change it is as follows:

0000000000000000 l     F .init.text	00000000000000ba check_mirror

Done with the help of Coccinelle.  The semantic patch checks for local
static non-init functions that are called from an __init function and are
not called from any other function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/arcnet/com90xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/arcnet/com90xx.c b/drivers/net/arcnet/com90xx.c
index 0d9b45f..81f90c4 100644
--- a/drivers/net/arcnet/com90xx.c
+++ b/drivers/net/arcnet/com90xx.c
@@ -433,7 +433,7 @@ static void __init com90xx_probe(void)
 	kfree(iomem);
 }
 
-static int check_mirror(unsigned long addr, size_t size)
+static int __init check_mirror(unsigned long addr, size_t size)
 {
 	void __iomem *p;
 	int res = -1;

