From: David Ahern <dsahern@gmail.com>
Date: Fri, 31 May 2019 18:37:40 +0000
Subject: Re: [PATCH][next] nexthop: remove redundant assignment to err
Message-Id: <27d7fdc8-f2ef-6940-ec93-736c95e82cfa@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530155754.31634-1-colin.king@canonical.com>
In-Reply-To: <20190530155754.31634-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/30/19 9:57 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is initialized with a value that is never read
> and err is reassigned a few statements later. This initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ipv4/nexthop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: David Ahern <dsahern@gmail.com>
