From: David Miller <davem@davemloft.net>
Date: Tue, 07 Sep 2010 01:35:31 +0000
Subject: Re: [patch] irda: off by one
Message-Id: <20100906.183531.191390472.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100904131435.GL5437@bicker>
In-Reply-To: <20100904131435.GL5437@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: samuel@sortiz.org, adobriyan@gmail.com, lizf@cn.fujitsu.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 4 Sep 2010 15:14:35 +0200

> This is an off by one.  We would go past the end when we NUL terminate
> the "value" string at end of the function.  The "value" buffer is
> allocated in irlan_client_parse_response() or
> irlan_provider_parse_command().
> 
> CC: stable@kernel.org
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
