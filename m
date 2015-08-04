From: Robert Shearman <rshearma@brocade.com>
Date: Tue, 04 Aug 2015 13:53:02 +0000
Subject: Re: [patch] mpls: small cleanup in inet/inet6_fib_lookup_dev()
Message-Id: <55C0C3BE.8010007@brocade.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150804074422.GB10867@mwanda>
In-Reply-To: <20150804074422.GB10867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Roopa Prabhu <roopa@cumulusnetworks.com>, Tom Herbert <tom@herbertland.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/08/15 08:44, Dan Carpenter wrote:
> We recently changed this code from returning NULL to returning ERR_PTR.
> There are some left over NULL assignments which we can remove.  We can
> preserve the error code from ip_route_output() instead of always
> returning -ENODEV.  Also these functions use a mix of gotos and direct
> returns.  There is no cleanup necessary so I changed the gotos to
> direct returns.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Robert Shearman <rshearma@brocade.com>
