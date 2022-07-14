Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE83C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Jul 2022 09:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbiGNJzr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Jul 2022 05:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiGNJzq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Jul 2022 05:55:46 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CBC630D
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 02:55:45 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E9Sv0V015165
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 09:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=N7dp8BppKSN460ZcsTanvQcFX5jjm4Ew3WBfbXby/2o=;
 b=fsFmngDNYRA0HihqzxTwG5/vK/zhgTyEM+Ag+UGKhn/+LUfiO3o0otkuCu/24aUULt37
 LZishtQ9TsfVDpAWwMK7esz5jLEfp/56SLolIKAa6obwNWvIOlebmTRKrYULyJ0pUd54
 f5NJT/uwjum/x8y7jUFwmgkX72leSRe8vgqJz7JaoxtqDh1ZJRMSyJKYd49HDoCkUaU1
 TRTSwFE/IBz3be7WR9t8ZLrVzBXlTKAoe4Yn18lfFyP7KxsOfCtmWJFUe0cLBb2NRnfI
 bCCsclt2fZNEQCR6QRyF+PQmvt+9ODtCwTKMGLLVF7WAk21m8uKpxf8lzev68nNln0iW eQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71rg4hkh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 09:55:45 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26E9pQ41022336
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 09:55:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h704608js-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Jul 2022 09:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oX9nzSO6Ha0v3ZogcCY20xrXSusQ0DGeB4fuxo+V6nG52Eoe/zNRxXvL0DFPQrS6uyk4o9vWftOzAXTTbHipM03GDaswoiGyDnNFh/JG+jtdwHAb2l79P7VMsY6KM4Y260R249Vd6N44MVlBa7ReD1je2ZZMNh+1NkQKbP0DwbNNct4mP27R0cEE5nXqDj+GAzKtNtjfLsQIsKZZthjMst19tC41HeTTIijtZdLhfppEG/FoBOI4hA6lI90rXX/nOIILT6ZswTfeyIlFfYMWji3MlE++bvy4lEnIMXh/wfHe4OMS9oMj6OFMpkek+etfbPdHTrUfGdc/khBYzjijPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7dp8BppKSN460ZcsTanvQcFX5jjm4Ew3WBfbXby/2o=;
 b=KkagtBIa28owbDN70y4O19Ri84Iqj7qqZDdOfmlU7zbgrG3tpUuR80UBiVVSPHeZ4SJU5hxcVRWdyib+MegsJ6rXfQgvkDfsfBAnockjYjjtjiw/e8OUepAsWJ8vesCZLNai+PLIIpRvo6MC96tDzGHYx9OiBUVEXi75Kltf5RHM21J7+pPeFlMQNYoaFaUbppnCMsCDV8MHnz2DrHGezPUDqWlhyhT/ac6dlaUB9MJEmoaqoxPQjKj2GhrKG4LF6T98wv2bw7mN4z74UurQiM0Awqh7afotD7dPU7hHp3/ZCdPL+uvEFv2MDjjpzoBYl2K6CHI103BhnM+qJhzSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7dp8BppKSN460ZcsTanvQcFX5jjm4Ew3WBfbXby/2o=;
 b=W4trbNZAoMDFeTy/oFReY+FNOXkET5GnF4hiIr1ANjHGQyuMom28NrXDLKgs0gPmJG20LHr9kNlf2MgIgy7mpQfI0YXU2u7ad+DBFdu4XdR3P8/1KvsMwiLfFZk3kY0gXAho79XUAjWgR97+yF2MIRS8aThNJlH43CtbOboMWuI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2249.namprd10.prod.outlook.com
 (2603:10b6:4:35::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 09:55:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 09:55:41 +0000
Date:   Thu, 14 Jul 2022 12:55:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ratheesh Kannoth <rkannoth@marvell.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [EXT] [bug report] octeontx2-af: Drop rules for NPC MCAM
Message-ID: <20220714095522.GU2338@kadam>
References: <Ys6tO+/RAH7WEDH7@kili>
 <MWHPR1801MB19186110DDA1663479B6E6AED3889@MWHPR1801MB1918.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR1801MB19186110DDA1663479B6E6AED3889@MWHPR1801MB1918.namprd18.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0035.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4c36f70-7789-44c4-3db3-08da657f0302
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2249:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ts6msZaWRse96Oz8pQ0NIRyt6Rp3rq2RvpLkKHKORsNS2hXCZXquhElf0pyMgwNsEl/z1sEKKV1eFnUIvzknyvL73wg8IlYjw8Cj57pvcknFuxAAhAWJMmtvcGQwXIjpN9rRgNoOjSeevrZ3wJZ32qJO4C58WbE1QYveLS3l/MUEyYCLPLkGkUFv/Kta0B7JT+FtTAHLTwtAQdEa9JGyTkv57RKKn95wxLvGAFXHgOipxc2FWcR1jGNIkxR+C+zkYrPpACZgwC8sAvAOUINdiT713p/9HWWgZAyPZGqQyMN5dAlHdl/DMVhPMhCaAi60VfHo1apD7CUkRiTwAmhJtoyP6GlzhWaksmPcELF5/BePOqZJ6PhhqOgqhRyjOpPyOkD3Tki68EqhsUPGtnJLBY8nh9x1hA+9MmndTk1U9RVGno+clKS+aXbDKE1bbV52Xmxg0E473KHaw5iyYl1Dh9AdbonSMXVV1CtghzDk5kF4KYrtQfzi+jyGcbvERwmUJLFnIWHDjrdRoL1JQfW0nGKEzmKJdSe6x0PFatjgvWI9SJWGxPI6NXZjQz4HaeqGVEKIp833+GKwvgxH6NZAT2tpPLrmSs8cV6cf1YQ9cyhDa+K7kBBV36xiQfsu0YJdE6xy6N6g8pp2ZBisy5gLWjRVhIgVavwyf4L6bIo8Bz5fCAbowl3tvIXWySy5ZLkWkS373jgAdfR4E/kjUk5ek4yPFvHmxf2BsQRapTZQeGzj7ZHZ1gwHvEFk791YI9tQ3uRDFfEfXge5TfE9L+l9H0Sb4x9BX1Bh3hg4B2ceZ8ME6EhAYJKRhBuNINknHdIx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(346002)(136003)(376002)(396003)(366004)(8936002)(2906002)(186003)(86362001)(52116002)(316002)(83380400001)(33656002)(44832011)(1076003)(6862004)(8676002)(5660300002)(9686003)(6512007)(6506007)(33716001)(6666004)(26005)(6486002)(4326008)(66556008)(38100700002)(66946007)(66476007)(478600001)(38350700002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2Rg6yMguDpnH0pxntVI7CJkau234jb79ocE10IF0MPCmNeMSxi6eEbXrpAJ?=
 =?us-ascii?Q?MlkUFS8qfLIZktsH3qkHzRnAUKjpGGGjmaowwXWrrac9G68UTe8Nktw4HRYX?=
 =?us-ascii?Q?kJMV9zr21bDOQKc50QHLk0mMqPtpPktyGIJTrgwJ3oOfF3Lc2yKuqfisjyJb?=
 =?us-ascii?Q?yattxLIatZY2t9hD8hX5/CQd3PkXWdMurWNiuWetR0HzGBiiKhkwK50WtggP?=
 =?us-ascii?Q?X6IGRZr1K+bK+r3sNKV28ib3u2dMamAXCRosPN8lwoNbgIkt3ol0hlo036Nz?=
 =?us-ascii?Q?OkFSCijHeFjSsO4QINCMgJFg55gB61luVbeH7mECbvlzX9r5XZP4I3dsk0xG?=
 =?us-ascii?Q?GkOa7c7FqActzYTQ8PMObDl9WGjN9/mwP5jN3zsVRvrt1QzDxSAzJC7I0aOU?=
 =?us-ascii?Q?Hxvs0NyY+FpwQmKt0IlRIFJKV6swa40dsleYpJ+LRLGs9gTvGQD/GlqeebdU?=
 =?us-ascii?Q?+Dph3nZZO4hkdUt7YMS0JTSzb13ZgWMyQLiteja+Pkecmb6LyfbCRtkvoehA?=
 =?us-ascii?Q?8IsonaModycI/hyqi3N9lWWNPVeF9eD0G08mlBF5kY4KMwOns3Iv/lB62vAz?=
 =?us-ascii?Q?PjhBaBbp0KBEVFDj+NkHLKN1DT0bapslUptZEBacCRphxSfpJii3/lYqM8N7?=
 =?us-ascii?Q?KYg/ZOm1eC/I8NbQjePhTc0/2H35MW0+xeUE0/4ev5Kf/Wu0XHL2rjnUMNiR?=
 =?us-ascii?Q?iXE76jRFU3zWxXBDGmBdZ+qtqy4DFyJekaN75VbXJ/4u3J+n6q0mwTjrXXWM?=
 =?us-ascii?Q?yHqZ1HiGyXUd91qE1vUIRKppDCEwMnXz/q8f8b8StlWVY+GDj6CPpM2qeN5n?=
 =?us-ascii?Q?thaWMQpv4kWTPqZZpsadTQLD3frKpoAaucyiHk8Bw/sZqo6wxm3hIVGbDOaa?=
 =?us-ascii?Q?UMrq3CqAlaXI8GtdMB3MXsOOAxlrBtZhIjb0q5nqADdXxNgct38mR3QK55ie?=
 =?us-ascii?Q?6tMgeiLzMfiTGFK+PFKuUlu8KIp7hMcYbBnS5b+1g/h1dteAUVCI0WmLK4pA?=
 =?us-ascii?Q?V/A3cU52uosptkmwcM2ZmtO2YQKbIlXQAI8d9wiFDrIVwApcwjT0kF9T4rat?=
 =?us-ascii?Q?0RsJ3mckbWs2kbuMd+hiWM2ttFNWelwaUFhQYOVGzg9+dZEYBUPuKTVNPqw0?=
 =?us-ascii?Q?ofosK3sO2Wa7yNjwXub2LkimrETukvATx9FE0t4cybxe2zsZaTA0g4zWCkJ4?=
 =?us-ascii?Q?9zwL5bEglsqArGabN3ORGzyLKP0wkheLxUcyGV+oZ0nq+Eack8+UK3GjG2G7?=
 =?us-ascii?Q?kF4nAXwNgXMrudAqWP5UO+/ooxKyc92jyWGFAAAs8LD4DH917DQihJYB5oj4?=
 =?us-ascii?Q?Lh0ybown9qGtEYPG60jXE1gThc5Us9YOU0yYhPydxspwBigPdY1B1fI22ZJi?=
 =?us-ascii?Q?Hu/VxTL5qd2CiS3PceLs3gBICAeMkjZpXyd6CaJT69RAiLl4ua/R9IXTaCLX?=
 =?us-ascii?Q?4HchwkLJFly5RSX28fl8zpUNI8Y13LGJbXLyUhTjJqFzppV4I+qSIKp4nZOn?=
 =?us-ascii?Q?Mu+ctzsOcOp/I7MTmaZ6z1JjpaDp5OEKIucsIOB1VUFIHBDDpT4rdFQMpzCd?=
 =?us-ascii?Q?mMPq0ql3fjHK4HfOdf1WPsXVaVOXfY5cMV5x/i9/RibZ3HyOctFCGHjxMZQ6?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c36f70-7789-44c4-3db3-08da657f0302
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:55:41.8638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJcRSCb9zie9aol46Ktf4HUexH+qHx5ZVHB14Mp45LP+R+vxhfQ18U1nM6ANClbnMF7ayXTpq18phMldqmdz10ACgVVg4xhn+uuhc9d/hQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2249
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-14_08:2022-07-13,2022-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=907 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207140041
X-Proofpoint-GUID: kVMmbWKoWEjMwW9-sIEqVoYkfRXtaWje
X-Proofpoint-ORIG-GUID: kVMmbWKoWEjMwW9-sIEqVoYkfRXtaWje
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 14, 2022 at 03:25:02AM +0000, Ratheesh Kannoth wrote:
> Dan,
> Thanks !!
> 
> I tried to run smatch tool and could not see any of these errors ? Am I missing any step ?
> ===
> ./smatch-master/smatch_scripts/kchecker drivers/net/ethernet/marvell/octeontx2/
> 
>   CHECK   drivers/net/ethernet/marvell/octeontx2/af/rvu_sdp.c
>   CC      drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.o
>   CHECK   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c
>   AR      drivers/net/ethernet/marvell/octeontx2/af/built-in.a
>   CHECK   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
>   CHECK   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c

Hm... To see those warnings then you need the cross function DB enabled.
It takes forever (over night) to build.

./smatch-master/smatch_scripts/build_kernel_data.sh

> 
> >drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:735 otx2_mbox_alloc_msg_npc_get_secret_key() warn: struct type mismatch 'mbox_msghdr vs npc_get_secret_key_req'
> I don't see any issue in the code. 
> 

Sorry, this is unpublished Smatch code which was buggy.  I have fixed
it now.

regards,
dan carpenter

