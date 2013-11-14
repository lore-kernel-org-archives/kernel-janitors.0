From: David Miller <davem@davemloft.net>
Date: Thu, 14 Nov 2013 21:50:54 +0000
Subject: Re: [patch] isdnloop: use strlcpy() instead of strcpy()
Message-Id: <20131114.165054.356251797193140551.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131114082110.GD8150@elgon.mountain>
In-Reply-To: <20131114082110.GD8150@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, isdn@linux-pingi.de, kernel-janitors@vger.kernel.org, isdn4linux@listserv.isdn4linux.de

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Nov 2013 11:21:10 +0300

> These strings come from a copy_from_user() and there is no way to be
> sure they are NUL terminated.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks Dan.
