From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:08:03 +0000
Subject: Re: [PATCH 27/56] ipv4: Remove void casts
Message-Id: <49DDC903.5040803@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>
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
>  net/ipv4/route.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index c40debe..3699077 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2707,8 +2707,7 @@ static struct dst_ops ipv4_dst_blackhole_ops = {
>  static int ipv4_dst_blackhole(struct net *net, struct rtable **rp, struct flowi *flp)
>  {
>  	struct rtable *ort = *rp;
> -	struct rtable *rt = (struct rtable *)
> -		dst_alloc(&ipv4_dst_blackhole_ops);
> +	struct rtable *rt = dst_alloc(&ipv4_dst_blackhole_ops);
>  
>  	if (rt) {
>  		struct dst_entry *new = &rt->u.dst;
>   

