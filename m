From: Masaru Nomura <massa.nomura@gmail.com>
Date: Sun, 18 May 2014 17:19:14 +0000
Subject: [PATCH 2/5] staging: lustre: lnet: socklnd: Clean up memset(...)
Message-Id: <1400433557-24985-3-git-send-email-massa.nomura@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
In-Reply-To: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, andreas.dilger@intel.com, oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove prohibited space and fix line over 80 characters of
memset(...) to meet kernel coding style.

Signed-off-by: Masaru Nomura <massa.nomura@gmail.com>
---
 .../staging/lustre/lnet/klnds/socklnd/socklnd.c    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
index 66af02e..2d6414a 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
@@ -113,7 +113,7 @@ ksocknal_create_peer(ksock_peer_t **peerp, lnet_ni_t *ni, lnet_process_id_t id)
 	if (peer = NULL)
 		return -ENOMEM;
 
-	memset (peer, 0, sizeof (*peer));       /* NULL pointers/clear flags etc */
+	memset(peer, 0, sizeof(*peer));     /* NULL pointers/clear flags etc */
 
 	peer->ksnp_ni = ni;
 	peer->ksnp_id = id;
-- 
1.7.9.5

