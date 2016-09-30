From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Sep 2016 09:55:20 +0000
Subject: [bug report] net: ena: Add a driver for Amazon Elastic Network Adapters (ENA)
Message-Id: <20160930095520.GA10045@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Netanel Belgazal,

The patch 1738cd3ed342: "net: ena: Add a driver for Amazon Elastic
Network Adapters (ENA)" from Aug 10, 2016, leads to the following
static checker warning:

	drivers/net/ethernet/amazon/ena/ena_ethtool.c:459 ena_flow_hash_to_flow_type()
	warn: bitwise AND condition is false here

drivers/net/ethernet/amazon/ena/ena_ethtool.c
   454  
   455  static u32 ena_flow_hash_to_flow_type(u16 hash_fields)
   456  {
   457          u32 data = 0;
   458  
   459          if (hash_fields & ENA_ADMIN_RSS_L2_DA)
                                  ^^^^^^^^^^^^^^^^^^^
This is zero.

   460                  data |= RXH_L2DA;
   461  
   462          if (hash_fields & ENA_ADMIN_RSS_L3_DA)
   463                  data |= RXH_IP_DST;
   464  
   465          if (hash_fields & ENA_ADMIN_RSS_L3_SA)
   466                  data |= RXH_IP_SRC;
   467  
   468          if (hash_fields & ENA_ADMIN_RSS_L4_DP)
   469                  data |= RXH_L4_B_2_3;
   470  
   471          if (hash_fields & ENA_ADMIN_RSS_L4_SP)
   472                  data |= RXH_L4_B_0_1;
   473  
   474          return data;
   475  }


regards,
dan carpenter
