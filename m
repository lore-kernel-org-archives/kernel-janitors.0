From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2011 06:49:38 +0000
Subject: [patch] sock_diag: off by one checks
Message-Id: <20111208064938.GB16735@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Pavel Emelyanov <xemul@parallels.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

These tests are off by one because sock_diag_handlers[] only has AF_MAX
elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/core/sock_diag.c b/net/core/sock_diag.c
index fbaf01c..9c27bcd 100644
--- a/net/core/sock_diag.c
+++ b/net/core/sock_diag.c
@@ -32,7 +32,7 @@ int sock_diag_register(struct sock_diag_handler *hndl)
 {
 	int err = 0;
 
-	if (hndl->family > AF_MAX)
+	if (hndl->family >= AF_MAX)
 		return -EINVAL;
 
 	mutex_lock(&sock_diag_table_mutex);
@@ -50,7 +50,7 @@ void sock_diag_unregister(struct sock_diag_handler *hnld)
 {
 	int family = hnld->family;
 
-	if (family > AF_MAX)
+	if (family >= AF_MAX)
 		return;
 
 	mutex_lock(&sock_diag_table_mutex);
