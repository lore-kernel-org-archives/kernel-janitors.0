From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 May 2019 07:19:51 +0000
Subject: [bug report] net: dsa: sja1105: Add support for Spanning Tree Protocol
Message-Id: <20190508071951.GA12293@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vladimir Oltean,

The patch 640f763f98c2: "net: dsa: sja1105: Add support for Spanning
Tree Protocol" from May 5, 2019, leads to the following static
checker warning:

	drivers/net/dsa/sja1105/sja1105_main.c:1073 sja1105_stp_state_get()
	warn: signedness bug returning '(-22)'

drivers/net/dsa/sja1105/sja1105_main.c
  1059  static u8 sja1105_stp_state_get(struct sja1105_private *priv, int port)
               ^^
  1060  {
  1061          struct sja1105_mac_config_entry *mac;
  1062  
  1063          mac = priv->static_config.tables[BLK_IDX_MAC_CONFIG].entries;
  1064  
  1065          if (!mac[port].ingress && !mac[port].egress && !mac[port].dyn_learn)
  1066                  return BR_STATE_BLOCKING;
  1067          if (mac[port].ingress && !mac[port].egress && !mac[port].dyn_learn)
  1068                  return BR_STATE_LISTENING;
  1069          if (mac[port].ingress && !mac[port].egress && mac[port].dyn_learn)
  1070                  return BR_STATE_LEARNING;
  1071          if (mac[port].ingress && mac[port].egress && mac[port].dyn_learn)
  1072                  return BR_STATE_FORWARDING;
  1073          return -EINVAL;
                ^^^^^^^^^^^^^^
The caller doesn't check for negative errors anyway.

  1074  }

regards,
dan carpenter
