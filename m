Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BEAC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 13:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B95F26128E
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 13:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbhKKNiO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Nov 2021 08:38:14 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32008 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233443AbhKKNiN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 08:38:13 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ABCPp2o003890;
        Thu, 11 Nov 2021 13:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=RYkt72F/C5cLZR4XtWJOLyvAxI+obI+sfqUNFjjb5Ao=;
 b=h4eKWC+FUgZxFoH6UfemDqiLIqGVrN+o2bRYj1mL8KcE5F/FBaZZWe670SOmqeOZ9tKx
 MSMZa1OH3OCS5pdUM6G6rqB7mAU0YmnG+jMcqrrppLB3ittOveEu/2oDCejwF8M52SLv
 bhDpA8ff1HZCQhEIwcbhbtFIzpNo8nfBXIGlaUm0sdUtxmQ0XqxMrmfd9egXdGGvghG9
 uFfuKC1UWuy/QaTuCdT72/V9bHuLjPuzg2KXidinjaXvgX/0/5DY4MbJ9ed4P9UbOWwB
 /zPDZqZrn+3wC42HrXhDjfDGqy3fqZ+KG52etCy0dt9h69qZyies1j+7Mv7ma0mrPxq2 rw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c89bqj279-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Nov 2021 13:35:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ABDVf41104134;
        Thu, 11 Nov 2021 13:35:19 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
        by userp3030.oracle.com with ESMTP id 3c842dv7a0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Nov 2021 13:35:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsySitxQgWLV0I9RisRAi/tyaXnTr4kmC/u/l7HNC1MFjx8zK5XDJ6W0iayT7hgHdd/QZNgdin0AHxNl5S1TkYOKlg2aSS2fA7bq9E5OZd1Bk59nf9ncrh0f0E7RwIWqxqf+Z3ZZquIZqZSxza4rBLA1q9yjKS04upKONkjwtyT4OU3avjNGxmgvirmJzoQ6STby6y3NKwJkSMiRzs5hJ1v3tDo5Q3Cf1PaY+Ok1I4vcFv6H2C+pygSf7myzJ2Y2CdenS51lHYUZAOgtRL2KaR8lqdQvoWbH77UsQeXmCU0zXz7uLzxQE0ZV8Z9/Ssq3sfbBOmslwDRtMieUVxxTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYkt72F/C5cLZR4XtWJOLyvAxI+obI+sfqUNFjjb5Ao=;
 b=OpffiCvISXajHbyweDJ6RqV4H3or7xoDfNdLhpo5sGAuie+UJcJmYqy+k5TTH2TK1/ic9UplrzCHWeprWx+ln3ORjFH2Fn/MIDlXcSf37BfQKFAafnQ5TMTZAQpVwexn2DC2BiXY43D1Q/h+7FDz+oeBnAglrKsh5MHCLnCsIavTn44IZ1HhcvqFYHMAKzMFDld7mIXiWibtO2xxkQOjeAVCmPjPauuCrZ7/dATIvQ7h8yeS2eZQF4HmqbRAdwOc9+bjA0PniK0uQOdkRKvrlk0pKGaqvQw1cAYyBE7cAl3sRz0ulX9bLboIyRMNhgUU54by6OLZmBSfS+B//3wNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYkt72F/C5cLZR4XtWJOLyvAxI+obI+sfqUNFjjb5Ao=;
 b=CKUntdS2LhtGUxl7u2qtatWOxRUmX2lhgcFhj/N7uPHaZCpEOsWKI6rSidhhXoq2AsdZ3GmpnPv4KqM7iTfQYKJ4Cs7ZF7w7FnoE7ZmpE5VFz3qTXrrZu0iajG5Ecsl3q0YJlh/EaLMSK0KD7MOI6FqZAGOLnQ8ai2FD22zgC2c=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1294.namprd10.prod.outlook.com
 (2603:10b6:300:20::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 13:35:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 11 Nov 2021
 13:35:16 +0000
Date:   Thu, 11 Nov 2021 16:35:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     l.stelmach@samsung.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ax88796c: ASIX AX88796C SPI Ethernet Adapter Driver
Message-ID: <20211111133508.GA22045@kili>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0024.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Thu, 11 Nov 2021 13:35:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 596b61c3-9f96-49d2-bf87-08d9a51818f6
X-MS-TrafficTypeDiagnostic: MWHPR10MB1294:
X-Microsoft-Antispam-PRVS: <MWHPR10MB12949BD2116F11E949D96A818E949@MWHPR10MB1294.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2urXM2z5lk+3q89WIfFHCT0oHaeyuZ+XJXwiNDXCpo9vo4G5TM9P3HnU/vSkzpGspldRsoDE3Oo6PhhUjkSP8EDPzQX1XRPrDWOlGBO7+Qb3CJkJm9AWLiZrXej1NwMN+GxiZtkNZyIwW7FRzUwIMO/aod5mnTQ3GDnuQJW4j9w04wIRgBo/21KAVrqaNsobsYqxqVPkBLgA4hXeJXgAorf0ugWfFgzFWH63ODalTxZ77WIqqjPJHxawm4OAsqPWf8oHtHhnqLHVC2JaaOtkpkdDzx0tM9YdubWUD4DgLw789kyOqU7Adz4mTXmP5WHlaawxxznwfS2I75P/Ufoh2wBQrNCeQ+4FKphdv789Mx5bb5tNnbHC2tsEiVtfxARyH4CHQfwK1YrzuQ6CXh01bHioEaJ5mzTzCVUsS5Dm4xeJBeqdcyGMbUsuo4Sxe9ZJp6JFlKtPJbmyz/DYCpp5JaPGESyM02WjasKOBWZKTcxQwUd329zlDDntrwXwbmfKTq+e6wSry/Rut59I0D+6l1HXkDiHeRKJWeRbGD0e+vja6ENNxvPfE+/bnlCDAVtu19dlcNXvbrl2cjfmMrMEjI9uJC2iAEtRKpc9qkfWwcVcTWL8Ay9WJ4njcQ774ZSELTTmU3iaOEZRODK1Pr4JAE076lKJizAi02gLquof++XcTw8KSxRhHnB63rVjTutBZ6EWmpsuLCsCObKLt9bSXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(6496006)(55016002)(83380400001)(2906002)(38100700002)(186003)(52116002)(38350700002)(9576002)(33656002)(66574015)(33716001)(44832011)(6666004)(1076003)(4744005)(26005)(66556008)(66476007)(66946007)(9686003)(316002)(508600001)(8936002)(6916009)(8676002)(5660300002)(4326008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlUWElXYkd6cjlKblRQV2ZhVlBFbThuM2xaL3V3bkxidmpCK3pGVXNnS3Q3?=
 =?utf-8?B?b1BHVzdiSWRVU0Z2d1pVNlNPUGRjWEhWdElLZWhBS2xNeHQzL1BPNnRnSjFx?=
 =?utf-8?B?cGpsdy9hb1R1Z3MyYzFSU05OYlZJdXJzMm1MU0doZm1xN3h0TXk4SE9yK2Nl?=
 =?utf-8?B?VjQ4aU9wc3NaekFhQlR0REJ0RHVIdDAwL29GVzB4b0xUNkIwMC9sdXFYV3Nu?=
 =?utf-8?B?TFMwZTZYdEozcjF6UU5nKzJmR25EWFFtcDdheUtOSkN1bHovR2dZbGM2QUVH?=
 =?utf-8?B?aDc3dDNZdXIzSFVQZG9Gd1BCNTk4NzBVR29UNG1ZSmtKUk5UamVmZzRLNnNE?=
 =?utf-8?B?UVVSTlE5WGlOSitzYjQrUzFGVk8wcG8vZk8yN2tLZjErSzdzS3ZXZzl0aUN3?=
 =?utf-8?B?S3JxYmhVVUp5MVFnVFloazJoMUdIMVNXS0l6OGJFM0RPNjkzRFpBRTU1NWY1?=
 =?utf-8?B?RkhNS2YwR0U0Y2hFNVAyaE50VVg3aFNIQzFBeFBiQU04dnc1djdsVHF1UjZt?=
 =?utf-8?B?WDJ1TlpoUXkwTmI0K1dPVytyZGdybmZmR3BrRjJad3NvbStLRmd1VzlCd0xP?=
 =?utf-8?B?Zlo3THJwdmZYUStRb3gvTElZUW45NUkwb2xsS3BGbzZwb21JWGtXSFRXQitS?=
 =?utf-8?B?Q3ZCWldOWmxYRTh0RUdudjY5eU8yS0VJQnI1MnczTTdwWHRlY0dMV1VkakFF?=
 =?utf-8?B?dHpXVWZzVG1KR0J3YkFpL0ZYaUNxY0ZCT2pkNHB5SWcyajVHM3ZTUE9rZk43?=
 =?utf-8?B?Y3JHNW54VzdWMkRkVkxZMHVhelovRm1pQWMybVVJcnNRR3laYk5IZktaQzJt?=
 =?utf-8?B?VjJtTmt6NmV0M2RCcFVQU3pGSUtYRUgrSU95M1JBQnZpY1dqNnhZcENCZWhz?=
 =?utf-8?B?bytZdlZFN2F0enZpdjFIVWJsMllZblo4alExYlkvMWFYQWJ5V2dOcWJMRStm?=
 =?utf-8?B?NFVnN0p6cVBjbkhKejlNRCtaSnVLWWJ5dVV6ell1T0JVYlYrZ1dPUE1ldVZX?=
 =?utf-8?B?ZXF0azZwZ0FqbFkrQmtsd3FleUQvdVl3NGZrMUlmMmhPcUF3c2dJM20yZkho?=
 =?utf-8?B?emplZ1ZtbGJCbGtTM2xHTDF3Z3Bkd3RiQzNLWS9YNk1UdlBjRkVrU01sOVhB?=
 =?utf-8?B?VjBSUTN6M2dvUHdDdGIrZ1pUME5SREVKN1krTjFZTTV4SmFlejhiczA4ak1Y?=
 =?utf-8?B?NEhNVUdESVNYTnUrSFJsMjd3eGVwcGFjZ29IUHErd2s3RTFuOVovYURlQmU3?=
 =?utf-8?B?MC9mdUdJak5rNmdqWWk1TGl2RjUvZUhFcW40alBGVDB6bGhiSE9oM09pR0w0?=
 =?utf-8?B?TWFxQmNPd2ZFMXNPQzJia09mMW5kelVFbTZSVTlHS2dXS0YrbWhLR0h5bEZa?=
 =?utf-8?B?cGlKazFSYWRNbGxtemJBQi84Qm0rZHJCZit4M2l5djM0UzFjOTBhbzU2bDRh?=
 =?utf-8?B?bjhoL2FmQkJCaHV6WGp3TTE4WVk3UmtBdzB4MVVrSXk0anpTZll5a3hVelda?=
 =?utf-8?B?TmFUdUN5Um5zNlVpanpEN0JyVUEvOWxYSHBvSTJGRUtTVElQNlQ5SER2ZHcz?=
 =?utf-8?B?L3Z3dWFTalFsczlnVlZJKzN4cW5BTnA0TENDaEVmL0Z5ditQZm1oS3BPRmly?=
 =?utf-8?B?Y2drVHNqSHJ5TFZwR2grN2tJQmdaMGw3bkVkME8rYi93eWg5Wml6bVBDTGNj?=
 =?utf-8?B?QVVMdDkrMnhuYyt5ODZCV2dURTFKN3d3TE9YMHNuOEVoa0xsVEY2TzN5b0tU?=
 =?utf-8?B?WERkcW04a3daUWZZaThRZHMyMkF6VzRDK1RaMHcxVlJRM1V3Y3g4Y1BiRVVu?=
 =?utf-8?B?K1ZzMVBtcUd3aks5QW5uaUNMWU9iNkJPc3RCdW5hNmJmcDBCeU01dG9uV2xR?=
 =?utf-8?B?V1EvNDhEb09PUjRSTkFuYUNHcVNicUw2TzU4b01sNUw2MFhJYUZVVzVKeW1O?=
 =?utf-8?B?MytMODIvQmVQTXcyVHcyQzJ6aFdlVUU3b0FlZDJ3enZqMzdQU2NIT2kvQkJZ?=
 =?utf-8?B?c3EvQ3EzQWxOU3NDQTlWaXBCWURJM1lnRUlJSmk0a2VWblVjMG9UQW5YSENK?=
 =?utf-8?B?ZmphNWhQUlE1QzdWYzJnZjZQdXBwOWlLaWdla3RJRkplSUY5YndVaC8vU3RJ?=
 =?utf-8?B?SHVJYkVtVEJ5NG9YSWR6MTllaWt6SlRCSXhtT09qVFFZd3pnd2xtWWpEU2hl?=
 =?utf-8?B?SjBTS1NMaVlRcStyTnBxelJ4b3M1aVdzcWlwS0lHRVpwRUFINGVUWHVkdmJw?=
 =?utf-8?Q?UQawwmjmrLQnXL5UQXen9S/zxC6AQ4ZI3xyKPvzr1g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596b61c3-9f96-49d2-bf87-08d9a51818f6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 13:35:16.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BlU9pYSYD/O3imUriVUr/WEErx9LyVFuAJgyC2xuqRXdEJV/dMWKk70pDIEmQq/xjN7uyMBp7re7nEJ7jHxsnCGsNP1JG5j47A8KCk93aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1294
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=699 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111110080
X-Proofpoint-GUID: VwRuzFhlz8faG3R7-JVIGgRVn6Vu3fG0
X-Proofpoint-ORIG-GUID: VwRuzFhlz8faG3R7-JVIGgRVn6Vu3fG0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Łukasz Stelmach,

The patch a97c69ba4f30: "net: ax88796c: ASIX AX88796C SPI Ethernet
Adapter Driver" from Oct 20, 2021, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/asix/ax88796c_main.c:926 ax88796c_set_features()
	warn: duplicate check 'changed & ((1 << (40)) | (1 << (3)))' (previous on line 921)

drivers/net/ethernet/asix/ax88796c_main.c
    915 static int
    916 ax88796c_set_features(struct net_device *ndev, netdev_features_t features)
    917 {
    918         struct ax88796c_device *ax_local = to_ax88796c_device(ndev);
    919         netdev_features_t changed = features ^ ndev->features;
    920 
    921         if (!(changed & (NETIF_F_RXCSUM | NETIF_F_HW_CSUM)))
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    922                 return 0;
    923 
    924         ndev->features = features;
    925 
--> 926         if (changed & (NETIF_F_RXCSUM | NETIF_F_HW_CSUM))

We know this condition is true.  Was something else intended?

    927                 ax88796c_set_csums(ax_local);
    928 
    929         return 0;
    930 }

regards,
dan carpenter
