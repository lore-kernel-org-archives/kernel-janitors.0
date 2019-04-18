From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 18 Apr 2019 10:52:34 +0000
Subject: Re: [PATCH] net: ipv6: addrlabel: fix spelling mistake "requewst" -> "request"
Message-Id: <2b20f045-a386-723b-9a8f-265cc96d0916@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418103918.10729-1-colin.king@canonical.com>
In-Reply-To: <20190418103918.10729-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/18/2019 4:09 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a NL_SET_ERR_MSG_MOD error message,
> fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   net/ipv6/addrlabel.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv6/addrlabel.c b/net/ipv6/addrlabel.c
> index d43d076c98f5..1766325423b5 100644
> --- a/net/ipv6/addrlabel.c
> +++ b/net/ipv6/addrlabel.c
> @@ -476,7 +476,7 @@ static int ip6addrlbl_valid_dump_req(const struct nlmsghdr *nlh,
>   	}
>   
>   	if (nlmsg_attrlen(nlh, sizeof(*ifal))) {
> -		NL_SET_ERR_MSG_MOD(extack, "Invalid data after header for address label dump requewst");
> +		NL_SET_ERR_MSG_MOD(extack, "Invalid data after header for address label dump request");
>   		return -EINVAL;
>   	}
>   
