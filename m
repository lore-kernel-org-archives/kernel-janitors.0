From: David Miller <davem@davemloft.net>
Date: Wed, 05 Apr 2017 13:54:18 +0000
Subject: Re: [PATCH -next] liquidio: clear the correct memory
Message-Id: <20170405.065418.597015931851791657.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403181827.GA6505@mwanda>
In-Reply-To: <20170403181827.GA6505@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: derek.chickles@caviumnetworks.com, prasad.kanneganti@cavium.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 3 Apr 2017 21:18:27 +0300

> There is a cut and paste bug here so we accidentally clear the first
> few bytes of "resp" a second time instead clearing "ctx".
> 
> Fixes: 50c0add534d2 ("liquidio: refactor interrupt moderation code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
