Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83446C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Mar 2022 11:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355284AbiCPLSk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Mar 2022 07:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355278AbiCPLSi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Mar 2022 07:18:38 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BA265809
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 04:17:22 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GB0EIE011440;
        Wed, 16 Mar 2022 11:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=nPNY4xBNOaH/gV0wWNDfxm6UyCvyNgNG9xKlls95n1Q=;
 b=AikT30n1udhD+3Hq8CBuodflJHuF/HI71yVdBiW5oMPe0yM5eoybO/3E1EqHHNwRxkl9
 r3HoNOu+gwl3wbMVTYEbc8ccZn9e25pPDfVHk12RxLvc1sZGROQwDKmc9AJVsbbuIYaG
 QAJWy1R2JvrnKRt8IkfzbMMvCgxIMTjePQL+coaU06XE/1IhbmZME3r60hMZAHlrmHug
 EcH8IP1yEg4U3ATgnYFY/R9HEJ3FySTwc4ycXEXYrSJ+z0FK02t4DygB6yhOL6PGkkhk
 6l1pM8X1zCZHolsANd+p0ym+GAWWd7KtF8i3B9d7QtzOq/VZmj3MTtsTKqR02iIaYGeE yw== 
Received: from aserp3030.oracle.com ([141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6nur2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Mar 2022 11:17:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22GBGUqk160024;
        Wed, 16 Mar 2022 11:17:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by aserp3030.oracle.com with ESMTP id 3et64tx553-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Mar 2022 11:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7nJBa50L3M7SQjevKPKmHF6xJY0ThZvVN97BXLh9x4cakR36T0zQ9WEMbLJgIaDi/nhrKnI4vSVT+L4HLS73C/AiCR2C5MHqOWs9RKat5xtpdJh7fm0osCCrsAYt0nG30RjOea06kNMf4G1xRA0z0iAE3IwzuSSTXAmp2IDNoGSOMRf7v1KBLc31YC8fa4cMz7OmNGnDZ0yU2PQEjf+8Pz3Po6SXSADIx7HRN2J0Pp5rPm9PFINRyZ7bt7+sYaDPWeJ2JWDdXKQDkobug8urDUKDqxepu2aMX7Z23Qcan3HhFxyigV2aiI/fAsVDblzH+Q/Hicfi/uX/AgVq9ZuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPNY4xBNOaH/gV0wWNDfxm6UyCvyNgNG9xKlls95n1Q=;
 b=dpCVSxxMHbE0K7UDfdvRhrHBDhzpbhdWSdmdaYYotZf86+rPzbzaIhlO6h4LxaEfwgA8SPz6FQOWCxzeC5bnlE/p6VmICBljAliEz6hW4sZ6KLnG5PyWkDeCO2jJFkQVSnzd1erZJlhIabO/+0NHKM084zw56Lm4Yud2q1ijCGtJuf8EvpWIDfZFizjdgY9plbXinvIeb8URJ5ORFJ/pnZaGVdmNB6ISOQusu6Ve9ktpTeTHtTY07/1kjd5/Ogx1B0ftCz58RMrtLqe2ySK6aJMygmDpwOvrJrfww4aL9AmC/gz2oKdIgpmgVEy4Nv1QtGzkWJ6pWM383i7AiLfZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPNY4xBNOaH/gV0wWNDfxm6UyCvyNgNG9xKlls95n1Q=;
 b=LR2MhZ7cDqQLeznsqt0TnJBXXiUjIJHDQqC2lFF3yuUyr2NN/hU02a+mPM3nW5whlR9gFDt4Ir0PokaMRZt/0d9wq0t8sAosvoRB4CUO255uTARCAjHvbGxXnOPD9ebrBDVozTElWxfEumhDX6o3nX5SW6By9cxwpip5N9VqyQQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3435.namprd10.prod.outlook.com
 (2603:10b6:5:69::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 11:17:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 11:17:16 +0000
Date:   Wed, 16 Mar 2022 14:16:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jonathan.lemon@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] ptp: ocp: Add debugfs entry for timecard
Message-ID: <20220316111659.GF1841@kadam>
References: <20220316111546.GA4687@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316111546.GA4687@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfd9fadf-ce84-40a6-7ea3-08da073e86e0
X-MS-TrafficTypeDiagnostic: DM6PR10MB3435:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3435C057085CF36D3F92A4BE8E119@DM6PR10MB3435.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6Nf2jidZnQgrT+yGsYmxEAzbLTU9dIFm2RI0fFdtHjw3D+CwQc4f7Ukr62ehCN+I7W4Y2uPHHoVlmPSfp35R5LbeCN5zj97D8tUbbCdnT6hw1/dvWtAN8gsZ7WX/AotMpNt42ggIbCEaAB7+T0yOe8rA+lHxjJCnNb2xJHMujFTrf0s8DewG8Hq7fN/lZB38MAP7jOhMOfPorQxoDbeWiLuj5ElHx0pxWampf9pxkDnYGMlZqW/o15Iwn10KakatE5woLAfFy7+A0ZECPc/55k+sJyOsqiJta1jMMzLRcfncxRnf3P1qvn/8gOhpjqgZJWBnS1urPv23xwWAByUo62xd8ePaNZIvM3flaTPSaHQ4UM/tK7DT74dTJoFPlqf4t1s5bcED2ucKJsIlEhwFCPzOnNGa7OXs0dhbc32mtGz9JOMBYl4BMVbClRWhprw5CzxTLk8WykoLvDf2Np/p3F8pG599xolMmrLEf9UNTrNWSW7peJHVnBPz5zwagJ7gKV3ok+fpBaMAFbPN5IJbSUqjKYMJPYIh+8Ayt12TCTG3/wUcRosyBV67sDilP2E45T3xVmIfmstq60rdTwQbyDYW6961N2+5vARofVw5Pl2xGKQoQ1MNu2JnpOz2Qj6HTr+u0BD/w3PG1LlXR8nUXvXZKvjVc+fPwksFeqIZANGhVnLHQCRqripia43ocGafZ7NJ5atQFui6N9JERZzqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6666004)(9686003)(6506007)(508600001)(83380400001)(52116002)(6512007)(6486002)(33716001)(38100700002)(38350700002)(316002)(1076003)(44832011)(33656002)(2906002)(6916009)(186003)(5660300002)(26005)(4326008)(8676002)(8936002)(86362001)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gzcQsDW9RJgOrVVpJ6n9LlsMtvulUblHB+mytsvVL2sACE59h7hGHChygHrb?=
 =?us-ascii?Q?3Eshlx1a0KvpMSY62uUpWS+9mNU/0aUInMwMEdAxLmoizpUhfx2pc/LdUW0H?=
 =?us-ascii?Q?+9TyulzAISKcmIri37JLWwEqr9S2c3YmnqKtCasu9ejatPM2MX6Ar1Xq12Nw?=
 =?us-ascii?Q?nJFwzGuGIwIuxsKKPz0h3fwPwL30zC0gVlYmN/xyLNcYqoT0Vmig67g6XhHn?=
 =?us-ascii?Q?Hs7jxIXCm+RI08etAXQhKo47v8DArL0oSA9/r/Kn215oY2PCpzC2LJl4BZgm?=
 =?us-ascii?Q?E3Nt+QcV3bYA66eL8j9anFGpisgVQjB8DjO399hCK83JlCOsuX3Smo4YCaxQ?=
 =?us-ascii?Q?t/lixP3jjm73Fk/FwUIFHmLOWP55GoEajHEWe9sh5DCpQZJ+3feXBgctiFM/?=
 =?us-ascii?Q?70Ysq7CgFPE/iJ57WivU2QoUixUssMxWBYamBXF8g81feh0z7u1KWu0eQirs?=
 =?us-ascii?Q?zSpk2JXKFb3bQBPZiZmVQJNKuCLMVGwjxS3f1fsdvO7ax/y3LjyM6igYiiIs?=
 =?us-ascii?Q?o6yJAT6URF92yOOCvU7tDQ5Hgt0SC/w+HAnpfeNM37KF63CQUiRyxVzlH3lM?=
 =?us-ascii?Q?R2CutkWk4md9/izLK1GwjFJQ7I5zAWQdvmAPmlcyNDssGJkVRWE7adAkLYru?=
 =?us-ascii?Q?S0MH2BV2rs3CvCp/P788eLQkRcLkz3By1V4XTdY1Z68e3rjBOmfyIAiYsFP5?=
 =?us-ascii?Q?3qyHfZg/o1BAMrJhLgPf1vVnEEit90tenxRJ3dsjgNVMx7/A7giLvUVG7Qgm?=
 =?us-ascii?Q?bqgzAQFte0u0CfltW6KULUwictitEnJV5AbMJ6fKb+uKWncNp8Ah7qvWYenX?=
 =?us-ascii?Q?LtmthJOXgJJdb9kATKxvEs+dzi3bRtESowTVCyiN7hGkuGlxb2lk1ReOF40n?=
 =?us-ascii?Q?Tg0+V7rFxJmTrjPYpUqsEILZ1nN3WRCBmpDRNSUvk6S2UNYlP4+5w3NfA7sW?=
 =?us-ascii?Q?+/z3bpxxRZsoAbL8AWqej4MJ+bAVUezyGL5OiPUD4WyaMmAeDs8ncs+Zoot2?=
 =?us-ascii?Q?rLP+UmAsjcIpz+G0ONgiIQIi69GRe/vOLe4p5A4ecH4uarjdJ5VhA2Y4QtPN?=
 =?us-ascii?Q?LfBBPz6pzUbbIdvBmrn2V196Ie63DgzeGSaT/93yqMhr2/Cc/y3IueM6u+ap?=
 =?us-ascii?Q?uU9SobUewXS66LL/5MzMzUwxc628eKSZVPt3xwEIlxOzeHfGWLny/vGTs+Gw?=
 =?us-ascii?Q?Eg92SDWkRykezJaD82iRYD9GbI+xN4B8/JVnoLqQSj9Eztrw6qYGMkGT1LaC?=
 =?us-ascii?Q?wduqy6aUd232N1To+7Ci8SD335ZglByP2V+ZtFVXtAq1yGbHtYC9tdQwTK22?=
 =?us-ascii?Q?5ZPLap3uNuLpKtnp/GEof5RsWvXgp7ktvuTT81a8ma54xTyMpdsoPdD3L0K3?=
 =?us-ascii?Q?OJAvphIPcc1tr4S6Bm7KTXYjYGMLWsmD7BamMhsztxvUPOypYIrTg93k180x?=
 =?us-ascii?Q?1mIHe2v6w7kVkXG8rnaKaiO1n1wxGuAFnvT2exvec6+SYA29iflb9A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd9fadf-ce84-40a6-7ea3-08da073e86e0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 11:17:15.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1KUTsbDw8yCigr9BDOgaCC2xez7h6AGuY7kfW8hrBwOwXRpACt/veYWwVCMNMOzicR0meJ+BkoHlR7JmYCScMmuXCjQ0+f7ESZpNOH/lS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3435
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10287 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203160070
X-Proofpoint-GUID: 103K9yYfaktYTq1do3y4xk91m5Stq1bJ
X-Proofpoint-ORIG-GUID: 103K9yYfaktYTq1do3y4xk91m5Stq1bJ
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Also:

drivers/ptp/ptp_ocp.c:3154 ptp_ocp_summary_show() warn: right shifting more than type allows 16 vs 16

regards,
dan carpenter

On Wed, Mar 16, 2022 at 02:15:46PM +0300, Dan Carpenter wrote:
> Hello Jonathan Lemon,
> 
> The patch f67bf662d2cf: "ptp: ocp: Add debugfs entry for timecard"
> from Sep 14, 2021, leads to the following Smatch static checker
> warning:
> 
> 	drivers/ptp/ptp_ocp.c:3102 ptp_ocp_summary_show()
> 	warn: right shifting more than type allows 16 vs 16
> 
> drivers/ptp/ptp_ocp.c
>     2969 static int
>     2970 ptp_ocp_summary_show(struct seq_file *s, void *data)
>     2971 {
>     2972         struct device *dev = s->private;
>     2973         struct ptp_system_timestamp sts;
>     2974         u16 sma_val[4][2], ctrl, val;
>                                     ^^^^
> This "ctrl" variable should probably be a u32.
> 
>     2975         struct ts_reg __iomem *ts_reg;
>     2976         struct timespec64 ts;
>     2977         struct ptp_ocp *bp;
>     2978         char *src, *buf;
>     2979         bool on, map;
>     2980         int i;
>     2981 
>     2982         buf = (char *)__get_free_page(GFP_KERNEL);
>     2983         if (!buf)
>     2984                 return -ENOMEM;
>     2985 
> 
> [ snip ]
> 
>     3087 
>     3088         if (bp->fw_cap & OCP_CAP_SIGNAL)
>     3089                 for (i = 0; i < 4; i++)
>     3090                         _signal_summary_show(s, bp, i);
>     3091 
>     3092         if (bp->fw_cap & OCP_CAP_FREQ)
>     3093                 for (i = 0; i < 4; i++)
>     3094                         _frequency_summary_show(s, i, bp->freq_in[i]);
>     3095 
>     3096         if (bp->irig_out) {
>     3097                 ctrl = ioread32(&bp->irig_out->ctrl);
> 
> reads a u32
> 
>     3098                 on = ctrl & IRIG_M_CTRL_ENABLE;
>     3099                 val = ioread32(&bp->irig_out->status);
>     3100                 gpio_output_map(buf, bp, sma_val, 4);
>     3101                 seq_printf(s, "%7s: %s, error: %d, mode %d, out: %s\n", "IRIG",
> --> 3102                            on ? " ON" : "OFF", val, (ctrl >> 16), buf);
>                                                               ^^^^^^^^^^
> shifts to zero
> 
>     3103         }
>     3104 
>     3105         if (bp->irig_in) {
>     3106                 on = ioread32(&bp->irig_in->ctrl) & IRIG_S_CTRL_ENABLE;
>     3107                 val = ioread32(&bp->irig_in->status);
>     3108                 gpio_input_map(buf, bp, sma_val, 4, NULL);
>     3109                 seq_printf(s, "%7s: %s, error: %d, src: %s\n", "IRIG in",
>     3110                            on ? " ON" : "OFF", val, buf);
>     3111         }
>     3112 
> 
> regards,
> dan carpenter
