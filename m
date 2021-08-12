Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A95C4338F
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 06:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B8F0601FD
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 06:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhHLG54 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Aug 2021 02:57:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4034 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230370AbhHLG5z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Aug 2021 02:57:55 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17C6pZjQ023820;
        Thu, 12 Aug 2021 06:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=VUot8etx6reOn4bay302TUCfS1YMH4UGKihvhMe68UY=;
 b=djAaJHnWJjAhN6AdLysismU41dpW+KtM+Z4A9XdsvLtX3iW5WGOVuPSUXcGVOfrOGXks
 lk/xwNLWtXGWJ9P2Gkwr4ixLiVrQ0j1UuM0cDSuHvrk+rWA5sS1N5OglPHdhM9TreMFD
 i6a1q2lVNpVVcNwKBCxajv+Z83YUYBKkPQ0A9zkRpnWab3BDUTFBRonVKAdbRA4bWFBh
 KM01VfCP15rAy5+zm1iGWfQ1brgnkEYXaDSJMrx3kMVdyY9cHGDlRMhDJJoxg5ycyCMs
 cq00cYn6lS3AxPdhqIJmB9nRvZAjF8zuUHajFZit4btNwd6CdorKxJ0XCZFYEadnudvf 5Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=VUot8etx6reOn4bay302TUCfS1YMH4UGKihvhMe68UY=;
 b=KTi616QpSI0Sh1EsxpYxe/MUnt9ATj7VrEjLBydVrkOhhd67d6Ws5ey8M8uAdXckOnSd
 am2/pnuj9xqanTqHHA77ngrJpR9i8+CDy4ChIyIgNTuqxA+6tMgXo+cKSaJ117wnti+S
 c+ROgusztGxLEo8fLlQAYtjr4eDw5XV6/QDc105xqMleJMYwilHQoJRj81O1llqJYpoK
 4DuN/xgzXaBb0wTeX2WXGFkPrdfOPRz74oWrrJTPtSR7Z92lMmvK6xQu2TK7OGAEV1kq
 sxI5COyHCWINPwnLIJOJatufDFjFhy//jfnJgNgosvXFORWVwq3j8CpCn1ltYl6S01gr kg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3aceudt0w8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Aug 2021 06:57:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17C6uTsw186387;
        Thu, 12 Aug 2021 06:57:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by aserp3020.oracle.com with ESMTP id 3accrbkuak-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Aug 2021 06:57:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOT9KUzzXtzPWBHfmyHkVvhQ01GC0+4ZaHUToXUEsjSCx00+i9V0+tvj68w29+D8V2eh7nkqyz6lWdoyWfoJ/AUReZqTsf0+6bdwTTrVJeSq0PzX4PSgnqm1D1jhprMy/Dj+iSQQi7aSu8J2Am9RUivW5hINpDVaKT2D04fBCQ59x/20SE6al/MF0uW+mIDSRUssuWIStFn5zLAfQ+87yD7WvlBeE/EyZIeAG+WWqXWcQcUzmyLppPTgeKBnUah++FDtOdV9raFnKyUUZ5kGmc4yHOoNQitHtdx0sQ2vHz/EeSnRPoJMHk1gWPe49n3s1OwEkHBu0RYcEaGA4izyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUot8etx6reOn4bay302TUCfS1YMH4UGKihvhMe68UY=;
 b=KCqTz6Bi0ve4kqiksHqxAXYfiA5pmNprfZU30yAY1H/g3M0CZ1aOk1xF/mIsxJqH/EP0YvCCjR+sgO6pZJXfH3ce5KbPxdCard+LrXMYVuOfG1lhuzlpmAeHFmFxfKBLC464zz3kc+6mhEeBWzPXGPng8l9WlTc9t5AmubY+bY9yHEaBcAKykS3t3DO34tpRuK4Jbje7VodKFdFuT8Wly+g9PuPT2W3QCl1UN0W47uspTmcdrwtfzt1D8QzF9VjBxymk/flSJj3Zz0Q8TVANNnA+v0l3mOBFomHjAABWRVgEEUELXaqp58MwKxFhT9mhaz7/FXG3sSmoXMJyZLCLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUot8etx6reOn4bay302TUCfS1YMH4UGKihvhMe68UY=;
 b=vW9Hv4MO0DLNoQ94amLRQl9HR7HgNAfH9T7nUyzbPtAtY3VIDv0k/ipTVbSVKeFMiCzLjtb0M6Un/nGgWudUzE/5E32YmggPcDmFzSRKZ2nLrOFPOM8x7L2W8VvgbLLVgKt212PvvP6FLJ1pK1jqxoVc6tL+nvqoKZOQWl2HvjY=
Authentication-Results: lwfinger.net; dkim=none (message not signed)
 header.d=none;lwfinger.net; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2093.namprd10.prod.outlook.com
 (2603:10b6:301:36::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Thu, 12 Aug
 2021 06:57:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:57:21 +0000
Date:   Thu, 12 Aug 2021 09:57:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Fix a couple scheduling in atomic bugs
Message-ID: <20210812065710.GA31863@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Thu, 12 Aug 2021 06:57:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dd254ca-a1b0-4628-f107-08d95d5e6e95
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2093752F910163F3E1647D418EF99@MWHPR1001MB2093.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wExiF+zTWmT9meEToTpOFOTlJcDVZbR3KFB4VsjBgo8UbEm6MkcHUub/dfNL49Qo4N2EYN0K+kYBWLiiQ5ZWzpAh2CttvF0hu+qtIKkEAaBN7YUIjFt4DtyHcZxn95TIR/oJJzBrFHiiK9gEpb280peyxRjdX2J5lbNiK3Wng63TWQomiZfbPg+48W61K3VviYFvj6rYLLpGizYiSLdin3Co/rOawJdkQQSYbCit08lUoqZ7L+QeQGCI+4KvFf2heGNMWBXHDRhsl/28TdnvkpyP7ICt7DTjFMryIRzSJPoM6cBqod1+wRAVqZmMlej80zrJjCfAbs5jr1pO2yIaUdnwfM4CiVo7+MYqtUPVmv+67s+Jxpl6caLSZWaZD4AET5t4RO/d2eXnYzNqyzr7nRa+IOCx8A6+BylnmI5ZrpqG0YVUSYxEKZ8vC5Owz3be5+rHaTE0ST+JTjD/gXCnXZ5vA+01+NnV8sRx9JSTGXCn5DuC5EWhfQILUH9Cm7PBL1GVBXWvHqsWyP1ZJjwuNzDShDh8QSTz9aRxkeZkP/AqqxeJIPtCsMa+rkEOr36Ctjcf+Pa6eMpLGRU5djCbViu5wqE/GC87WLdUC13hb6QB9/bmZWd9/dI3DzAnIy0o74jNFCDhvz3wEY6rUTBsgXo9ueRYFi0LSRSAlpUU0txYwdrDP+GxdFvndw1g25pAs8U6vzIfkTcfGouhEFivw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(376002)(136003)(396003)(44832011)(6916009)(478600001)(1076003)(8936002)(38100700002)(5660300002)(86362001)(26005)(38350700002)(54906003)(83380400001)(186003)(956004)(4326008)(33656002)(33716001)(66556008)(2906002)(8676002)(66946007)(316002)(6496006)(9576002)(66476007)(52116002)(6666004)(9686003)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ZvW4LVI2JIPf05xQIXNFUHHdSUWgxD/zsr2P5DfhXN6d2Zfggvg627HV6ZI?=
 =?us-ascii?Q?xkChssqboFZQkatGbcyhn3ZQySohitA76byhIf6pnzASfwrFqh05XRHWMCFQ?=
 =?us-ascii?Q?21Gcy1rSQ9ZjzhfYhb29c9x+J/FR8ugkohV+JFe4Ni7RCBrmwGzD/zZDB8aO?=
 =?us-ascii?Q?kKLFOt8iibD5Z6ZsGFkHdsaOT0BzyOHunRHLflcqPuNrLNRk+999nbPcgi+e?=
 =?us-ascii?Q?mRJUA7Wm58MncO4xcYUzLvW0izq9Os3oqQVE4J9IofFab9plLFyR6U9Hz7kC?=
 =?us-ascii?Q?c0C7mVjhYUITb1EzlnYfGP3lRpnPG91tGOUycf2X1ytwNKQZysdUS2g49tI9?=
 =?us-ascii?Q?EBhhK/Yw1dsAW4iRpOHJPQ1jCkb8+pt5u2y/npepbVts8TVXEB4UML2YCpq+?=
 =?us-ascii?Q?Ww3XgeTJAPAnrZyJic99rFDGUIII9ZSlPMBEmP7diCNDit4yChzga/jE/mIt?=
 =?us-ascii?Q?AMzOypijggX8GBH/rAjFHAs4m2hH/yUC/9+ZgZ7/WsihFZwGfZ1PiJNF+OgA?=
 =?us-ascii?Q?GFDcLRpjxssOx+jR+s2gCZkG4i6kY81M4C8gxJ9PXHxpVD3kDWJnTom7FM23?=
 =?us-ascii?Q?BPbTiih8O5+c6XpKZQBNRwZPBNz54bWsl8aK5OjIGgJ0lhzuQZVouRiXIExA?=
 =?us-ascii?Q?M1/dQ0YQVJ155vaIAWoW3Df7YLVs1dYFb0KLxp5a5N6AHKY/B88BaRAZAdKW?=
 =?us-ascii?Q?3IuDMFrZVlvEaCPFTG1V0EqjKiCXs23CTVIWqOt1tOV7YdUxvlxiLFx3ORSZ?=
 =?us-ascii?Q?YLSYj48C4/4/A05nCQ7fLKe0k7JR9iOc5WPeseEj+/lX/mmSix84LB8lSh8c?=
 =?us-ascii?Q?JDFzwzNhcnAD3ig/j7Mz687xG3OWmAmVmY0yUuGLd3R8FLeXygwXyz3zXU3Z?=
 =?us-ascii?Q?Ii7bhoYHJyIOcxBVHjQR+qRdLrQQ7jzrfNqKH5s3I8QJ5MAY2If/7eQvJgUQ?=
 =?us-ascii?Q?HraLkjNGhNXhGRaCf4I0FnT4e5pWx5r11Z2eHj8237Y/OA7tHjFJmoyrXe42?=
 =?us-ascii?Q?lDwWW1vzALZENUJ5KD2rKjMEskceyNfi7PQsaXthLeH7cPKVVF8glbuJR1DN?=
 =?us-ascii?Q?ZqVaBkDmIJTKdTn4DNlTpF0U/lUYaikUaUVkbVGgGd0w66AusFKZpQ+U7r12?=
 =?us-ascii?Q?f1V2ilqN4M6SEJsJiZQqbQQlLBzagJeBEvK70prXpZNUKty8XRktPHdGAKIo?=
 =?us-ascii?Q?vKaifC26K3W37ixsf509XfbGSc6zVk9QZYRsD0diSA7fmZqxZut8U9xEHwAe?=
 =?us-ascii?Q?2JGr+JdwJbBwUhb3dCJTC/8sheBBNX7HaeZDU/AJM3gnSxH9naLtwZRwS2ff?=
 =?us-ascii?Q?i/iSuFaO33irE9k3niy3HeUk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd254ca-a1b0-4628-f107-08d95d5e6e95
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:57:21.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QB1TLrO0Q1P9pbUWa6cbE862Hu03CasFqxSaKQi7I54zoO9GVylRC9A7wTeitrza0s8MVTjJCs5+xV2NantxiBg4JHVLLzcMZ7bxuB7xr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10073 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120044
X-Proofpoint-ORIG-GUID: 9av_2vrg7aX_M4pDcrliSHL0ZuAlxCmS
X-Proofpoint-GUID: 9av_2vrg7aX_M4pDcrliSHL0ZuAlxCmS
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These allocations are sometimes done while holding a spin_lock so they
have to be atomic.  The call tree looks like this:

-> rtw_set_802_11_connect() <- takes a spin_lock
   -> rtw_do_join()
      -> rtw_sitesurvey_cmd()  <-- does a GFP_ATOMIC allocation
         -> p2p_ps_wk_cmd()

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index b4497444a7af..04480a86902e 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -1697,13 +1697,13 @@ u8 p2p_ps_wk_cmd(struct adapter *padapter, u8 p2p_ps_state, u8 enqueue)
 		return res;
 
 	if (enqueue) {
-		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
 		if (!ph2c) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_KERNEL);
+		pdrvextra_cmd_parm = kzalloc(sizeof(struct drvextra_cmd_parm), GFP_ATOMIC);
 		if (!pdrvextra_cmd_parm) {
 			kfree(ph2c);
 			res = _FAIL;
-- 
2.20.1

