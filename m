From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Thu, 15 Jun 2017 11:57:40 +0000
Subject: Re: [PATCH] xfrm: NULL dereference on allocation failure
Message-Id: <20170615115740.GH2631@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614103537.GJ29394@elgon.mountain>
In-Reply-To: <20170614103537.GJ29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trent Jaeger <tjaeger@cse.psu.edu>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 01:35:37PM +0300, Dan Carpenter wrote:
> The default error code in pfkey_msg2xfrm_state() is -ENOBUFS.  We
> added a new call to security_xfrm_state_alloc() which sets "err" to zero
> so there several places where we can return ERR_PTR(0) if kmalloc()
> fails.  The caller is expecting error pointers so it leads to a NULL
> dereference.
> 
> Fixes: df71837d5024 ("[LSM-IPSec]: Security association restriction.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Also applied, thanks a lot Dan!
