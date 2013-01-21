From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 21 Jan 2013 12:13:01 +0000
Subject: [PATCH 8/15] arch/powerpc/platforms/85xx/p1022_ds.c: adjust duplicate test
Message-Id: <1358773378-4700-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gala <galak@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive tests to the same location.  The code tested the result
of a previous call, that itself was already tested.  It is changed to test
the result of the most recent call.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@s exists@
local idexpression y;
expression x,e;
@@

*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\)
    when != \(XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/powerpc/platforms/85xx/p1022_ds.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index e346edf..af5853c 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -302,7 +302,7 @@ static void p1022ds_set_monitor_port(enum fsl_diu_monitor_port port)
 		goto exit;
 	}
 	cs1_addr = lbc_br_to_phys(ecm, num_laws, br1);
-	if (!cs0_addr) {
+	if (!cs1_addr) {
 		pr_err("p1022ds: could not determine physical address for CS1"
 		       " (BR1=%08x)\n", br1);
 		goto exit;

