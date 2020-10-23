From: David Laight <David.Laight@ACULAB.COM>
Date: Fri, 23 Oct 2020 21:30:59 +0000
Subject: RE: [PATCH] vsock: ratelimit unknown ioctl error message
Message-Id: <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023122113.35517-1-colin.king@canonical.com>
 <20201023140947.kurglnklaqteovkp@steredhat>
In-Reply-To: <20201023140947.kurglnklaqteovkp@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Stefano Garzarella' <sgarzare@redhat.com>, Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


From: Stefano Garzarella
> Sent: 23 October 2020 15:10
> 
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

Isn't the canonical error for unknown ioctl codes -ENOTTY?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
