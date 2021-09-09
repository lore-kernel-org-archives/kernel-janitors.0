Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F236C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Sep 2021 09:05:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F17B61051
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Sep 2021 09:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhIIJGe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 9 Sep 2021 05:06:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38976 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229927AbhIIJGc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Sep 2021 05:06:32 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1898TAMs031111;
        Thu, 9 Sep 2021 09:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=VjLNeWJWvKu4YL2J4b9Du7JqUybhQ2oUOMPzpahXwzM=;
 b=C6DI//Zmbr+JKV8UaeQYEu9KY7yXmcskYGX0p/fPsdwK8TurNJ5HvYcRY8OF/3jWOAAU
 V+d3IfzrnG6CllrD6lOOo55tSMHQuTC49OSVhiY8SHWlSI2NoB3p/6wed1UeZz2NXm7r
 SR1t3sUa0/2X6YxGaogCbbs8f8PC0XcICL0hZUD26qWplGmt+zhZAToQKFwvmE50g3cv
 0GHl6QhWrVVEZLbm2W2XtduDCV7AdYrNDTpgOvjuw14Yb+axx4U7VB4cZwt3qBhLO+Ab
 oucegd6dRIepcWawG+9nkqZPLBYx9Q2v1QvQczeUwRKvAxI/vAq2GNWqn982J3JLP3QG vA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=VjLNeWJWvKu4YL2J4b9Du7JqUybhQ2oUOMPzpahXwzM=;
 b=W5NYXCwhk1UUgMHk+5EOf5/y3f7sSqEC8RgMCT6SFY5PnYN5sNFcf8MrOe+L1mIgdSqq
 QZRt2WjOl874tqA38fs0RHmmdFy68mxeBImqpjRVAd/KpjU1PyvK2UDCGTP0pF/Zog/l
 5n10IUnPS+eqlwZT6owBwO8VB46P/1gSmd4pyRzcB07obnC/7jVMv/xBBps3mQN/Dk9q
 Qh8jvD4hOa3uKzCw/+qR1WXcTv98ZFre1G+PLxUwmqL3Asr22qp/lGkQdpsX9ouegKP2
 rfZx4Ddf1iZ9Z0M9PdRSu0Cv101B3srTlMKgaCRnhs+ZwNRgIPl/s0HeaIXB6dNiISXO dg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3axcw6dqyu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 09 Sep 2021 09:05:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18990Fcd123450;
        Thu, 9 Sep 2021 09:05:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        by aserp3030.oracle.com with ESMTP id 3axcppxjse-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 09 Sep 2021 09:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUvyTnbLjeZ3M/BycQtw/0q3sorIsuZ1BeF9t3+xCQL58pJZSbola6xpkL8vt9jC32vOEMsjPmwa+vD87yoWmnQoivv3pwmMI1A9nBCUkDabm++Am3TQc8LAYNu2Sbo08QlVdyzJf/QaUcdcgyjFXSsfzwuTYh1keC+vNZJIMEs+7jTF0DlRLOtaV72pZWBVxI8S+G99210ddkf3a0csThVG35yqY+slhgGZcqI6QEwPI+hlSxDG2m8n3xkSS/uFgCSNVLpwn00IENt5Li2uxS5HLeH3orh+VCzOL1AWydnd8g7apHpOBpNhmBXX6Dmfz9Tho9Myy2HrzydVzxBdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VjLNeWJWvKu4YL2J4b9Du7JqUybhQ2oUOMPzpahXwzM=;
 b=MroGJC1Y5delH+8Gka+aomeyQwQgTpGrIu4wLKM37tkr1S8tYsSgiall5fPunT6j4jGHGL8wa3uWdWiJrOxibsuoGhfkhO0a3xjOrfvzn9l44CgwtlNWTRdllk61FZuXDHWvbBWfLjOrCWJpBEnFeEBXUIUdmk0A8KdFaAz32lKqdEaJ+odooz/w3S4739eX5PMX3EeYqb7bQbX5wGZ22rxPZKtYeBQGvf7xnTgZkaKqUXfP8cgT+xng1Um/hnXYNLkyLHQr0g0SWqQpqQdZ/y6UwOc3b7P5vnIzOe2iEe4Eg8uOQFhFk9RZA4BAXl797ciPTXO7jb4XaeIZVWEOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjLNeWJWvKu4YL2J4b9Du7JqUybhQ2oUOMPzpahXwzM=;
 b=jnbmaZuBcaCDWCcFhb3anEaPR8i31aY4bfJ1DcA96Fqr4vGtqGY7/xuY9lzAxzz34KAhUDMQO9DeLinFr4/9VhKhkT/TGhoy+8bgoX2YQf3Ti+ZTt/GifjcOpjspltYFSlBryYPgwju47PaVlq9V0MhE3IdIN5C/gwdQIyAuYBs=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4628.namprd10.prod.outlook.com
 (2603:10b6:303:6c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 09:05:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 09:05:03 +0000
Date:   Thu, 9 Sep 2021 12:05:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rmk+kernel@armlinux.org.uk
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: phylink: add suspend/resume support
Message-ID: <20210909090502.GA24126@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 09:05:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63c71fcb-bf4d-47ed-2826-08d97370e907
X-MS-TrafficTypeDiagnostic: CO1PR10MB4628:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4628D29369156DD37D793DD08ED59@CO1PR10MB4628.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMv+vSD/mG1wtRxKDYD99Zmktjyx+AFvOqJncvFheJ+TlkM6ZMhw3/gtFcghI5zUtKzAJpKBQFSiyU6BQkHN7daY9Pv4g3WOQu4QSzgdqHlZ3AhTMK/trgNof36BCucnv/EOWaY8j432NmG9R+J25ijIFlO4bg8sdOKk0iWECYlKpxhO65RRGh+H6/0kRCbzatiEU+5bvX7OLB8jcWRv47KIKqxaM/9WYkINn7iDvDYwbMJczX9d8WDbz4GXladHECDPaJaq5jToTML0fxCyKjqqOb7REerdU+qb8e+X3NucE+fRwI50anXGQeet7N/XwdW/XJowqLkVfwqNWcyRA3tTvhEluZRRpNH9q6sIz0mNm1l1kQ8zh2OKFmW5PF/VXeE78am4daKbG9MhdQ9nQLC6kn0w2FMWZGLBtY4sCUqbR6EqLwa4KERYlyu90axE5T6UlXwgioj3IrkYWdsoS8pchgBgiIgCiP1cEPQnkk9X10PN+jMg+0HYBUTHsKLEne5nXySjEw1G6EZxXTu7D0Zx8Eek9z5lQTNqcjRHkjyDrEAbrMMRa9dDzDKYhjNTAxR/6ofAxr3HBQ1CT6ruLS2FtD5MyhAwBAUSOjX9JY2ylOwNqsVnZkChNOp76DSzOq6imXZw9pwpfe08MMVQ9RvdM9j5aTrBJ1JXY0PfXV0hLxaJFxEHvFaE73viEDTWyYrTj4X7q+udQEZZJjoudQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(956004)(83380400001)(9576002)(86362001)(55016002)(316002)(66476007)(66556008)(5660300002)(44832011)(66946007)(6496006)(52116002)(478600001)(33716001)(9686003)(1076003)(33656002)(15650500001)(38100700002)(2906002)(38350700002)(4326008)(8936002)(186003)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u7HioDnClBI61hz8S6+d2cE2ViA9m9teEq+pbGlLKUHU7ZD141UzmJuc3q0M?=
 =?us-ascii?Q?fijTeg+Gy92H78qcCeRBmJn9XUDwB203ZjNw0kw7Km/1uil9jbC6Qr9DH/IA?=
 =?us-ascii?Q?tZ29xvigx6ifTUIiLyaR3tZAE6vwdT/5/HBwBKVhpDJIaXcEdbQ+UjCAMB+g?=
 =?us-ascii?Q?edH4MiUu/7Olh9n2ejt7sTLH+qktdKmItl9o3KFqU6geZVqAj19ABA1Emu+V?=
 =?us-ascii?Q?GB3gvtBHnlXC7eT1dmdXodMvcn3XcPtZ5S2cFSofXk/gfvpN6RqadTtT55GL?=
 =?us-ascii?Q?yWw3bJUPC3q0kA0NOQmxie4YfCjuApFv0Je32j7ZO21dA2uAvYaXB8er1JeR?=
 =?us-ascii?Q?n1NonVjKUNBaFlVoQ4N6qT2iq7Wh5mXagxYFpLzyQ89UnTnQXPtfuS7SpAlF?=
 =?us-ascii?Q?arfnMMCoESexrIvyGZb3biGw9D77liv6Ds/bGVdrP0DXCJJPsnSgtCE57AGh?=
 =?us-ascii?Q?esBPwZOEdzqejd7dUShlhkNVgUWwNXX7WRy880sXfQcGikDd5eLNvjSoAX8C?=
 =?us-ascii?Q?1E1Y30YjeVuyQFb04gZoeUFaC6IdH4NxccG58NaK0OoaUtqlVJkvFiwvoy04?=
 =?us-ascii?Q?SAt5ffa4kPa5Z4JLtaQ4RTFMo5hizMfyV5XXSPaRZNH2kVXak3Lwfnqh8G7n?=
 =?us-ascii?Q?u+hOcpsoFvXRhCRNE+PBTEFPfQvg8ACqld8lFo6Wn89mUTjD6WaDO3iwhbAL?=
 =?us-ascii?Q?aCPwMvQkiR+wvJFcvLj8/W75FahdQwjkOyjv90V1APJjUeMaXVzDXhjFXkEx?=
 =?us-ascii?Q?7/7gjXs5uRzjL8cakVPrakTh6hwzYdJy522tSZwUM8a3L22+C2m3/r6Rxwqb?=
 =?us-ascii?Q?fcIYy3PHUzBlvGyRhueap+ddVeJxutrZ0mEmbXXMWD6xJbOyuzugtfxe4Tzt?=
 =?us-ascii?Q?isuIjJG/e+3t/E2LlTqj5UzNp9dZikKkfan7umzjOBMLUP5ADRVWes+qjuSU?=
 =?us-ascii?Q?yzyfrd93TjdPkQYG//cTfwMVPdqvPOSEoWXgJRqaMlZry3B7CB24EkbPZO0+?=
 =?us-ascii?Q?vXO1Tvc43IbXckRVRsZTxzaNMKVbmPPRnmV3lnqdPVaTdHaMDyJYGlbcmFOx?=
 =?us-ascii?Q?X/ZDJ604AkbwNuC+z6e8/ePBsq52aDKOc6jjHmWvG/I1IkYTjLGlKU36nIck?=
 =?us-ascii?Q?yE8jK6KLOU7wOsxbEFXzz3VjJ+DdC2pM7YT/3bbH/OT+pbfWHnYmewcxUAOZ?=
 =?us-ascii?Q?soK/SRjkLdq6JCLKUqCxVpLKCQEyW7wC/6A1IvC/P3Ouf24croaOXqwVdcp+?=
 =?us-ascii?Q?zfSBXG4hhVtj/Tnsqcyq03voj5jHp+6Bo9BGHHnwJ/OHqQNFy5Z6Kelf0L4V?=
 =?us-ascii?Q?lZ6cJ3VC2C8g6V2b8qZ7XuWg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c71fcb-bf4d-47ed-2826-08d97370e907
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:05:03.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aw/OOQxE/ckyAE0I0lh3/uLXkVD0FCr5WYGpBGN35//TFcTNCgMBjRxuhvOfJCSY2PXUuvJX4JwquQCMo7GeDAwPWjmSoX9mT4d+9CMYclo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4628
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10101 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=748 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109090054
X-Proofpoint-GUID: Xtz8D2XDzXWALejPBHxLWngura1fT6N5
X-Proofpoint-ORIG-GUID: Xtz8D2XDzXWALejPBHxLWngura1fT6N5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Russell King (Oracle),

This is a semi-automatic email about new static checker warnings.

The patch f97493657c63: "net: phylink: add suspend/resume support" 
from Sep 7, 2021, leads to the following Smatch complaint:

    drivers/net/phy/phylink.c:1336 phylink_suspend()
    error: we previously assumed 'pl->netdev' could be null (see line 1325)

drivers/net/phy/phylink.c
  1324	
  1325		if (mac_wol && (!pl->netdev || pl->netdev->wol_enabled)) {
                                 ^^^^^^^^^^
This checks for NULL

  1326			/* Wake-on-Lan enabled, MAC handling */
  1327			mutex_lock(&pl->state_mutex);
  1328	
  1329			/* Stop the resolver bringing the link up */
  1330			__set_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
  1331	
  1332			/* Disable the carrier, to prevent transmit timeouts,
  1333			 * but one would hope all packets have been sent. This
  1334			 * also means phylink_resolve() will do nothing.
  1335			 */
  1336			netif_carrier_off(pl->netdev);
                                          ^^^^^^^^^^
But there is an unchecked dereference inside the netif_carrier_off()
function.

  1337	
  1338			/* We do not call mac_link_down() here as we want the

regards,
dan carpenter
