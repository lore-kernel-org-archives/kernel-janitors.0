From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 31 Jul 2017 07:41:40 +0000
Subject: Re: [PATCH net] mcs7780: Silence uninitialized variable warning
Message-Id: <20170731070925.ztlfbyd7pvoz46wh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170728144511.tf7nc672hwo35rnn@mwanda>
 <20170729.232855.1831311386560187695.davem@davemloft.net>
In-Reply-To: <20170729.232855.1831311386560187695.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: samuel@sortiz.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 29, 2017 at 11:28:55PM -0700, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Fri, 28 Jul 2017 17:45:11 +0300
> 
> > -	__u16 rval;
> > +	__u16 rval = -1;
> 
> Fixing a bogus warning by assigning a signed constant to an
> unsigned variable doesn't really make me all that happy.
> 
> I don't think I'll apply this, sorry.

There's no guarantee that small kmallocs will always succeed in future
kernels so it's not *totally* bogus.

regards,
dan carpenter


