From: David Miller <davem@davemloft.net>
Date: Thu, 13 Nov 2014 19:40:07 +0000
Subject: Re: [patch v2 -next] amd-xgbe: fix ->rss_hash_type
Message-Id: <20141113.144007.803844779196991897.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141112.150459.233340605780805877.davem@davemloft.net>
	<20141113061905.GA1280@mwanda>
In-Reply-To: <20141113061905.GA1280@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: thomas.lendacky@amd.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Nov 2014 09:19:06 +0300

> There was a missing break statement so we set everything to
> PKT_HASH_TYPE_L3 even when we intended to use PKT_HASH_TYPE_L4.
> 
> Fixes: 5b9dfe299e55 ('amd-xgbe: Provide support for receive side scaling')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: remove blank line

Applied, thanks a lot Dan.
