From: Masaru Nomura <massa.nomura@gmail.com>
Date: Sun, 18 May 2014 17:19:17 +0000
Subject: [PATCH 5/5] staging: lustre: lnet: socklnd: Clean up ksocknal_create_conn(...)
Message-Id: <1400433557-24985-6-git-send-email-massa.nomura@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
In-Reply-To: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, andreas.dilger@intel.com, oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove prohibited space and fix indenting of following parameters
of ksocknal_create_conn(...) to meet kernel coding style.

Signed-off-by: Masaru Nomura <massa.nomura@gmail.com>
---
 .../staging/lustre/lnet/klnds/socklnd/socklnd.c    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
index fd4cdc3..c63d69a 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
@@ -1010,8 +1010,8 @@ ksocknal_connecting(ksock_peer_t *peer, __u32 ipaddr)
 }
 
 int
-ksocknal_create_conn (lnet_ni_t *ni, ksock_route_t *route,
-		      socket_t *sock, int type)
+ksocknal_create_conn(lnet_ni_t *ni, ksock_route_t *route,
+		     socket_t *sock, int type)
 {
 	rwlock_t		*global_lock = &ksocknal_data.ksnd_global_lock;
 	LIST_HEAD     (zombies);
-- 
1.7.9.5

