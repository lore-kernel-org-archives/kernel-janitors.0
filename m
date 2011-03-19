From: David Miller <davem@davemloft.net>
Date: Sat, 19 Mar 2011 04:53:13 +0000
Subject: Re: [patch] ftmac100: use resource_size()
Message-Id: <20110318.215313.149843288.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319043915.GB2008@bicker>
In-Reply-To: <20110319043915.GB2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: ratbert@faraday-tech.com, eric.dumazet@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 19 Mar 2011 07:39:15 +0300

> The calculation is off-by-one.  It should be "end - start + 1".  This
> patch fixes it to use resource_size() instead.  Oddly, the code already
> uses resource size correctly a couple lines earlier when it calls
> request_mem_region() for this memory.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks for fixing this Dan.
