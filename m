From: David Miller <davem@davemloft.net>
Date: Fri, 07 Aug 2015 04:57:05 +0000
Subject: Re: [patch] mpls: small cleanup in inet/inet6_fib_lookup_dev()
Message-Id: <20150806.215705.2259534799573368398.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150804074422.GB10867@mwanda>
In-Reply-To: <20150804074422.GB10867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ebiederm@xmission.com, rshearma@brocade.com, roopa@cumulusnetworks.com, tom@herbertland.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 4 Aug 2015 10:44:22 +0300

> We recently changed this code from returning NULL to returning ERR_PTR.
> There are some left over NULL assignments which we can remove.  We can
> preserve the error code from ip_route_output() instead of always
> returning -ENODEV.  Also these functions use a mix of gotos and direct
> returns.  There is no cleanup necessary so I changed the gotos to
> direct returns.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
