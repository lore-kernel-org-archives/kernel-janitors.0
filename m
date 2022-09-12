Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C3EECAAD5
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Sep 2022 10:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiILK6J (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Sep 2022 06:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiILK6A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Sep 2022 06:58:00 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BD41900D
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Sep 2022 03:57:58 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C8nwNM030235;
        Mon, 12 Sep 2022 10:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=uZ3iMj1I542kgbIuJZ4mLhPQ9zHrWUYwOSGL+POPlJI=;
 b=MBz+fggTpfFaKTxgLF+jiBR66jfnuiu9v5v/mxtD1+nFZtcOqQl7JjMPsQgPB7Sqiinp
 Ivsf3j97elnJfVg8pdSXtYO3PVpGwmw7BCUIA4/UjdKTiqZ01ktwYmzqNuCCwxznuQ8A
 7i5t4OlwsxRcfAuHh3hsAAcAh2P/gJSLT9davxhsCVTLHD/VwJ5K8nmEWjBFJWAhsUhI
 pdYx3LDpSHAXkrUBT03cUN+4yGcVIYb94EstsiKOwLCHOZQDyZ5UwZnSURv+H5Q9prvx
 ABFBhJZDjbxIRiOS/tunnqDO/+BYKktydij4yR/F3/jhN7J1dMqZKlFZxxaxClWPW7dq kA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jgh0c35h3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Sep 2022 10:57:56 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9rJmV027704;
        Mon, 12 Sep 2022 10:57:55 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jgh12eapf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Sep 2022 10:57:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7Y8BuyS5swtPDu2s3EkRD4PmpQzwWGeqtuBxpxVAASZUgVXz4Qfo617Nk1TePqWOESEPm3WY4ihz2NwkEr2MS2S3jNRni/k9FZabDvOX3EjqyHKRWvoM4bG3OFqdBjIp/eRUZW+G4ndOzdTzZn+PW4CEfq7F/n8EX1uIWa1syQeJdxGOaJijIx2yU7xZMt+puTseWvV0ayWHlkZ/2FYikE2tS0ZUOFHAJ25D83S0xRKcQJm6OGB2YWStM6QOtGbWgr6n25Of992qbiHjHlosaSbTC78qnA5g1O62M+GB4louePQWNNjVRV02YkPbc7LKH6u8AHw9xvHWn3mY0p1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ3iMj1I542kgbIuJZ4mLhPQ9zHrWUYwOSGL+POPlJI=;
 b=N9m7EqKMAMHcSmkwyx77pTT5DO4P346KFSAF4feCstPaaBsopdXdo+GaTUMx+s3qkwqm/qYSHlqWIYXAgHTHsLoLj6lO4LHShK/uH5LtnhaoH2ssybQhVgvmrwsQjnNc00kj9Pz48eyD0z9aTj69dq6RvvTt6L00yn47nv2uwFfjfMtulmdolkpEOJlxY0PJlgt6rIxGvZsMiYIjVV/6dJRwu4AOplByb6rdMrCa0fzK/OrVdADpywuImk1/Ch5r8h80ib8jgc8M9xyih5J/LZy4yQU0467GJGTkZaggCy6f5HpzAbhfx3ExLtDzkc+3L/eFHqnXVtTnVY48GzavWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ3iMj1I542kgbIuJZ4mLhPQ9zHrWUYwOSGL+POPlJI=;
 b=IUc89WmLcCFdZLXB9cIh6G42p4ivcCyHh5k1Hqn4KnSCuocaP15gJFW+pNjyullxkOQ7+JovAzBue7EeZGw2eEyPwq84e32u5siCuum6VTImjQfY52y9FgYsdJ3+vemU8wrPujgT58q34mJg7gYXn2+9Q6vLGLjUhoLB+vz7Ibw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH3PR10MB6883.namprd10.prod.outlook.com
 (2603:10b6:610:151::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 10:57:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 10:57:52 +0000
Date:   Mon, 12 Sep 2022 13:57:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     liorna@nvidia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5e: Add MACsec offload Rx command support
Message-ID: <Yx8QqZbn8KWnPMd3@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0014.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::24) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH3PR10MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b163df9-b45f-42e4-a846-08da94ada3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdOGrxx2VCv1DxtcImPKdEqHbYhACuuD6tUNp3MeoZ94cS2nDNYvUde2us+u9cHq4F2Or289RJR45mBzZIRXyg3e117+sWbSkPTYFLlrb9MvUvzi34IbO/+8HPM3g6Khpjmluthi6rK34aw8EkFiTan/1Aj7mHPw2EKee0V2DYRlFDx87lE8sTG9AeWEueOsR/aAqXB2w6GpmBOAeyWYSAHOFEhJy55r53IZbPW4t5rejsbkBrVsQu1bgbLM2y1yI8N0KgWi8LY61RwFP1qdXBjbM43pgalA/jm5MHOkxolOqLUcvN347TiXOkgwJ0M3T/SwomZ4eSrsHnf8FgT2zpmd6zdBk9pGIsrocVmJu8v1efq6CpNhoAFFwKH0g26eSjzcVCWSg6HSuAy3QVEmqopg9W5fxds3MsVA1A3f5QZu1drVO+i05Hy2ZYGW6rGrjC0TOmOEEu4LktfGVoB7d9pKoWkGE12SG57pi4F7zr0KTGvcVVzCySBmO1GmbdwbDbajNUsUhAcVXmeCPOFXWh4sHjf9QmME8adVJpr3HjgTA1ujr8igjH9r3ZGz+8YDh47OPqeww902gSM5OdM77aes0bF6uxXumGhqxOwDgi8zJ9JIvwKXxjrmElXPZUr+lTIMlIfmugapb/2m+h8mt6stMJMwF+PJepaTWi7FACAwxU4DaLZH9M6/uLjPfFyDtdKWeLWUZkMQ3vQpvwYEaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(136003)(366004)(346002)(376002)(39860400002)(8936002)(2906002)(6916009)(4744005)(316002)(26005)(6506007)(41300700001)(6666004)(66476007)(8676002)(44832011)(6486002)(9686003)(6512007)(4326008)(5660300002)(33716001)(66556008)(478600001)(66946007)(83380400001)(186003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMnvTJRcEy9zJo+UqXDaj+binDIE4Ol0nRcnKftxjxAGiJzCcejX6DzHve/w?=
 =?us-ascii?Q?5G1bD28pvKchRdrc7cmlUKwkoEbKmDrpN9xa23iX6WyuUWMVqNF4uW9jUmpe?=
 =?us-ascii?Q?GN5xXYgvWEn/0MEpf3eK/7mpHl96YY+FHZCWsIh87MZAYWcZzTJEqoGugLcH?=
 =?us-ascii?Q?0OBQVp4lV3zyEm/FNscl128LAmafp1JpR3MfA4JnE8wAqq6E5cxzxSOeOn8H?=
 =?us-ascii?Q?R75hmOWU0MYMtY8a9sJ13FinMZG5NUK6EEt1JXPZN6TXr7XjrdtratDjlbr5?=
 =?us-ascii?Q?ROn7D2dz50oRbjJEW9RcYbhwwPVEC1vScN0s9AFp1r7OGjNelWkGmCpZlBys?=
 =?us-ascii?Q?Jd+b5spuoXuaP0MmIVUHpLs+vhY8cdQHwIZDCmvE265n5P2TPS9wvxy1iZw/?=
 =?us-ascii?Q?D+Y7NpkDPklU8+gfXs0NoO7dDvLYhCFljtg0J1/aluXgLFgYmokvcLJG+lzL?=
 =?us-ascii?Q?8zI0MTJEBT8HnsX0VfzL2vbRSx3rAVKPDPR8nwhF7jYLef+1n4/4JplopHm1?=
 =?us-ascii?Q?ND1mvfjV3H+m7qS1WiI5PY4ohLbOg138+VuwBEaaHIaUjJXQlxr5KNLLpxWH?=
 =?us-ascii?Q?LIpSXnZY2+XJ90egXcxCiGSSXp28XatZNLy14imnIfJd+bEgsXS3P/L4/1Sm?=
 =?us-ascii?Q?L/BGEC5XWV+N9i9uTUnh0EmEKM6T69bcvXemxhi2bu9Qoqtts03kTrMrGEvY?=
 =?us-ascii?Q?9H1UFfHz3Qx9O/qMeKmSbgj/XU8fr3nyc4ZhuOWJLX5DKi9QbPCTrw4+SVcp?=
 =?us-ascii?Q?kn9ydfIVfR/WOzbNoW107b02/AZqJpNgyBJPh20sF8WmXrgU6BmlO9+95cJQ?=
 =?us-ascii?Q?2m95dQFcRGOCbgukD3l8cI48z9Y+XjUSY89Bxw+VGGt29AyoNa38RqTcFXas?=
 =?us-ascii?Q?xQj8RRTL4awnT5hK9BObW6o8WuwfYiFkp8UqcfsxXTSpxAOqanUAvnjdm0a6?=
 =?us-ascii?Q?NTqfPduo086XiW6IA1CTacS4A4hupl4FaQkejk92cdfN1zCzZNcGPgtnVUhq?=
 =?us-ascii?Q?mxS0IXrMEHESDBtsZMVxy9N+dI1am6mblRBLI85XfYYv2SWYODqk2974GHR9?=
 =?us-ascii?Q?triJ0VVTOtsLSAnAqIVTJyLP0AQZlBtZILEdHQCDI7wKaBGhd0TpXmyLrwaM?=
 =?us-ascii?Q?2uGlAzq5z2iNr6P8RzwvKVp4RIk+UYfUD/GFZBpjZ9vAxnaOuUXoQStIM6HE?=
 =?us-ascii?Q?fMwW7mb3WL1ddf9c5o/63nZu0NXcbpnm/txcDrWnADc0pqLKqjNds8VI90Rc?=
 =?us-ascii?Q?FzVZjldy/5XNgnJu77hSNuCI2JOFC8xMt28xblO5L7IOHRyf1kPv/KGjkgM8?=
 =?us-ascii?Q?iOGlC27pHqWEJcECCCMRWqFemVxqeVNZcpbQR+qM4+j18NppfzRtXKC86fM1?=
 =?us-ascii?Q?hmEIYr1uBeYtEEXvA+ZvuVZXcQbKK9MtMU8I6d5zro/407qtKEo7iwSdgDPi?=
 =?us-ascii?Q?NrT7cegGn0ka8TwO3m/MU/bVO7NtNI2TXvdkjilC389v5GW1Qsx4Pq+mgch2?=
 =?us-ascii?Q?LxgiMzSA+A6lM/AWTaFqKgnAxYRCY5t12gJyp+Yf0yIKMF4i5BAHbyrOCqdO?=
 =?us-ascii?Q?aoycCmplAGvdaNwijdiuy5cYxU446itJ7Q7ZiUyN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b163df9-b45f-42e4-a846-08da94ada3bd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 10:57:52.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0J+YH+gYRBPUznovnbc8hw0ghDsLAwR27Km3ehIJZlfNNkyVYfCQoOlvCW8vqiy0Y1GeqnniTBXTOKQ1p9jiNbVoW2QglA4cq6eEPdwX6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6883
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_06,2022-09-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=773 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120036
X-Proofpoint-GUID: VO82Ex1cc_RfWXbMpk8Wu4NLkD4p_1pi
X-Proofpoint-ORIG-GUID: VO82Ex1cc_RfWXbMpk8Wu4NLkD4p_1pi
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Lior Nahmanson,

This is a semi-automatic email about new static checker warnings.

The patch aae3454e4d4c: "net/mlx5e: Add MACsec offload Rx command 
support" from Sep 5, 2022, leads to the following Smatch complaint:

    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c:827 mlx5e_macsec_upd_rxsa()
    error: we previously assumed 'rx_sa' could be null (see line 819)

drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
   818		rx_sa = rx_sc->rx_sa[assoc_num];
   819		if (rx_sa) {
                    ^^^^^
Check for NULL.

   820			netdev_err(ctx->netdev,
   821				   "MACsec offload rx_sc sci %lld rx_sa %d already exist\n",
   822				   sci, assoc_num);
   823			err = -EEXIST;
   824			goto out;
   825		}
   826	
   827		if (rx_sa->next_pn != ctx_rx_sa->next_pn_halves.lower) {
                    ^^^^^^^^
This will crash on the success path.  Should have been caught in testing
which suggests it's a bad merge or something...

   828			netdev_err(ctx->netdev,
   829				   "MACsec offload update RX sa %d PN isn't supported\n",

regards,
dan carpenter
