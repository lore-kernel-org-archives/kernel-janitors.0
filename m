Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011E1C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Mar 2022 13:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbiCDNSl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Mar 2022 08:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbiCDNSi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Mar 2022 08:18:38 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF82B5BD07
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Mar 2022 05:17:47 -0800 (PST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224AQRu5014139;
        Fri, 4 Mar 2022 13:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=9p/dorUGbpys5I6ufgL/79aVRoTR8/YFkycfnb2c05Y=;
 b=SR6TYo+wZypeweeyY7o6muxj4qI2KZM6zzI8zIt2KOW465gwNmYxQdm8D2ucVqdXymqF
 28xwwno3JI9PzNYmVmV7wAl5U3Xa3IvY6P1OMpaptEE/InL46UQjAqmSyp7Od3bAtIaX
 GXM78vHwZwCUkJAIKN/3Iww0hNIr0Q+D4xCNQG0E6oN/NF4haslVDa5LwWHY4QNhyxBF
 nn58sEYKX4jY3WmbiItyIn3KLBlr1w7M76y5Q0+frBNm7szXVk0qxqwpvFSw2RoYmXqX
 +zFCfdT1JQUI5XsdYJ+0M7TeJuYXT502RKj1okbM5yatnRUtiIAVN1CJ4MlrQ8DmCoJT eQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hv9qnr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Mar 2022 13:17:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224DHZET079172;
        Fri, 4 Mar 2022 13:17:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by aserp3030.oracle.com with ESMTP id 3ek4jgtdva-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Mar 2022 13:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPEPKaNz6ZMO2iA/Y3Hc6I3RF6iSxdYMME5egRidyjtnymQA99NRpM4U3JBMIs5+EkxMH/SHSncSA1D5/dApuyGx6m+sXGdkRf01SgBtgQnKpFOu2/McZiDBtpR0BT2BVbfrQns47LB/elmYUF/9iD8UIr5PZkqHlXLBPFRh+ZNtQJWiz+p5c1Ly7ZLKoLiz9Ea/2BezsQA8I3IUwmMpwXGuobbWlH9XuIx/loCJ6LKQDv/VCYk0m28nueMwPRZbPs9+FiE0X8v1rjomW+qVKtK5OxVuKfiDnJTc1VLHZAC+yV6TuggfDCn4luAOQBQTi4sgs3nbAqSDXHMz8iSuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p/dorUGbpys5I6ufgL/79aVRoTR8/YFkycfnb2c05Y=;
 b=KSDESkiYX/cc85RYUbU5jvWksbJFvoqZcp3kwmUDStQp+ui+fqk66Nj3qJMA8bvcFx7V5JwUo7qKpmMjPZAs8bg1Ik+4vIuuhvNJ6ReebI8s1yd/i56YAwdnfe7F+xxulQJbH9rPbT9ZbZPlNi147LaDB9OCvp0rT77MbaJg+DdhLz3vDuuli/IDLi3/QdTC0ctZ8ym4udj/A5D7/a71zgSdgQ322lO8nm5B9yTeQwsqBFd3emP4J933zRrY2EpKE0FZMIaPQP7vEHF0wdGfZ/AXqvYMZXLtqDYEnrmG0KcmsMay9h6I9DKQXWNX8nwX75y4Xcaq/WXWTl5Ej05b6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p/dorUGbpys5I6ufgL/79aVRoTR8/YFkycfnb2c05Y=;
 b=CzAO4nbwj4XZI7FAR5mJMHlehBuZ6XWjjgDJ7FqhiUSDFmcX5jZ1PiCqEWhUNA/yLxWHtEnK7mwWus6yAhvc/2RiTFxh2DzstUmBv0HCyPEwZZQVs2nX1748fr1UGNooNGLH3oLHQ9mlKuO9xPyPQJ3NCYgHECxBjwHKSOl1feg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5117.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 13:17:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 13:17:42 +0000
Date:   Fri, 4 Mar 2022 16:17:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     d.michailidis@fungible.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/funeth: probing and netdev ops
Message-ID: <20220304131718.GF28739@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0101.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9481f4c0-a690-4e56-2d7b-08d9fde15c5e
X-MS-TrafficTypeDiagnostic: DS7PR10MB5117:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB5117B7FED71A9249F3288F968E059@DS7PR10MB5117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAzCIqWQj4bnIhcYZv1Ek+EQACBGbRX7S4pTzrtCQ6w9xiXLLsXFRWKuQPBUO5ui9nLsCZ/4qECAnvZnfTmSR5MCBcxG7rm+qFcfMWguoR97YjQbujn2AATGrn4XM173cNBAUqs1dlUOz2T02BSPfM0nXDdldL8HGL5BniFz7S4CIgtFAdyYbQAP/aXiYi0VWU8P3AS0CjDgwhZVQJ6AE05mtDw8LjipAv0TjFM0rMJY11/W1pXdU6Ke9N7Ss+sjmdvDAh778diNSAPQUqXjkZVRHHn7tgeriqWT4RRqQvNzG4JqcourAod3emJ0opS4C8at5agM1CjpOp58aG8tNIpbO6wbtOqG/xz7Y7vbwa2tS/8SS3qsxBJJVZ/VJl+GIwda4+VppTPOyB54LFXQu47GN4sn1luPzcRlxO+iRWBjP15H8lWzmBa4BrFx2HxA/eloFWutqx+e5+IEemIb5BlJehwMtCxRz8Ki+hN3P5CHA93rSK9lhQkmB3qOP2C+5Yv1QjSJUD94wJZiXesLI8cOZjFyXeXMLj7LJBRK1Bs0mkyte+ayl9NqttMbRscLGqkDNy+rhdAOA+/E/qOYftfp5s1pGK0DeOdUKmzGlPKkd1mcBhfOnw2fuNEv/SYvSqrQGkm3jsPQX6YbTjKyEWPbUFsiFpOJmXziOmJaDuEdeQs/kEQIGaBX896vUOhegt8rQZBIXtFdNrvrsOgz6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(33716001)(6916009)(316002)(66476007)(66946007)(66556008)(44832011)(38350700002)(1076003)(38100700002)(5660300002)(33656002)(508600001)(6506007)(83380400001)(6512007)(9686003)(8676002)(86362001)(26005)(6666004)(6486002)(186003)(4326008)(52116002)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hI0g0FCsR0QjeshAQwQOEXTYgBg5PQl87502243DXrntCfyGOlPbXhUPVwkn?=
 =?us-ascii?Q?FUCEe92jYi4u0k3zr8JLqKHLHPPtJ8r/g4J/DICcP6VI20wyDgEMgJd/59J3?=
 =?us-ascii?Q?PsD0qiD6HeBXdR9970otJxJuzalsHY/DWinNBQ7IISM3SPG/M7yGmhIENI/L?=
 =?us-ascii?Q?aASgMpOgVlvbFS9eNrTDjYux0THFrETPc6e8SZgcvPDJdu0OVewDkzZH51b8?=
 =?us-ascii?Q?2GDLer5fjuawgu/GDHkTp+g3nTXEw8aZqi5N0SP9gJAYE0CSFgZSa19OZTUm?=
 =?us-ascii?Q?FkwysFJlV9JkIybivLhMB6DRHaMZQXJPyzV2QnEJllLejQP7VrW11MbHoDl6?=
 =?us-ascii?Q?gpahLotvLTcirz00/jnLSnIALdqs+ZQc9RLX1mQuSHyiqJbttQTEWJsvg/Bq?=
 =?us-ascii?Q?lXyBFx6D+yge9j2FJUgNLTMS/etHce9E4mh5Y0/JT4DDBh9ej2gSmRnUpsLz?=
 =?us-ascii?Q?s8OAKOYDjuzEwfxPOg6bcZRDtWzl2etag2SjnSh9CKVrXn1WrnYKmroK0wyz?=
 =?us-ascii?Q?u9rsSj/CKauJO2dQk8B8Mcc0eMObrdGJ/ERLbWWiz0qRKwJLF0WQtXdsJoKJ?=
 =?us-ascii?Q?K2XxTB2aJL1y+nYDOgzHPMFkFO+KdeecAidyJNUcZXtQYkAgo+ET2sn0lvTW?=
 =?us-ascii?Q?Ks8syq9RcdYr7F3PsTJusNmioKc9PIPX6Oxbdoxts9hwNegqRpLJ5/gx+QA0?=
 =?us-ascii?Q?7w34nK6bZv0sC0ntMRo2vQv1iuXnPPajRMGsKBPLYzDPHndDBFnuitpYeRXH?=
 =?us-ascii?Q?tChBQx6a2IlQI16O9TEb8nz7n5WxSrEOzoEtTLDg7pQ6g3NXtXPFvPPcIvJi?=
 =?us-ascii?Q?+kNEIn692sAz7P4EWpsyUrniRdl1sGHdhJtAm6PY41RSoEjarKSQp3WNHO3K?=
 =?us-ascii?Q?UyQki21B9sjF6apw4N6Z0tdNIZdkqpj0e+z7fLklIrTXS+yqDjFiPE8KLPHv?=
 =?us-ascii?Q?YZCzWqTjFR9lN9CDcHBa9BdZaPqEa2vNHL2i+ALy0yZrz6q6ay49wcluCvMP?=
 =?us-ascii?Q?xx14Ff/BOy18u3J3Js1fLUKJLQSygMhAWAjYsyiyjvN5rZRh/1obAofGcTQ+?=
 =?us-ascii?Q?IJ71K8I1KgaaPPdCgLOWUT9f+1cEAH4K4nwFPbOrj+V/AWsyx9o8gjYqwSBG?=
 =?us-ascii?Q?5RK9zneEIdCHkGSUtfLrXyUCdYdo/zBiYIVAqha7wRRpn8hEY6F68AoQW0uD?=
 =?us-ascii?Q?ifHDSkP7yLZfKS84fL44YLaUoffOrmmffKw5oCCqPBFM8Tj/qgXkhC4qBh+M?=
 =?us-ascii?Q?IQt1RAH8fc65HgKQ2LUX9PUA2FWl1qsmfAFoSKVqZhlrKdAhJmhVYojxQ6UD?=
 =?us-ascii?Q?5ar/xw4PCPAc3xtjxxQ8/CkWYPzA7qdrZrVTo7wzkK94pHLebzgIWhBS5AFY?=
 =?us-ascii?Q?4SBPLoIc6xhxksgAExmw0Y6u0YT2lNMt/luPrXKMzk4MPR2UbArMeRJtelTJ?=
 =?us-ascii?Q?n0RNEI1IN3lr56jKUYqC52+pwqyUPevUGfX4O7SeFqTAJ6iF6T5NEtQTklpL?=
 =?us-ascii?Q?KGp0CFcL3EcwT0ack6GvHwFjrSTE9ej0GMT2rhzMjBUQ+AGJAVUX6gmLMvjl?=
 =?us-ascii?Q?cQxD5NS8KPGagrDuF4kzokWtOQxywChQDYNf8sJht41qjOSu/0noeaIJuSPd?=
 =?us-ascii?Q?oFSoxhtGr9M50V9+JoHodimpEEgltHLI/HiYCdZ0As+x259Q8JCSYxT9nRi8?=
 =?us-ascii?Q?GZm9lA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9481f4c0-a690-4e56-2d7b-08d9fde15c5e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:17:42.0342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSL2z5KcbyHhJdPQPgzvkKIWP8aUTee5kza7Kg7OV5F6HUKc1DDip9EGpCTluMuGqmoRkkXFUZoVNa6jlWY2JszaIeGxcNFRthhVUjeyYZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=811 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040073
X-Proofpoint-GUID: ms4SL1gArh_TYP5REGgWlOy9R4fkXyAJ
X-Proofpoint-ORIG-GUID: ms4SL1gArh_TYP5REGgWlOy9R4fkXyAJ
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dimitris Michailidis,

The patch ee6373ddf3a9: "net/funeth: probing and netdev ops" from Feb
24, 2022, leads to the following Smatch static checker warning:

	drivers/net/ethernet/fungible/funeth/funeth_main.c:477 fun_free_rings()
	warn: 'rxqs' was already freed.

drivers/net/ethernet/fungible/funeth/funeth_main.c
    443 static void fun_free_rings(struct net_device *netdev, struct fun_qset *qset)
    444 {
    445         struct funeth_priv *fp = netdev_priv(netdev);
    446         struct funeth_txq **xdpqs = qset->xdpqs;
    447         struct funeth_rxq **rxqs = qset->rxqs;
    448 
    449         /* qset may not specify any queues to operate on. In that case the
    450          * currently installed queues are implied.
    451          */
    452         if (!rxqs) {
    453                 rxqs = rtnl_dereference(fp->rxqs);
    454                 xdpqs = rtnl_dereference(fp->xdpqs);
    455                 qset->txqs = fp->txqs;
    456                 qset->nrxqs = netdev->real_num_rx_queues;
    457                 qset->ntxqs = netdev->real_num_tx_queues;
    458                 qset->nxdpqs = fp->num_xdpqs;
    459         }
    460         if (!rxqs)
    461                 return;
    462 
    463         if (rxqs == rtnl_dereference(fp->rxqs)) {
    464                 rcu_assign_pointer(fp->rxqs, NULL);
    465                 rcu_assign_pointer(fp->xdpqs, NULL);
    466                 synchronize_net();
    467                 fp->txqs = NULL;
    468         }
    469 
    470         free_rxqs(rxqs, qset->nrxqs, qset->rxq_start, qset->state);
    471         free_txqs(qset->txqs, qset->ntxqs, qset->txq_start, qset->state);
    472         free_xdpqs(xdpqs, qset->nxdpqs, qset->xdpq_start, qset->state);
    473         if (qset->state == FUN_QSTATE_DESTROYED)
    474                 kfree(rxqs);
                        ^^^^^^^^^^^
Should this return or set "rxqs = NULL" or something?

    475 
    476         /* Tell the caller which queues were operated on. */
--> 477         qset->rxqs = rxqs;
                ^^^^^^^^^^^^^^^^^^
Only bad things will happen with safing this freed pointer.

    478         qset->xdpqs = xdpqs;
    479 }

regards,
dan carpenter
