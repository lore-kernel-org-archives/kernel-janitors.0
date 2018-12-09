From: Colin King <colin.king@canonical.com>
Date: Sun, 09 Dec 2018 15:01:42 +0000
Subject: [PATCH] x86/platform/olpc: remove duplicated check on node == -1
Message-Id: <20181209150142.9010-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the node = -1 check is being performed twice, the
second check is redundant and can be removed.  Fix this by
removing the redundant second check and moving the first check
into a combined check with the result from the olpc_ofw call.

Detected by cppcheck:
Identical condition '(s32)node=-1', second condition is always false

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/platform/olpc/olpc_dt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index b4ab779f1d47..658363ec3ff3 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -28,10 +28,7 @@ static phandle __init olpc_dt_getsibling(phandle node)
 	const void *args[] = { (void *)node };
 	void *res[] = { &node };
 
-	if ((s32)node = -1)
-		return 0;
-
-	if (olpc_ofw("peer", args, res) || (s32)node = -1)
+	if (((s32)node = -1) || olpc_ofw("peer", args, res))
 		return 0;
 
 	return node;
-- 
2.19.1
