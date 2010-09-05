From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:32:45 +0000
Subject: [PATCH 07/14] staging: tidspbridge: check return code of get_user
Message-Id: <1283711565-7375-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Vasiliy Kulikov <segooon@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Ernesto Ramos <ernesto@ti.com>, Nishanth Menon <nm@ti.com>, Ivan Gomez Castellanos <ivan.gomez@ti.com>, Felipe Contreras <felipe.contreras@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>

Function get_user may fail. Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I couldn't compile this driver at all, so it is not tested.

 drivers/staging/tidspbridge/pmgr/dspapi.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/tidspbridge/pmgr/dspapi.c b/drivers/staging/tidspbridge/pmgr/dspapi.c
index b23591b..faf8304 100644
--- a/drivers/staging/tidspbridge/pmgr/dspapi.c
+++ b/drivers/staging/tidspbridge/pmgr/dspapi.c
@@ -872,7 +872,11 @@ u32 procwrap_load(union trapped_args *args, void *pr_ctxt)
 		/* number of elements in the envp array including NULL */
 		count = 0;
 		do {
-			get_user(temp, args->args_proc_load.user_envp + count);
+			if (get_user(temp,
+				     args->args_proc_load.user_envp + count)) {
+				status = -EFAULT;
+				goto func_cont;
+			}
 			count++;
 		} while (temp);
 		envp = kmalloc(count * sizeof(u8 *), GFP_KERNEL);
-- 
1.7.0.4

