From: David Ahern <dsahern@gmail.com>
Date: Fri, 07 Jun 2019 13:54:01 +0000
Subject: Re: [bug report] ipv4: Plumb support for nexthop object in a fib_info
Message-Id: <885df715-19ab-73eb-bd7d-da15a5244602@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190607084256.GA380@mwanda>
In-Reply-To: <20190607084256.GA380@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/7/19 2:42 AM, Dan Carpenter wrote:
> Hello David Ahern,
> 
> The patch 4c7e8084fd46: "ipv4: Plumb support for nexthop object in a
> fib_info" from Jun 3, 2019, leads to the following static checker
> warning:
> 
> 	net/ipv4/fib_semantics.c:1482 fib_create_info()
> 	error: we previously assumed 'nh' could be null (see line 1357)
> 

Thanks for the report. The patch in question is a prep patch; the
reported dead code will be made live in a followup set.
