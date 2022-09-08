Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B41C38145
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Sep 2022 10:49:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiIHKtr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 06:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiIHKtn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 06:49:43 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A5613DF7
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Sep 2022 03:49:38 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2889n3f4028003;
        Thu, 8 Sep 2022 10:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=Z395aobtg4lK7WuPWmhonw4J6LpW8tgyVpwYsIe6Raw=;
 b=NGlkg1JcumW3mEzfGsqjJXjCiQUPLrVdWo4SNXXelb6kfroKJkdzxtcn5eVvvGzT4wi2
 7itvonhsu/hbyBEdnvzMMzxoRJZvrHZBo2KqouVEaR+qKCnnBDVN+vOulfnFQyNWEgus
 6otNqJJJDqqENISTHSJKjPj8at39rflPmq57Icbj2v8L1QcrtGs0BaNtP71iGnDemfCS
 DajcJGdOUAKgUoM02qtRLAbxqNaLffUTxRN8KOJymYKdaYCilojIEV8HbtxeN7zg7NG9
 ONHGr6+I5CrGtLnSxivVrm4dzjeKP+184oVLqos1imNf71m6QmG83zfz/x4oNt4atB+v dg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jbxtakdy1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Sep 2022 10:49:22 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 288Aa6aD006885;
        Thu, 8 Sep 2022 10:49:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jf7v64sg1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Sep 2022 10:49:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkUQRyfoEg2/mufZQv/a+JkLZeEqi49oXYOnq9uMQ+0ELiYjXWJKrXKaZl7vMuVArfhFrEGz3aMFlXbPf+MVYvSQde0yzxX90N9IKnEUzArrZIVGTxbwMrfr6FrYzWTZduZdegElRq72ZbEPajxhLXSeNiZ3oZiZ4ZuYAC1m5PVAGdLbFgsOuImWZIhkz9lde3cZ/qL+RUW/JaU/oMJln5qcx+HPTxqYI8vRat1r1i7NCJ6gazmRnELD+ITbeDpTQuDF+2rnJMJ2iziSSRFgp+c1t97CtPXJkn0Dx50Lk/lxApc8O5ni3jgl6krz+8qtr0Zg1f/hx7chHnLWwQR0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z395aobtg4lK7WuPWmhonw4J6LpW8tgyVpwYsIe6Raw=;
 b=Jo9pWaTLXy/wRJIsfEQ2g9tL4tmx5Iyie1gIfvs4gUZcq7eyT4VSm48F/1ODJ3z/RWv2ysotxYRn66meQaZZw+kCSmeTRi1Ax9bYCzPJB8qFq8hYRG1I8bC5LNfKAVWBQyBdeFWhw9X/SKGaGefZYNlf7ytaHulRwzy+b237VS4S0k4ygoZDx6qRjQT0dWvp05KbURsMo1ir93uKdG9kynvXo7AkxvgXHsjxcjDJC/BQfxTv4wVd1uZLmnz57D2J5LuegLqx+UcoBIJmaHfxTOu6i+B9RMbDQAu/i9lcCR74+FMk9SbGx5zh5d9exPsplmAWbqxG2X6IjOaL2giI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z395aobtg4lK7WuPWmhonw4J6LpW8tgyVpwYsIe6Raw=;
 b=t89wj9XPZiEtpZ+ZJh4H/Wy5HvP+OSIbpl2zDvSGAM0UItY2ymP7zkGYOkIvLr6mY3BT/I+QTYFihRQh887BuntQpmRRlFV52/FWAE2gA+gRIbl8//3AjZChB50nXgJLjZVur+C9LdirY4KSx7gr5dciY4Ok5M0vqprnrKN7zjo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4710.namprd10.prod.outlook.com
 (2603:10b6:510:3e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Thu, 8 Sep
 2022 10:49:19 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 10:49:19 +0000
Date:   Thu, 8 Sep 2022 13:49:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write
 functions
Message-ID: <Yxm7eztkQKDPU/Kl@kadam>
References: <Yv8ezribLQbq5ggv@kili>
 <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
 <20220822125705.GD2695@kadam>
 <YxmSTH5ETSC0D3Rp@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxmSTH5ETSC0D3Rp@google.com>
X-ClientProxiedBy: JNAP275CA0008.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d3fe51c-ae51-47d8-107c-08da9187c7fa
X-MS-TrafficTypeDiagnostic: PH0PR10MB4710:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQ52ca+VF69S46Ak1bpgTRNQn9hcY4P2LHdPnj+/xy4k716TNt0PNKaFGolVWytxSqoGw6gfPkK4sgBDoR5HRs9U61shHGRQCX/pz6j+Fyb/zrKMASXz2Zfk7eeEwI0hJLP6k2POl11abtCMv/Zn+J52J9FkjORKC1qUltoyvECcbUmiGE4NQ2VSbKgfbTRpie173Z+wuvUY3M6y3/pqdaWvE55ZOvBkfCxdqkFiVEfEbqdaRSDgHtnDxmxcUwZep8RPalKc4JPxe+x8yq8Gb8VKlC7EGR3xaV6DlM+hPFcpEhkO+PnTyCAkdmw5LN8leT1209wVZTEEo9Lys1L5Ih8gNEmhb+T8J+fTGoEt5fxiogxWfhDvuNd725c3EJ8vmNVoOub1F0uCiQ9NjAcxrxuDGmtdmeHRMwvTjR8ZevnjZjMuj1XThziykST4UrKMfJY00mMUUnYZHawW/Ekd+mfT4d8Ci4DTj0ns+FdG4VQkMxvQ4uaLVKHry2+ArarEVHAxggo3uiOL0OjGbj6fdCFgQaGYFF0/GoGUeUTr+3VPJOSnfIoAJoOnFDhHpUKGLslfxEc8uh44rp1vDVyFF8Qi1n/xiDkHb1ZojzkMUjhvtJJcOXKddMyXkp/XpSactIQfQmUpNbUxr4OFUMdWB8pKPlCfnY9XDzBnv1hkq3kVyVHU6BxXYDX4O+udNfsp9+pk2VpWw6CJfFEJ9cBHvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(376002)(346002)(39860400002)(366004)(136003)(53546011)(6512007)(26005)(9686003)(5660300002)(66556008)(66476007)(66946007)(4326008)(8936002)(44832011)(2906002)(38100700002)(33716001)(6506007)(8676002)(316002)(54906003)(6916009)(83380400001)(86362001)(186003)(6486002)(41300700001)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?frV1Z4eJap28kSyYM5SJ8XvPx3GB7Z10ZxE3fn07WVoAvaM7TrO2xq+YIvJO?=
 =?us-ascii?Q?Q0lUBosCsF9zljETkz0i5y8L6uQbOlCQaADu+rflaL6trTlouaL1U6EM/9fo?=
 =?us-ascii?Q?ad75O4IP/cgPYORTXMmNAbTXXPbekLo2r0d3nqbInqdqPMTXNDeZSzUhwnEh?=
 =?us-ascii?Q?eCNcxeMr+VF/6LtxkZ6CCpNKQINO1YDU5AmccX3FtXTtHldAZt6tdJw9tef6?=
 =?us-ascii?Q?WE5xzovi8rkBmmTLLG7oXMf9YmJYIcyJzoG4AELPvR2x8ouHOj4iiJ29ZFmR?=
 =?us-ascii?Q?FBXCuRBlEG3J7AAiDEgZpMPIqxETfYc9EVREdA0Rkar9M/qR/JPGgF4wLs1w?=
 =?us-ascii?Q?cpKoUmR/2HF99fwWjocc/NAtHmUVIGf4yj/uViT99DtXPitRw8Yh/jdwAJ/E?=
 =?us-ascii?Q?jsjZXf0eVOsi1WJ4CWFibWJeZHMgynthWrbkSAd1ZES0nWWCpphzf2KKE92t?=
 =?us-ascii?Q?B5dRUxQ0zVxjQJNR2CSjjn6t80NFcWnH8gcCC84luW5xGOkyPdwhGpkLl96H?=
 =?us-ascii?Q?wELbnkW8jAe62jJ2JX/gns3gaAJ6wrMGWKONMqofGCbSlAovIoZ/sQYX25YL?=
 =?us-ascii?Q?7KEF5kBCw+8s3StKd8G6ZjkOwt2u17YCoYd54Xu1+Ji5ACVM+jmEvvjPmrKA?=
 =?us-ascii?Q?I9PQ+1ljELcffoau91Hln2EwB6gEJxwykWR/Qlghnc8DFgxKKp5YGEURGaqk?=
 =?us-ascii?Q?58dnQlRQIw3EENgoLoEQmz44mHVwVtZiPkHFpPJh0PZfqvu45l0xvpyWtB27?=
 =?us-ascii?Q?T5uq14x2YI7ce6sURwyp06R+FwgvZ+ygNscv+7WFu42l2cIFJfF9riVHsytp?=
 =?us-ascii?Q?ogXOririxQ1dpgKOC6oqo145lhe1GdwNMJFGaKaqhHAvYLI2wHCwngQxDCr6?=
 =?us-ascii?Q?ZIIK+NS6sxdA3pNu/WadYwqY1AAPRXxbtQLJb4OdKo7dp0AYILu2r3mmxX7d?=
 =?us-ascii?Q?/tVw0M6ftqNNXvIVFmnI/7nRPFm4Ak8cBN5CFpNwTe/Iynx7E/4cncyaBQCV?=
 =?us-ascii?Q?NW9oA0eYbdG7wunTpZ1LdfU9/pOC/7Uerz47HHASMqpeHyxN5HgR6ytWCvX6?=
 =?us-ascii?Q?BNraTLOCUHlfWWvsnUJowt6wfttr1uIEgQO/HXG3ApfBLGlYRvSfRCuwHcur?=
 =?us-ascii?Q?WdRhGQ9BX5MjJmLtqQN7/oMW4E29GjtiV10NWVXEhkryExXzAq7CCLZwLS6r?=
 =?us-ascii?Q?c42TMSK15yc/1eFhKVIpK6pw528hTOqW/cSpuc6REkswTYyo2hzIu5y7XuT8?=
 =?us-ascii?Q?8phX9QJjE/shD51ZWPU19VrWb/Iyh82zbFHkqt3jZx655JQIQXRPDoYBTT95?=
 =?us-ascii?Q?V94/hX/+5Y7wRZ/etdcMiCHBlC2e+2shnEJbB/V02T0rVsARx1oZWuibCleA?=
 =?us-ascii?Q?vGamR7KnK07OEU1PFyP2V2esNpdkSBNW4gXXXaMDpDb4vTo9bXdPhHKM2jdC?=
 =?us-ascii?Q?7OybaufWsxisihe7rZpO2YA9cWR0GgFRru4W2TL4O52ZgDYYjqRzJe9WDzor?=
 =?us-ascii?Q?aGadSuXxD32h+KTBawwAgY16CohlURbykoqlj7jHOwxZm3EXFaBKIwXJ+qfL?=
 =?us-ascii?Q?57Epo85TTaQRpcL78KAJsF2ogWsnSj9+ABxI5RVublZviLePgLnnNnyzpQWJ?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3fe51c-ae51-47d8-107c-08da9187c7fa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 10:49:19.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuRh0aKQ4c/0sDHGwctgQXcUL7vDqDYUxZeZjx+3a5Uj5Zk09C7IqKh1aFvcHqSQaj5a08VXq2K87jdEk5nxOuwkrRegxR+8DXxKwqcjeM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4710
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_06,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080039
X-Proofpoint-ORIG-GUID: -02THbHgfyvj636ppiu-z7lKDJAcn903
X-Proofpoint-GUID: -02THbHgfyvj636ppiu-z7lKDJAcn903
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 08, 2022 at 07:57:16AM +0100, Lee Jones wrote:
> On Mon, 22 Aug 2022, Dan Carpenter wrote:
> 
> > On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:
> > > On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > It looks like there are a potential out of bounds accesses in the
> > > > read/write() functions.  Also can "len" be negative?  Let's check for
> > > > that too.
> > > 
> > > ...
> > > 
> > > > Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> > > 
> > > > From static analysis.  This code is obviously harmless however it may
> > > > not be required.  The regmap range checking is slightly complicated and
> > > > I haven't remembered where all it's done.
> > > 
> > > Exactement! I do not think this Fixes anything, I believe you are
> > > adding a dead code. So, can you do deeper analysis?
> > 
> > I spent a long time looking at this code before I sent it and I've
> > spent a long time looking at it today.
> > 
> > Smatch said that these values come from the user, but now it seems
> > less clear to me and I have rebuilt the DB so I don't have the same
> > information I was looking at earlier.
> > 
> > So I can't see if these come from the user but neither can I find any
> > bounds checking.
> 
> What's the consensus please?

Let's drop it.  I think it's not required.

regards,
dan carpenter

