From: Jiri Pirko <jiri@resnulli.us>
Date: Sun, 28 Jul 2019 07:46:19 +0000
Subject: Re: [PATCH] rocker: fix memory leaks of fib_work on two error return paths
Message-Id: <20190728074619.GA2423@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190727233726.3121-1-colin.king@canonical.com>
In-Reply-To: <20190727233726.3121-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Ahern <dsahern@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Sun, Jul 28, 2019 at 01:37:26AM CEST, colin.king@canonical.com wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>Currently there are two error return paths that leak memory allocated
>to fib_work. Fix this by kfree'ing fib_work before returning.
>
>Addresses-Coverity: ("Resource leak")
>Fixes: 19a9d136f198 ("ipv4: Flag fib_info with a fib_nh using IPv6 gateway")
>Fixes: dbcc4fa718ee ("rocker: Fail attempts to use routes with nexthop objects")
>Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
