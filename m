From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Oct 2020 09:09:42 +0000
Subject: [PATCH 2/2] vsock: fix the error return when an invalid ioctl command is used
Message-Id: <20201027090942.14916-3-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201027090942.14916-1-colin.king@canonical.com>
In-Reply-To: <20201027090942.14916-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when an invalid ioctl command is used the error return
is -EINVAL.  Fix this by returning the correct error -ENOIOCTLCMD.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/vmw_vsock/af_vsock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 865331b809e4..597c86413089 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2072,7 +2072,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
 		break;
 
 	default:
-		retval = -EINVAL;
+		retval = -ENOIOCTLCMD;
 	}
 
 	return retval;
-- 
2.27.0
