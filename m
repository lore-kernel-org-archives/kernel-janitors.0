From: Stephen Hemminger <stephen.hemminger@vyatta.com>
Date: Fri, 07 Dec 2012 17:08:00 +0000
Subject: Re: [patch v2] bridge: make buffer larger in br_setlink()
Message-Id: <81d549e4-cdee-4c0f-88c7-6d2341c7b1f2@tahiti.vyatta.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121207111045.GA9676@elgon.mountain>
In-Reply-To: <20121207111045.GA9676@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Graf <tgraf@suug.ch>, netdev@vger.kernel.org, bridge@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>



----- Original Message -----
> We pass IFLA_BRPORT_MAX to nla_parse_nested() so we need
> IFLA_BRPORT_MAX + 1 elements.  Also Smatch complains that we read
> past
> the end of the array when in br_set_port_flag() when it's called with
> IFLA_BRPORT_FAST_LEAVE.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Style tweak.
> 
> Only needed in linux-next.
> 
> diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
> index 850b7d1..cfc5cfe 100644
> --- a/net/bridge/br_netlink.c
> +++ b/net/bridge/br_netlink.c
> @@ -239,7 +239,7 @@ int br_setlink(struct net_device *dev, struct
> nlmsghdr *nlh)
>  	struct ifinfomsg *ifm;
>  	struct nlattr *protinfo;
>  	struct net_bridge_port *p;
> -	struct nlattr *tb[IFLA_BRPORT_MAX];
> +	struct nlattr *tb[IFLA_BRPORT_MAX + 1];
>  	int err;
>  
>  	ifm = nlmsg_data(nlh);
> 
> 

Acked-by: Stephen Hemminger <shemminger@vyatta.com>
