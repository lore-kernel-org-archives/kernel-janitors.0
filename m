From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 27 Oct 2020 09:18:04 +0000
Subject: Re: [PATCH 2/2] vsock: fix the error return when an invalid ioctl command is used
Message-Id: <20201027091804.7mpad5yaxzfmbva6@steredhat>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201027090942.14916-1-colin.king@canonical.com>
 <20201027090942.14916-3-colin.king@canonical.com>
In-Reply-To: <20201027090942.14916-3-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 27, 2020 at 09:09:42AM +0000, Colin King wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>Currently when an invalid ioctl command is used the error return
>is -EINVAL.  Fix this by returning the correct error -ENOIOCTLCMD.
>
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> net/vmw_vsock/af_vsock.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 865331b809e4..597c86413089 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2072,7 +2072,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
> 		break;
>
> 	default:
>-		retval = -EINVAL;
>+		retval = -ENOIOCTLCMD;
> 	}
>
> 	return retval;
>-- 
>2.27.0
>
