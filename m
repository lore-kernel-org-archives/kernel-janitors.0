From: David Miller <davem@davemloft.net>
Date: Thu, 30 Jun 2016 12:56:26 +0000
Subject: Re: [patch] be2net: signedness bug in be_msix_enable()
Message-Id: <20160630.085626.1553236786452459332.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160629143943.GA22818@mwanda>
In-Reply-To: <20160629143943.GA22818@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sathya.perla@broadcom.com, ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com, somnath.kotur@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jun 2016 17:39:43 +0300

> "num_vec" needs to be signed for the error handling to work.
> 
> Fixes: e261768e9e39 ('be2net: support asymmetric rx/tx queue counts')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
