From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Thu, 15 Jun 2017 11:56:58 +0000
Subject: Re: [PATCH] xfrm: Oops on error in pfkey_msg2xfrm_state()
Message-Id: <20170615115658.GG2631@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614103405.GI29394@elgon.mountain>
In-Reply-To: <20170614103405.GI29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 01:34:05PM +0300, Dan Carpenter wrote:
> There are some missing error codes here so we accidentally return NULL
> instead of an error pointer.  It results in a NULL pointer dereference.
> 
> Fixes: df71837d5024 ("[LSM-IPSec]: Security association restriction.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied, thanks!
