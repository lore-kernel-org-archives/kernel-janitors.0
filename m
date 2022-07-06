Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E2DC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 14:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbiGFOE4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 10:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiGFOEy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 10:04:54 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C8BB9A
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 07:04:53 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266E3sT8010525;
        Wed, 6 Jul 2022 14:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=JvG+5JHi+IYUM59iPUc82uHnx/ddMTee9pI3zhFTxEQ=;
 b=onfGSd4J6Bf/vwgSdDN0Y89WHQIUbRVqMT5ntNIlgXQsdl9+CW4XtCVTnP0a/7jw2gQB
 ocKOxHjlNYw5y8ZR9taG64Wp7k19utEoidHD7CIsd4z+UCnhbkgT+8xnJ5vui1cdReW8
 td3Ai5fspVY81gvjZ4LFOqm280Ux9SfBSBcE7TG8Fey0N77dt6fw5uDr+joTl5hFBpB4
 LyUh0tZbel25cC1kMSs2kw1GWOLXf0hopFk8qFWny9W/gbofeNbrj1Q1bfuWlGHO9bIb
 ZNB2T+VlRu85eDx2NpFLcdBeDUXfKH/atYQAO4UvP0mhz8pgYjBG8eJBdv/BUSNjhf4T Kw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubya0td-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jul 2022 14:04:33 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 266DtqeI008644;
        Wed, 6 Jul 2022 14:04:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h4udek6qa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jul 2022 14:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAhfp9TCyHM07yNapfa3w4usTUt66zqDJG3fiXpFARO/69JZ0FG50fxzLzNShlq+yj3DTacn0CoZDUxlb/rjkpqAt0bWDd8QUDKMqSVBWDuaRHO6OXtKLE46rLRQSxghe8TEyjis0Jw28fbofx7L+Xx3ObmDWUklUGim3kzeXuufEOR2PWacI2JJu9EqjCjRjyFfCtzlwk4inSzVAJAsWL/GrtHL2N9acc6Ig/w8i096aW85yYUGvlkqqO1+i7bce8dMmO5sw4IG4bIwV57rcXeSMl83CkXTXhrOTh21fR4GyyIpCkQNGFvL0nwNyd5uW1kTQYtEsivqGhW5PC5TZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvG+5JHi+IYUM59iPUc82uHnx/ddMTee9pI3zhFTxEQ=;
 b=gr1dDOGs4rO4ccZHicXVTd0DxltR5VAk9JDZU3mI0FNZEqGpPYI5BDjusQrgZfxSgA2Vp8uZWgLlx47PTcl/Rdnks3d/9hMQNMO56I8vn4sQwnE4AkD395l4D1g0X9crCOgtpojuSxhH7tjbQIdzLsDalhrLxSpC2HEw0LCEbttE0oBpJBpwkR+vv6F4NsGrPv19pEHJ+1UX/CrNl9P3qsggtxh/4ZClO+3CNtlGKMqz800eUwInqJHAxrmvJHSfv7lV9CoyT21hPT/zixjJYfuXGWszwOor34TzzCheoghYJv08DUwdozlJoubKSw88AKI+ro+T8n1eMx2SgEiGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvG+5JHi+IYUM59iPUc82uHnx/ddMTee9pI3zhFTxEQ=;
 b=Nkv1TxHG8V7cMO6We5ZsZt6i44TNq8h+5zXX7sj1uAaFcHpkFfkEVc37Vsjk4DOdDNS+qYmxp7ot+Q0T2d+xw4zTk7cnMehhVyHbqYnL3Abftbl65SozSTUcXEoH/TnkncE6lry6Buzye/d46Qf8RAhMB5ToNzppZNta4KJaK4o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1673.namprd10.prod.outlook.com
 (2603:10b6:4:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 14:04:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 14:04:24 +0000
Date:   Wed, 6 Jul 2022 17:04:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jiawenwu@trustnetic.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: txgbe: Add build support for txgbe
Message-ID: <YsWWXYal9ZwmIo2G@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0155.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa032d76-b089-46f5-154a-08da5f586e96
X-MS-TrafficTypeDiagnostic: DM5PR10MB1673:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zwpO7KfqTgAs8lZAZKq9G02KZVJOp1OqiBZG3qWIiJYlLjeV/yeQP50TED1FVsPu2psxQvZF02tPuZwByhxJgwHWSQOeraO6T3hP8EPCeoTvhnnB4HzMzfXANrHQ/8DccgTwqGK3WVMDXLoKBdg/VNWuvM5P13ECn/op8BdvTl2aQKVEKstueXWTjY71r+hAUEmaGzsC7a1794cbi/qZ57Qm3urAyIJCkrLNSMCAMCL0szCrsb3Hlx+3gLlBe0k4vWWeQtjmiiQu7ay/LuLCJAiIQoBVyX1Hncq4n5wmZQOhaOEdy8FbqYiGUADjSRTxW5Qxt8WBD+L1u7u40ZKX9FGNqAtAnwRCVNMLh5YOjVSC/K6wwGnppBej5JsYa4Z1Sdo070ed+GtfzokoTPgyJiAdpwPvb88j3gyHXP5zr0jvaNXLaIAS5u7JWdgjHFTsz0VV/dC2V9JJzKfbL2R3SNF8/FxUtyU42Im2ij34lSTHY/E1M3zu5S/wgiqCFPINl6Sq4G236NZGp2t1UR4o2/xYLAmLwGWUhazsoKUYpmirfXDRfQckX0mvq+1FmfW/HBE4lwMjurmmKx3Ur2kLd4DgVPPe0EVuGBX0Kyq0Sm68Z229dW1hqWMdwlvlu1QoYa7hamYJnysWtaegPdRT1FaqezocyB4AWsqX5eGroKjPWRVPPQWIjcJYL3Asz0k3/oDEZbadJJitWbzOQXV2kr/RBYTCbj1JWwDI3E4MBgCsjg3GNbMX8tzMwm2D5hExEwLT12WpfdGeFz2WWT3ncjxDYqfqzXYGKVQPNZ4hIigPMOQtVuySMPoqlIRJBhb4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(136003)(376002)(346002)(39860400002)(366004)(8936002)(6486002)(66946007)(44832011)(478600001)(86362001)(4326008)(38350700002)(6512007)(8676002)(9686003)(33716001)(66476007)(5660300002)(66556008)(4744005)(26005)(186003)(52116002)(316002)(38100700002)(6916009)(2906002)(41300700001)(83380400001)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pt6EgFdxBafUeT3bTEVp6gDnusRqu4NnigQEqOFzESxX3ZMp54mk8sbjJ40z?=
 =?us-ascii?Q?hZoB781THBZeUO6vHwpxVOl6DdEhsSBuGo6qZXB7Ts9JqQDsZvM1HUSaXVsv?=
 =?us-ascii?Q?43LYEgFXyPUwIzbUtOVrKxqJ95FwNzrgGhcDCLflRo1sw7xoyqWOJLnJHcyK?=
 =?us-ascii?Q?DYo3y5NEvzF0VP445W/YDdkg2UxSyX/W7ic+UmBStov2ylaO5LziZUVwOhhw?=
 =?us-ascii?Q?dWJyOmuzBLGmPm8oUEikWw4NWt2ybajOc8io9HBeTM4jqiuLfD1khvhDw56f?=
 =?us-ascii?Q?aFThrHPnNhGimDhAnyjH1MCVrNhlL8hL859ZrNfnAXP3CIxj++Vu/V9jUOvS?=
 =?us-ascii?Q?qmy6DXDv3DVzv03d6zY9/Exwb8OkGsgPKkSWkhGYc0FrZvk3Xus5VKVam5SL?=
 =?us-ascii?Q?P+VAR1fkSzlQ1ae0iNn1vAfdyiZB1zWztzNuBfXEgqsNb5XKyzCTeWuAlXD0?=
 =?us-ascii?Q?jLGQfy6pMt93T2nsNKJWrmCNt+8kFQRufzJwT8WVQnCg0dHYrKqhwrLmd/xi?=
 =?us-ascii?Q?fXnTQbzIsSj16rKUW3cladJXaDkVTqKPvuBuJpzAOEg2bZiG+Y/N83GKKZbf?=
 =?us-ascii?Q?CeaEK7OWq9yRUW+Lq3wtymliRp6ZYe5gdJELgHDNLSfaoIwl7gv3ImxmohYm?=
 =?us-ascii?Q?ns5qa30XnUb6+jeP9eeyo07YmF9PwjiXAO6QN6uDAWNSRSfO3J4bgzlRrOzE?=
 =?us-ascii?Q?ItTx8+wfNnMPlWwlWX9QN3SNYLIWIiObZyDmGbBd4aVq2JTw25a7/9tjE7Hk?=
 =?us-ascii?Q?xQSm6zIXyASyOlZjRhVAVQJpxG/iX3CNgGWjLATm0dv+Ubg6ajPiIkt2bkfI?=
 =?us-ascii?Q?NzVIZPXb8gwbRsFTpZoVNPGirRldTXX/moLmO0R9EFWg2jDhRptweQXaVrrt?=
 =?us-ascii?Q?+FrWuMBEfW0Nso/3Vd5qGDUY4hg7+fwu5+zQUzScWgyc8DEortedsGXn8Tzk?=
 =?us-ascii?Q?B7Lz3Q+LI52GVMkjmgaht3Wx4rrmmOoIRHFEtqMBNrKzPZhoJbObw9gpGcMa?=
 =?us-ascii?Q?jNaseQW7qkQpA/hK42z1AkBntv0TDNOaXizhfa9IhJHRRKG7Pn5ZZNA+PY/I?=
 =?us-ascii?Q?SbGTjNeFDIpV98R3lq3Yr/oNOy+ZyuXftw6kHrFe20hZIuzHULZzXEJAgnei?=
 =?us-ascii?Q?ppOBe7KwiZ+4sHvFU1Rr1S5bivZ4GWC7fJb8qQbcMomRDDkvSDUkcRxrD002?=
 =?us-ascii?Q?wiFrqQVj4WsFMgWP/knSwMBjE6CiJVJLCKthqfTIWPmYcSTu93E1ZNFyjOeU?=
 =?us-ascii?Q?ZoGrIsxLH5uwU2KvYS1Y5bQ+DLym0nJywMESxAjn9W/o55DZNzAR5C9TBbeO?=
 =?us-ascii?Q?XcBFcKhQSZKpe+avbDFTA3qF2ngRFeni5qCgGQHyVZlFq/Vhi9uvktxjc569?=
 =?us-ascii?Q?0IkK5ABZYQZr3IU9CGE83bz15wAKecbedAD/gwLm7hFkjiVRr4rfESUsleNu?=
 =?us-ascii?Q?1KTbH6jtXV6K6loZjxjH1eXnyypwTFC6dMNmS2/5JJmSeHikB0k0TPnGqexM?=
 =?us-ascii?Q?nVTG4IzEteVWi/8V8KVDqInbyYfX/HFSUALtcKHco1x4Os8HAzqcA6dZSWjj?=
 =?us-ascii?Q?qJCQvQdZY8zsqa+rGhs5yjc+Gm7mlnZwNdEln94lGRxxFPr+qbmz8PIFySjV?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa032d76-b089-46f5-154a-08da5f586e96
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 14:04:24.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgW7o7+41zTWSg40i/gU31P9WxRXQSdVrt9OKnwEmuODo+zZ4hS+wPNLi6kNpdQP8ZvpdjHVER23ZmP2L2iUnDH5AeoJK6hSVk7Hd5/oJq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1673
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-06_08:2022-06-28,2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=870 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060055
X-Proofpoint-GUID: z2TDCPp7kCiSI7z-7JNMFtMO4qKxHV1h
X-Proofpoint-ORIG-GUID: z2TDCPp7kCiSI7z-7JNMFtMO4qKxHV1h
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jiawen Wu,

The patch 3ce7547e5b71: "net: txgbe: Add build support for txgbe"
from Jun 28, 2022, leads to the following Smatch static checker
warning:

	drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:50 txgbe_shutdown()
	error: uninitialized symbol 'wake'.

drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
    33  static void txgbe_dev_shutdown(struct pci_dev *pdev, bool *enable_wake)
                                                                   ^^^^^^^^^^^
Presumably this function is supposed to set "*enable_wake = true;" or
something?

    34  {
    35          struct txgbe_adapter *adapter = pci_get_drvdata(pdev);
    36          struct net_device *netdev = adapter->netdev;
    37  
    38          netif_device_detach(netdev);
    39  
    40          pci_disable_device(pdev);
    41  }
    42  
    43  static void txgbe_shutdown(struct pci_dev *pdev)
    44  {
    45          bool wake;
    46  
    47          txgbe_dev_shutdown(pdev, &wake);
    48  
    49          if (system_state == SYSTEM_POWER_OFF) {
    50                  pci_wake_from_d3(pdev, wake);
                                               ^^^^
Uninitialized.

    51                  pci_set_power_state(pdev, PCI_D3hot);
    52          }
    53  }

regards,
dan carpenter
