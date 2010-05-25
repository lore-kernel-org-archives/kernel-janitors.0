From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:51:10 +0000
Subject: [patch] kobject: free memory if netlink_kernel_create() fails
Message-Id: <20100525095110.GG22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a kfree(ue_sk) missing on the error path if 
netlink_kernel_create() fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index 59c1551..08e15f7 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -378,6 +378,7 @@ static int uevent_net_init(struct net *net)
 	if (!ue_sk->sk) {
 		printk(KERN_ERR
 		       "kobject_uevent: unable to create netlink socket!\n");
+		kfree(ue_sk);
 		return -ENODEV;
 	}
 	mutex_lock(&uevent_sock_mutex);
