Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50601C432BE
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 06:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C33161059
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Aug 2021 06:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbhHLG7u (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Aug 2021 02:59:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23684 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230323AbhHLG7t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Aug 2021 02:59:49 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17C6qgXB007199;
        Thu, 12 Aug 2021 06:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=PzRmy+YlByCeRPyzXcp+7FzoIqJcabmEPJX6tjuaKo8=;
 b=JXDKpTs5nfBuWVRj76D3CEPccxyeTCxJKKWS5O+9gpLi+oVwekkOnn32WV5xGFbGLGvo
 kzBbgSYklZ0bxyH0rGQwb7sSpsy7v+b2cnE5Ee0YU9h2AHzLRKU34WMmMrRgLcWL7eov
 G5ME+5Y2l7Y3zvwPO1YIduARkBuvkLEBkMpcikCvkc2ewmrklvOArJuddqk/ekEniRST
 SlGnQsejhude0UUyKgP5aaN+YpTTsGye2hEMEXVJW453xwJJ8cskad/bjzijFcQHK/Nb
 sHMVZahe/5NdLV6Nz9j5+bIVoMrAghYsGrSEtyfM3ITILmxdn9ZWazKgz1i5GFje0cuX Cw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=PzRmy+YlByCeRPyzXcp+7FzoIqJcabmEPJX6tjuaKo8=;
 b=Y6mtsxvFsPdd0JfLSQc5sI77xDYK8GRaXlNYi1O+9B3imQ7BJUQJ6zjAtpnwcZ46Eh5Q
 3gPw/wSnb2zxB6VbugLSlKOIgzJ2Muxv4Y66vGKJmNfbm6AjFxhG9g0lsDUZGmdyqvtZ
 3xj55FaAj2JDimTJ3WmfcxpnTNU2YA/kG1vce6pkKwwd7qRFie/Yyr7mIdQktXIqLwZs
 mSzSS7x6Ba6W9I9k5JRRZngtAMXJXbLBDa4swqyBkqnL0kRhHsA+url1NZLOl1K70HN0
 /60GPqmTOswUxJI7dRB7YuGlN4tVl/BI5mjoX5+DABnIG1v8Zd8ySw4PzF4nyy9LIs09 Sg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3acw9p05xq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Aug 2021 06:59:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17C6uP2H007690;
        Thu, 12 Aug 2021 06:59:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by userp3030.oracle.com with ESMTP id 3abjw81hfv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Aug 2021 06:59:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edT1Sy5mYhSbPo2UD5FK6RbLyilXy96hM7oVv2OiyVlUSFIFw9tWBZ/+wkdVpPMVTFTqZiCf5hmHya3xjVvzmYe9gSeS7DDBIQbz3EgrhJkY4bT/gIFaZ5Ptmaur7iWbFqJOzqTUCTH+6kKQ7H9BgYfw2jhRFniw0EnX9jKD7wCEEMurgdD7aowLULUbdmexgPYS30XkfFCo2ySO5Rr4WOeinhjqGeCd6+Jr18fyyYS1M5VN7nH5L0hbIj5O4110pc6+qOBfv/d91W2Fz9dru1b3cM16X37g8XiibjK4/cmiXzhzRTbl5KYNcQqpXvE8MN4I+uuLzh79207mhXWUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzRmy+YlByCeRPyzXcp+7FzoIqJcabmEPJX6tjuaKo8=;
 b=Xo2VPZMl/iQTRYRaWy0hhqOWYIWWf0e9/AL+vV2I2JxuZDwNmcfqZI6rQqBGF/jh/qbZp03ks/lPPdg3IUSauzOgUfA0c2DHGasy7qJoLYjM19SVuaQwN00wtrzlWSqFn5KU39rCK4ioi0qEYpAEZaQYM5hBCq8MuN7pSCDv15sbSWySnZoAAVb9NZQVTdYY3i2flovtE6v6O4nqDtey6vV3GlHnjDBemyvybtmWconsc/rNXcRmAZ0jwR4b6FOWWYdsba2pTyPm8+e3Ngpc4SJebx8+36MdzIunI0+TpxLlfmbWIme/CTBY0v+Sc9YrKpQDS4YbGgrVey45WK2SrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzRmy+YlByCeRPyzXcp+7FzoIqJcabmEPJX6tjuaKo8=;
 b=CJGCKyy1J6ioCmm3oeoz3hA95Z9u+fxO6Y4GrUvY4n8Yh7wpDCZKuWxDv8S+if8eTbCIPa8JrHwBk2McEkvHuRoR1+3EjDpwqEA16fWqWmRvgPOlNA6mzCGq+lAL6STaEiwBqh76nLIQMVIaAvYOJ04OWez4tKo+iSpsdcphT34=
Authentication-Results: lwfinger.net; dkim=none (message not signed)
 header.d=none;lwfinger.net; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2093.namprd10.prod.outlook.com
 (2603:10b6:301:36::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Thu, 12 Aug
 2021 06:59:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:59:04 +0000
Date:   Thu, 12 Aug 2021 09:58:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: r8188eu: scheduling in atomic in rtw_createbss_cmd()
Message-ID: <20210812065852.GB31863@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend Transport; Thu, 12 Aug 2021 06:59:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 527da873-5643-4ecb-9945-08d95d5eac30
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2093B8A69378F395C0E280D48EF99@MWHPR1001MB2093.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pQs06V4/saGxUzOd9FQE/hfXi+iB38X2PHOw2vqsLcxo2LGR54ltMW7QI2c0O6ydA5BtRo1L4Z7X69GWeFw6alCFedpjFOeAgLm3OTllDkKtoyNVclnB8IwGThQjF2h+E9UmZBtU2g4V5LhV9jYSldLCbJjQMjJ0r/UdtVpCZNHs1BLX/5pDYiBl3fhql6hUNNREYOwjVhmZLkow4/MdOtwphgDixOZtOsfBnVcHv35ogClj2mQKY0K+dPrP4MLHMEmLqPg4gQJcIKR/geJaiVNRi7Pvygvvn+FbEQ9BJkmZrflEgz5df62vhnhK7EsIX/JoMpDsOMUcdkBJewVOFKRCbag4xChCdVq2mEw7eMiW0TMxFvc0ciA4K/l1tb86G+fEzo5rNvFHGUgnMa3YOlTJZB7OGG2FfgfIp5AUL6EVHSRJQx4UlgkF3dnKkAZ2tlItiKdNDvr6dBpa1KnxexZ7XyGjL418pvwMoici8UvaBVIulq8nXi5ssCgCvylkXW7/3M1dgcvosENP0/xVloCqULdFaLylBr7Y6zJu2mKfBXw4IkeH+hR0u5QaOqFEExBZlNpYJCl+s/cofj3RVumxNcj+1kFxtBd7XyYYc6ISZ6PuPKGcj5uE2S7bsfGWksuN86UvdW4f4pPYoEiQxUKNDnwPPZNbRqItmA7tsA4ObWB3HWY2p4M4SIcxZHEqfcWl6GziogH3f2AEwvqFyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(376002)(136003)(396003)(44832011)(6916009)(478600001)(1076003)(8936002)(38100700002)(5660300002)(86362001)(26005)(38350700002)(54906003)(83380400001)(186003)(956004)(4326008)(33656002)(33716001)(66556008)(2906002)(8676002)(66946007)(316002)(6496006)(9576002)(66476007)(52116002)(4744005)(6666004)(9686003)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c+3Lcn2X0YOyp5Tm9LsYHY6hfuLBGm7gMTbmfZvT37lVchl0JkOPvdvLXldg?=
 =?us-ascii?Q?t4Wt1soltGxcdZgfKLsox4bHGIYtXoFpmhE1klt9aI9t4SvxPIDUcuAGQrds?=
 =?us-ascii?Q?XxY6l4OgkqqbgtGLHsewxAdKDB+nAloAbGCmaZWnM1BCSqjRVJ4gQofXV6+u?=
 =?us-ascii?Q?ui34mbI6qIKYedE4XA3HFLbYtjgjyCd9BFHzLcJI9dsugWnBnI30DW9OnuwE?=
 =?us-ascii?Q?ZP4hU8j4/Hhh+yA4V94iVwocBwTr6oy8NUUtBDTMjuyVRS8WT0gw7RG2OO/W?=
 =?us-ascii?Q?N2N2UqGOfQ41Rfs8GplkwfJGwMi4QvvOzWrM76hAl6C7RCylGpLi55qvNGYr?=
 =?us-ascii?Q?kVldHOaXzwEyRq4hAHnpWtliFxIUZTyvNMjbUDnCnlWVJUwWVORPhrxMS1OZ?=
 =?us-ascii?Q?xV4Yf4T/1bR5gjhzK7F2kaP6I06ih0hbdsGpdiOGJeL/1foNIDRritTxqmli?=
 =?us-ascii?Q?9STZUNdjB8frUM0x8xnQlC/4J8Iw9+r6lNyGlWcVRn6xvqkEoHtp9bDvuM6G?=
 =?us-ascii?Q?LP7gCgQyMGSPT3IRrLIgYwtlLqCkI6VAjr+TyHE9ALTe4OoBLalFJG2yXxxZ?=
 =?us-ascii?Q?ITVThWU7P+eB/Eh1C65IGAirbcNTRmmb/jEeKYDzz2s8f2E16vyePyPgTiWs?=
 =?us-ascii?Q?tn5ElzZqQ1SDz2OfmaEJ4xm8PitsR672zmQwCBytPQiSVGL52Y58tJliQYX4?=
 =?us-ascii?Q?tO3czxK20/Wv8SUP/cc+SPyo8iQ22ljkwuZjdufUVPRDnjzd5u/Nap6prmMX?=
 =?us-ascii?Q?WxAC89EDZTFb94zFB4YGlNfD084Mu//rvHe9N9yaCyLlRvNYTqfco6W/k3bL?=
 =?us-ascii?Q?eyS+ubdDkp3C4QNC+HfIgslPQ+JoMJ27O3EXVb7wkAB4VsAJ7LEENSVX4Z4u?=
 =?us-ascii?Q?RMqLI9THNRo/2IcPI//sbPTc9Xv8RmHtEBwXhyu931qoXrRd9cRPqwDvWymU?=
 =?us-ascii?Q?dVNicID3x2NFALBecUoYt3pM8WTPihgE28EQozxSIW63uMdp9PNXKAs9HHRM?=
 =?us-ascii?Q?lJUXYkhO3QNt7hjDOR3qqw7N3MmQ1N+tM0gfvazqTcJoz+X93UdVhG3caSrM?=
 =?us-ascii?Q?Z3XqHovUuu5tYlLlIZQoeThCer+rBYP01ERTy5Ug+C5FTxDnlZhWC/V753rr?=
 =?us-ascii?Q?X+JRpcM+gWjBgs5dBbHo+jgjzCxi8Md+r68pBBMyLvoVo+7tKF1d2WF2cxMa?=
 =?us-ascii?Q?4hlqDIihe64syzuJ/kKPKUsAt1qMB0gP9ewCjSsHC1S4c30I049a1Avqdr4r?=
 =?us-ascii?Q?xxxdXGLdQEXb0LpjbuxeXxNVNmyT/iBFC3BgrNErDF8yE+TPhuIhbPY1OIJY?=
 =?us-ascii?Q?4noLMnZilaSvdbbdz3u4NTaf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527da873-5643-4ecb-9945-08d95d5eac30
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:59:04.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrmGYg/3SPUbvee9xPMbBVjaNZcWs1mna05t9nNFZetINI6+HpauhU6ga2d3/df9bu7imakWMbsbeLWxirhyPq86OYCuEmyn3xcpTrin9P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10073 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120044
X-Proofpoint-GUID: wzVZt88U7RCN5hvVj-_DixGnRIWJCT_F
X-Proofpoint-ORIG-GUID: wzVZt88U7RCN5hvVj-_DixGnRIWJCT_F
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

A couple of the callers are holding spinlocks so this allocation has to
be atomic.  One spinlock is in rtw_set_802_11_connect() but the simpler
spinlock to review is when this function is called from
rtw_surveydone_event_callback().

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c3a9051ca10c..ff5b4505a713 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -735,7 +735,7 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 
 	rtw_led_control(padapter, LED_CTL_START_TO_LINK);
 
-	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
 	if (!pcmd) {
 		res = _FAIL;
 		goto exit;
-- 
2.20.1

