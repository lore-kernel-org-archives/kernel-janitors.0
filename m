From: Alexander Aring <aring@mojatatu.com>
Date: Mon, 08 Apr 2019 18:16:18 +0000
Subject: Re: [PATCH net] 6lowpan: Off by one handling ->nexthdr
Message-Id: <20190408181618.2m5c3aqlqjmem57j@x220t>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190403053416.GA21913@kadam>
In-Reply-To: <20190403053416.GA21913@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Aring <alex.aring@gmail.com>, Jukka Rissanen <jukka.rissanen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On Wed, Apr 03, 2019 at 08:34:16AM +0300, Dan Carpenter wrote:
> NEXTHDR_MAX is 255.  What happens here is that we take a u8 value
> "hdr->nexthdr" from the network and then look it up in
> lowpan_nexthdr_nhcs[].  The problem is that if hdr->nexthdr is 0xff then
> we read one element beyond the end of the array so the array needs to
> be one element larger.
> 
> Fixes: 92aa7c65d295 ("6lowpan: add generic nhc layer interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alexander Aring <aring@mojatatu.com>

Thanks.

- Alex
