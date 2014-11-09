From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 09 Nov 2014 09:06:33 +0000
Subject: [PATCH 2/3] staging: lustre: libcfs_debug.h: remove final uses of the GOTO macro
Message-Id: <1415523994-12520-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1415523994-12520-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1415523994-12520-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove the GOTO macro, as it is no longer used.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h b/drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h
index 8888b27..2e5a9e5 100644
--- a/drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h
+++ b/drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h
@@ -242,18 +242,6 @@ do {									\
 
 #define LCONSOLE_EMERG(format, ...) CDEBUG(D_CONSOLE | D_EMERG, format, ## __VA_ARGS__)
 
-void libcfs_log_goto(struct libcfs_debug_msg_data *, const char *, long_ptr_t);
-#define GOTO(label, rc)							\
-do {									\
-	if (cfs_cdebug_show(D_TRACE, DEBUG_SUBSYSTEM)) {		\
-		LIBCFS_DEBUG_MSG_DATA_DECL(msgdata, D_TRACE, NULL);	\
-		libcfs_log_goto(&msgdata, #label, (long_ptr_t)(rc));	\
-	} else {							\
-		(void)(rc);						\
-	}								\
-	goto label;							\
-} while (0)
-
 int libcfs_debug_msg(struct libcfs_debug_msg_data *msgdata,
 			    const char *format1, ...)
 	__attribute__ ((format (printf, 2, 3)));

