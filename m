From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:14:11 +0000
Subject: [PATCH 06/15] staging: tidspbridge: check kmalloc() result
Message-Id: <1279296851-24983-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Omar Ramirez Luna <omar.ramirez@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, Ameya Palande <ameya.palande@nokia.com>, "Guzman Lugo, Fernando" <fernando.lugo@ti.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

If kmalloc() fails then exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/tidspbridge/pmgr/dspapi.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/tidspbridge/pmgr/dspapi.c b/drivers/staging/tidspbridge/pmgr/dspapi.c
index 7597210..ba5d8c4 100644
--- a/drivers/staging/tidspbridge/pmgr/dspapi.c
+++ b/drivers/staging/tidspbridge/pmgr/dspapi.c
@@ -1407,6 +1407,8 @@ u32 strmwrap_allocate_buffer(union Trapped_Args *args, void *pr_ctxt)
 		return -EINVAL;
 
 	ap_buffer = kmalloc((num_bufs * sizeof(u8 *)), GFP_KERNEL);
+	if (ap_buffer = NULL)
+		return -ENOMEM;
 
 	status = strm_allocate_buffer(args->args_strm_allocatebuffer.hstream,
 				      args->args_strm_allocatebuffer.usize,
@@ -1446,6 +1448,8 @@ u32 strmwrap_free_buffer(union Trapped_Args *args, void *pr_ctxt)
 		return -EINVAL;
 
 	ap_buffer = kmalloc((num_bufs * sizeof(u8 *)), GFP_KERNEL);
+	if (ap_buffer = NULL)
+		return -ENOMEM;
 
 	CP_FM_USR(ap_buffer, args->args_strm_freebuffer.ap_buffer, status,
 		  num_bufs);
-- 
1.7.0.4

