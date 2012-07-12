From: David Miller <davem@davemloft.net>
Date: Thu, 12 Jul 2012 14:55:44 +0000
Subject: Re: [patch -next] smsc95xx: signedness bug in get_regs()
Message-Id: <20120712.075544.1808665763383467090.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063251.GB11812@elgon.mountain>
In-Reply-To: <20120711063251.GB11812-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: steve.glendinning-sdUf+H5yV5I@public.gmane.org, emeric.vigier-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 09:32:51 +0300

> "retval" has to be a signed integer for the error handling to work.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
