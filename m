From: Colin King <colin.king@canonical.com>
Date: Wed, 02 Jan 2019 09:37:03 +0000
Subject: [PATCH][next] cgroup: fix spelling mistake "paramter" -> "parameter"
Message-Id: <20190102093703.32506-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the message in a cg_invalf call, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/cgroup/cgroup-v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cgroup/cgroup-v1.c b/kernel/cgroup/cgroup-v1.c
index e20a08ce9655..e72699dec620 100644
--- a/kernel/cgroup/cgroup-v1.c
+++ b/kernel/cgroup/cgroup-v1.c
@@ -1019,7 +1019,7 @@ int cgroup1_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_name:
 		/* blocked by boot param? */
 		if (cgroup_no_v1_named)
-			return cg_invalf(fc, "cgroup1: Blocked by boot paramter");
+			return cg_invalf(fc, "cgroup1: Blocked by boot parameter");
 		/* Can't specify an empty name */
 		if (!param->size)
 			return cg_invalf(fc, "cgroup1: Empty name");
-- 
2.19.1
