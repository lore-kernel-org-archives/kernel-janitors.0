From: David Ahern <dsahern@gmail.com>
Date: Fri, 11 Sep 2020 14:48:12 +0000
Subject: Re: [PATCH] ipv6: remove redundant assignment to variable err
Message-Id: <a243b2e5-8d6e-dddf-3e3d-a89949f5ccb6@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911103509.22907-1-colin.king@canonical.com>
In-Reply-To: <20200911103509.22907-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/11/20 4:35 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read and
> it is being updated later with a new value. The initialization is redundant
> and can be removed.  Also re-order variable declarations in reverse
> Christmas tree ordering.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ipv6/route.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: David Ahern <dsahern@gmail.com>
