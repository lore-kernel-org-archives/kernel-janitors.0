From: David Ahern <dsahern@gmail.com>
Date: Sun, 28 Jul 2019 00:32:33 +0000
Subject: Re: [PATCH] rocker: fix memory leaks of fib_work on two error return paths
Message-Id: <d3b8bb71-21d3-97ae-0807-d0300ba44a04@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190727233726.3121-1-colin.king@canonical.com>
In-Reply-To: <20190727233726.3121-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/27/19 5:37 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there are two error return paths that leak memory allocated
> to fib_work. Fix this by kfree'ing fib_work before returning.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 19a9d136f198 ("ipv4: Flag fib_info with a fib_nh using IPv6 gateway")
> Fixes: dbcc4fa718ee ("rocker: Fail attempts to use routes with nexthop objects")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/rocker/rocker_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Thanks for the patch,
Reviewed-by: David Ahern <dsahern@gmail.com>
