From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 30 Mar 2018 16:43:44 +0000
Subject: [PATCH] debugfs_simple_attr.cocci: add clarifying information
Message-Id: <1522428224-20192-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

The referenced commit gives some information about the overhead
reduced by this change.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci b/scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
index 7c31231..6ff97e2 100644
--- a/scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
+++ b/scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
@@ -5,6 +5,8 @@
 //# Rationale: DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
 //# imposes some significant overhead as compared to
 //# DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().
+//# See commit c64688081490 ("debugfs: add support for self-protecting
+//# attribute file fops") for further information.
 //
 // Copyright (C): 2016 Nicolai Stange
 // Options: --no-includes

