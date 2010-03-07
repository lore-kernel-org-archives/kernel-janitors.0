From: David Miller <davem@davemloft.net>
Date: Sun, 07 Mar 2010 23:27:57 +0000
Subject: Re: [patch] bridge: cleanup: remove unneed check
Message-Id: <20100307.152757.142897943.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306111408.GJ4958@bicker>
	<20100306122031.GA15864@gondor.apana.org.au>
In-Reply-To: <20100306122031.GA15864@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au
Cc: error27@gmail.com, shemminger@linux-foundation.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sat, 6 Mar 2010 20:20:32 +0800

> On Sat, Mar 06, 2010 at 02:14:09PM +0300, Dan Carpenter wrote:
>> We dereference "port" on the lines immediately before and immediately 
>> after the test so port should hopefully never be null here.
>> 
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> Yes this looks correct to me.

Applied.
