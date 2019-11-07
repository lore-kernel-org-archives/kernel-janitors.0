From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2019 07:48:47 +0000
Subject: [PATCH] block: drbd: remove a stay unlock in __drbd_send_protocol()
Message-Id: <20191107074847.GA11695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>, drbd-dev@tron.linbit.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are two callers of this function and they both unlock the mutex so
this ends up being a double unlock.

Fixes: 44ed167da748 ("drbd: rcu_read_lock() and rcu_dereference() for tconn->net_conf")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analisys.  Not tested.  There is a comment about the lock next to
the caller in drbd_nl.c that I didn't understand:

drivers/block/drbd/drbd_nl.c
  2509          crypto_free_shash(connection->integrity_tfm);
  2510          connection->integrity_tfm = crypto.integrity_tfm;
  2511          if (connection->cstate >= C_WF_REPORT_PARAMS && connection->agreed_pro_version >= 100)
  2512                  /* Do this without trying to take connection->data.mutex again.  */
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
What does this mean?  We're already holding that lock.  We took it near
the start of the function.

  2513                  __drbd_send_protocol(connection, P_PROTOCOL_UPDATE);
  2514  
  2515          crypto_free_shash(connection->cram_hmac_tfm);
  2516          connection->cram_hmac_tfm = crypto.cram_hmac_tfm;
  2517  
  2518          mutex_unlock(&connection->resource->conf_update);
  2519          mutex_unlock(&connection->data.mutex);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Unlocked here.

 drivers/block/drbd/drbd_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 5b248763a672..a18155cdce41 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -786,7 +786,6 @@ int __drbd_send_protocol(struct drbd_connection *connection, enum drbd_packet cm
 
 	if (nc->tentative && connection->agreed_pro_version < 92) {
 		rcu_read_unlock();
-		mutex_unlock(&sock->mutex);
 		drbd_err(connection, "--dry-run is not supported by peer");
 		return -EOPNOTSUPP;
 	}
-- 
2.20.1
