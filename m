From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:08:37 +0000
Subject: Re: [PATCH 28/56] ipv6: Remove void casts
Message-Id: <49DDC925.9050706@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, davem@davemloft.net

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  net/ipv6/route.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 1394ddb..9c70a88 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -834,8 +834,7 @@ EXPORT_SYMBOL(ip6_route_output);
>  int ip6_dst_blackhole(struct sock *sk, struct dst_entry **dstp, struct flowi *fl)
>  {
>  	struct rt6_info *ort = (struct rt6_info *) *dstp;
> -	struct rt6_info *rt = (struct rt6_info *)
> -		dst_alloc(&ip6_dst_blackhole_ops);
> +	struct rt6_info *rt = dst_alloc(&ip6_dst_blackhole_ops);
>  	struct dst_entry *new = NULL;
>  
>  	if (rt) {
>   

