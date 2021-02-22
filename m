Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C4CC433DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Feb 2021 11:24:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B90664DDA
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Feb 2021 11:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhBVLYl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Feb 2021 06:24:41 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:34450 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhBVLYl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Feb 2021 06:24:41 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MBK8mV094182;
        Mon, 22 Feb 2021 11:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=FfJBQO9jBhUtK/gmUSDuAE61wn1qPeSaWDLF6dLR76w=;
 b=EvBUGlDaRde2SrjOMo7N6vUBJWLoGw7fKuvQZpaIPWZQ/I2FZjbssyveb2q15D0d6rVG
 p6hFBabjI6HqHHSxGeuHM2UpO9VftkihJg90D4CwSEvBkMeji4Gsc4bshZwafielRKsV
 cnjcjW4w37qQ/69Es93DrXK5z9h7mFGNsoQ7Jj2v5aBht0mtI+Ko7ARTcbMfiyM9DVdM
 34EDY42HCvNaCc13/yMd4MvTGV3aWNziHuTJclv/haotjBwyNFv/NYSuSeim3bX5v9hT
 jEmPJQB86xZGUANpmDXprxSBupwgwH/3OohGW4rWSZHwucXlwE4FCH3xr5n/vmNtqPbA /A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 36tsuqua7q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 11:23:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MBKQBr168223;
        Mon, 22 Feb 2021 11:23:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 36ucbvycmj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 11:23:54 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11MBNrm5013557;
        Mon, 22 Feb 2021 11:23:53 GMT
Received: from mwanda (/10.175.170.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 22 Feb 2021 03:23:52 -0800
Date:   Mon, 22 Feb 2021 14:23:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hariprasad@chelsio.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] cxgb4: Add support for dynamic allocation of resources
 for ULD
Message-ID: <YDOUQjkElDIS5yKK@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220105
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220105
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Hariprasad Shenai,

The patch 94cdb8bb993a: "cxgb4: Add support for dynamic allocation of
resources for ULD" from Aug 17, 2016, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:7099 init_one()
	warn: 'adapter->msix_bmap.msix_bmap' double freed

drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
  7005                                   "could not offload tc matchall, continuing\n");
  7006                  if (cxgb4_init_ethtool_filters(adapter))
  7007                          dev_warn(&pdev->dev,
  7008                                   "could not initialize ethtool filters, continuing\n");
  7009          }
  7010  
  7011          /* See what interrupts we'll be using */
  7012          if (msi > 1 && enable_msix(adapter) == 0)
  7013                  adapter->flags |= CXGB4_USING_MSIX;
  7014          else if (msi > 0 && pci_enable_msi(pdev) == 0) {
  7015                  adapter->flags |= CXGB4_USING_MSI;
  7016                  if (msi > 1)
  7017                          free_msix_info(adapter);
                                ^^^^^^^^^^^^^^^^^^^^^^^^
free here

  7018          }
  7019  
  7020          /* check for PCI Express bandwidth capabiltites */
  7021          pcie_print_link_status(pdev);
  7022  
  7023          cxgb4_init_mps_ref_entries(adapter);
  7024  
  7025          err = init_rss(adapter);
  7026          if (err)
  7027                  goto out_free_dev;
                        ^^^^^^^^^^^^^^^^^
Assume we hit this goto

  7028  
  7029          err = setup_non_data_intr(adapter);
  7030          if (err) {
  7031                  dev_err(adapter->pdev_dev,
  7032                          "Non Data interrupt allocation failed, err: %d\n", err);
  7033                  goto out_free_dev;
  7034          }
  7035  
  7036          err = setup_fw_sge_queues(adapter);
  7037          if (err) {
  7038                  dev_err(adapter->pdev_dev,
  7039                          "FW sge queue allocation failed, err %d", err);
  7040                  goto out_free_dev;
  7041          }
  7042  
  7043  fw_attach_fail:
  7044          /*
  7045           * The card is now ready to go.  If any errors occur during device
  7046           * registration we do not fail the whole card but rather proceed only
  7047           * with the ports we manage to register successfully.  However we must
  7048           * register at least one net device.
  7049           */
  7050          for_each_port(adapter, i) {
  7051                  pi = adap2pinfo(adapter, i);
  7052                  adapter->port[i]->dev_port = pi->lport;
  7053                  netif_set_real_num_tx_queues(adapter->port[i], pi->nqsets);
  7054                  netif_set_real_num_rx_queues(adapter->port[i], pi->nqsets);
  7055  
  7056                  netif_carrier_off(adapter->port[i]);
  7057  
  7058                  err = register_netdev(adapter->port[i]);
  7059                  if (err)
  7060                          break;
  7061                  adapter->chan_map[pi->tx_chan] = i;
  7062                  print_port_info(adapter->port[i]);
  7063          }
  7064          if (i == 0) {
  7065                  dev_err(&pdev->dev, "could not register any net devices\n");
  7066                  goto out_free_dev;
  7067          }
  7068          if (err) {
  7069                  dev_warn(&pdev->dev, "only %d net devices registered\n", i);
  7070                  err = 0;
  7071          }
  7072  
  7073          if (cxgb4_debugfs_root) {
  7074                  adapter->debugfs_root = debugfs_create_dir(pci_name(pdev),
  7075                                                             cxgb4_debugfs_root);
  7076                  setup_debugfs(adapter);
  7077          }
  7078  
  7079          /* PCIe EEH recovery on powerpc platforms needs fundamental reset */
  7080          pdev->needs_freset = 1;
  7081  
  7082          if (is_uld(adapter))
  7083                  cxgb4_uld_enable(adapter);
  7084  
  7085          if (!is_t4(adapter->params.chip))
  7086                  cxgb4_ptp_init(adapter);
  7087  
  7088          if (IS_REACHABLE(CONFIG_THERMAL) &&
  7089              !is_t4(adapter->params.chip) && (adapter->flags & CXGB4_FW_OK))
  7090                  cxgb4_thermal_init(adapter);
  7091  
  7092          print_adapter_info(adapter);
  7093          return 0;
  7094  
  7095   out_free_dev:
  7096          t4_free_sge_resources(adapter);
  7097          free_some_resources(adapter);
  7098          if (adapter->flags & CXGB4_USING_MSIX)
  7099                  free_msix_info(adapter);
                        ^^^^^^^^^^^^^^^^^^^^^^^
Double free?

  7100          if (adapter->num_uld || adapter->num_ofld_uld)
  7101                  t4_uld_mem_free(adapter);
  7102   out_unmap_bar:
  7103          if (!is_t4(adapter->params.chip))
  7104                  iounmap(adapter->bar2);
  7105   out_free_adapter:
  7106          if (adapter->workq)
  7107                  destroy_workqueue(adapter->workq);
  7108  
  7109          kfree(adapter->mbox_log);
  7110          kfree(adapter);
  7111   out_unmap_bar0:
  7112          iounmap(regs);
  7113   out_disable_device:
  7114          pci_disable_pcie_error_reporting(pdev);
  7115          pci_disable_device(pdev);
  7116   out_release_regions:
  7117          pci_release_regions(pdev);
  7118          return err;
  7119  }

regards,
dan carpenter
