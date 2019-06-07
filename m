From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2019 15:29:51 +0000
Subject: Re: [PATCH next] nexthop: off by one in nexthop_mpath_select()
Message-Id: <20190607152951.GR31203@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190607135636.GB16718@mwanda>
 <0e02a744-f28e-e206-032b-a0ffac9f7311@gmail.com>
In-Reply-To: <0e02a744-f28e-e206-032b-a0ffac9f7311@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ahern <dsahern@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 07, 2019 at 08:54:33AM -0600, David Ahern wrote:
> On 6/7/19 7:56 AM, Dan Carpenter wrote:
> > The nhg->nh_entries[] array is allocated in nexthop_grp_alloc() and it
> > has nhg->num_nh elements so this check should be >= instead of >.
> > 
> > Fixes: f88d8ea67fbd ("ipv6: Plumb support for nexthop object in a fib6_info")
> 
> Wrong fixes. The helper was added by 430a049190de so it should be
> 
> Fixes: 430a049190de ("nexthop: Add support for nexthop groups")
> 

Sorry, my eyes must have gone squiffy.  I don't even know how I got that
wrong.  Let me resend.

regards,
dan carpenter
