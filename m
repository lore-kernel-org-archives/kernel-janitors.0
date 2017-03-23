From: David Miller <davem@davemloft.net>
Date: Thu, 23 Mar 2017 02:25:34 +0000
Subject: Re: [patch] sfc: cleanup a condition in efx_udp_tunnel_del()
Message-Id: <20170322.192534.1032558291775882753.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170322091002.GB14520@mwanda>
In-Reply-To: <20170322091002.GB14520@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Mar 2017 12:10:02 +0300

> Presumably if there is an "add" function, there is also a "del"
> function.  But it causes a static checker warning because it looks like
> a common cut and paste bug.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good, applied, thanks Dan.
