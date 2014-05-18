From: Masaru Nomura <massa.nomura@gmail.com>
Date: Sun, 18 May 2014 17:19:15 +0000
Subject: [PATCH 3/5] staging: lustre: lnet: socklnd: Clean up CDEBUG(...)
Message-Id: <1400433557-24985-4-git-send-email-massa.nomura@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
In-Reply-To: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, andreas.dilger@intel.com, oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove prohibited space and fix indenting of following parameters
of CDEBUG(...) to meet kernel coding style.

Signed-off-by: Masaru Nomura <massa.nomura@gmail.com>
---
 .../staging/lustre/lnet/klnds/socklnd/socklnd.c    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
index 2d6414a..26cb8ce 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
@@ -153,8 +153,8 @@ ksocknal_destroy_peer(ksock_peer_t *peer)
 {
 	ksock_net_t    *net = peer->ksnp_ni->ni_data;
 
-	CDEBUG (D_NET, "peer %s %p deleted\n",
-		libcfs_id2str(peer->ksnp_id), peer);
+	CDEBUG(D_NET, "peer %s %p deleted\n",
+	       libcfs_id2str(peer->ksnp_id), peer);
 
 	LASSERT(atomic_read(&peer->ksnp_refcount) = 0);
 	LASSERT(peer->ksnp_accepting = 0);
-- 
1.7.9.5

