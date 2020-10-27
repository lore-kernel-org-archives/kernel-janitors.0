From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Oct 2020 09:09:41 +0000
Subject: [PATCH 1/2][V2] vsock: remove ratelimit unknown ioctl message
Message-Id: <20201027090942.14916-2-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201027090942.14916-1-colin.king@canonical.com>
In-Reply-To: <20201027090942.14916-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

When exercising the kernel with stress-ng with some ioctl tests the
"Unknown ioctl" error message is spamming the kernel log at a high
rate. Remove this message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/vmw_vsock/af_vsock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 9e93bc201cc0..865331b809e4 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2072,7 +2072,6 @@ static long vsock_dev_do_ioctl(struct file *filp,
 		break;
 
 	default:
-		pr_err("Unknown ioctl %d\n", cmd);
 		retval = -EINVAL;
 	}
 
-- 
2.27.0
