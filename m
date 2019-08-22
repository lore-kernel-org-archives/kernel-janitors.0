From: David Ahern <dsahern@gmail.com>
Date: Thu, 22 Aug 2019 12:59:02 +0000
Subject: Re: [PATCH] nexthops: remove redundant assignment to variable err
Message-Id: <ad6d4f72-c299-5704-31ee-a300c9c67396@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822125340.30783-1-colin.king@canonical.com>
In-Reply-To: <20190822125340.30783-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 8/22/19 8:53 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is initialized to a value that is never read and it is
> re-assigned later. The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ipv4/nexthop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: David Ahern <dsahern@gmail.com>
