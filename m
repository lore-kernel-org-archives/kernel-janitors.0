From: David Miller <davem@davemloft.net>
Date: Fri, 23 Jul 2010 20:05:55 +0000
Subject: Re: [patch -next v2] mv643xx_eth: potential null dereference
Message-Id: <20100723.130555.35023547.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279881177.24768.1623.camel@Joe-Laptop.home>
	<20100723110504.GG26313@bicker>
	<20100723111818.GV21121@mail.wantstofly.org>
In-Reply-To: <20100723111818.GV21121@mail.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buytenh@wantstofly.org
Cc: error27@gmail.com, joe@perches.com, jpirko@redhat.com, kirjanov@gmail.com, saeed@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Lennert Buytenhek <buytenh@wantstofly.org>
Date: Fri, 23 Jul 2010 13:18:18 +0200

> On Fri, Jul 23, 2010 at 01:05:05PM +0200, Dan Carpenter wrote:
> 
>> We assume that "pd" can be null on the previous line, and throughout the
>> function so we should check it here as well.  This was introduced by
>> 9b2c2ff7a1c0 "mv643xx_eth: use sw csum for big packets"
>> 
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Acked-by: Lennert Buytenhek <buytenh@wantstofly.org>

Applied.
