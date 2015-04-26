From: green@linuxhacker.ru
Date: Sun, 26 Apr 2015 05:28:43 +0000
Subject: [PATCH] drbd: fix memory leak in drbd_adm_resize
Message-Id: <1430026123-26329-1-git-send-email-green@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Oleg Drokin <green@linuxhacker.ru>

From: Oleg Drokin <green@linuxhacker.ru>

new_disk_conf could be leaked if the follow on checks fail,
so make sure to free it on error if it was not assigned yet.

Found with smatch.

Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
---
I thought about just moving the allocation around so that
there is is no failure path after allocation, but looking
at the history of changes in that file, people tend to insert
extra checks at random places and that's how we ended up
with the current bug, so better let it fail and handle the failure.


 drivers/block/drbd/drbd_nl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 74df8cf..87fa774 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -2585,6 +2585,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 		mutex_unlock(&device->resource->conf_update);
 		synchronize_rcu();
 		kfree(old_disk_conf);
+		new_disk_conf = NULL;
 	}
 
 	ddsf = (rs.resize_force ? DDSF_FORCED : 0) | (rs.no_resync ? DDSF_NO_RESYNC : 0);
@@ -2618,6 +2619,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 
  fail_ldev:
 	put_ldev(device);
+	kfree(new_disk_conf);
 	goto fail;
 }
 
-- 
2.1.0

