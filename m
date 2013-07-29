From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Mon, 29 Jul 2013 09:16:53 +0000
Subject: Re: [patch -mainline v2] af_key: more info leaks in pfkey messages
Message-Id: <20130729091653.GS3109@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130725073205.GQ3109@secunet.com>
 <20130728200444.GA8684@elgon.mountain>
 <20130728.132128.473273050357111535.davem@davemloft.net>
In-Reply-To: <20130728.132128.473273050357111535.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: dan.carpenter@oracle.com, herbert@gondor.hengli.com.au, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, minipli@googlemail.com

On Sun, Jul 28, 2013 at 01:21:28PM -0700, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Sun, 28 Jul 2013 23:04:45 +0300
> 
> > This is inspired by a5cc68f3d6 "af_key: fix info leaks in notify
> > messages".  There are some struct members which don't get initialized
> > and could disclose small amounts of private information.
> > 
> > Acked-by: Mathias Krause <minipli@googlemail.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: set ->sadb_x_policy_priority correctly instead of just clearing it
> 
> I'll apply this as soon as Steffen reviews it.

The patch looks good, for the case you want to apply it directly to
the net tree:

Acked-by: Steffen Klassert <steffen.klassert@secunet.com>

