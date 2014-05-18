From: Masaru Nomura <massa.nomura@gmail.com>
Date: Sun, 18 May 2014 17:19:16 +0000
Subject: [PATCH 4/5] staging: lustre: lnet: socklnd: Clean up ksocknal_get_peer_info(...)
Message-Id: <1400433557-24985-5-git-send-email-massa.nomura@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
In-Reply-To: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, andreas.dilger@intel.com, oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove prohibited space and fix indenting of following parameter
of ksocknal_get_peer_info(...) to meet kernel coding style.

Signed-off-by: Masaru Nomura <massa.nomura@gmail.com>
---
 .../staging/lustre/lnet/klnds/socklnd/socklnd.c    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
index 26cb8ce..fd4cdc3 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
@@ -247,9 +247,9 @@ ksocknal_unlink_peer_locked(ksock_peer_t *peer)
 }
 
 int
-ksocknal_get_peer_info (lnet_ni_t *ni, int index,
-			lnet_process_id_t *id, __u32 *myip, __u32 *peer_ip,
-			int *port, int *conn_count, int *share_count)
+ksocknal_get_peer_info(lnet_ni_t *ni, int index,
+		       lnet_process_id_t *id, __u32 *myip, __u32 *peer_ip,
+		       int *port, int *conn_count, int *share_count)
 {
 	ksock_peer_t      *peer;
 	struct list_head	*ptmp;
-- 
1.7.9.5

