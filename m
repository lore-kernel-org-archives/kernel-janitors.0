Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067E6C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Mar 2022 14:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235732AbiC1O1g (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Mar 2022 10:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243797AbiC1O1e (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Mar 2022 10:27:34 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB2724F3A
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Mar 2022 07:25:54 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22SCtodf023941;
        Mon, 28 Mar 2022 14:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=v+Tt3SWtOUcYLimVHYOtouy1AxZfroNsxGPRt0R+/xo=;
 b=hrRTzH1UnwvGtwsXW17VviC6r5qZyRjwm4XxJ4Bf3+jpWpMJE13Bz0ZD47uGkInUmjtq
 0+aNb7/Egq8ZVPkNPBEVh+4SvXewP2nHAROJsxifiKsQJOPN7TuYVc2MMqNiE1zmuiI0
 wVs0Yy0DXlJ/mHb40Y8CTRG8HJZthh06Ygv37gR/Gm4YgTR2PQRkEv55pzex5C1F/rAJ
 S7SuZ7uqcqxIlAKgSrbYyYHejNkCrIEnUh3c8SCJ3OZsna4ich4paZv2uBsORE7TJ1F0
 ftVKq7k58kkmpiHwDoL10jE4V/xOokxT3lc8NsNngx1BvP3s1Cz5lB/aZVB1n4oI9Omb SQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8cknre-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Mar 2022 14:25:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22SEGm4I087826;
        Mon, 28 Mar 2022 14:25:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        by aserp3020.oracle.com with ESMTP id 3f1tmygbu1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Mar 2022 14:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeyLrhP/9GAlefhblLX4B8MiCtEpLlTxtCSkL1xXtuKbjNT58DAHLnn9qgtmyE8TzNzH1v0lCMZwWXBXmDTmsAHkQT9ahECcUFUqNxgxSBoUFNdnwHuoOp5KxbJxSh1ZBr5dGE4BJQEmQmI+mcF1/IT0P6j+8ROwGhTiY/UL2pUEvz2wjAi3Dy/a9T0DUcvSacTdgBckyTxFhZDyOt6o/lQAGrKdMmi1AhrgbPkYTBFWCr6guc9/3y/1K8caUZlz90p5q1jDDnn0SZf3p1YaZyt3jxLvGyOF8HzSugKrwISyErmdkEJpSZfrOPdKGSI7nlnQdjjPXvUCAOD6g2Ittg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+Tt3SWtOUcYLimVHYOtouy1AxZfroNsxGPRt0R+/xo=;
 b=cTcKSKDZ3X4hozVC20d3Pif7Yq8qrMKcE3sw1yyMs4ft3WEKmXBAi63Jq3N2fv3p/8j4nU3y7InDiCdq1HqSenZV2dlBpfqZi3K5jfyrqd7ltlDSMUbWPKG9Lsqalfi6B/B9Yamw71a6qa1Oone9S/ZzpHLhYFG+CFBU72OG2SxL//GofjtGTXEdU7IpvVRAr0qs1vlm6lls9p2/Wx1u/76Yxei/sOjXcDBhORDp0E5R99pock1gAQM5jJJMqE/Xk40I4y82qgACEEn07X2IshuWWbHeB9MNQ468tlhsA3z9zArEdkGfFC7WfPl1RdbbqU9csNuanYxVU89Z2MTNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+Tt3SWtOUcYLimVHYOtouy1AxZfroNsxGPRt0R+/xo=;
 b=TU97cj+62DqRblliXASoDWcZrye/WIYJI9DTM5EZbimTajW+z5jxD08LxduRjFElggvJu+6vp5DoNM/bRIuGNQNJwSGWMuy5FeSfviTZnCgAmyqRpLYwcV8rFRvjVv1igzEbf2N7Wdx2tiPQ86ffzmilgqE4gBxXYGQ44hLFVU4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3461.namprd10.prod.outlook.com
 (2603:10b6:a03:11e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Mon, 28 Mar
 2022 14:25:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c%7]) with mapi id 15.20.5081.025; Mon, 28 Mar 2022
 14:25:50 +0000
Date:   Mon, 28 Mar 2022 17:25:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Harm Smits <harmsmitsdev@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [question] Whats up with loading the GDT in startup_setup_env in
 x86_64?
Message-ID: <20220328142528.GQ12805@kadam>
References: <CAO64rh6_m6rx_=rPcEGLzzT5oaJFYzbE2RSQ-9zwk83ysj16wg@mail.gmail.com>
 <20220328131711.GS3293@kadam>
 <CAO64rh61eMd2ekWK-XmXpjNvRKVscdua=txEMF-fYp4qt+pp=w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO64rh61eMd2ekWK-XmXpjNvRKVscdua=txEMF-fYp4qt+pp=w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0020.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::32)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab29a44-2e1c-4932-0860-08da10c6db8e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3461:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3461A3FFF5B35C41D4E9D07A8E1D9@BYAPR10MB3461.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQljK4rmrzjFdU8J3bT26+6nBClr2+MdIlWK0OW1cN3sFkr0ylZy31XK04FqZRWSWCckKPtdxeUj4r0hcpB04wmvlnfbeKHClm3UpXa+4OcXisRJpA4o44RD7xDFL2tw6GVavrEGJXqoaPRHQ91zi/yxcBP/jBEURl8iG0XhLI/YECrQs792Ab8mABKlETSsxr10EYwz6LWl2FxmJcyR/2GO1UHy00OiQ7QYAA22y2YUTCLtb3cUSaYBIL5+ZyKigJTrM1dQ/1W57u8EwC9KVJ/GhCmg9D5FbvrGEZLNBMYKNjiYkO5mK213ry1oGZwR2orL8Z59hGRKqKhnA4nXNVuK09q6sEOFIQ4QEwUWfZxOh6AkXg66qKi2H5ZmdHsxlcvVZZpPdbgSI1BosMbHwjPIgEq2c7W3LWdtmJ1ipC+HEZAvmrwCSjxoEy5KMXXP1Pl5SJg+M9AUkJk9rhhitHnSp+kU7uvXXKEwbEnUPPPYIJX1at8pHzhvvHUyxRxjnY4t0wyqjN4hBdnvA+PCbHsSLptQa4sz8qeIlhGCH+LLwji8CdEw2qWWwQIXBeDKr7k/4PC0c9U/uY2ut2nz7j1n4hAmFmxUPNlpTQYGGbQmeh3t4RVTnZLs6OXX8+B3VDaOcm1b01Mf5XaVBol15pOafVucHrb9SnYHv+9sA/MdiBfTRKf5EOcsBk1FNLFS4f4PWyVMJKqn/rlw1JeLLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6512007)(6506007)(6666004)(44832011)(52116002)(8936002)(4326008)(9686003)(6486002)(66946007)(66476007)(66556008)(5660300002)(8676002)(316002)(86362001)(508600001)(33716001)(6916009)(4744005)(33656002)(2906002)(38100700002)(38350700002)(1076003)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YSsI9MY0mKHd9D4OMnFq/tYys8nYUEJegZf76L+b2Uq6WcRoDyJoPgPFCNIP?=
 =?us-ascii?Q?rVKw/4EpMu1n7VfX6ZicvNQXlcjM+eiyWFD0rJwKYfEmUsadOu6yJAxgMB/D?=
 =?us-ascii?Q?rTWEt28DTa5tf6QOi74WPQLI1FeX7b31bY6+/qi/gZ+19WSdDzb1cIpOdADr?=
 =?us-ascii?Q?gP67kzUeIN06gmD/N3T//IOK6Gf0crvjhxypKB6mH29GQC8ZYhhK32c2eKfT?=
 =?us-ascii?Q?mLsQnwPn2I+ZMEfg5OQ9M/Gq74GZhCxLw0Q042BThGraTfH+1QoAPHdoDFjO?=
 =?us-ascii?Q?1andHY6ZMpeRuxbciDdSSCsc/yxNDeRy+KK079zo1VZ+m3vtOxM2faM1md36?=
 =?us-ascii?Q?2Tl2nH/Fng1PzIf13WDveWMcp67NAjvM3eIQYN6QvbyDowUJ/P7a8Q5IVo1x?=
 =?us-ascii?Q?r0pS+Njiv7c3SCNVg31CvdWZmctvVUK5beO+TUfChcANXfQpUhoqe9zyiO75?=
 =?us-ascii?Q?LDKzhGp3TSUu/SbreL3Xb+fXyEpuUYIwqj35MvXGftKiSIrJQuNu5xeaRtA6?=
 =?us-ascii?Q?y0jsl34mRQ9zeXf9x+RLHg5BOh59Xi+3uEnNrrh7AqjE1todTfxaLS9GyC+6?=
 =?us-ascii?Q?AEObfb7j5K1wbG/e7VUNMrLa6sxN/H2XfcdwedGOP2UV39J2krdwZUPzlNwE?=
 =?us-ascii?Q?J2u9QmylPN/vWOsbzKFf2iP/PiLKqIvytM8I0HAAxLqmQSSgc1DJji4rOvuL?=
 =?us-ascii?Q?CgM6hgKDaq2Huzwqd7B3VZhyHLivKITo49HFXVYkf5YHpWt1LMD3T9tQWOxW?=
 =?us-ascii?Q?V9EEyUSl7cZYX8abkNjcHnm7nLKjmDbelPj9XWgyUlVdOGJL3RtiFLqP+tMN?=
 =?us-ascii?Q?JT9vt6/4VrBLIyjaclgzZLCTDyP2wTVXU4cM2ZtEhi2ys9UKSy5B//zqOBKl?=
 =?us-ascii?Q?WGW4v5Vf+3ePBhYkpFov9kZXETEs/fphl625JTZ9rS9Wj9LmoIJJsMpbTbrB?=
 =?us-ascii?Q?p9JnidLcnIx7Ph7rOl3z78yzSe+Ijd06lBUhPekFrl46JigwyvxonfBP2IXF?=
 =?us-ascii?Q?fy74pJ2xWNOhTO7R5ipd6V4/JF/Bqs5QrFGj4csPjKejmM1Iu2AM8bha+fhH?=
 =?us-ascii?Q?gbJvD4jostWd64/4QyRaR+z0lBZaRNDaPNxDgnzeWkOsjEJvbTvfYiiacsdv?=
 =?us-ascii?Q?eI+qJDnGoHHra9MMVcv2PVb1BUWfIVyunZJGFixQbwoJFoIDGbTNNF2taAIV?=
 =?us-ascii?Q?+cZ8BohrY8u6VRPFjWvwgyIefUMeIPdcxvv+wtW2Qap5ND7w25Np5R/vdKJ9?=
 =?us-ascii?Q?Pwmn43sroZAU6rSZ6FBk+wSungBmcrWUQH3lDx+510V+kDgI3DEwPXvKQkhW?=
 =?us-ascii?Q?OttH0S8AAjaRLrPClUEiRzX1M3T4noJsg7/XHppJgHwSaX+GiFs92Ghvui4r?=
 =?us-ascii?Q?GpedLS/IjAiwOMVynjqQwN+xDfekE36wzQ/5Uu7Y2OMVEaihtGIKCW28WUQB?=
 =?us-ascii?Q?/nZIFAtrGj3uUZz/+W+94x/H1I1Qx9jXyJO5zyHtOlrlwyKxrvxTJ/U+B/ie?=
 =?us-ascii?Q?8IgqVf8Y320JVpcEW3g6t5znMakUQRQSa48sXQuG6YzDITL+Fj2q3PMLXjBF?=
 =?us-ascii?Q?mGK1UWbyL0pg7Dv4GnYngrX7jygnCw6rP6V79VXqvEnOQDtY8xKEyQZyApaQ?=
 =?us-ascii?Q?FIFC3BMOSA3BROgS3xgQtC4/nKSdLehlKNq29DDzckfEXPgUFxZYjSf88cwP?=
 =?us-ascii?Q?u/Hn33OkwbC87TfN+wFPoYe+PxgTZa/yBATJJ9vKUOsYMC0mjxRLlFL+xJzr?=
 =?us-ascii?Q?piqizEYxaaBnfoc03bBpJ61PEyVZhGo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab29a44-2e1c-4932-0860-08da10c6db8e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:25:50.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcxxJrmhTQYDTfTAakrAF87Rup7bTcUZSjGqu3SDJtNxiK6FcB4iDsBW+9L/ujYldsjHYI9fzX0n/9z6r3XDSVXRB06ZqGnMK9+bkGGAUCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3461
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10299 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203280083
X-Proofpoint-GUID: _qb1nEwxVdWvxVJjKBBDR8EBhzdN8dD2
X-Proofpoint-ORIG-GUID: _qb1nEwxVdWvxVJjKBBDR8EBhzdN8dD2
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 28, 2022 at 03:25:14PM +0200, Harm Smits wrote:
> After a bit more digging, I have figured out what's going on. The
> compiler optimization passes seem to turn the absolute addressing into
> relative addressing by means of %rip. Should I submit a patch to also
> wrap it in `fixup_pointer` to make it in line with all the other .data
> manipulation in `startup_64_load_idt` and `__startup_64`? This would
> also avoid it from completely relying on an optimization pass which
> might get changed in the future.
> 

Your explanation sounds totally reasonable but I'm not a domain expert
for that.  If you're sure and you've tested it, then send away.  The
worst that can happen is that your patch is rejected but even that means
you learned something so there are only up sides.  :)

regards,
dan carpenter

