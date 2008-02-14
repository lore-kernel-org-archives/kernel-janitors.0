From: Julia Lawall <julia@diku.dk>
Date: Thu, 14 Feb 2008 15:14:04 +0000
Subject: [PATCH 1/6] arch/x86/xen: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.58.0802141613300.1185@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeremy@xensource.com, xen-devel@lists.xensource.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
(d)) but is perhaps more readable.

An extract of the semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression n,d;
@@

(
- (n + d - 1) / d
+ DIV_ROUND_UP(n,d)
|
- (n + (d - 1)) / d
+ DIV_ROUND_UP(n,d)
)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP((n),d)
+ DIV_ROUND_UP(n,d)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP(n,(d))
+ DIV_ROUND_UP(n,d)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
--- a/arch/x86/xen/enlighten.c 2008-02-02 15:28:17.000000000 +0100
+++ b/arch/x86/xen/enlighten.c 2008-02-13 20:48:15.000000000 +0100
@@ -293,7 +293,7 @@ static void xen_load_gdt(const struct de
 	unsigned long *frames;
 	unsigned long va = dtr->address;
 	unsigned int size = dtr->size + 1;
-	unsigned pages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
+	unsigned pages = DIV_ROUND_UP(size, PAGE_SIZE);
 	int f;
 	struct multicall_space mcs;

