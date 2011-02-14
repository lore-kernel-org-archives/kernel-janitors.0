From: Matt Mackall <mpm@selenic.com>
Date: Mon, 14 Feb 2011 22:42:24 +0000
Subject: Re: [PATCH 2/5] drivers/char/hw_random/omap-rng.c: Convert
Message-Id: <1297723344.5929.28.camel@calx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1297599132-7226-1-git-send-email-julia@diku.dk>
	 <1297599132-7226-3-git-send-email-julia@diku.dk>
In-Reply-To: <1297599132-7226-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Deepak Saxena <dsaxena@plexity.net>, kernel-janitors@vger.kernel.org, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org

On Sun, 2011-02-13 at 13:12 +0100, Julia Lawall wrote:
> Request_region should be used with release_region, not release_resource.
> 
> The local variable mem, storing the result of request_mem_region, is
> dropped and instead the pointer res is stored in the drvdata field of the
> platform device.  This information is retrieved in omap_rng_remove to
> release the region.  The drvdata field is not used elsewhere.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Looks ok to me, Herbert?

-- 
Mathematics is the supreme nostalgia of our time.


