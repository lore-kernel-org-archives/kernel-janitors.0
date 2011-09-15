From: David Miller <davem@davemloft.net>
Date: Thu, 15 Sep 2011 19:42:29 +0000
Subject: Re: [patch 3/3 -next] 6LoWPAN: call dev_put() on error in
Message-Id: <20110915.154229.2135105151765674100.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110830135109.GJ3705@shale.localdomain>
In-Reply-To: <20110830135109.GJ3705-z0WHZYlhLlzP0Z7Jsv878P8+0UxHXcjY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-zigbee-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Aug 2011 16:51:09 +0300

> We should release the dev_hold() on error before returning here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
