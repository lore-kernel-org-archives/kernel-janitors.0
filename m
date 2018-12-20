From: Roopa Prabhu <roopa@cumulusnetworks.com>
Date: Thu, 20 Dec 2018 16:56:01 +0000
Subject: Re: [PATCH][next] neighbour: remove stray semicolon
Message-Id: <CAJieiUj6mDAjEgmy5wLWFO0Fpi+NOMvw08sB4Tk0maMJjeU7FA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181220165050.17429-1-colin.king@canonical.com>
In-Reply-To: <20181220165050.17429-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@gmail.com>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Dec 20, 2018 at 8:50 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the stray semicolon means that the final term in the addition
> is being missed.  Fix this by removing it. Cleans up clang warning:
>
> net/core/neighbour.c:2821:9: warning: expression result unused [-Wunused-value]
>
> Fixes: 82cbb5c631a0 ("neighbour: register rtnl doit handler")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-By: Roopa Prabhu <roopa@cumulusnetworks.com>

Thanks!.


> ---
>  net/core/neighbour.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> index 43687c9abe1d..1c4b7814ac32 100644
> --- a/net/core/neighbour.c
> +++ b/net/core/neighbour.c
> @@ -2817,7 +2817,7 @@ static int neigh_get_reply(struct net *net, struct neighbour *neigh,
>  static inline size_t pneigh_nlmsg_size(void)
>  {
>         return NLMSG_ALIGN(sizeof(struct ndmsg))
> -              + nla_total_size(MAX_ADDR_LEN); /* NDA_DST */
> +              + nla_total_size(MAX_ADDR_LEN) /* NDA_DST */
>                + nla_total_size(1); /* NDA_PROTOCOL */
>  }
>
> --
> 2.19.1
>
