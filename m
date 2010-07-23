From: Lennert Buytenhek <buytenh@wantstofly.org>
Date: Fri, 23 Jul 2010 11:18:18 +0000
Subject: Re: [patch -next v2] mv643xx_eth: potential null dereference
Message-Id: <20100723111818.GV21121@mail.wantstofly.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723101528.GF26313@bicker> <1279881177.24768.1623.camel@Joe-Laptop.home> <20100723110504.GG26313@bicker>
In-Reply-To: <20100723110504.GG26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Denis Kirjanov <kirjanov@gmail.com>, Saeed Bishara <saeed@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 23, 2010 at 01:05:05PM +0200, Dan Carpenter wrote:

> We assume that "pd" can be null on the previous line, and throughout the
> function so we should check it here as well.  This was introduced by
> 9b2c2ff7a1c0 "mv643xx_eth: use sw csum for big packets"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Lennert Buytenhek <buytenh@wantstofly.org>
