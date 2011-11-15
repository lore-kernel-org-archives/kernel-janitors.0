From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Nov 2011 06:33:31 +0000
Subject: [patch] mac80211: memory leak in mesh_queue_preq()
Message-Id: <20111115063331.GC30827@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently introduced a return here, but we need to call kfree
first.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/mesh_hwmp.c b/net/mac80211/mesh_hwmp.c
index a7afb2d..8a81591 100644
--- a/net/mac80211/mesh_hwmp.c
+++ b/net/mac80211/mesh_hwmp.c
@@ -871,6 +871,7 @@ static void mesh_queue_preq(struct mesh_path *mpath, u8 flags)
 	if (mpath->flags & MESH_PATH_REQ_QUEUED) {
 		spin_unlock_bh(&mpath->state_lock);
 		spin_unlock_bh(&ifmsh->mesh_preq_queue_lock);
+		kfree(preq_node);
 		return;
 	}
 
