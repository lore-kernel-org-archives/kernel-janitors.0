From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 18:05:58 +0000
Subject: [PATCH 10/11] staging: msm: formatting of pointers in printk()
Message-Id: <1279130759-17608-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Daniel Walker <dwalker@codeaurora.org>, Stepan Moskovchenko <stepanm@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Brown <davidb@codeaurora.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Use %p instead of %08x in printk().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/msm/mdp4_overlay.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/msm/mdp4_overlay.c b/drivers/staging/msm/mdp4_overlay.c
index 304bb82..de284c2 100644
--- a/drivers/staging/msm/mdp4_overlay.c
+++ b/drivers/staging/msm/mdp4_overlay.c
@@ -874,8 +874,8 @@ struct mdp4_overlay_pipe *mdp4_overlay_pipe_alloc(void)
 		if (pipe->pipe_ndx = 0) {
 			pipe->pipe_ndx = i + 1;	/* start from 1 */
 			init_completion(&pipe->comp);
-	printk(KERN_INFO "mdp4_overlay_pipe_alloc: pipe=%x ndx=%d\n",
-					(int)pipe, pipe->pipe_ndx);
+	printk(KERN_INFO "mdp4_overlay_pipe_alloc: pipe=%p ndx=%d\n",
+					pipe, pipe->pipe_ndx);
 			return pipe;
 		}
 		pipe++;
@@ -887,8 +887,8 @@ struct mdp4_overlay_pipe *mdp4_overlay_pipe_alloc(void)
 
 void mdp4_overlay_pipe_free(struct mdp4_overlay_pipe *pipe)
 {
-	printk(KERN_INFO "mdp4_overlay_pipe_free: pipe=%x ndx=%d\n",
-					(int)pipe, pipe->pipe_ndx);
+	printk(KERN_INFO "mdp4_overlay_pipe_free: pipe=%p ndx=%d\n",
+					pipe, pipe->pipe_ndx);
 	memset(pipe, 0, sizeof(*pipe));
 }
 
-- 
1.7.0.4

