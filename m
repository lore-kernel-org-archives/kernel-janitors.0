From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Dec 2018 02:10:09 +0000
Subject: [PATCH -next] xen/pvcalls: remove set but not used variable 'bedata'
Message-Id: <1543630209-135108-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/xen/pvcalls-front.c: In function 'pvcalls_front_sendmsg':
drivers/xen/pvcalls-front.c:506:25: warning:
 variable 'bedata' set but not used [-Wunused-but-set-variable]

drivers/xen/pvcalls-front.c: In function 'pvcalls_front_recvmsg':
drivers/xen/pvcalls-front.c:603:25: warning:
 variable 'bedata' set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/xen/pvcalls-front.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 77224d8..223ad7b 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -503,7 +503,6 @@ static int __write_ring(struct pvcalls_data_intf *intf,
 int pvcalls_front_sendmsg(struct socket *sock, struct msghdr *msg,
 			  size_t len)
 {
-	struct pvcalls_bedata *bedata;
 	struct sock_mapping *map;
 	int sent, tot_sent = 0;
 	int count = 0, flags;
@@ -515,7 +514,6 @@ int pvcalls_front_sendmsg(struct socket *sock, struct msghdr *msg,
 	map = pvcalls_enter_sock(sock);
 	if (IS_ERR(map))
 		return PTR_ERR(map);
-	bedata = dev_get_drvdata(&pvcalls_front_dev->dev);
 
 	mutex_lock(&map->active.out_mutex);
 	if ((flags & MSG_DONTWAIT) && !pvcalls_front_write_todo(map)) {
@@ -600,7 +598,6 @@ static int __read_ring(struct pvcalls_data_intf *intf,
 int pvcalls_front_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 		     int flags)
 {
-	struct pvcalls_bedata *bedata;
 	int ret;
 	struct sock_mapping *map;
 
@@ -610,7 +607,6 @@ int pvcalls_front_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	map = pvcalls_enter_sock(sock);
 	if (IS_ERR(map))
 		return PTR_ERR(map);
-	bedata = dev_get_drvdata(&pvcalls_front_dev->dev);
 
 	mutex_lock(&map->active.in_mutex);
 	if (len > XEN_FLEX_RING_SIZE(PVCALLS_RING_ORDER))
