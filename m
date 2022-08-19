Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F21C25B0E
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Aug 2022 05:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbiHSFVM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Aug 2022 01:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbiHSFVK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Aug 2022 01:21:10 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A09D4775
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Aug 2022 22:21:10 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J509fr004306;
        Fri, 19 Aug 2022 05:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=yKWYE5O9oUEkoCi/w8betEwJ5TDMw6aBACvobNDaKvs=;
 b=snSfUZ61K2agmn971bYRUFwNv5OMAv/4CwsN1zFfjlfggtvYmSz19eP1N2qJT8kdim6d
 Wg7Y1UdUOfQpy0wkM4I6wCG+5kNoKpTpmn9BaspF2ezY05XgjHvJk1s3g7AeWcqnDGkQ
 DNzjxaHQeXieNhCqL6thBIGEDEYWEtbIxtcDMk/bTroGS3y3boNwiXF0qQ4jV7rf0Zmw
 p1ZNr+Y2sjrqJXplD3lDCIoUEyUYpnWivuiax0QliEnY9D3GgTW7ZZu5fuOJA9Bn9t/D
 IpUTThZl0CEdDn63t3gwGU1neVKdhxM+DvvpYFaSEYs9wTb4lGaLH5QB6LAo2rdpqDot 1w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j23yug0r4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Aug 2022 05:20:53 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27J4mkg7034035;
        Fri, 19 Aug 2022 05:20:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hx2d55c10-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Aug 2022 05:20:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVFM1AF/KPej61YrteZvX2vknhxun/EEJjbQ9lhgQD/ebp85+kEkUUFmQx6gSbJsQ7dxkExGSeYM2/69OpGmq0KN500hUebO17sYRiwbQb2hf+ijD0Lb79+IDQszRb6vJlOxHPAB7SF+cAXtBzn9BzqvCCA2xGEU2CrmoV+MK7UoecI5jeBNvzxF0TqcSag8Hx54CM+NhGSHUVYbT8LomQcTtt5q5JNAWksFLFm0L4rlA97HL9MIhjskiXgTfP+DrEkVkbAVpec9PagAJId/jGylGAKn7daXfqN5yKTMlZnSecNyzcpAa0cxiQyKhZqrOHuLZpyshvpYylKYM7vrwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKWYE5O9oUEkoCi/w8betEwJ5TDMw6aBACvobNDaKvs=;
 b=Lgfx5W66EloW7255fsmF/KpZm/Ro0qxiiLHk/lL9aeB6xrvoVRW3egkI+UKAn3X+GE8QhUQYvtmauBAF6HrJRSeI7tctlunS2bWfu4cuqOFut9LMWiAo8Tdl2SGP21ziewHn4noByqnIzc2R5rQvtrc4IAMb52hBbhrwBBCR1sfvLsxaVwk3m3CYH3b0GuNGVZELRA0LESu8DjUk8kmDm/Rjp5XINcO9kuWLYXHl9GQ9AXLri/ww42kqiybPgdmHu3xFChVl6o5mcHGdymMnXZ1Jyf1U0R8rrt1SWRIh0d+BvsNRn7jhpu229rEDdDNbTAN+cyYOT67xmWJjG2ReAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKWYE5O9oUEkoCi/w8betEwJ5TDMw6aBACvobNDaKvs=;
 b=ApW9Lg+OwGwxJIUYglb4QIoSVyyteUY/7nEPPCPGY6kTN1+3YFDYG88hrqoApy0W5tOAOsEo5uaADJbz5l3KUIrsd6PVK/+shM/ZeAcXUv2lr84bcD6WCmhqXZ1mrJj00p2YsM5tYN5UkjTleJyqBnNv/phsDTc2lrTEK7XWIx4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4124.namprd10.prod.outlook.com
 (2603:10b6:5:218::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 05:20:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.028; Fri, 19 Aug 2022
 05:20:49 +0000
Date:   Fri, 19 Aug 2022 08:20:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Guenter Roeck <groeck@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/chrome: fix memory corruption in ioctl
Message-ID: <Yv8dpCFZJdbUT5ye@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0114.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed01f016-df2d-4ef6-a792-08da81a293a7
X-MS-TrafficTypeDiagnostic: DM6PR10MB4124:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YiLbK966ved6OKkD/bBN9jPPj6o+gS/hwMnyQcs84C5q82O5g443k42BsuSMQhzITlxKs9XdnNHXz4Rh51PY2bKijEbFh/yXg+0Ww/GfN2lcMvefTmUa2M5qoS9KxGhM0nGS53rYa/nxETzkD/2jdQvrDo2qZT1q5nMHAzHOv2v3FTL8k2E4k3sqdg5gzHGWfitFB9KXdU5qBZJzOO56MR95VyhULe6FgU4NMwI+jOMtGpcRcEVKZ5amgzBBROsCvuoJJSJR1YxmvR4My1F+vU33LTHPVNzBVCoq3HZHHtqiFSVjwhuTXUVuHsW8XVUHN9RkSLeQE2hAcmyaWJBxRmZG4/rgWLPArBO4Jgcv4Emf65TRlq6CrK3bUehrO+y87lMKz/+r3bNPS+nKHqEIX4gh89Zd2Iq+skzMH6PSrxOC/fEXsWNYBeqZL6zHb4VUeiATKmPTFZeeE4vCDNrY1m59ykc/NNGcwvpKwv40hItbUwo8knASIPL/xv9bqjlzaZ7KEZJZRpkeqPS3zeJLcD2e4pbFZHlUFmtFnHaAkTZnQ/8HWD8Q9aPsnqS+Xj8lawhXnft4IXyeFKTFVuaDHnPHo1TzLp5wOoLiJbxAOkak4kRrftJZYzLvy5dod5z1hGZ3AsfcgUZ2H9hoXTwmavYve7xNCQ1sSWoLXtPoiHtZcztfexNO3QBghfO8ANgjGVh9YHR05aUOib3OdBl0ei3JjbAyuj1mJgr3m2WVy8tuQrSehf0gnnJ8fBl1CztXtp2AUns0JHMiBu+Gzr7WQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(346002)(136003)(376002)(39860400002)(396003)(41300700001)(52116002)(186003)(478600001)(6512007)(26005)(9686003)(33716001)(44832011)(316002)(6666004)(6506007)(2906002)(54906003)(8936002)(4744005)(6486002)(5660300002)(8676002)(66556008)(4326008)(66476007)(66946007)(38350700002)(110136005)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hIi3hCjlgUtKL8bDR1M2w/o14Nh42reKVW4FVHvS2/DxEDX8jkDW2LTQ4EoC?=
 =?us-ascii?Q?Lx5xj0M6S6BXc32d/l4gz8VGZ9GEPzDLE/SBvSJ/H9laUpYA88fQ7HjhaQYC?=
 =?us-ascii?Q?C8eJ5JLD2rsQzyuAM2rah25LTBtF/zRm7e9YM4sbyYhsh2BU7lZK6mg6iPSS?=
 =?us-ascii?Q?IZhwUt52UiMpgz7sSXjM9pG4GH0e9+e9rC660XjylNZcA2ZaWRtrlDg/NuCJ?=
 =?us-ascii?Q?hX1atDQMf0nuBYNoYKpBknRVh6/3srihpvSyY7zwCs9H5ySGgF21OlTW7Tby?=
 =?us-ascii?Q?CT2kRO90MyftgxaLSs6nMHZGEdZtcEcP6MF4Ku1V89PT/p6urF8P5RFvMrYk?=
 =?us-ascii?Q?PgVsMC30zTq7oWo4dVx7v9VM9qKtXPwrVBjTrpfq1wppNfIcOhw3VhOX+eLr?=
 =?us-ascii?Q?M4SD8T/4IV56gxYY5cq8b+GIWHEX+jZPJkLz/3MLyQvEwwkfcI5OQTbTdQIN?=
 =?us-ascii?Q?QIeOE3id8uzes3FQjhVdu21NaZUVKT+ioCQa3Hiql3MQ+IWFhRScytgSorMq?=
 =?us-ascii?Q?0B+DTRzHcQLbtD5xNL4/HIB0KolIVCDS5dEQKpQueGFp8ZTB8F8m57/QHqqW?=
 =?us-ascii?Q?2e+cveYBCHDryy/74zoDVjbjeLq3dMgFzG5z4bEzy0FNwa0uoAMmrquyZHib?=
 =?us-ascii?Q?mOQ77Ws0Bqr0CkJmxnXiU/VoDVNTXeoEnd2RgfXiT/GfghQlXt0v3c+Q1H5B?=
 =?us-ascii?Q?KpdzCjjPb7bRh1+aYefZKKfLEF0Hzeq5EJ9vUKQEWtWgBzRs8P8M7LqoB2Qy?=
 =?us-ascii?Q?2YY2Y5Axu/L81XuWaW4r1LzRif1nk6/wUGyqOz9jrFhmzWnGIQYxfhOY0/1t?=
 =?us-ascii?Q?FGVoIDeantlerLTZPirlIlgc9rvMT5mXJavPuX5ox8Z3Bibg1ycjSjDwAmsV?=
 =?us-ascii?Q?ELvSSMxWq5v6xTAJoLUduS1QVnSBAdBBx+woDq9mEEFjrgCB4ooy7tqEFfkq?=
 =?us-ascii?Q?kbtryYBZlkKRed3E60Ncae7auFx6ZkG1r3dZrSzwOe15jzn6wr9/SpHJITXc?=
 =?us-ascii?Q?XlaZUnfBCARRFS0FmEbRlB/0omtkTBgPSMMupbnBXmTcYcr4cDZRUCTsAMe4?=
 =?us-ascii?Q?Y2su4FjwoEyaKD2avbfXvX68SumIHF91MTUX5+Cc+k4J2G+9c32nW3BzGPOu?=
 =?us-ascii?Q?0MIgp35EDh6nkD0/A7qZVRTpSFZdpbee22OpwI8qLLXSUbEWuX6Vvj+BL4r9?=
 =?us-ascii?Q?cW8b8AwbQ7y7NIAFYJbJcT04h9/t20CgcHUSqurJJrMyDSKqVwgb57VmDSGE?=
 =?us-ascii?Q?iMla5IGyDxJh/eAUaePgUjJ/GF4vp1kRJk8NExedWy+ke1qvly5dsrIslanG?=
 =?us-ascii?Q?h4h2PuQ5y4ajWJOwvbf3Jki952yP9qFBbXjqMF+nNLpJ7pVKG6wXwCIjlGfo?=
 =?us-ascii?Q?bg91F0GlB21bYDoyDTyHcTSR5Oh53G+VpTCNPQH3Nielw066icIw/0t1BgrB?=
 =?us-ascii?Q?0m6Jgv34Zju5+0X/vTAL5xazzugO1u/s+zJvB5E8E+3TiAsr22kcNVA97HWv?=
 =?us-ascii?Q?ySvA+mTmHIlRdEvV5i4326aqu6ddOU6adR5RbTglec+Yurftj6aP3QTbGNii?=
 =?us-ascii?Q?E1/PbDvSXaD/WME4lOCSoIfwEB9aibtRHzBeQ4MQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?GiadgThE0zDNeKvtSm/fjF5B837sZBgABtEziuAuU6UqHkSohr1+3ipcTC59?=
 =?us-ascii?Q?ubx1ZOAcN4slI/cp3VEIfQqSTzWXmOlbgX0DSlzlJyV+p73rewAKKnAkiJg9?=
 =?us-ascii?Q?keAYJCRfpKUplgndLQ1bFyiDNBNooV4PjVsXJyiSxFic3XOHms2gmINZRoXf?=
 =?us-ascii?Q?FW6CR7pL8/Jc5uCmj5yOet97HwFxHlcA2/PfdsjJEElS4LiDv3dUULqfNES7?=
 =?us-ascii?Q?zwUflpIqSt+Fl9mImpqv5n41XL+dWVt+7JGTzz25qkELxtXaEFpIAnGPxabn?=
 =?us-ascii?Q?wItaEftfxvDqqWMPEF5j8Lkfq9oqw+a25ooi1Cg6WurCmClmL6JaPQfQkM28?=
 =?us-ascii?Q?Y9ljQ2hAcEV4vvS5TNL9+E+/ZgZ1EyVKskcGAulvDLgfn2TE59jpB+BEtNMk?=
 =?us-ascii?Q?Q32wnTTiYVaEW+AyrZKs9g6PYQOl9Kp639CE86V7RUt9qn/Aazm8TqRyJF00?=
 =?us-ascii?Q?acTOludN11eegnCJqTvF2B3grSNQQ9a6nUmzoblbMieWx4cdrbQe3CGCLdey?=
 =?us-ascii?Q?W0+QZw0WRxDs8hTPIDZzA1GVPQC0E3DPt0xSRejpGCM8osUVDTEoowkWL/S0?=
 =?us-ascii?Q?khM6lVOvXUXcAb+VDkANjOxY2t8WCodHa06s40FeNJJLWvdJjm9JCtvE904h?=
 =?us-ascii?Q?W/RU3znPWvZyvwx87r1Ftano/DFIFc/swya3Ep6eaccXJ7OD42rJw32jMsZt?=
 =?us-ascii?Q?jAC8WEMiPLNLw6PbRYeyuTeuQXIAlx8c0FnVhEGuoHlkS8nW6fTFbSHFvtmo?=
 =?us-ascii?Q?2GMtWXIgeNw0HvzVr7byIymFG5Yy8GCC5o8qNhXEgEZnqPXMuFpZuhn+NSQs?=
 =?us-ascii?Q?QaF8JjEvInAILXeOBJq/CtuJyXSXwysmc0V7/NaCSDe5u/R3CZjR1ktIbRIX?=
 =?us-ascii?Q?BXMVVJpOLXCgZBq05JznsmsW0F1fwlHnWAMkSILRIocC9mcy0dgAD1Qa2gAP?=
 =?us-ascii?Q?zBu+NglLa7YP6eazip1z2LNXm2vI4o2Qidh6+d64y5FdS5AQWxAnYjxzdI57?=
 =?us-ascii?Q?sUfdh2jO94DiPGkIxNN1dPz/9EV7mA6p9EAL7itDx5QvcW5ZOKBCxA+As9Jy?=
 =?us-ascii?Q?SmqdACrll+h71UKTR8NVWq/0CF88gZREmb86xjd5XB1Sw2bW0Qp1ubRgUdw8?=
 =?us-ascii?Q?PNo57h5Zgy8zNcj1r5atuwyrPx2zBSa48t3sc0zlYnLSlqUZy/mh1o8xyNq/?=
 =?us-ascii?Q?kzuVe8KJogS70LLU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed01f016-df2d-4ef6-a792-08da81a293a7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 05:20:49.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixo5zmtB0O9+EZknQPnl53EM9iWVtMdEwTfG5UPhYGYPuKzH/M7KXQ2gCHGjIsS0W6ChTFA1Z9Qz49zuGkatDQ2Vqy2ExrIa7VUz548qfV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208190022
X-Proofpoint-ORIG-GUID: aaRsquoI0rEovWpYxhqvf5ECWKTFopEg
X-Proofpoint-GUID: aaRsquoI0rEovWpYxhqvf5ECWKTFopEg
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If "s_mem.bytes" is larger than the buffer size it leads to memory
corruption.

Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/chrome/cros_ec_chardev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index fd33de546aee..2442dce4e208 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -327,6 +327,9 @@ static long cros_ec_chardev_ioctl_readmem(struct cros_ec_dev *ec,
 	if (copy_from_user(&s_mem, arg, sizeof(s_mem)))
 		return -EFAULT;
 
+	if (s_mem.bytes > sizeof(s_mem.buffer))
+		return -EINVAL;
+
 	num = ec_dev->cmd_readmem(ec_dev, s_mem.offset, s_mem.bytes,
 				  s_mem.buffer);
 	if (num <= 0)
-- 
2.35.1

