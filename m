From: Julia Lawall <julia@diku.dk>
Date: Sat, 31 Jul 2010 20:35:28 +0000
Subject: [PATCH] drivers/acpi: call rcu_read_unlock in default case
Message-Id: <Pine.LNX.4.64.1007312234590.12199@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Adjust the default case so that it benefits from the call to rcu_read_unlock.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@rcu@
position p1;
@@

rcu_read_lock@p1();
...
rcu_read_unlock();

@@
position rcu.p1;
@@

*rcu_read_lock@p1();
... when != rcu_read_unlock();
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/acpi/atomicio.c             |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/atomicio.c b/drivers/acpi/atomicio.c
index 8f8bd73..f426010 100644
--- a/drivers/acpi/atomicio.c
+++ b/drivers/acpi/atomicio.c
@@ -267,6 +267,7 @@ EXPORT_SYMBOL_GPL(acpi_post_unmap_gar);
 static int acpi_atomic_read_mem(u64 paddr, u64 *val, u32 width)
 {
 	void __iomem *addr;
+	int res = 0;
 
 	rcu_read_lock();
 	addr = __acpi_ioremap_fast(paddr, width);
@@ -284,16 +285,17 @@ static int acpi_atomic_read_mem(u64 paddr, u64 *val, u32 width)
 		*val = readq(addr);
 		break;
 	default:
-		return -EINVAL;
+		res = -EINVAL;
 	}
 	rcu_read_unlock();
 
-	return 0;
+	return res;
 }
 
 static int acpi_atomic_write_mem(u64 paddr, u64 val, u32 width)
 {
 	void __iomem *addr;
+	int res = 0;
 
 	rcu_read_lock();
 	addr = __acpi_ioremap_fast(paddr, width);
@@ -311,11 +313,11 @@ static int acpi_atomic_write_mem(u64 paddr, u64 val, u32 width)
 		writeq(val, addr);
 		break;
 	default:
-		return -EINVAL;
+		res = -EINVAL;
 	}
 	rcu_read_unlock();
 
-	return 0;
+	return res;
 }
 
 /* GAR accessing in atomic (including NMI) or process context */
