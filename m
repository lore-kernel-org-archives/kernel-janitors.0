From: Julia Lawall <julia@diku.dk>
Date: Tue, 25 Nov 2008 13:13:03 +0000
Subject: [PATCH 2/5] arch/x86/kernel/pci-calgary_64.c: change simple_strtol
Message-Id: <Pine.LNX.4.64.0811251412330.11897@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: muli@il.ibm.com, jdmason@kudzu.us, discuss@x86-64.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Since bridge is unsigned, it would seem better to use simple_strtoul that
simple_strtol.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r2@
long e;
position p;
@@

e = simple_strtol@p(...)

@@
position p != r2.p;
type T;
T e;
@@

e = 
- simple_strtol@p
+ simple_strtoul
  (...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

 arch/x86/kernel/pci-calgary_64.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/arch/x86/kernel/pci-calgary_64.c b/arch/x86/kernel/pci-calgary_64.c
--- a/arch/x86/kernel/pci-calgary_64.c
+++ b/arch/x86/kernel/pci-calgary_64.c
@@ -1567,7 +1567,7 @@ static int __init calgary_parse_options(
 				++p;
 			if (*p = '\0')
 				break;
-			bridge = simple_strtol(p, &endp, 0);
+			bridge = simple_strtoul(p, &endp, 0);
 			if (p = endp)
 				break;
 
