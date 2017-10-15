From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 15 Oct 2017 09:24:08 +0000
Subject: [PATCH] docs: dev-tools: correct Coccinelle version number
Message-Id: <1508059448-24317-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

There is no Coccinelle version 1.2.  1.0.2 must be what was intended.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 Documentation/dev-tools/coccinelle.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 4a64b4c..37e474f 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -209,7 +209,7 @@ err.log will now have the profiling information, while stdout will
 provide some progress information as Coccinelle moves forward with
 work.
 
-DEBUG_FILE support is only supported when using coccinelle >= 1.2.
+DEBUG_FILE support is only supported when using coccinelle >= 1.0.2.
 
 .cocciconfig support
 --------------------

