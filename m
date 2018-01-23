From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Jan 2018 08:33:18 +0000
Subject: [PATCH] powerpc/ps3: remove an unneeded NULL check
Message-Id: <20180123083318.GB10091@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geoff Levand <geoff@infradead.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

Static checkers don't like the inconsistent NULL checking on "ops".
This function is only called once and "ops" isn't NULL so the check can
be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ps3/sys-manager-core.c b/drivers/ps3/sys-manager-core.c
index c429ffca1ab7..a5a6def77bb9 100644
--- a/drivers/ps3/sys-manager-core.c
+++ b/drivers/ps3/sys-manager-core.c
@@ -43,7 +43,7 @@ void ps3_sys_manager_register_ops(const struct ps3_sys_manager_ops *ops)
 {
 	BUG_ON(!ops);
 	BUG_ON(!ops->dev);
-	ps3_sys_manager_ops = ops ? *ops : ps3_sys_manager_ops;
+	ps3_sys_manager_ops = *ops;
 }
 EXPORT_SYMBOL_GPL(ps3_sys_manager_register_ops);
 
