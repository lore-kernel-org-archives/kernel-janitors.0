From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 04 Jan 2019 05:57:20 +0000
Subject: [PATCH -next] xen/pvcalls: remove set but not used variable 'intf'
Message-Id: <1546581820-123466-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543630209-135108-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543630209-135108-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/xen/pvcalls-back.c: In function 'pvcalls_sk_state_change':
drivers/xen/pvcalls-back.c:286:28: warning:
 variable 'intf' set but not used [-Wunused-but-set-variable]

It not used since e6587cdbd732 ("pvcalls-back: set -ENOTCONN in
pvcalls_conn_back_read")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/xen/pvcalls-back.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index 71b6287..7aa64d1 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -283,12 +283,10 @@ static int pvcalls_back_socket(struct xenbus_device *dev,
 static void pvcalls_sk_state_change(struct sock *sock)
 {
 	struct sock_mapping *map = sock->sk_user_data;
-	struct pvcalls_data_intf *intf;
 
 	if (map = NULL)
 		return;
 
-	intf = map->ring;
 	atomic_inc(&map->read);
 	notify_remote_via_irq(map->irq);
 }
