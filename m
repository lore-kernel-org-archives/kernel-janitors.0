Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394D8C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 08:19:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB2761248
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 08:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbhHXITy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Aug 2021 04:19:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23802 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235068AbhHXITv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Aug 2021 04:19:51 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O7MeAw031024;
        Tue, 24 Aug 2021 08:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=8wCU5EWsvNQExg4maYHFsiPCLT6Ux4M3p1fuJ9KG1XE=;
 b=QA9a2j73u8QRwsY9/tzFMKGZUuRPN5yBHoKdciB2WZu7MSkk1eXR+E5ga4woLV8Z1B5t
 GgTqxQChODDE5FzbtvVhTu6oWoPRn9G/96yDfu5GBlTn9bUB17dPbJWxwebCrRDn/pWK
 CIhRxz34J113MUdHsBQtIFUObgnE0k87648L5sf/1dhkYKDAZDoAFiZaPrEcpfgnNYPf
 N5arKaG4aJKEPNtDJDc66YMO6/LjOl8d2eUa3DtydY7Gt4NNb5uBizn8XRPtIFA3yDmP
 VuJisW9OsI0C3aQzKDKTlm+3KqZOEdjC9omvM1ntZMGuX4Uk8Zu4TSwhcGe+oFrQmeHz uw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=8wCU5EWsvNQExg4maYHFsiPCLT6Ux4M3p1fuJ9KG1XE=;
 b=CutyS0ZQyqvdfOznkHgor88kbNIhgEO8kkcmYUsK+3hGaujXGJyfd8Ik5/zPLDMuQjTV
 koTASMmMjCf8fouK/WgzB8lapLmbOB/lpQBch4nFouQP3TSZv7FRqrn4aelJCCvXZiXH
 vgW3ZjsiYQInlEj/kRCz1jHIq3tKpM79e+rCxuMn+3hH4vuM/X9GsCwU7Ob1h3eI2H5x
 u+BpF7TaQzx5S7bvhtVFNQ7R2e3esgJhKJEeVfC7qfizf9TPqu8cYo/YE3d3tauNT434
 44g28dsslAodVOQwmo8K50n41hSV5MK13DHj0vHX+Nl1ALiFGIxyDsI39XWzRArfVYuk /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3akw7nbp4x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 08:19:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O8BESK030084;
        Tue, 24 Aug 2021 08:19:05 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
        by aserp3020.oracle.com with ESMTP id 3ajsa4uyfk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 08:19:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsgPzNr0LHPmlFj6NJP1lLmNqwMcUCwRa4tY+1VUgQo7U0Hon+7BaCGay6VOP4WvnF7QL3mTTIsB+kXc/RibpGTk+nhe/2l0ZUBBg8ptjV/GC8TdGXsMaKiQW3MFHSQdLD8uhThQ3/TMnpZUVK78cRCBx6I5pe2tp+xObDOOGVopg7uuViwOl3vzo0SsoAAAAC94Y01ELdGpyn4qGpRpP6QRd4vejy87lAfBaDZNSd+s4vu13D70N5ob40ck5/gHJ9tqPMCWxbWLW/T69Jm9zOY/l/8yL4f1TLARYYCvYXt4IjyzBqVzwEYEoKA002e+34+nqOrgh75eXhoK/DyWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wCU5EWsvNQExg4maYHFsiPCLT6Ux4M3p1fuJ9KG1XE=;
 b=d+c1d/2wnUpsSufcd+3T7ONG/7i5G8WUfzEpX5chFWAfHc8DgFWd3sl8PuLQfZP6LQNfMwAm0ULsss58qqEzXzsMb5U++DdD7AkPK2iEoG/FaGKq26ZwWVhBJ7GO906xdksuWTemn7YMaRbiRnZmAwwlqGap8wIzajOU8mIBujj2kkpgcsXYyCU1/PgpgVa+qrqBf92f1rXEvzyrxN8crR/WRa08BPBU2KejaXwa5T2zCUy78TBHaGzfb/JaqaPCqHBfuareCO8uBlKsKQ43g1aLaAIPzU/3MCoOokqrz1NWYRwv2rUSTVv5zw9TQXbzZQv8tsHdM+wHAkO2uab5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wCU5EWsvNQExg4maYHFsiPCLT6Ux4M3p1fuJ9KG1XE=;
 b=o02xOohnS4S9lv4tda2wTfudcR0Cp3VLdZMhdsoJnM+K5grIK+4Qht3U9dPPWl13+zx/2jBqmnCgI6rhfW/QwcM/rRdRKwJmh1/Mbs6Ko7cCTNKTrdgmsNNrNrz5Wd4Exzfvqb8mPvMYXVmUtkOYvPSEXJG3fSTGYkltKcLVBiQ=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR1001MB2325.namprd10.prod.outlook.com
 (2603:10b6:910:44::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:19:04 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a%2]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 08:19:04 +0000
Date:   Tue, 24 Aug 2021 11:18:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vladbu@nvidia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5: Bridge, allow merged eswitch connectivity
Message-ID: <20210824081852.GA17050@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0158.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::17) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0158.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:19:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 489722c7-4dac-458d-dc06-08d966d7d5a2
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2325:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1001MB23253F7713248768A821008F8EC59@CY4PR1001MB2325.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOrBkePG8IO+weOJFCXlAG5YCNpiqImTAVUokBviJXK5gFLaP00Z9GuTU8p6u9+5QJdDKDuLXuZs0sMqjqWXQZ/fC2lxMkcsvHFSj+DXD9ViC4vPBpZFUaN54m5Z6xBRGvFagh5ILJtYRxpKpoOF7CSADZD4olAmxdRmXHKieYRzoygkeC34KK6Pv/mMSwYS/tm4E77f0WipUzGTDxUJ25mRhwiXMxiL9uyjWsdcpyzB9yEclXJpCXMfg5c9u7OPCxNXNwcje4Iqq+bCsJguAUxECpiqYg6+QjJqgWke5ycXkQ/fa9MaDUkCfqeGNL5RvjKNr9PO8/WjF/n+2wB4OjwHHhWdg6A5xp1/4ZjDXTUntTtyyOQqVWhMV16HW5TQ5p9PenCxadjj1y7LJeBeQ24QA/KjqjkGoSHHjfHI4deCaLcltBs5pdvq0TeOLf3gFm2MNCzhNTL3qiPUbA+hydhU/H3+vaz+Rg9ujA4R3oYsTrsRYhLV2TnX8xQFwaUmFZ7X9G60oVMImoAflGaBxjnUKjxMG46K2k51EoT7nSi+dyopk/aNmDQSk8AA8pUd7fZeUYFf5EmJFvNBoWMx/ALnuEzI1rJvWoeE1cmGwL6JhEBJScGEyB3B72JOY+9iI2+Vo1EGisyf1m4VR3lI/mdk++bshmNLoLSazgIEDyohIOXSeM39x4njuRswjZ+ITG60Kb9+PMlDUix1sFeNfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(4326008)(8676002)(8936002)(316002)(956004)(1076003)(508600001)(9576002)(6916009)(38100700002)(38350700002)(5660300002)(44832011)(55016002)(33656002)(186003)(33716001)(66946007)(83380400001)(86362001)(6666004)(6496006)(52116002)(66476007)(9686003)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4GHrxwOnNiBq2nKSSCZGDOwC1z6bYD4HeMfW2v86VaQ1U20gAMxwAKMRbZyl?=
 =?us-ascii?Q?yXCtAWZVqGcf4+tzWvfwXJzy/GgP1SH0IWTn+MZZtZgONFAPEBYrgHJzPJlg?=
 =?us-ascii?Q?Yzk+g/S+NZ4S1+ksUwyAs265N4wjMTopppTX3tmxq9FFqtgFKqot2BNDi22M?=
 =?us-ascii?Q?vWEpI5/mOwMbAnnnyEzF9i4XW8tpZZ6G715W2LYHnx0ZXS6RB4/N59BTI12l?=
 =?us-ascii?Q?RDK2oi1a8fKxs0FsRdZKtGGprZUlsHQSJKdG03VmZbLZttMmPTRDuZFbrd83?=
 =?us-ascii?Q?9UKba5sfWYL/7HWZzAEtB1bW4U6NmoLMK0F/7VTpU+4RzcRuXCMNKLJrsgdB?=
 =?us-ascii?Q?pNLAvwXzHMDegSIrdIVuyzYV2NbqWZr5SoMRmizUoBB0bEviP0XjrvrlcYzR?=
 =?us-ascii?Q?IuR0w3RnmWWq+e3vb2Q3QOHseJxq9ppcjWaJUQb7sBB6TNg3mBZ0AJObssxs?=
 =?us-ascii?Q?DzJ/uAz1zImVXVXiTMpgjuSjTd4JnePaOaqMpVdGQDuxRhM2DLY5XAVpaNlk?=
 =?us-ascii?Q?3nzXLReW3XprVA86wtZmORf7YIIW+/9wpRlRtrPsRrrdTq45/NzjSPGmVpcz?=
 =?us-ascii?Q?ejOBlIyDuLg1Z+JvAnS8jNsno0e3El6zAEBRwBQy/xoKR63PEXndlF0y5/3Y?=
 =?us-ascii?Q?/PMqjxc0v6mulLHzBhI+jhKHfPIXryktfur4cfa02rwgOm38Nmnk1fyI+xw9?=
 =?us-ascii?Q?3ADlgJ027NFvo4XbLOEsMhM/ZHF1wmA19bpPEnqxzam0RGcEzRaxYiAskcfs?=
 =?us-ascii?Q?PMx4jCQsmy1Lxg3m3vF8SglDrhkjKcNLmfPL76ceAooAYVmOGfQpIYSjpAVC?=
 =?us-ascii?Q?ILL0Kw5FdLdEn9pVSnhKhslE6jR9dAMDYRBjcvJ9Tp6YSs/KDolEvTQnt6z2?=
 =?us-ascii?Q?45b60AqmlilyURX4FlE6stA/NF4WWbCzUdkbHqR8AUBhu+ZlRon8TqsSd0+P?=
 =?us-ascii?Q?RULdUuxDW365U/NOA9lmByQ9qrvne9D7Ak7DVao5LthyqI2Mna2mjHqrtZ0+?=
 =?us-ascii?Q?NFZAt3t8y2P98pIRMEqz0t38jvlxcfuiLoPulQ5HCFaGYJVpSgZmqMNTFlE2?=
 =?us-ascii?Q?WB6lP+w8qyUEbXpIp9iqAd5OURv9KxAyANz368kttp7LXC/ZfK9NX8I79PcR?=
 =?us-ascii?Q?mmfx0OvO27Op0Rqdgw0XdC0NsQidovegEP+kkEAef7TItjskHup3MF/uLNJQ?=
 =?us-ascii?Q?4ZetXhrFgq+LDphk/wA1aU6/1/wdDldrOAUpyXkLsqxCVnzn8XoOggjMuBhI?=
 =?us-ascii?Q?BC2MMTgFo+zSbVfpG8Gfs8VqJFbDw8BBzj/mDsDMlDMsa3dg+EsjR1TyUX7s?=
 =?us-ascii?Q?UiSXy1I3uwPP2iWtgtkjBO6K?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489722c7-4dac-458d-dc06-08d966d7d5a2
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:19:04.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQTt6Ct9bEY3oIG/mBRS2sV65+50OCHPaWAMfZNnabax4Ie5DQXK+WKMNAQwR3k7pnW0QRti1WYbrDoJ7LCIkOf4kt/t9DkA0tKullr7Hzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2325
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=941 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240056
X-Proofpoint-GUID: ipvmMHiz7PNl5ycf-Lj5Ig1u-cCz9v3s
X-Proofpoint-ORIG-GUID: ipvmMHiz7PNl5ycf-Lj5Ig1u-cCz9v3s
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vlad Buslov,

The patch c358ea1741bc: "net/mlx5: Bridge, allow merged eswitch
connectivity" from Jun 25, 2021, leads to the following
Smatch static checker warning:

	drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:164 mlx5_esw_bridge_port_changeupper()
	error: uninitialized symbol 'err'.

drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c
    128 static int mlx5_esw_bridge_port_changeupper(struct notifier_block *nb, void *ptr)
    129 {
    130 	struct mlx5_esw_bridge_offloads *br_offloads = container_of(nb,
    131 								    struct mlx5_esw_bridge_offloads,
    132 								    netdev_nb);
    133 	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
    134 	struct netdev_notifier_changeupper_info *info = ptr;
    135 	struct net_device *upper = info->upper_dev, *rep;
    136 	struct mlx5_eswitch *esw = br_offloads->esw;
    137 	u16 vport_num, esw_owner_vhca_id;
    138 	struct netlink_ext_ack *extack;
    139 	int ifindex = upper->ifindex;
    140 	int err;
    141 
    142 	if (!netif_is_bridge_master(upper))
    143 		return 0;
    144 
    145 	rep = mlx5_esw_bridge_rep_vport_num_vhca_id_get(dev, esw, &vport_num, &esw_owner_vhca_id);
    146 	if (!rep)
    147 		return 0;
    148 
    149 	extack = netdev_notifier_info_to_extack(&info->info);
    150 
    151 	if (mlx5_esw_bridge_is_local(dev, rep, esw))
    152 		err = info->linking ?
    153 			mlx5_esw_bridge_vport_link(ifindex, vport_num, esw_owner_vhca_id,
    154 						   br_offloads, extack) :
    155 			mlx5_esw_bridge_vport_unlink(ifindex, vport_num, esw_owner_vhca_id,
    156 						     br_offloads, extack);
    157 	else if (mlx5_esw_bridge_dev_same_hw(rep, esw))
    158 		err = info->linking ?
    159 			mlx5_esw_bridge_vport_peer_link(ifindex, vport_num, esw_owner_vhca_id,
    160 							br_offloads, extack) :
    161 			mlx5_esw_bridge_vport_peer_unlink(ifindex, vport_num, esw_owner_vhca_id,
    162 							  br_offloads, extack);

No else path?

    163 
--> 164 	return err;
    165 }

regards,
dan carpenter
