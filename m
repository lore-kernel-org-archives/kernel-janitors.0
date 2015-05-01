From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:38:03 +0000
Subject: [PATCH 4/20] staging: lustre: libcfs: linux: remove unneeded null test before free
Message-Id: <1430509086-22132-18-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL) {
  kfree(ptr);
  ptr = NULL;
- }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c
index c8e2930..483cbc8 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c
@@ -102,11 +102,10 @@ void cfs_tracefile_fini_arch(void)
 	int    j;
 
 	for (i = 0; i < num_possible_cpus(); i++)
-		for (j = 0; j < 3; j++)
-			if (cfs_trace_console_buffers[i][j] != NULL) {
-				kfree(cfs_trace_console_buffers[i][j]);
-				cfs_trace_console_buffers[i][j] = NULL;
-			}
+		for (j = 0; j < 3; j++) {
+			kfree(cfs_trace_console_buffers[i][j]);
+			cfs_trace_console_buffers[i][j] = NULL;
+		}
 
 	for (i = 0; cfs_trace_data[i] != NULL; i++) {
 		kfree(cfs_trace_data[i]);

