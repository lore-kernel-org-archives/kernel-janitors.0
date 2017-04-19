From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Wed, 19 Apr 2017 05:24:01 +0000
Subject: Re: [PATCH] esp6: Fix esp6_gso_segment()
Message-Id: <20170419052401.GD15917@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418195151.GA24793@mwanda>
In-Reply-To: <20170418195151.GA24793@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 18, 2017 at 10:51:51PM +0300, Dan Carpenter wrote:
> This NULL test is inverted so the function become a no-op.
> 
> Fix: 7862b4058b9f10 ("esp: Add gso handlers for esp4 and esp6")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is still in Steffen's git tree and not yet in the networking tree.

Same patch was already sent to netdev, so I took that one.

Thanks anyway!
