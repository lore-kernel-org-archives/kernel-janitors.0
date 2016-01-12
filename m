From: David Miller <davem@davemloft.net>
Date: Tue, 12 Jan 2016 19:30:48 +0000
Subject: Re: [patch 1/2 -next] mdio: remove an unneed condition
Message-Id: <20160112.143048.1357041752363538499.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160112093534.GE29804@mwanda>
In-Reply-To: <20160112093534.GE29804@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jan 2016 12:35:34 +0300

> It used to be that mdio->irq was a pointer but after e7f4dc3536a4
> ('mdio: Move allocation of interrupts into core') it's an array inside
> the mdio struct so it can never be NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
