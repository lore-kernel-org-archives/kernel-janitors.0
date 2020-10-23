From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 23 Oct 2020 20:25:42 +0000
Subject: Re: [PATCH] vsock: ratelimit unknown ioctl error message
Message-Id: <20201023132542.4f151318@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023122113.35517-1-colin.king@canonical.com>
        <20201023140947.kurglnklaqteovkp@steredhat>
In-Reply-To: <20201023140947.kurglnklaqteovkp@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 23 Oct 2020 16:09:47 +0200 Stefano Garzarella wrote:
> On Fri, Oct 23, 2020 at 01:21:13PM +0100, Colin King wrote:
> >From: Colin Ian King <colin.king@canonical.com>
> >
> >When exercising the kernel with stress-ng with some ioctl tests the
> >"Unknown ioctl" error message is spamming the kernel log at a high
> >rate. Rate limit this message to reduce the noise.
> >
> >Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >---
> > net/vmw_vsock/af_vsock.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> >index 9e93bc201cc0..b8feb9223454 100644
> >--- a/net/vmw_vsock/af_vsock.c
> >+++ b/net/vmw_vsock/af_vsock.c
> >@@ -2072,7 +2072,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
> > 		break;
> >
> > 	default:
> >-		pr_err("Unknown ioctl %d\n", cmd);
> >+		pr_err_ratelimited("Unknown ioctl %d\n", cmd);  
> 
> Make sense, or maybe can we remove the error message returning only the
> -EINVAL?

+1

> Both cases are fine for me:
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
