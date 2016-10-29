From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Oct 2016 19:36:59 +0000
Subject: [PATCH 05/15] MIPS: TXx9: 7segled: use permission-specific DEVICE_ATTR variants
Message-Id: <1477769829-22230-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_WO for write only attributes.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@wo@
declarer name DEVICE_ATTR;
identifier x,x_store;
@@

DEVICE_ATTR(x, \(0200\|S_IWUSR\), NULL, x_store);

@script:ocaml@
x << wo.x;
x_store << wo.x_store;
@@

if not (x^"_store" = x_store) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_WO;
identifier wo.x,wo.x_store;
@@

- DEVICE_ATTR(x, \(0200\|S_IWUSR\), NULL, x_store);
+ DEVICE_ATTR_WO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/mips/txx9/generic/7segled.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/txx9/generic/7segled.c b/arch/mips/txx9/generic/7segled.c
index 566c58b..2203c25 100644
--- a/arch/mips/txx9/generic/7segled.c
+++ b/arch/mips/txx9/generic/7segled.c
@@ -55,8 +55,8 @@ static ssize_t raw_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(ascii, 0200, NULL, ascii_store);
-static DEVICE_ATTR(raw, 0200, NULL, raw_store);
+static DEVICE_ATTR_WO(ascii);
+static DEVICE_ATTR_WO(raw);
 
 static ssize_t map_seg7_show(struct device *dev,
 			     struct device_attribute *attr,

