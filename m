Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840EEC433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Oct 2022 09:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiJNJlW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 05:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiJNJlR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 05:41:17 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98437BF4E
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 02:41:16 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E9U2UT009329;
        Fri, 14 Oct 2022 09:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=jtMJrFm5pK0YhJAYymvKzOiqcFhoxcgISVPRu5HZE+w=;
 b=rIped+ZQOwEqOqNT6HszMjDtKVFWiRJ9gRl/7ftTWEvRJY5oaNEPMFnC4OsPY+SiktB6
 CRz0psAYoLM/k7xVUU048fv4YHDTNyvPNOj6Ojktwca3a/QnCLqIAeKp0PE975/EqlqS
 YY4Id1H7/3R+pLoQqvw9vg9yjqsIlzi9xRcF9YY3q653H6d7y/dDeNP21w2lA82C3IDt
 lHLjvfnjgDJYCnAsz9hrOwDKBVSQpN404/8IwrpprrTYZw5dc29b5awwT05QOyyS5dcq
 VKChoVaIp0kf67szapf32nvtEiFpRmmTm/1QUEQUzUbll61w65Ya7ErryYVLGpaOfKJ8 2Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k6mswj9n5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 09:41:13 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29E7HChC003896;
        Fri, 14 Oct 2022 09:41:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k2ynddunv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 09:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeIGPTBcnTqJn7H6JnG9+VQfKEpOHY80eaF6F0lLcU9MyzXTx3irBKhPepZDdO5h9c04n0nj0TzmI3BwINwvSoIgaTaqQIxdllUmXNCA21tbqU3j+jKjcrrrCqbrOmx3fSBtD8Qd6abr6Yw465WxtcKMxsldMUdBSHt3nFTJlletfuA/e6qQ7L5PXCchKk0H74NC3Qtdzyid1Ug8w5JOzsIs6MELbdwOWabflIxLIuaY3mu9eHaD5/FU++RGexcy+is70i7rW9Zw6miO5D3NgVLtoLZRenxGius3lreM7XH1EIxWduce6jk4UMhOdPtTwO3adhEq3AcfIJCV8SMpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtMJrFm5pK0YhJAYymvKzOiqcFhoxcgISVPRu5HZE+w=;
 b=FAvjGTGgMV9gvU0JkyJAIOFsto6GQf0RH0TVs7D+PnfdtJwbHvUp2B0ZpHtNKveRKMzPLnJ6KV4EuXDBNXBIW4i4pItEDA8sySl1O5f0q9yFh6yRRI5vRU1RGF51iEKJjVNJsQIx/MmeUft/oPOnhr9DG33ODlY/xyrtEAHCRNJn0OEiB2U07tJYDQl+NXOpR98O7BZtcNmAxai6ZvcZZXM2bwt1V4mTZf07Mo8B4IakYJOSWMtBbvuFoFtRJgbRPgYCsfNB/spPJ1xmfbYFtSvjb9ujn8Cy9UatBEiaJEt4aDsm9Lt/a392QWC99ZqA7Xa2L+DG1WzWaTxlLR4iTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtMJrFm5pK0YhJAYymvKzOiqcFhoxcgISVPRu5HZE+w=;
 b=zkcruB740rD4DtMP5Zl69mPhcrURKKCtEHu2G470frN+Y0gJphRGxjIjNu5lOHQ5fUVLnD+NMhsmDELXf+1HM1fEa5t5r679l8UiQuwslCXJ9HfFsDLDzihjbULAAYTyIGqT8t1wbL8zsA4P6mfubYGuPLaQBsublG7a+8VX72I=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 09:41:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 09:41:11 +0000
Date:   Fri, 14 Oct 2022 12:41:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vladimir.oltean@nxp.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: dsa: allow masters to join a LAG
Message-ID: <Y0kusYUT1zskwnXI@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CO1PR10MB4531:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a43d63-1393-4192-1971-08daadc839e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 65V5M/J2gd1t1DyURMrIa8jEUIl3NvqI2Xf1lz3SuyIGo3ZLG89Y/MUpqWwOVa+uBvSFo5VqER3tyMK5Lte9oh0IUkSC2/Vb/2lMCqmaPu+VQplfZzsFnFtiypw47QMoYCWK7Vvd0h0xQs0Z5wmDvdsW3/Jononk6d0dDg+OI6CxErqexPbbXFahdq8PC79Mobs386kmxMuqBntfYjiA9Um261s/xhJLI7Uxfdmi1ya+DASOHzQFbA1jDXdHESoThEiSLoeHqOMUdRJYgSpB5y7dTW/KqmGzg3YMcTDVnB4t5xDikLrIUCeFGMV0ajpISYwRAe79gLtAIICpPkb7YSCyvrJRQLH33cl9unSWajQ5mk4LuZpCW+XBmjIWI09qQcdh06g7gmNfYZH73c2mvDBf6xSEZS6EbcqPnlSL5ckWWlHE2p4mFGpm/OiXj/rS8a3XOz55fdjCUwWfwlStAM1r90ns6Wzz6yB71p3AEWnWZZgTKr3Vj3KXv55vZbWOpJ6gaqMp714RAbkzzwOefUYtdh8cul7OGy/SC0GYp4DhAqJf+ePdvlnrY93uDHUff8PzkKv6f4sX+4B8W10OOqAOyFqRIYd8/Nrp8/J2YC2qujLThh0zl5LE2y8mi+w8tzI1PUVA/FgMpiVjuYlEITq4mKWGYoqart0sz3F7Lg4SeNAp0fSupO3FfNTJn5npWzYLiC0ZGKWFxWbnwi5IZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(86362001)(2906002)(4744005)(38100700002)(5660300002)(186003)(9686003)(478600001)(66476007)(66946007)(33716001)(66556008)(316002)(26005)(6666004)(8676002)(8936002)(44832011)(6916009)(6512007)(41300700001)(4326008)(6486002)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F7QapWT4AEuWEJCKZL11cl9nEy0mlNmOn3Ay2W+u69++Ok6ZWiGvUynRxkqz?=
 =?us-ascii?Q?xQoC7FDcn/7fZ+S/tJ5gjpjx7g9SUUdMeC+wjRu3KsNsNiaLg02OZ1fuxK5J?=
 =?us-ascii?Q?QwPt/TePzGGO1DfAzPDuyLEvvD4XJdSVpbMkuGR4swMKt6RC/kHK1vmZTWX7?=
 =?us-ascii?Q?+qV26fVZpSXBkY6XX3s5fFoazwOAdKSUM0DuF1cQJm9euNQlwSv3Ps0Vat0r?=
 =?us-ascii?Q?sJ+Clj+fnUbXonjfNWt5vypLr/ltw7s952qnabheohqstUGDNqh6byX8fIaQ?=
 =?us-ascii?Q?YNRBDI4BDxnZDtCpNHB9Nny36eVd55DPcRX5Ht75r45bBbK/wKu3U51Q82hw?=
 =?us-ascii?Q?q2GyCcXLbZg6Aex0f7cdA70IM8kENei1qQDJuvdh/X6Iew5NBk7djw0QqHkM?=
 =?us-ascii?Q?/2UtR5hs1h/xkciqBpbjw4czf2X2FopQuIsY4jXKOv+Sv7IUx6stIxzVFB6U?=
 =?us-ascii?Q?8dgi9lnTJeSmeephd/O5iH/SndB0AiRHjhwq50DLhCnigR5xhMhUOniTmc6B?=
 =?us-ascii?Q?wgLR9yc7YkZIWsnWQRkAtrkCGVZJ3uOaknK5kBkSDp6LNcnhM3WQYG28Y5vU?=
 =?us-ascii?Q?JW5hQd7tD+zB6mw7xuevBAmB60QrZd+RhMraZSqPKefahN+wXaHobnghHkGc?=
 =?us-ascii?Q?IYVKN5Tl/n8sDkqF/VDA3oF8Eg0S6PBFPpdX83jJGu3T6N6fITWCbzxYE7lk?=
 =?us-ascii?Q?5wyE6h61WrhYezxnJrnvt9MwFnfNUhN0zlF4aNleeIQ03AOv2w96o3zVSH57?=
 =?us-ascii?Q?1lDTxY+T8GxO1I68JheIwwE+tSvLb4cij8+BYgcsa7f95DhBbJfNPLlBgX4Y?=
 =?us-ascii?Q?avvekMv6QwHEGt68M2gUa1/QN8i7Aob7LmrQRVD+TtsJ4RHIKpM5uLQcfqWK?=
 =?us-ascii?Q?LiK8dPDcLQH0nKameTma2QX4hWizgfQTktd2EFbwGb3RZIQGXARHnYCLF48u?=
 =?us-ascii?Q?QUlp/WUu1bBYV9O0zwSI52kSU5CModNLD2Wek69QPgagwDGYU2A4FcjGoPdm?=
 =?us-ascii?Q?PJdeaJoJJ2U4xTx6PpXuz4GmH3BtYpjBZ/TeG9ygYX1DA1CbHUkstnmKNhr4?=
 =?us-ascii?Q?lPbzAnh8ad2SoyFezPY/cISBugYQuXlDMldLYvvNhNotJO3hIgqFFsxqZrg7?=
 =?us-ascii?Q?9Qgz8H+4pxMAxG/c6vSqbeVthurW2KHam+CNlcrR+ycsLYvw6IkSSUDaJfkP?=
 =?us-ascii?Q?5ABPLd5nwdF4hfesTqe9E7tLD1Krww5C2YYElInGEUpYHK/qQ8irFo3slP9Z?=
 =?us-ascii?Q?pootktHWr7nQZ3OLQKdLyC8JWo8YEI35VwA5tCFM01oNbheqZysseuV8V4it?=
 =?us-ascii?Q?jvAkqSkkaFKCPMDNn60mTOlzuKBKRUKHjB3Vm6sPEkwZi+RN8z7rcBkVKLgX?=
 =?us-ascii?Q?b2IDutyT7S7LrNIx0oKTJBfCAQ7ukLIIyAWHRJn2gqfj6Ky39TC2svD1wuW0?=
 =?us-ascii?Q?6b7Tw1/higdoJOT+iWSukU0E3oz90TyRNif8fDhMSzy+N+gw9kMgHwOPawN4?=
 =?us-ascii?Q?QpZH4BtJSGxbAao19ts+jZjHFBdvF6u17fKl8N557ZuhBhJPoYJuV6mqW9h6?=
 =?us-ascii?Q?pn2tzRNau+D8rpc7xIpvsoZrxC8crNzOF+TPac04QaP/N7iMOVOGWR6Rc23i?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a43d63-1393-4192-1971-08daadc839e9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:41:10.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fprJZA/MPia3jS3FzK4AftPK6jnTebdM82ZqoQsiOaumksJ1okk8yYEKyE/Ltr/KmQVTXN8ZCj7NdYeY7/FK8uxBHtTXRt075D+L7PoS1fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4531
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_05,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=941 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140055
X-Proofpoint-ORIG-GUID: 5mUeC2lvxgVDfj-kGyM3zd2xD6J0ESZG
X-Proofpoint-GUID: 5mUeC2lvxgVDfj-kGyM3zd2xD6J0ESZG
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vladimir Oltean,

The patch acc43b7bf52a: "net: dsa: allow masters to join a LAG" from
Sep 11, 2022, leads to the following Smatch static checker warning:

	net/dsa/slave.c:3165 dsa_slave_netdevice_event()
	error: uninitialized symbol 'err'.

net/dsa/slave.c
    3145         case NETDEV_CHANGELOWERSTATE: {
    3146                 struct netdev_notifier_changelowerstate_info *info = ptr;
    3147                 struct dsa_port *dp;
    3148                 int err;
    3149 
    3150                 if (dsa_slave_dev_check(dev)) {
    3151                         dp = dsa_slave_to_port(dev);
    3152 
    3153                         err = dsa_port_lag_change(dp, info->lower_state_info);
    3154                 }
    3155 
    3156                 /* Mirror LAG port events on DSA masters that are in
    3157                  * a LAG towards their respective switch CPU ports
    3158                  */
    3159                 if (netdev_uses_dsa(dev)) {
    3160                         dp = dev->dsa_ptr;
    3161 
    3162                         err = dsa_port_lag_change(dp, info->lower_state_info);
    3163                 }

Can both dsa_slave_dev_check() and netdev_uses_dsa() be false?

    3164 
--> 3165                 return notifier_from_errno(err);
    3166         }
    3167         case NETDEV_CHANGE:
    3168         case NETDEV_UP: {

regards,
dan carpenter
