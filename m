From: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Date: Wed, 12 Jul 2017 08:02:53 +0000
Subject: Re: [PATCH net] net: ipmr: ipmr_get_table() returns NULL
Message-Id: <ceca8ed6-f40f-7b62-2681-61b7cf1eb9d2@cumulusnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712075647.zyz6pkppyerl4ktf@mwanda>
In-Reply-To: <20170712075647.zyz6pkppyerl4ktf@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Donald Sharp <sharpd@cumulusnetworks.com>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/07/17 10:56, Dan Carpenter wrote:
> The ipmr_get_table() function doesn't return error pointers it returns
> NULL on error.
> 
> Fixes: 4f75ba6982bc ("net: ipmr: Add ipmr_rtm_getroute")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
> index bb909f1d7537..06863ea3fc5b 100644
> --- a/net/ipv4/ipmr.c
> +++ b/net/ipv4/ipmr.c
> @@ -2431,8 +2431,8 @@ static int ipmr_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
>  	tableid = tb[RTA_TABLE] ? nla_get_u32(tb[RTA_TABLE]) : 0;
>  
>  	mrt = ipmr_get_table(net, tableid ? tableid : RT_TABLE_DEFAULT);
> -	if (IS_ERR(mrt)) {
> -		err = PTR_ERR(mrt);
> +	if (!mrt) {
> +		err = -ENOENT;
>  		goto errout_free;
>  	}
>  
> 

Good catch, ipmr_new_table() is the one that can return err ptr.

Acked-by: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>

