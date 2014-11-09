From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 09 Nov 2014 09:06:34 +0000
Subject: [PATCH 3/3] staging: lustre: libcfs: remove final uses of the GOTO macro
Message-Id: <1415523994-12520-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1415523994-12520-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1415523994-12520-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove the goto logging function, as it is no longer used.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/libcfs/debug.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/lustre/lustre/libcfs/debug.c b/drivers/staging/lustre/lustre/libcfs/debug.c
index 2c15a9e..859129d 100644
--- a/drivers/staging/lustre/lustre/libcfs/debug.c
+++ b/drivers/staging/lustre/lustre/libcfs/debug.c
@@ -460,11 +460,3 @@ void libcfs_debug_set_level(unsigned int debug_level)
 }
 
 EXPORT_SYMBOL(libcfs_debug_set_level);
-
-void libcfs_log_goto(struct libcfs_debug_msg_data *msgdata, const char *label,
-		     long_ptr_t rc)
-{
-	libcfs_debug_msg(msgdata, "Process leaving via %s (rc=%lu : %ld : %#lx)\n",
-			 label, (ulong_ptr_t)rc, rc, rc);
-}
-EXPORT_SYMBOL(libcfs_log_goto);

