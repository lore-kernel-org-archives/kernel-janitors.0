From: Dan Carpenter <error27@gmail.com>
Date: Fri, 23 Jul 2010 22:15:14 +0000
Subject: Re: [patch -next v2] mv643xx_eth: potential null dereference
Message-Id: <20100723221514.GJ26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723101528.GF26313@bicker> <1279881177.24768.1623.camel@Joe-Laptop.home> <20100723110504.GG26313@bicker> <4C49C39E.8020502@bfs.de>
In-Reply-To: <4C49C39E.8020502@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Joe Perches <joe@perches.com>, Lennert Buytenhek <buytenh@wantstofly.org>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Denis Kirjanov <kirjanov@gmail.com>, Saeed Bishara <saeed@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 23, 2010 at 06:30:22PM +0200, walter harms wrote:
> this is a bit complicated, IMHO ppl have a bigger chance to discover what is going on
> with this version:
> 
>     if (!pd ) {
>        msp->t_clk = 133000000;
>        msp->tx_csum_limit = 9 * 1024;
>      }
>      else
>       {
> 	msp->t_clk = pd->t_clk ? pd->t_clk : 133000000 ;
>         msp->tx_csum_limit = pd->tx_csum_limit ? pd->tx_csum_limit : 9 * 1024;
>        }
> 

But then instead of 2 magic numbers we would have 4. :/

regards,
dan carpenter
