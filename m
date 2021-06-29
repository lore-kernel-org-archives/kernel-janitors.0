Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2ACC11F6A
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 08:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0E5B61DE2
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 08:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbhF2IYk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:24:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11842 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232523AbhF2IYh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Jun 2021 04:24:37 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15T8IEYq021363;
        Tue, 29 Jun 2021 08:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=P+lWGIaOIsvGRfI2vLUuh3JMKpCcAN3pyN4JnvpOiIc=;
 b=C2loMAkzC3AR6zaIEUAWMN/0hCW1sxWsWkZ7dABOqbGtAUvIDlPplYxVMYxhNpFu13CH
 TOTFr94tbkZwpD2mIh8i0+1ngfKiJgUl4C1RUbUBOT0f3WDTQKwAWfYzyh8PqtLpuna+
 tilHbUXYFjtoDx63ByeAp7snSqrQxY89tw7Fg8Q/cJs1aY/wflJUICqOkZ4GO1l1jmkS
 sGOD3TRrfS2A2hrMkyw79ZeKcRJ7j65kDtA5l2aR4VIfHXnlB3noxMaBvYtf7l/x2mB8
 1ikRfCVYGGHYY/Gcan9IW4ZN5NfHtwKAQEIg3piewe64vgwdGIDDxSESJENRds5JpNwU Xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39f6pqax1a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 08:22:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15T8Fpj7112745;
        Tue, 29 Jun 2021 08:22:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 39dv255drr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 08:22:09 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15T8L1EH127500;
        Tue, 29 Jun 2021 08:22:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 39dv255dr4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 08:22:09 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15T8M7LE026457;
        Tue, 29 Jun 2021 08:22:07 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Jun 2021 01:22:07 -0700
Date:   Tue, 29 Jun 2021 11:22:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     steen.hegelund@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: sparx5: add the basic sparx5 driver
Message-ID: <YNrYKpunrhDmsP+P@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: vGw0MHKF887SiBJMpjgMzBCmwyuZDMHt
X-Proofpoint-ORIG-GUID: vGw0MHKF887SiBJMpjgMzBCmwyuZDMHt
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Steen Hegelund,

The patch 3cfa11bac9bb: "net: sparx5: add the basic sparx5 driver"
from Jun 24, 2021, leads to the following static checker warning:

	drivers/net/ethernet/microchip/sparx5/sparx5_main.c:760 mchp_sparx5_probe()
	error: uninitialized symbol 'mac_addr'.

drivers/net/ethernet/microchip/sparx5/sparx5_main.c
   661  static int mchp_sparx5_probe(struct platform_device *pdev)
   662  {
   663          struct initial_port_config *configs, *config;
   664          struct device_node *np = pdev->dev.of_node;
   665          struct device_node *ports, *portnp;
   666          struct reset_control *reset;
   667          struct sparx5 *sparx5;
   668          int idx = 0, err = 0;
   669          u8 *mac_addr;
                ^^^^^^^^^^^^

   670  
   671          if (!np && !pdev->dev.platform_data)
   672                  return -ENODEV;
   673  
   674          sparx5 = devm_kzalloc(&pdev->dev, sizeof(*sparx5), GFP_KERNEL);
   675          if (!sparx5)
   676                  return -ENOMEM;
   677  
   678          platform_set_drvdata(pdev, sparx5);
   679          sparx5->pdev = pdev;
   680          sparx5->dev = &pdev->dev;
   681  
   682          /* Do switch core reset if available */
   683          reset = devm_reset_control_get_optional_shared(&pdev->dev, "switch");
   684          if (IS_ERR(reset))
   685                  return dev_err_probe(&pdev->dev, PTR_ERR(reset),
   686                                       "Failed to get switch reset controller.\n");
   687          reset_control_reset(reset);
   688  
   689          /* Default values, some from DT */
   690          sparx5->coreclock = SPX5_CORE_CLOCK_DEFAULT;
   691  
   692          ports = of_get_child_by_name(np, "ethernet-ports");
   693          if (!ports) {
   694                  dev_err(sparx5->dev, "no ethernet-ports child node found\n");
   695                  return -ENODEV;
   696          }
   697          sparx5->port_count = of_get_child_count(ports);
   698  
   699          configs = kcalloc(sparx5->port_count,
   700                            sizeof(struct initial_port_config), GFP_KERNEL);
   701          if (!configs) {
   702                  err = -ENOMEM;
   703                  goto cleanup_pnode;
   704          }
   705  
   706          for_each_available_child_of_node(ports, portnp) {
   707                  struct sparx5_port_config *conf;
   708                  struct phy *serdes;
   709                  u32 portno;
   710  
   711                  err = of_property_read_u32(portnp, "reg", &portno);
   712                  if (err) {
   713                          dev_err(sparx5->dev, "port reg property error\n");
   714                          continue;
   715                  }
   716                  config = &configs[idx];
   717                  conf = &config->conf;
   718                  conf->speed = SPEED_UNKNOWN;
   719                  conf->bandwidth = SPEED_UNKNOWN;
   720                  err = of_get_phy_mode(portnp, &conf->phy_mode);
   721                  if (err) {
   722                          dev_err(sparx5->dev, "port %u: missing phy-mode\n",
   723                                  portno);
   724                          continue;
   725                  }
   726                  err = of_property_read_u32(portnp, "microchip,bandwidth",
   727                                             &conf->bandwidth);
   728                  if (err) {
   729                          dev_err(sparx5->dev, "port %u: missing bandwidth\n",
   730                                  portno);
   731                          continue;
   732                  }
   733                  err = of_property_read_u32(portnp, "microchip,sd-sgpio", &conf->sd_sgpio);
   734                  if (err)
   735                          conf->sd_sgpio = ~0;
   736                  else
   737                          sparx5->sd_sgpio_remapping = true;
   738                  serdes = devm_of_phy_get(sparx5->dev, portnp, NULL);
   739                  if (IS_ERR(serdes)) {
   740                          err = dev_err_probe(sparx5->dev, PTR_ERR(serdes),
   741                                              "port %u: missing serdes\n",
   742                                              portno);
   743                          goto cleanup_config;
   744                  }
   745                  config->portno = portno;
   746                  config->node = portnp;
   747                  config->serdes = serdes;
   748  
   749                  conf->media = PHY_MEDIA_DAC;
   750                  conf->serdes_reset = true;
   751                  conf->portmode = conf->phy_mode;
   752                  conf->power_down = true;
   753                  idx++;
   754          }
   755  
   756          err = sparx5_create_targets(sparx5);
   757          if (err)
   758                  goto cleanup_config;
   759  
   760          if (of_get_mac_address(np, mac_addr)) {
                                           ^^^^^^^^
Never initialized

   761                  dev_info(sparx5->dev, "MAC addr was not set, use random MAC\n");
   762                  eth_random_addr(sparx5->base_mac);
   763                  sparx5->base_mac[5] = 0;
   764          } else {
   765                  ether_addr_copy(sparx5->base_mac, mac_addr);
                                                          ^^^^^^^^

   766          }
   767  
   768          sparx5->xtr_irq = platform_get_irq_byname(sparx5->pdev, "xtr");
   769  
   770          /* Read chip ID to check CPU interface */
   771          sparx5->chip_id = spx5_rd(sparx5, GCB_CHIP_ID);
   772  
   773          sparx5->target_ct = (enum spx5_target_chiptype)
   774                  GCB_CHIP_ID_PART_ID_GET(sparx5->chip_id);
   775  
   776          /* Initialize Switchcore and internal RAMs */
   777          err = sparx5_init_switchcore(sparx5);
   778          if (err) {
   779                  dev_err(sparx5->dev, "Switchcore initialization error\n");
   780                  goto cleanup_config;
   781          }
   782  
   783          /* Initialize the LC-PLL (core clock) and set affected registers */
   784          err = sparx5_init_coreclock(sparx5);
   785          if (err) {
   786                  dev_err(sparx5->dev, "LC-PLL initialization error\n");
   787                  goto cleanup_config;
   788          }
   789  
   790          for (idx = 0; idx < sparx5->port_count; ++idx) {
   791                  config = &configs[idx];
   792                  if (!config->node)
   793                          continue;
   794  

regards,
dan carpenter
