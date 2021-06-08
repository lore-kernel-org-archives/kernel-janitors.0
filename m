Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDA9C47082
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 12:55:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A996608FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 12:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbhFHM4x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Jun 2021 08:56:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:50330 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbhFHM4w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 08:56:52 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 158Cp3AX134382;
        Tue, 8 Jun 2021 12:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=YBFjEx/YJpCisR8OOkZT8b35xfum0wLphC6LCZINojM=;
 b=LwCg5QjE0G94T5Xb9jFXZyhKcw7a5l9YEkomhc6isBjD/LYnBz01bHw0D+mT8D0BbZYl
 Lm1YuKJe6aA2Z4p2AlrJ37ZnF2sTyNsDFvu/10rD73OCINWRF+7TN4HGOZEsh6yEkz8E
 ly2Idc+DWHqKe/YCKpIl+B4Q6Wydmntis8gD5cPk/Ki9dBGcfeJMbgTS5vyK4T5GWJNT
 0OR8GO6ZQP1axoMBcYiQP93g7miABtoYHFYcIZBgZ35kMQFfc2ZtFCoTpYaA8pgKAMxp
 ZUOWJG2164QaI9qY+oVDPvovtO4g+9vzLaI7AB7+8cLfUM/BOyKfeHLX0Q7tB6kf3bO+ Ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 3914qumh89-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Jun 2021 12:54:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 158CoLUC166159;
        Tue, 8 Jun 2021 12:54:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38yxcupyhn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Jun 2021 12:54:56 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 158Cstlf173055;
        Tue, 8 Jun 2021 12:54:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 38yxcupyh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Jun 2021 12:54:55 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 158CstTV009807;
        Tue, 8 Jun 2021 12:54:55 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Jun 2021 05:54:54 -0700
Date:   Tue, 8 Jun 2021 15:54:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] net: pcs: xpcs: convert to phylink_pcs_ops
Message-ID: <20210608125449.GI10983@kadam>
References: <YL9hTvz8QOo/+lu7@mwanda>
 <20210608123708.eofu2dlgzop3d667@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608123708.eofu2dlgzop3d667@skbuf>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: qPUrmBfGsI8xeUx--DriAgHwNv2ogTgQ
X-Proofpoint-GUID: qPUrmBfGsI8xeUx--DriAgHwNv2ogTgQ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080085
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 08, 2021 at 12:37:08PM +0000, Vladimir Oltean wrote:
> Hello Dan Carpenter,
> 
> On Tue, Jun 08, 2021 at 03:23:42PM +0300, Dan Carpenter wrote:
> > Hello Vladimir Oltean,
> > 
> > The patch 11059740e616: "net: pcs: xpcs: convert to phylink_pcs_ops"
> > from Jun 2, 2021, leads to the following static checker warning:
> > 
> > 	drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1237 stmmac_phy_setup()
> > 	error: we previously assumed 'mdio_bus_data' could be null (see line 1225)
> > 
> > drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >   1215  static int stmmac_phy_setup(struct stmmac_priv *priv)
> >   1216  {
> >   1217          struct stmmac_mdio_bus_data *mdio_bus_data = priv->plat->mdio_bus_data;
> >                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   1218          struct fwnode_handle *fwnode = of_fwnode_handle(priv->plat->phylink_node);
> >   1219          int mode = priv->plat->phy_interface;
> >   1220          struct phylink *phylink;
> >   1221  
> >   1222          priv->phylink_config.dev = &priv->dev->dev;
> >   1223          priv->phylink_config.type = PHYLINK_NETDEV;
> >   1224          priv->phylink_config.pcs_poll = true;
> >   1225          if (priv->plat->mdio_bus_data)
> >                     ^^^^^^^^^^^^^^^^^^^^^^^^^
> > This old code assumes mdio_bus_data can be NULL.
> > 
> >   1226                  priv->phylink_config.ovr_an_inband =
> >   1227                          mdio_bus_data->xpcs_an_inband;
> >   1228  
> >   1229          if (!fwnode)
> >   1230                  fwnode = dev_fwnode(priv->device);
> >   1231  
> >   1232          phylink = phylink_create(&priv->phylink_config, fwnode,
> >   1233                                   mode, &stmmac_phylink_mac_ops);
> >   1234          if (IS_ERR(phylink))
> >   1235                  return PTR_ERR(phylink);
> >   1236  
> >   1237          if (mdio_bus_data->has_xpcs) {
> >                     ^^^^^^^^^^^^^^^^^^^^^^^
> > Unchecked dereference.
> > 
> >   1238                  struct mdio_xpcs_args *xpcs = priv->hw->xpcs;
> >   1239  
> >   1240                  phylink_set_pcs(phylink, &xpcs->pcs);
> >   1241          }
> >   1242  
> >   1243          priv->phylink = phylink;
> >   1244          return 0;
> >   1245  }
> > 
> > regards,
> > dan carpenter
> 
> This should be solved here:
> https://lore.kernel.org/netdev/20210604112825.011148a3@canb.auug.org.au/ 

Nope.  That is a fix for merge conflict and it has been removed from
today's linux-next.  It's unrelated.

regards,
dan carpenter
