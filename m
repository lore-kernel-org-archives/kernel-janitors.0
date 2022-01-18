Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045B4C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jan 2022 09:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiARJis (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jan 2022 04:38:48 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34442 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237272AbiARJin (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jan 2022 04:38:43 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20I8Iwhq028929;
        Tue, 18 Jan 2022 09:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=HBW5UYvQfJzlj+bF3EWrKaU/bYVHQkGE63vtdKqjPXQ=;
 b=Ti9hJGr2mysdYLiXxCxRjHZC9IESQky7w4RWnTjQSNdtU6JKjTls9rf0c9MViktgx/WS
 ZAfcohHeTJGZUoP/rTrYC4tSOHpWaCglxlBUGMRsMhwB8VI2Ay682BPbGouLcEqd8r5d
 ExFkj5bAVE5ET75SiuCHSCKDCdyP5ijuux7YX8oTp5YBPow3vYNG7mJwpekccjrPK/p1
 vbOpxeuK12dE8UCMZqSjOGxGW7NYVBuL2rji5q7juAh4RWQiZG75jG8kPX81l+OW00aw
 BLL3c7jiUW45bk2kDUCENYfi6TOL9ZMAUizyasPy4jsdta30qlqruv2puYcMMM9YRL4J gQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dnc52scdr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jan 2022 09:38:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20I9aW22101462;
        Tue, 18 Jan 2022 09:38:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        by userp3030.oracle.com with ESMTP id 3dkkcx0fts-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jan 2022 09:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yo1Jx1RlCSoMwa6SwN8ol8V02h6AqPNbU7KPnlb5J8t4VPV0cpOLQ781c/xYHETg9OOoefPyJkT+ZEFthZ5KHlGxy4y005a2vz7pFqaGO66eV1z8VnPqg0WIw5IbXr+MvKS1e8Efl8BeS36e3BebP4vJgdnlXrG2GgimaOsrqD3ebwVwtImewsWwFhBLdHvKYIEKp0CcXNEArNJNywYEJSkVSKIhH+fktrsT3vpDT0nLiVd6XGUK6m/kFV7WP2YLc7P51nvzz7wwLHLgioXTJPKWylCjpeXI27o20KRlOeqvEwcETYszmg+yM3QQ7en7t8oqnqIyekM7raqIdF92iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBW5UYvQfJzlj+bF3EWrKaU/bYVHQkGE63vtdKqjPXQ=;
 b=bXYSEZa0Ax9aN9SOOluyWDL/CVDHswEWvEVKbuXlr+t9LFjjgl/9QmMoKIq9Ni4qvScPvvPKi21yEQDw+W5uxS+azvzaqfDkPNjABMCJ9joxtvcIZ4op+oBgk2zVUbeBf1/40vqfw2DLqnjxLr0oXiHXc3pW61L0BsGwv9YIxJa0ouAXt1FiXf3IGi7+50HpsvXKa6+NX2Pp5UPvY369P4/c+K49/eOpddrZ6G9Z0mMi9Mo1aVy2S6WkETwUimhn2djh2bLoD4au2/cK/I4X8BtnE2F75NrichyupsPF38RBmneCqX8Et/vFlucv1En9WHHngE45owwogXybw2Z5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBW5UYvQfJzlj+bF3EWrKaU/bYVHQkGE63vtdKqjPXQ=;
 b=dcE5yFVZL5ST3+TW9vWeul9BhGOV7XLAbu+P9IfxQyGErBToGw/Iiwz7rz+ygmogpl3vySySIzIFUNyscPKf6at4e4R9AZ5Rtj5sk+aFGwgCDR5VxY1aXIqRsehofJ/fqDr7rdldEPWYIs3fT+dOKiN1KrKuICTQA1PeGn79/t4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5110.namprd10.prod.outlook.com
 (2603:10b6:408:114::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 09:38:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%5]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 09:38:23 +0000
Date:   Tue, 18 Jan 2022 12:38:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     tom.zanussi@linux.intel.com
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] tracing: Allow whitespace to surround hist trigger
 filter
Message-ID: <20220118093809.GA13017@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20c710a8-1599-4e23-0eb4-08d9da664522
X-MS-TrafficTypeDiagnostic: BN0PR10MB5110:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB5110B1E33D890E224425DAE58E589@BN0PR10MB5110.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IV4ZHUYcW56o2bKLVsS80DZpuXNQOdLrs8zpRolmP9sjHnv3xqC09vXbwsfM+WngK1zpvLnpmubUZnXqEI5A8I65goV3MPc7/omleCsSxzke69jFZozFeaqIE1dn6SjCJfPb0G1P+Q9f6WQ7Y0CpJs8YK5NMFzK/UHkCti7vmMGLqOVNpd7CWd9blekMoYfsU6BRcipOCXbwZ1KwpsSnpWvDlBTjq/6rn1CKSgi63HUfMh9bdX0H4Wc8BGesZP5aWLbCmghNornR7iXzr0loYQqL/JpYP4POExVIk6K7Uuh3AHD/KYAXewzQ63ZlRHb3BY3vEUHo1ArD5BOfJjF55ze/5XJHWatnez8ghwhrbGr2a/c2IVajfLj769O+PGkEcKhuv9HvDEidjAUa1oZPhUrd3bpcK4lw692k8W7YAMUR2L5aniEdFSQofr1oGnMkssDvUv9ZxHlX5jQp3UD8knN3xDybCSi1B6tM02pdASrr8rwBWySfOQ4d1frA8iK+Pui3Z11F5wRyh/ew4+g7FVQE9LM8pgWCYgPBmbxG+J5lIVzpHfXjhqSuOAStLcJcq19UFd/OF02AsGnXeX+SHB0iq8wSll9X9rs7sso4yrAn3mfBpbNGE/47YZNse7FJ6RXklsTYgalW9jQRFPWc3+CPAhYdaCa4IlP9z8NdyPI2gS49IOKY2oxHifR6iLP3125+PsoFwsbuj6ddnP1lGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(508600001)(44832011)(66476007)(6916009)(83380400001)(33656002)(6486002)(8936002)(33716001)(8676002)(6512007)(6506007)(86362001)(9686003)(5660300002)(66946007)(6666004)(66556008)(26005)(186003)(2906002)(52116002)(316002)(1076003)(4326008)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gc5W0P0IdgAPkTh6KJcv/C9BQnofFOwrmKscq8cQmNm0Y8jsmPx3JVuwsIYU?=
 =?us-ascii?Q?ju0CGELNt+OaRSYNo38vfYc6kXVTd287wJQlubA3U4HEIXgtIDaLG9XeSpvN?=
 =?us-ascii?Q?k4ZNtgR29AtS+JoJCeYyOXOv9mRcNYzQGmxvVYBKFcwEoD4LhKRX188lKh9G?=
 =?us-ascii?Q?XhQ7B2ksFvzMSkFJDVVp2475sys76ounL4nz3u48estbd+94ZAowg9OOk4no?=
 =?us-ascii?Q?TMQhdgKYbq55URYlk9YJYcok72HSyTfigbrmpr4QqLcbOZgDjYNjhYiyNCIA?=
 =?us-ascii?Q?TWAqZzhx+DxXPgT08ivlpnIhSiZVrdnyp2cs2/68TWT+DNo+4MN/CtabcSS0?=
 =?us-ascii?Q?U9n9szraCJG7m95vQ2euqeUjtRsV+5XQskkI/lhuq1NUQlRzwR5uqtQ086jB?=
 =?us-ascii?Q?U8f0rix5vm3kFbqIHdhRRHiJMZINlvSmn5VvDIkliLP3V1xPHZ3WSaTTaGKx?=
 =?us-ascii?Q?d/hHLkqXieBfXWEJwqmDU/FVl+/NUtbmHamCCN9GMS0DwfZpjkv6sRNFSH14?=
 =?us-ascii?Q?Yim7NK9jX2+X2GDmefl6yhj3OwUaDXx7NF5nvEmY1VEtawAKp/vkgpXaiXdb?=
 =?us-ascii?Q?3ViMGLibmEHU2/1r2opZsjjRTnQ2CoyXuF31RVjN9ZuElFZl0Z0Ucp259B/P?=
 =?us-ascii?Q?pUPq8SYNccLJAA3zBB10FoOjaoppywsqGR9/CPjpadJFXxbIpdwWxy1TgyLX?=
 =?us-ascii?Q?adtz32SFej4kYevpwLHBqHV/nOWsh8sjpYVMksG9hGGWST3qUv6R+fJwL2Si?=
 =?us-ascii?Q?tOzXjEdLFpHdBCp0hW+CyF4UiGKVYLEmfMVbTKK/luqqViWKPZL0wBStnWc0?=
 =?us-ascii?Q?Amhj6W6PkFl/4GsZfriV2SDUTph4udJZsVHA2+SalW5jWv0/JLZJmYQWACn6?=
 =?us-ascii?Q?csEG4xHGfVNvV5vMADxUjXDLkZy9dDp8Io/zKwBTv9os5bNpK9ZQllL6Fa41?=
 =?us-ascii?Q?Le3Amzzfn5JvkIHuqZyLQD9RL1uB8we3TUUouFEswofSjqBg5FmhArACHibW?=
 =?us-ascii?Q?hGj8wYdJVh5yS+9UX0zFbKe5oJqU609fyHVQM2rTd7ktvxYpylIU5wRsMeyF?=
 =?us-ascii?Q?dTVQVW1MaSxmEPzbZq84SrZf87w8kZUBp02zwZdRijMJjUGjJ1c76ZP+HBgQ?=
 =?us-ascii?Q?S9tfcn4eIXnFVdmlpN8GbPMAKTeG33xfrG0u67RKPUF1gtTiJ+TmR9gRHVX9?=
 =?us-ascii?Q?CZ1GAmqDfS3YCboQ6ef3on9cjscGGjp4zemRSqjbzSfxnrmj7rJzp/45yXoU?=
 =?us-ascii?Q?i0IGw9hn1fNynWnkpa+8qx3RGGPn1T/+Wy9H7uTVj5NU9SbqYZTt+W5iUFww?=
 =?us-ascii?Q?nooOdF5UGvsQpthgwtw6tj7WOC6laCm+cJ2LvizL7sB1dt7i3M2Zo0T2PXm6?=
 =?us-ascii?Q?Ic6oc6p18maUgJSSlGL/Nd8O/d8H7hmYehtViNGyHFkkeqIJZ7d0Lxpnx4qM?=
 =?us-ascii?Q?FsxMPFyZuxBlavyHIySpS72t3rq+Ooolr2G/acTxEJnjQyokLEaK79NSr6eH?=
 =?us-ascii?Q?K6TtTMDV/FrZsAz1JaBKHccTuxVhSi4opKjW/dX8WcMgSuyDwP7XRay2D+3l?=
 =?us-ascii?Q?LRc6kajNAXZTcU7/LWIxd9tIiie4Yd8NP8U+TeGX9JLMjzfu+E9u1FYboBiP?=
 =?us-ascii?Q?bALcRXHvNwnakgA2a0VOnHghJLwVFgxmxk+JvX8/GYtHqvDFffXatGlnXjLt?=
 =?us-ascii?Q?DH7pKw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c710a8-1599-4e23-0eb4-08d9da664522
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 09:38:23.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2H2EwE9PywS8xLGFzrg3jRk8F1M7hbt6TpBZ1SvVbqwIRjJueMGoTmHYwBjJP/opn8wBK1qetzTo83UDvbOrIEXzr5dgn0HlvISSMOKyFsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5110
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10230 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180058
X-Proofpoint-GUID: ZaA3eOGIkSeRNrtVjgfS2ObBBENbhMO8
X-Proofpoint-ORIG-GUID: ZaA3eOGIkSeRNrtVjgfS2ObBBENbhMO8
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

[ This is an older warning but renaming the function made it appear in
  the new warnings list.  I have searched my outbox and I don't think
  I forwarded this one before.  -dan ]

Hello Tom Zanussi,

The patch ec5ce0987541: "tracing: Allow whitespace to surround hist
trigger filter" from Jan 15, 2018, leads to the following Smatch
static checker warning:

	kernel/trace/trace_events_hist.c:6199 event_hist_trigger_parse()
	warn: 'p' can't be NULL.

kernel/trace/trace_events_hist.c
    6149 static int event_hist_trigger_parse(struct event_command *cmd_ops,
    6150                                     struct trace_event_file *file,
    6151                                     char *glob, char *cmd, char *param)
    6152 {
    6153         unsigned int hist_trigger_bits = TRACING_MAP_BITS_DEFAULT;
    6154         struct event_trigger_data *trigger_data;
    6155         struct hist_trigger_attrs *attrs;
    6156         struct event_trigger_ops *trigger_ops;
    6157         struct hist_trigger_data *hist_data;
    6158         struct synth_event *se;
    6159         const char *se_name;
    6160         bool remove = false;
    6161         char *trigger, *p, *start;
    6162         int ret = 0;
    6163 
    6164         lockdep_assert_held(&event_mutex);
    6165 
    6166         if (glob && strlen(glob)) {
    6167                 hist_err_clear();
    6168                 last_cmd_set(file, param);
    6169         }
    6170 
    6171         if (!param)
    6172                 return -EINVAL;
    6173 
    6174         if (glob[0] == '!')
    6175                 remove = true;
    6176 
    6177         /*
    6178          * separate the trigger from the filter (k:v [if filter])
    6179          * allowing for whitespace in the trigger
    6180          */
    6181         p = trigger = param;
    6182         do {
    6183                 p = strstr(p, "if");
    6184                 if (!p)
    6185                         break;
    6186                 if (p == param)
    6187                         return -EINVAL;
    6188                 if (*(p - 1) != ' ' && *(p - 1) != '\t') {
    6189                         p++;
    6190                         continue;
                                 ^^^^^^^^^

These are the continue paths

    6191                 }
    6192                 if (p >= param + strlen(param) - (sizeof("if") - 1) - 1)
    6193                         return -EINVAL;
    6194                 if (*(p + sizeof("if") - 1) != ' ' && *(p + sizeof("if") - 1) != '\t') {
    6195                         p++;
    6196                         continue;
                                 ^^^^^^^^^

    6197                 }
    6198                 break;
--> 6199         } while (p);

Should this be } while(*p);?

    6200 
    6201         if (!p)
    6202                 param = NULL;
    6203         else {
    6204                 *(p - 1) = '\0';
    6205                 param = strstrip(p);
    6206                 trigger = strstrip(trigger);
    6207         }
    6208 

regards,
dan carpenter
