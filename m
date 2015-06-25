From: David Miller <davem@davemloft.net>
Date: Thu, 25 Jun 2015 09:13:30 +0000
Subject: Re: [patch -next] cavium/liquidio: fix some error handling in lio_set_phys_id()
Message-Id: <20150625.021330.1433395634367960208.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150624144702.GH1702@mwanda>
In-Reply-To: <20150624144702.GH1702@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: derek.chickles@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, sgoutham@cavium.com, rric@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2015 17:47:02 +0300

> There was a missing assignment so the "if (ret)" on the next line is
> never true.
> 
> Fixes: f21fb3ed364b ('Add support of Cavium Liquidio ethernet adapters')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
