From: David Miller <davem@davemloft.net>
Date: Thu, 23 Jun 2011 10:15:55 +0000
Subject: Re: [patch] net/usb/kalmia: signedness bug in kalmia_bind()
Message-Id: <20110623.031555.1014071961808473736.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110623055637.GL14591@shale.localdomain>
In-Reply-To: <20110623055637.GL14591-z0WHZYlhLlzP0Z7Jsv878P8+0UxHXcjY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gregkh-l3A5Bk7waGM@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 23 Jun 2011 08:56:37 +0300

> "status" should be an int here for the error handling to work.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
