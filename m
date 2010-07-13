From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 13 Jul 2010 11:23:33 +0000
Subject: [PATCH] wireless: airo: delete netdev from list after it is freed
Message-Id: <1279020214-9525-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Matthieu CASTET <castet.matthieu@free.fr>, Stanislaw Gruszka <sgruszka@redhat.com>, Roel Kluin <roel.kluin@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org

We must call del_airo_dev() before free_netdev() since we call
add_airo_dev() exactly after alloc_netdev().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/wireless/airo.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index 6b605df..cce2f8f 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -2931,8 +2931,8 @@ err_out_res:
 	        release_region( dev->base_addr, 64 );
 err_out_nets:
 	airo_networks_free(ai);
-	del_airo_dev(ai);
 err_out_free:
+	del_airo_dev(ai);
 	free_netdev(dev);
 	return NULL;
 }
-- 
1.7.0.4

