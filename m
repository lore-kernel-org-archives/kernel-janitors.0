From: David Miller <davem@davemloft.net>
Date: Thu, 22 Jul 2010 21:13:19 +0000
Subject: Re: [patch -next] caif: precedence bug
Message-Id: <20100722.141319.259998389.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100722111131.GB17585@bicker>
In-Reply-To: <20100722111131.GB17585@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: SjurBraendeland@stericsson.com, sjur.brandeland@stericsson.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Jul 2010 13:11:31 +0200

> Negate has precedence over comparison so the original assert only
> checked that "rfml->fragment_size" was larger than 1 or 0.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
