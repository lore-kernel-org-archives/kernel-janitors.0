From: Dan Carpenter <error27@gmail.com>
Date: Mon, 11 Oct 2010 17:24:19 +0000
Subject: [patch 2/2] vhost: fix return code for log_access_ok()
Message-Id: <20101011172419.GG5851@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, "David S. Miller" <davem@davemloft.net>, Rusty Russell <rusty@rustcorp.com.au>, kvm@vger.kernel.org, virtualization@lists.osdl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

access_ok() returns 1 if it's OK otherwise it should return 0.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index c2aa12c..f82fe57 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -371,7 +371,7 @@ static int log_access_ok(void __user *log_base, u64 addr, unsigned long sz)
 	/* Make sure 64 bit math will not overflow. */
 	if (a > ULONG_MAX - (unsigned long)log_base ||
 	    a + (unsigned long)log_base > ULONG_MAX)
-		return -EFAULT;
+		return 0;
 
 	return access_ok(VERIFY_WRITE, log_base + a,
 			 (sz + VHOST_PAGE_SIZE * 8 - 1) / VHOST_PAGE_SIZE / 8);
