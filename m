From: David Miller <davem@davemloft.net>
Date: Wed, 01 Feb 2017 17:44:33 +0000
Subject: Re: [patch net-next] sfc: a couple off by one bugs
Message-Id: <20170201.124433.584968147490170553.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170201085040.GA31514@mwanda>
In-Reply-To: <20170201085040.GA31514@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 1 Feb 2017 11:50:40 +0300

> These checks are off by one.  These are just sanity checks and we don't
> ever pass invalid values for "encap_type" so it's harmless.
> 
> Fixes: 9b4108012517 ("sfc: insert catch-all filters for encapsulated traffic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Please respin against net-next and Colin's fix.

Thanks.
