From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Dec 2018 06:44:16 +0000
Subject: [PATCH -next] powerpc/mm: drop test in pp_601
Message-Id: <1544165056-52579-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

The test selects between two identical values, so it doesn't look useful.
It turns out that the tested expression can only be true anyway, so drop
the test, the corresponding parameter, and the corresponding argument at
the only call site.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
@@

* e ? e1 : e1
// </smpl>

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/mm/dump_bats.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/dump_bats.c b/arch/powerpc/mm/dump_bats.c
index a0d23e9..33450a8 100644
--- a/arch/powerpc/mm/dump_bats.c
+++ b/arch/powerpc/mm/dump_bats.c
@@ -17,8 +17,8 @@ static char *pp_601(int k, int pp)
 	if (pp = 1)
 		return k ? "ROX" : "RWX";
 	if (pp = 2)
-		return k ? "RWX" : "RWX";
-	return k ? "ROX" : "ROX";
+		return "RWX";
+	return "ROX";
 }
 
 static void bat_show_601(struct seq_file *m, int idx, u32 lower, u32 upper)
