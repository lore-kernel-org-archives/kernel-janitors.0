Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFDCC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Mar 2022 13:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243054AbiC1NTH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Mar 2022 09:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240839AbiC1NTG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Mar 2022 09:19:06 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827075DE4B
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Mar 2022 06:17:26 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22SCuBRK011734;
        Mon, 28 Mar 2022 13:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=i98sKppd/JLisB5739v/6iGvXMhUvkUeAQLNvRHR60Q=;
 b=oh9lshadpUdijh9WoaXYvX32hi9CDccipbu+XdiEijOsGHI1EaNbDG51uhPuFvT5ilkP
 1oxtxiNGa9tr7xmhUCwmmeOXAwRTxwIujy61tQQl2N7xCSLNkPsySpCL9+uEB3Ym1aYS
 szodf5HLaRIvfQBM2CxPsPK6OHZJ1gRgP/HXCzEy/DZGFRJpNnDVWO7xfvbv2LMHEzbJ
 ouiFNKdLG/KU8EjviM8VURfA4KSPZyd5k6HFHDzLuYXJw0sZhaF4oZka/o29MgRUxy2V
 bQ2it2jk6lCRQDFiTfaO2CRLEMxjktXAIFXShiw0wFbcIGAfRhn/UKKchXnh4p5JKDo+ Hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2bgnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Mar 2022 13:17:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22SDHO3i018030;
        Mon, 28 Mar 2022 13:17:24 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by aserp3020.oracle.com with ESMTP id 3f1tmyg54q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Mar 2022 13:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msJlc3BjgBECfk7/iNpTP8JmqonUaatAcfxwPAEGtDsIZtQ3n3HpBxgV9O86Nd8d+Roj+fjGM9bcO/Elbhxcslcc+BrBAZvS/Atz4cdOLNDgjoxPJDJC+iQXsuVSRiFNK4hJHIDCusOkclKZ2IFisn1g6wyKr2dNh/Q1ok8zEIofFv5j1mmtbEUV3zyqNUWBdsyvZtO3N+cPwMdRc4Y15kKp//v3dPBB3n/8bXEy16VQ07ILz+PYllRvVjbogjsTIz53rrGWQNYVK+Jgufxd8zL0P+RcO4uabwbjhdL4m4IIHYSYzqN+gzmO3xzGtU3LsMkh/R1Un/Q+TOeDEd/dvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i98sKppd/JLisB5739v/6iGvXMhUvkUeAQLNvRHR60Q=;
 b=b/yMC0DHr6/GsoVAt2Zq+yRPT4n4ooKNTR63uu8piRgq1i8ZWfA1IG7qX0nOU6yQgDSDSOdF5nOzHv9mbNrdLTozI+aJ8LySkhXu00tYneX4IRzW5X+5SDn4QA6h9ErZ4iFGVXnG+gjA+X7+thE5a+WfkMHn1tplCTQnzlZ+4sbMKrHjhdb4MprHl0WGRPPOCb1l5782z5C0AruQlwN1w9ENtVfYpQb3CKTzWxazXByunmtLE6o+wyEOz9SMYlgokzwvQZ4NY7LEu2nNAOqj9E7wX25cHS/zXKwYoLjjRZuHgo44sgkqA8DvLmPBbKSTbJm4/8/d4t6XXbl19BqGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i98sKppd/JLisB5739v/6iGvXMhUvkUeAQLNvRHR60Q=;
 b=j5KxOqRxB9VL4kMTrju0naeJg51iLsIWZnlWz8/bYYY+qOScj/7cT4nNWxPw/COeW0gmTqBqoJVWB6LGvXrTy/yZ4oOzW5bSwhMEPH2wPWvAthqcI7XHOEB0dtd3y/InJPYlYRRz77LZPvVSPi0zKjbN+FZLPsLkCKBMc11wTAw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5718.namprd10.prod.outlook.com
 (2603:10b6:a03:3ed::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 13:17:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c%7]) with mapi id 15.20.5081.025; Mon, 28 Mar 2022
 13:17:22 +0000
Date:   Mon, 28 Mar 2022 16:17:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Harm Smits <harmsmitsdev@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [question] Whats up with loading the GDT in startup_setup_env in
 x86_64?
Message-ID: <20220328131711.GS3293@kadam>
References: <CAO64rh6_m6rx_=rPcEGLzzT5oaJFYzbE2RSQ-9zwk83ysj16wg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO64rh6_m6rx_=rPcEGLzzT5oaJFYzbE2RSQ-9zwk83ysj16wg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::24) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b77ff2e-e9e2-454a-c2b1-08da10bd4afb
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5718:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5718C3F21E8107DB356BA21E8E1D9@SJ0PR10MB5718.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/W5sS8b/cFi6L+bjDABMCmNvod80b9Y0AzvAH30QL6LpSXss/GhmaB/KU64RtSeuJ9dYBedBX606ciGcIiJ5YRHCrprfEVSu0BEuLyKJyrXjX3QPmJz7nbvQOh8RFINJIMQh9Cn1bqgD6NZ7cMdJtjaF7p6oVx+4qg35ryvOzimPUImjW2a+HuZVXX360erGdTADQfOyM5XTK6vlckLN8wEwkXCBC62iC0Wiprh0l33+JpSkmIswVyUPCOaUDELmdVhzDZErEYF2nQlUfsMxl9ko7S3IZVTStL6SszB/U49Ka7b6I7QnJKYBUvCDg+6BboIwrqmjIQpDNUY9rEA4Ikjj1X861sf8Wye0210vcXplseypXszdSzEakEupE4ZmPhXyzeEjleE+Z9bo1yglRFdhVopbrUUr095+RNuyynTgEEVKFhdZTWSFkPwRhC0+fTjut3xZeZOCKROSbVRGwJUcGfNiwBjQb1f0sa3Gvwwo1iZTaDJo4Bv2nAsL5SHLiSs0+T/GmsskJzpcE3Eto/aCkqPLEaaNw9lhtqvZx44z1p0Mmqzc8Ompf8ZX6RRQM8bHXDFL/iF8uYxd0jtSyZ280T3SAbWlEcH625XdUgjvEkA/Uj5ScBCvUymK347U8xGAFxjpiDz1ovb8ZVCdVXiQk0p7AdDS32X4uFVqNAMc6UEH42PSecZPlvU4zaF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38100700002)(38350700002)(8676002)(66476007)(5660300002)(9686003)(6512007)(66946007)(66556008)(86362001)(33716001)(6916009)(508600001)(316002)(6486002)(8936002)(26005)(2906002)(33656002)(52116002)(1076003)(6506007)(186003)(44832011)(4326008)(6666004)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fojRBhGT8tmdGrnHxbEr/xYj73wT6o5OpkCmdUOvD1cASz3Dit3VQlzeDo8l?=
 =?us-ascii?Q?GBMg6y/SSeoonoEHW9DcWCgL8YGsBtUDoQovIwirsCJI8DjaOYheRIQYDl5s?=
 =?us-ascii?Q?go18/bHe3OOF2F+f7YhSws7AGg2I6TzEXDoCDdTSdEXm5W0Wr807rKSFEUrk?=
 =?us-ascii?Q?hyvcRd7hL13U0LTimvv5ZGurdqO3vXu9s74osomiUiR23XDnf2Bcx8y7IWcl?=
 =?us-ascii?Q?ka1Ps6DGr6F4lnilJKaFPkKlDZKZXDSMXeYXFZuPLFEuRLk3xiYlotnILXA3?=
 =?us-ascii?Q?knPNAG7OJCgNVjNRjj1qqXKuPcc+Kd4MAVw9LCHOvAP7mfrinBDp7J82Ldsn?=
 =?us-ascii?Q?v+gDm2AKiWVEkL9AaX9wxCD3c7nbKEZRhr+sPkieAVj0Z0UYehjIkFzN6jGy?=
 =?us-ascii?Q?4+ANRDkoxWZ3F6E6oYBmgDGWWyQvAED0ICjb7GtUle2Nm/Juq3j533QC7Jzy?=
 =?us-ascii?Q?2eq2okuSCV2HGO4vs0DxZZIipFWlk1Tno2lYVGZxI/5s/y0rAxUso1WDwhuz?=
 =?us-ascii?Q?4gGOjxQezww8i4VbvGRYW6BxFKWmgCVf8C/TK1ohA2P1LiHLRDhWDTvEJ5Iu?=
 =?us-ascii?Q?+fKuAdvAH+5jU+nXZHOWRK+8cTm23iMOEjzxPIT9+FRlV+XSA24RQZouubTO?=
 =?us-ascii?Q?I/WMQNK8fTjivym9Mjl0sO0y+gaamAn0seNJb0O/KVZOx6ioAh/gZ7yfABkU?=
 =?us-ascii?Q?sVIxok4CZbmU9G+jt1o+wxAMZ5q/vc3GfjGBxq3GVCc5fTFSOoBoisDBlGss?=
 =?us-ascii?Q?FMo4MxhFIao3AI+ti7R4wcrkMuA7T3KZF6RE8izs8O4aicseqD85dpGV/PK+?=
 =?us-ascii?Q?43D7SeJdUNUrf4mApxXO2i6nLT69Md7gvCk0vP307lspX0SJooZpRRPAlxYY?=
 =?us-ascii?Q?9kKUIOh6GHgkgBM+jS9OqtuqpxY1QM/rPgEcL4LGzRA3bYCwp5wDajum8Bj8?=
 =?us-ascii?Q?W/4P2yZjJ9qj3+wDQps9+iF0hNMJ82ep7z8UthyXcNHMaS072gLLSotihIqr?=
 =?us-ascii?Q?WVD1UDyo5y/Y2E8MvS04CRYOhremgRjvHBE/bMIfm3q4LMsJM2lD7mK7WA1V?=
 =?us-ascii?Q?lPTLgvfieCTX+ix8cdESaHrNe9lYl3161GulcEWcfqEfooYImREOF8sZC1PY?=
 =?us-ascii?Q?vltHrXJ3FG3krLg+lKLL811mw84IEmYYQervm6jrND2sHZMDRZv8E2PS7VeD?=
 =?us-ascii?Q?RYQMojPg2y/Icq5zht6DVniNkz/33EQlXxJFM6Y6Fylc9kTXO92KR/rm/BjZ?=
 =?us-ascii?Q?PYS6Uu05qLcCmEXncCRKDP+fl5Swcq2DKo6+5Ccd8sqTTIxfojIQy11+tK7T?=
 =?us-ascii?Q?2qj65BRmJ0c7MMIQMkATvQY7ZSbu2v1W5EvbjogtYX5VlJMGwMm1QDq0wLee?=
 =?us-ascii?Q?WzIKG3yyA8JASvY1Hn0URc48U2rMHMJeW1hQBSImIYd8fEZSDUbdF3E9SsMO?=
 =?us-ascii?Q?WJtNNAjlbc2s2xVKan/JBHecg78Kr8WDQ8ECvlPVk76M2SaPax2hPK/JD5G2?=
 =?us-ascii?Q?Dn1oe0urrxzDVSrSsIxQ+SyTxFaMTHE1P9ov/40LpCchpgwj3y8a3GOUij4H?=
 =?us-ascii?Q?RxBb+nQyuE3jy5KeBUM2ltkcMXmngSxcK13FocEx0BZCb+xEU3O3xZw38VBG?=
 =?us-ascii?Q?86yIkgPoB5N43Pmui5Ls0Sjr2xzqLQyjK7GMPsMS4/cDgJ1AZMWAvAezCTtI?=
 =?us-ascii?Q?AznrZo1/rQgXPJZFERr9ENmJiQiu+/TI1ty6E01hxfehcyLfKOFJ9UoS8zJL?=
 =?us-ascii?Q?eB/RkGTweJ+6g7MRQehEhxsBGdqE/rk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b77ff2e-e9e2-454a-c2b1-08da10bd4afb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 13:17:22.1254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8MNe30n/jSbGy8yQCNTkoThj9ASTzlzKt14P9tv+Wi4FGuOfjdVbKsukiPaKuDhwEniofHswDFsR9gEjKwiB/yf8Z6c3K0L8eWqPCtKESE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5718
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10299 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203280077
X-Proofpoint-ORIG-GUID: fUdKOhLLVerzwMDcrK1M3tlF_Bh_CtNQ
X-Proofpoint-GUID: fUdKOhLLVerzwMDcrK1M3tlF_Bh_CtNQ
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 25, 2022 at 04:35:19PM +0100, Harm Smits wrote:
> Hello,
> 
> I really have no clue where to ask these kinds of questions so please
> excuse me if this is the wrong mailing list.

I don't know.  If no one else knows then try asking on kernel-newbies
kernelnewbies (at) kernelnewbies (dot) org.

If they don't know then you could try stackoverflow.com

regards,
dasn carpenter

