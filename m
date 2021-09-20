Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA91C433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 20 Sep 2021 07:51:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 474746104F
	for <kernel-janitors@archiver.kernel.org>; Mon, 20 Sep 2021 07:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhITHw0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 20 Sep 2021 03:52:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49734 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235264AbhITHuD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Sep 2021 03:50:03 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18K4b0Ul017942;
        Mon, 20 Sep 2021 07:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=7+PpnULdZDvtn9uJJhgBcrrjYPAHbUxKT06S+mM5xK8=;
 b=o+5vXlnUiMFkzIOcLbehrpImlZQKAOO7IvhUuauioV/QVqOJvV7HNXg3DHDVtSSJC2kP
 45Iu+tZcFk0jC24irXrdmLAmU9SW/73vusszYT+wZD5DCmI9FFaK+H2HsuPdxRcJVrwG
 3Y/dlY760vworKBIAwwvT7GIu65eD3EdtFHHUnyqIBRZwTNCQH9YHnkUnkMPYWyL9LH6
 1Arth9ji49HuAqADZaPBe60VJ7cmShp80PjLiV0Mu0x4iWxt105VgsO1kf4JgfWVwJgr
 PKHOrakicSwVSR+S5NpK1FkKu0IZEH5wXx7XLbqznBDxGbDbUcFfTBTz36s3PS+iC6ps Jw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=7+PpnULdZDvtn9uJJhgBcrrjYPAHbUxKT06S+mM5xK8=;
 b=nwPR5+YQxbimkyvcqpCJbqcJrYlGFLSYMkPDa2gMrEGT+3cyne+vCZUjYzBFdUpc7ZWw
 ohqXLQp69OL76iNyAiom5Ir1S8z5bZnEfKn6uqcNtM1RPmWy0a0fRpcQx4WUti/5pfUB
 LeypGavGx5c+E5Pv9ysvKbq45ddqpsegFapUDKYDv2QdDdwtNlFX76J4k0Y0KY24Reno
 f1Ad2GImUnoVh+GWAvztWEZPJYGGXnDrZOsbS04f+igpViKuOsyIA4j5nACQWCI2Zg16
 rdKAluomsLMkyGZCn8F7LvR9o1x4ohoZjO0Obyxuj/YW4Ek3GhYJvXdbDNZxHsYfUEYW LQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b66gn19na-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Sep 2021 07:48:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18K7kggI073116;
        Mon, 20 Sep 2021 07:48:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        by aserp3020.oracle.com with ESMTP id 3b57x3pk4v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Sep 2021 07:48:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHRYRx5qeMB+z2omYHAYQfAAlcdBs2+tn2rKxOKVR3OcK41LrZTpJqBTS6ngqMDZ9Bp2r+dJQ25kblShq9NizlZmkImLWXZDMRi4jwo/IZTWRALaNdrzpTMGQzkO48SZgo/NRBEinvoHrARGWUy8kNGlSSExSSQgDqn2Q4vb/KvB5PW8m+gtokCQZV7fSsA4bGcCkzb7kUD7hrNZKTivryEkbNLkfQv1HQVKSY+E4O2v9oyOjI/dpPc3rfFmDbOVTdnF+nbmTYDkgoKPsxFTkL4JenTiGgiY+KQvrZ8HfSvx65bj3rFwWqF4lX/ilwF3cK2aXlgbVFbn5D0YZvyPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7+PpnULdZDvtn9uJJhgBcrrjYPAHbUxKT06S+mM5xK8=;
 b=IHLA6KdBlEKsQ8QSwiabWbSXbsmT1AEIJ8t/ZeobVLt0vYRafmu04ud33o1hDGm/T0rlGXLaJqVxOCsEM2wpwcJ9qySCRAaytrX46uiow8s27QOgrjWuyl+EO10yoodVb6G3wwU/jamH3AJ3Esr0U+r8IzexsL+xgtL/qd+H58yBtVPP10oK8VMeo9LYPsSAQjXUSe1in4auEBnJb9NtHEGnjV+utWM0yyHgGKbBUyxXYHrfrz3Ff9mgWV8Lr6V06PSGny6soGaavCIH6ZnFnGE+cs84AS2bISa2yn3uRFaMFLv/6IXm2G3eQci6EGKBpAi3aekgvoE/fU5IJk9J9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+PpnULdZDvtn9uJJhgBcrrjYPAHbUxKT06S+mM5xK8=;
 b=Rz4sMOvr7HxqfRhsP1D/31V88dMEhtbJ41LYe1HGlyYj08oUA6613MNhCvklGecBkT8Z2vcz32bZD/wTVChqux7+9iDgC6nj3W5LSR4b07Ieumuhj+tYfWOCaDBbRkHvd1RAFsDQFkY416Vsflg4CQ3KnJeSh13Lcm30+C1FBQg=
Authentication-Results: baidu.com; dkim=none (message not signed)
 header.d=none;baidu.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1885.namprd10.prod.outlook.com
 (2603:10b6:300:10a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 07:48:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 07:48:31 +0000
Date:   Mon, 20 Sep 2021 10:48:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     caihuoqing@baidu.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: arc_emac: Make use of the helper function
 dev_err_probe()
Message-ID: <20210920074822.GA21488@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 07:48:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a7dff79-e220-4913-3141-08d97c0b0ab9
X-MS-TrafficTypeDiagnostic: MWHPR10MB1885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB18854B21F3B29517EE5A30CF8EA09@MWHPR10MB1885.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p4v+ZttYuCe+/LZsdeVRbQzY2Yi7rUqvZ434cwv/O5Ni2mJIOa9s2fAyWDhmDMA4bOt11hh86dJc0J81aZh85VK7QdR1qLh9EhDNGCQUqrjHp7o86VsI1AnLQmoX5EADF+UzbtFrngp0NS/p9dlmfTB/fFCuCEJm1VclbkYlfReQhIGU2Bww1Ry3XeQxooHGXNaox8w/ak6JB54bW936+B0jT41IIXzjK3nqW8aDc1c6jglt2ySdDinTw4Ggk21FPasUYQmGv0IveKJtpUiaH2/GGvxQ2vTMEIvBO6TcrTWqRffOxeUBsJstVlXFaDoyRpYELcPeCJUmLM5bSgWK9m/d9jLNY2sGyM/I9cgTWMn5xKXRzISOkcK053M4NEpGCoJuNAJcWgotVEJMI5nq0tZDnB2qJylSHxgRJJD8ht5Xsko0VEln/BeHwJiBaeckgS61a3TGoddiMFGSLxoixTZDS5TfG7lXa+nm5+XaPc5+X7lOx+K5nsVKN3Zh9K5tGUUXQvxunlyLfqsJc91ESQ2jFXhoIXIyiwoV5xpWzFtG1+gFmzg3v3SPANj6NNWw8csNsV/sLsp1kM0Yj0EAQkdazkDDhyxfiLn+mBS2tfgU/Ex+D6XlGCMTKK3TtHYls6gWYrCMY4MbqLQ9ta/p6fO6Yi/eL83YB1bCeMpgWzhFXOV2r1BeBqqPlbO2hiQvjq26rs9qf4Z3lbFHa+/LzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(66556008)(66476007)(186003)(956004)(2906002)(5660300002)(6496006)(33716001)(33656002)(83380400001)(52116002)(1076003)(38100700002)(66946007)(6916009)(9686003)(316002)(4326008)(8936002)(44832011)(4744005)(8676002)(26005)(478600001)(6666004)(55016002)(9576002)(86362001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xf4V18t8lIGTny8DVaKqPkS/3cJjhWp1+NkRB69L3K3cXC4IK6MU6D/en7F6?=
 =?us-ascii?Q?bffVPFqxEvsa6revlGQ9bNSodKDnGNLlIX8twIAaXq1IlXHGlmVlahB0rHpL?=
 =?us-ascii?Q?58oqy38uPHQqrirBDd8t6klvVIziev+eewXhErR1zfn8WfRWCayzxMjXE2r6?=
 =?us-ascii?Q?7A2/H4iUIXkhV/t2SJhS9R6WliM1Eq48rxH9qHB8r5/i03vAhXqPU4IKyjAv?=
 =?us-ascii?Q?XvWfcybWtC/QjbRQNTnmJeybyPE4edn8w0yo4zUZYM3oVmNbelPNHVcqaTjM?=
 =?us-ascii?Q?+lZTB875sPpRjjm01VwXm2CVLtiOcAzO/C4XMyArkAnTE8Ru+OHcVRiUJTNT?=
 =?us-ascii?Q?T00hSdIkMlSvhCCNwpNOeVO1VMW34DARlJpR7ZG+z+qt1roJFl9oh/V5LAq5?=
 =?us-ascii?Q?7Bs2mrPij495Xc3avzhdB7oUGHM9aLoMHfb2J/TkT7vYr7lg1L11u8W3MNEz?=
 =?us-ascii?Q?jadWxuCFC8q8k9zfqE0ItH/2FmGPt1zXJMCQuIBrUlYttdC+zfjm24jbtquq?=
 =?us-ascii?Q?3qB1jI/dvBKXbSetaAJrgU57CJq2hveiPyan3pujShFaok/w+0CUVe3/HkkB?=
 =?us-ascii?Q?3zGLE/FBXnLdiZrYQOHkh6ySd/aOXxb3UrVByMeLopf+lk/OJPPLr+fVveuk?=
 =?us-ascii?Q?MEVYw4eHxE42hXfnjpmxwKlP1I9dTYEKSawoPP3/q4SVmLgYiNGeAu2vmri7?=
 =?us-ascii?Q?jMWXZBcGp8dJhTM9iPU5LWR+QYs+ursplhEjvmAYYKQY6IiqbbgNra7SzrSq?=
 =?us-ascii?Q?NKXOtu82IBU4VGOBrawgF8I4DEUP+/gg8MG+cP6B7xbOjD0Z8V/Qn49PQ01y?=
 =?us-ascii?Q?1lMXvtqt1NuQdYXI0epnXhTQYaxjkUGiczhbO7YekLGOAzG2SY6uNDQEWnJ/?=
 =?us-ascii?Q?2WkHzfXoP1TlTU7qIBpGQKE29aWvS55Lyldx0nrfbreuDcGYsrb2u/x/AJ7Y?=
 =?us-ascii?Q?PG7+dwFxykSCVZOOghzwG9vIpeSDH0o5X1Cm0SYuG5zEmvZfwI8ZPGGRBjTu?=
 =?us-ascii?Q?e+RbAJavc3uYYGQUyBCRIUEtJ6Vwnhoo+660G/4Bhk7FKahyDibVaU8s8Jbj?=
 =?us-ascii?Q?RfZhyOwcnvfWt4tdvzYFXS/REKHx85HaJY89pnhB8iG5mp4KDhwSbkVYYZRX?=
 =?us-ascii?Q?9RJediykWNKJquoq2LOex9ApJ1u7dv4rjDOXNHd5+jVzjX/pFakPkg9c80b2?=
 =?us-ascii?Q?4KzWHw6Dgv+mcAevR5giRIX3SOBaHT1TffMj5CKrpE3O+1wU7c1YV02VYkUD?=
 =?us-ascii?Q?ewWyuan2YJgZ4hbVV3WCz90nk58CtTSq2N9puykXoymednHu6gQKapySiF8l?=
 =?us-ascii?Q?RxM7OAT+am8jGcdtCk3Bg0dU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7dff79-e220-4913-3141-08d97c0b0ab9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 07:48:31.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCiNKWVtXuC4ZOzwfIIbh+9uPYSqV+N2TpAB5VbeQ/legtWt8oQ4vywnitBWARo5Gt4kCr3OxW6NMysKr/EVpgkts/1gr1/AgKI1wJHJGKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1885
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10112 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=727 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109200046
X-Proofpoint-GUID: FfkehO_Pysh3wrw80H7l2QbiFAs3vrAR
X-Proofpoint-ORIG-GUID: FfkehO_Pysh3wrw80H7l2QbiFAs3vrAR
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Cai Huoqing,

The patch 95b5fc03c189: "net: arc_emac: Make use of the helper
function dev_err_probe()" from Sep 15, 2021, leads to the following
Smatch static checker warning:

	drivers/net/ethernet/arc/emac_mdio.c:170 arc_mdio_probe()
	error: dereferencing freed memory 'bus'

drivers/net/ethernet/arc/emac_mdio.c
    164         snprintf(bus->id, MII_BUS_ID_SIZE, "%s", bus->name);
    165 
    166         error = of_mdiobus_register(bus, priv->dev->of_node);
    167         if (error) {
    168                 mdiobus_free(bus);
                                     ^^^
Freed

    169                 return dev_err_probe(priv->dev, error,
--> 170                                      "cannot register MDIO bus %s\n", bus->name);
                                                                              ^^^^^
Use after free.

    171         }
    172 
    173         return 0;
    174 }

regards,
dan carpenter
