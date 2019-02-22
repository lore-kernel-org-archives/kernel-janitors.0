From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 22 Feb 2019 19:48:15 +0000
Subject: Re: [bug report] rocker: Check Handle PORT_PRE_BRIDGE_FLAGS
Message-Id: <13275337-b090-c7ec-f5ab-3e5e658a675e@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222194627.GA30893@kadam>
In-Reply-To: <20190222194627.GA30893@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/22/19 11:46 AM, Dan Carpenter wrote:
> Hello Florian Fainelli,
> 
> The patch 93700458ff63: "rocker: Check Handle PORT_PRE_BRIDGE_FLAGS"
> from Feb 20, 2019, leads to the following static checker warning:
> 
> 	drivers/net/ethernet/rocker/rocker_main.c:2087 rocker_port_attr_set()
> 	warn: missing break? reassigning 'err'
> 
> drivers/net/ethernet/rocker/rocker_main.c
>     2069 static int rocker_port_attr_set(struct net_device *dev,
>     2070 				const struct switchdev_attr *attr,
>     2071 				struct switchdev_trans *trans)
>     2072 {
>     2073 	struct rocker_port *rocker_port = netdev_priv(dev);
>     2074 	int err = 0;
>     2075 
>     2076 	switch (attr->id) {
>     2077 	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
>     2078 		err = rocker_world_port_attr_stp_state_set(rocker_port,
>     2079 							   attr->u.stp_state,
>     2080 							   trans);
>     2081 		break;
>     2082 	case SWITCHDEV_ATTR_ID_PORT_PRE_BRIDGE_FLAGS:
>     2083 		err = rocker_world_port_attr_pre_bridge_flags_set(rocker_port,
>     2084 							      attr->u.brport_flags,
>     2085 							      trans);
> 
> I think you wanted a break here.  Or a /* fall through */ comment.

It's fixed with this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/?idz25c6c0aac85bbc50d3ce49cd08888adb14508b

thanks for your report!
-- 
Florian
