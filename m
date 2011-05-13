From: Julia Lawall <julia@diku.dk>
Date: Fri, 13 May 2011 13:52:10 +0000
Subject: [PATCH 2/3] net/rfkill/core.c: Avoid leaving freed data in a list
Message-Id: <1305294731-12127-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

The list_for_each_entry loop can fail, in which case the list element is
not removed from the list rfkill_fds.  Since this list is not accessed by
the loop, the addition of &data->list into the list is just moved after the
loop.

The sematic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E,E1,E2;
identifier l;
@@

*list_add(&E->l,E1);
... when != E1
    when != list_del(&E->l)
    when != list_del_init(&E->l)
    when != E = E2
*kfree(E);// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
I have only verified that rfkill_fds is not accessed by the loop by
inspecting the code.  If this analysis is not correct, the other solution
would be to leave the list_add where it is and delete the element from the
list explicitly.

 net/rfkill/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rfkill/core.c b/net/rfkill/core.c
index 0198191..be90640 100644
--- a/net/rfkill/core.c
+++ b/net/rfkill/core.c
@@ -1024,7 +1024,6 @@ static int rfkill_fop_open(struct inode *inode, struct file *file)
 	 * start getting events from elsewhere but hold mtx to get
 	 * startup events added first
 	 */
-	list_add(&data->list, &rfkill_fds);
 
 	list_for_each_entry(rfkill, &rfkill_list, node) {
 		ev = kzalloc(sizeof(*ev), GFP_KERNEL);
@@ -1033,6 +1032,7 @@ static int rfkill_fop_open(struct inode *inode, struct file *file)
 		rfkill_fill_event(&ev->ev, rfkill, RFKILL_OP_ADD);
 		list_add_tail(&ev->list, &data->events);
 	}
+	list_add(&data->list, &rfkill_fds);
 	mutex_unlock(&data->mtx);
 	mutex_unlock(&rfkill_global_mutex);
 

