From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Mar 2012 07:52:50 +0000
Subject: [patch] x86: tls: off by one checks
Message-Id: <20120324075250.GA28258@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These are used as offsets into an array of GDT_ENTRY_TLS_ENTRIES members
so GDT_ENTRY_TLS_ENTRIES is one past the end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/tls.c b/arch/x86/kernel/tls.c
index 6bb7b85..bcfec2d 100644
--- a/arch/x86/kernel/tls.c
+++ b/arch/x86/kernel/tls.c
@@ -163,7 +163,7 @@ int regset_tls_get(struct task_struct *target, const struct user_regset *regset,
 {
 	const struct desc_struct *tls;
 
-	if (pos > GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
+	if (pos >= GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
 	    (pos % sizeof(struct user_desc)) != 0 ||
 	    (count % sizeof(struct user_desc)) != 0)
 		return -EINVAL;
@@ -198,7 +198,7 @@ int regset_tls_set(struct task_struct *target, const struct user_regset *regset,
 	struct user_desc infobuf[GDT_ENTRY_TLS_ENTRIES];
 	const struct user_desc *info;
 
-	if (pos > GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
+	if (pos >= GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
 	    (pos % sizeof(struct user_desc)) != 0 ||
 	    (count % sizeof(struct user_desc)) != 0)
 		return -EINVAL;
