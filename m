Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F86C4743D
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 12:24:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1B861073
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 12:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbhFHMZw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Jun 2021 08:25:52 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38082 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbhFHMZv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 08:25:51 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 158CMOk5072289;
        Tue, 8 Jun 2021 12:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=7YYymniu7E6rNjJaL3UQVEMMCESPsbjbI/lhcsBS8G4=;
 b=eBGMlw6FzlAQ6oZkdu9jPkLkj+BBrNu+JpYAahyVybb2VOC8fnaja8t/9lWpNwzI27sT
 mpam1OlYvv7+p773NakV2M0m8lx3ln42eXq/ZML++U525DI9NmIMQpzNDosnbU4uupTK
 DlV5opkcuv30S1XOd38eUqxzltL0VFFWSzNqtfoCemHPbC1ozF0M0WlxKQM27Yq3F2I8
 WmhgY/Py+/CqtxKwMrVuUO5FA6vA+vsg7vIvjhEmwZ6nF4EkdPq0UFrPutLKUxtS0IeX
 rp+Ja4GM5B0Zj5ewBDFtZIweVGvEF4jt9wDlwomyKM18VVij+L3ioW8HD+OThYdPRn9I mQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 3914qumdtf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Jun 2021 12:23:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 158CGZQS191487;
        Tue, 8 Jun 2021 12:23:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 3922wrv5ad-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Jun 2021 12:23:53 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 158CNrGc083202;
        Tue, 8 Jun 2021 12:23:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 3922wrv57u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Jun 2021 12:23:53 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 158CNqMS011012;
        Tue, 8 Jun 2021 12:23:52 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Jun 2021 05:23:50 -0700
Date:   Tue, 8 Jun 2021 15:23:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vladimir.oltean@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: pcs: xpcs: convert to phylink_pcs_ops
Message-ID: <YL9hTvz8QOo/+lu7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: jyEucg_jQXXRxqAVo1ncUu_sU53OH1hI
X-Proofpoint-GUID: jyEucg_jQXXRxqAVo1ncUu_sU53OH1hI
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=626 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080082
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vladimir Oltean,

The patch 11059740e616: "net: pcs: xpcs: convert to phylink_pcs_ops"
from Jun 2, 2021, leads to the following static checker warning:

	drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1237 stmmac_phy_setup()
	error: we previously assumed 'mdio_bus_data' could be null (see line 1225)

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
  1215  static int stmmac_phy_setup(struct stmmac_priv *priv)
  1216  {
  1217          struct stmmac_mdio_bus_data *mdio_bus_data = priv->plat->mdio_bus_data;
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  1218          struct fwnode_handle *fwnode = of_fwnode_handle(priv->plat->phylink_node);
  1219          int mode = priv->plat->phy_interface;
  1220          struct phylink *phylink;
  1221  
  1222          priv->phylink_config.dev = &priv->dev->dev;
  1223          priv->phylink_config.type = PHYLINK_NETDEV;
  1224          priv->phylink_config.pcs_poll = true;
  1225          if (priv->plat->mdio_bus_data)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^
This old code assumes mdio_bus_data can be NULL.

  1226                  priv->phylink_config.ovr_an_inband =
  1227                          mdio_bus_data->xpcs_an_inband;
  1228  
  1229          if (!fwnode)
  1230                  fwnode = dev_fwnode(priv->device);
  1231  
  1232          phylink = phylink_create(&priv->phylink_config, fwnode,
  1233                                   mode, &stmmac_phylink_mac_ops);
  1234          if (IS_ERR(phylink))
  1235                  return PTR_ERR(phylink);
  1236  
  1237          if (mdio_bus_data->has_xpcs) {
                    ^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

  1238                  struct mdio_xpcs_args *xpcs = priv->hw->xpcs;
  1239  
  1240                  phylink_set_pcs(phylink, &xpcs->pcs);
  1241          }
  1242  
  1243          priv->phylink = phylink;
  1244          return 0;
  1245  }

regards,
dan carpenter
