From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Feb 2019 19:46:27 +0000
Subject: [bug report] rocker: Check Handle PORT_PRE_BRIDGE_FLAGS
Message-Id: <20190222194627.GA30893@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch 93700458ff63: "rocker: Check Handle PORT_PRE_BRIDGE_FLAGS"
from Feb 20, 2019, leads to the following static checker warning:

	drivers/net/ethernet/rocker/rocker_main.c:2087 rocker_port_attr_set()
	warn: missing break? reassigning 'err'

drivers/net/ethernet/rocker/rocker_main.c
    2069 static int rocker_port_attr_set(struct net_device *dev,
    2070 				const struct switchdev_attr *attr,
    2071 				struct switchdev_trans *trans)
    2072 {
    2073 	struct rocker_port *rocker_port = netdev_priv(dev);
    2074 	int err = 0;
    2075 
    2076 	switch (attr->id) {
    2077 	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
    2078 		err = rocker_world_port_attr_stp_state_set(rocker_port,
    2079 							   attr->u.stp_state,
    2080 							   trans);
    2081 		break;
    2082 	case SWITCHDEV_ATTR_ID_PORT_PRE_BRIDGE_FLAGS:
    2083 		err = rocker_world_port_attr_pre_bridge_flags_set(rocker_port,
    2084 							      attr->u.brport_flags,
    2085 							      trans);

I think you wanted a break here.  Or a /* fall through */ comment.

    2086 	case SWITCHDEV_ATTR_ID_PORT_BRIDGE_FLAGS:
--> 2087 		err = rocker_world_port_attr_bridge_flags_set(rocker_port,
    2088 							      attr->u.brport_flags,
    2089 							      trans);
    2090 		break;
    2091 	case SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME:
    2092 		err = rocker_world_port_attr_bridge_ageing_time_set(rocker_port,
    2093 								    attr->u.ageing_time,
    2094 								    trans);
    2095 		break;
    2096 	default:
    2097 		err = -EOPNOTSUPP;
    2098 		break;
    2099 	}
    2100 
    2101 	return err;
    2102 }

regards,
dan carpenter
