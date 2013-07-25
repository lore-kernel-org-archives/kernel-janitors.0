From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jul 2013 08:24:38 +0000
Subject: Re: [patch -mainline] af_key: more info leaks in pfkey messages
Message-Id: <20130725082438.GZ5585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130724103956.GA30345@elgon.mountain>
 <20130725073205.GQ3109@secunet.com>
In-Reply-To: <20130725073205.GQ3109@secunet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Mathias Krause <minipli@googlemail.com>, Herbert Xu <herbert@gondor.hengli.com.au>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 25, 2013 at 09:32:06AM +0200, Steffen Klassert wrote:
> Userspace seems not to care, but the correct setting would be
> 
> pol->sadb_x_policy_priority = xp->priority;
> 
> So maybe we should send the right priority to userspace, just for
> the case that anyone is interested in it.
> 

Yep.  Of course.  Thanks.  I will redo and resend.

regards,
dan carpenter

