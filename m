From: "Eelco Chaudron" <echaudro@redhat.com>
Date: Wed, 26 Sep 2018 12:38:30 +0000
Subject: Re: [PATCH net-next] net/core: make function ___gnet_stats_copy_basic() static
Message-Id: <130487F6-D4E4-477E-9ED6-07DA541F263E@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537963785-165570-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537963785-165570-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: john.fastabend@gmail.com, toke@toke.dk, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 26 Sep 2018, at 14:09, Wei Yongjun wrote:

> Fixes the following sparse warning:
>
> net/core/gen_stats.c:166:1: warning:
>  symbol '___gnet_stats_copy_basic' was not declared. Should it be static?
>

Thanks for fixing my commit ;)

Acked-by: Eelco Chaudron <echaudro@redhat.com>

> Fixes: 5e111210a443 ("net/core: Add new basic hardware counter")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  net/core/gen_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/core/gen_stats.c b/net/core/gen_stats.c
> index 65a2e82..9bf1b9a 100644
> --- a/net/core/gen_stats.c
> +++ b/net/core/gen_stats.c
> @@ -162,7 +162,7 @@
>  }
>  EXPORT_SYMBOL(__gnet_stats_copy_basic);
>
> -int
> +static int
>  ___gnet_stats_copy_basic(const seqcount_t *running,
>  			 struct gnet_dump *d,
>  			 struct gnet_stats_basic_cpu __percpu *cpu,
