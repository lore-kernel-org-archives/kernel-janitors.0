Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724C8C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 08:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiEWIT4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 04:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiEWITw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 04:19:52 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CC513DED
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 01:19:50 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N6evWV003786;
        Mon, 23 May 2022 07:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=78IW1akKgaAd+kKEgNS7JKVeir7sYBlDONrjYylpfO0=;
 b=nR+GVF02gfq/eabkE4BMa4vx0QzP9olOzcW5GAIYHqen1d3Aq0KoAodLj+QysOtXeZ0W
 urDiO9CEcPCXpnFhCuCJZeyAuAOvaAiEHLKSDjOzsW5tejyGFL+YJskWAFdoWyrHqTkH
 92b/HrGE0D7sAJXlyuEBBRk8S1n1zejXOv7Hu0+8umDIPEPO84USa3rPIBkYG2kdowB8
 /BaInmNkN6H0yffO3omYebQkORZbnKSeqY+SdMlxddItzXc0oHkaG1kzNhRivgdKhQZH
 8+qbeEM0ZCHqNxSW20Q7GWewplKg6WpIjh2aUF5vR4nZjJpw7ZhxylCvOXOOC27TWmN4 Yw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6rmttcdv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 May 2022 07:01:51 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24N6u0X0013797;
        Mon, 23 May 2022 07:01:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g6ph7gpds-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 May 2022 07:01:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRImPewqqp5LxvFljytx/a7IA2cczTpfrow+yzCrtmcKZKR7JHu8U1LwIJds+lI2ltPpY09M8s+x69e0LFeqj6iEtsks0LP+ZFmKD7q+ngYBL3emkM2TCvMNg1BS6f6/ko8fM5/6NaRSLDkLfepz6bixNaHYBrs/gFDaTzLvDqhnEXguwWP6GHdJ/Vii9QgBeVZZowEn7pm+E4YtbbW9pAX8e4/kyt4yGa3pvFVBS5VKMxnsSY58zHd83O7thPQw7zw3BD84HcfQ66ahl7r/OfWiUoFAQA4K/jPF/Z82v6Auwq6l8vo8DPvG3gIBXoWEW52TE0nVGyZZQoXNSNkR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78IW1akKgaAd+kKEgNS7JKVeir7sYBlDONrjYylpfO0=;
 b=oVFivAokOUBqLzrDyN0amg3qFeve01KOQygEE8euzFXfQW3OuwlYb7ekABAJZ8/2/uoflpf8WZ2YJ9Q9JlxQm2SXQenuFDO+5EAppxkccp5jJySKl4+weF+9PjvlPdMqO2fLLVU+AbXr7SaZXZJfVRkZl7sZ3pjgiFRWddBDU9+LGuaVbL7mt7YL704aqi5aosX3/ADxyA1aehJMF9pznBjEKe0COFWfxkNqQiMQIkKhygqslNZn9N383AonKrz76LS7a1QgiQNPDzuJk0yf70lJZKfw6fR5PHUGrF4HcpOALwQSDkkgHLhmwa4uWk8L2EC4qlpJgSvunOA5s0XiTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78IW1akKgaAd+kKEgNS7JKVeir7sYBlDONrjYylpfO0=;
 b=T6TyL5gP6c4n6HzwS43EFjLnOH94uxY4jFhVZJVMn7lgYDjZwAJecqXXGje6cggfErXH3QMyAR6+Z+qP47hyXY4GY+TtUEyj0Lpy4isYslbxNbz80BhOt3zDtv8dBsDcOz59iJhwHCKWUSOioKgxEyq8qrAmtkFi5zHAdfKKe7g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4405.namprd10.prod.outlook.com
 (2603:10b6:510:40::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 07:01:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 07:01:48 +0000
Date:   Mon, 23 May 2022 10:01:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     tony@atomide.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] tty: n_gsm: Fix packet data hex dump output
Message-ID: <YosxSDXeL9jTCENN@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e491312e-77ad-4a9e-b5f6-08da3c8a1ae7
X-MS-TrafficTypeDiagnostic: PH0PR10MB4405:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB44050B2CFCB1E43EB6D112298ED49@PH0PR10MB4405.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5wn8I4dxvR3msGraL2jCpC5QhPwVJCTUnHUrxgGA6hEjb9kMupRnC5xZYGUaqa4yAH8n3PhiCtv/kU91F36mJCQwNw5MMkSpcyu9I6o9A1N22ekHxKVLRxbV6rZKqvPBz9illoUaPwAhbrcQoRqx8q4DdjmD8kfikojq+WTbArvzDRyCbqF9VNcL+FevQPki7s9e3WzOnSNTaKtf2jF5CUlomzTBr3EC7iRzWcmc6UP5XFVwFXUtHpyCfdEAirSVqq1wxADL57J7pFsjs08+RodKE0NYwyKh+IF8alSlJdJUXig96nlxb1rMl4wTk5bf50Dj5oLsOULFX6WgkM00mj2AsXQtlpC2kRsn0DoIksnLt+DuauTITf6/59ds1pH19bmKIZIPteX6mASRZjnwRiiJ5QvGvaIXrG0GUBDsWcryzAl3RHsPw5bnJ6spId9byM+7FzQp1VuwqK88GtZVb01IcjK2+rjCryV19hbb8VCr0ZCdAYAoENpNddpCJ1kWzNAZwJSOPNt39fETtSAEG+Wck53r7OUI8ACy2jjzCnR0Z45KvMLMWT0j9PVcsW6PplOCt2scjSbTJ7cdw6Qjev9+UkZv5MQgtZa83WYr4rXDdKLPeQcsBEuMvJuPIYnGbBW8CjoEq/Oen7XmDw+rGkCv1CN9Mr73Y2LZsktsKcrDI0g+5Vqk4UjHMFS9vaCxUZpN3hAF9Q9puL3qbVFMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66946007)(66476007)(6506007)(44832011)(8676002)(4326008)(6916009)(316002)(66556008)(33716001)(86362001)(6666004)(5660300002)(52116002)(508600001)(26005)(6486002)(38100700002)(83380400001)(186003)(38350700002)(8936002)(2906002)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OsmHaoQjMz7RrtoL5lezCSbPeaeMCoCRz2DmhMVV3q02q0f28zAUB70G4EzY?=
 =?us-ascii?Q?Ys0Nt5SKvYBQAijpYEYDCL5Oj8Oq84kIsVjm/oiGDip6vJxrG3Jq7IG58d1+?=
 =?us-ascii?Q?NLzE5OHJwrEFDKJ27hBCYIrXjSrnSrvYQhzresuGc3fE9ZjXdcQughLF5Cmb?=
 =?us-ascii?Q?monVqbP6EcEr5hNUoBtwJ0WleW4BiTTJw0BVvr/Z4J1BTsOJrnlQfFnSO071?=
 =?us-ascii?Q?YJAf+97sVT1hNRiAN0ek+Q+KFJG5I6ee6Zivsq4Et7I/9Sik/U+EJnj9ZG4G?=
 =?us-ascii?Q?sg5VxaLu6xrAey3y4hJq5hK6z1xjWZsIBWJjy7XOiBZpuvbM75fw+wavINEn?=
 =?us-ascii?Q?vtOgr02W4JjqjuVzarmC5XKV10aJBJwhpZsNwbbJ3q5+5I44C1z6wuAa44xt?=
 =?us-ascii?Q?WyurrxG9FYp45IlvK26x/c2IW2gIA0N20n+ZnPaW68xbZKMV/qwTr5pC8BeW?=
 =?us-ascii?Q?eE11zJstowIGcFJf2N5c3VDB3TF4TWTKoa+WZMFWWere8u58qYZO9hzRc+tQ?=
 =?us-ascii?Q?JIj9SuDMhR+EsFI/nRu56ndB6CEQ1yJgnAI/wuNEoS0khM+danQBE7vaY0XT?=
 =?us-ascii?Q?zVsBtZzSj5a2cX9GAzELBW60sVRzB0chZjRvRD+XpeTUAUFpXRDGD8xIw5uU?=
 =?us-ascii?Q?7aJBOkUMXyRyxg4oB2vvzvn27Sgpu0muhfPqh176i3vtS4ZpPXdpQ2J1vgne?=
 =?us-ascii?Q?cDBeUjdvv0dtXj1HVSz/7NjX6rRwr54bjTnAyyNjBXG+Cw0qzhf6AQebAyHn?=
 =?us-ascii?Q?v5xfFOiIvf5Ee72bPaKW/b+C1qiqDaP8h9yvk/WeHFhUzv+IndiCFYcITp/4?=
 =?us-ascii?Q?U0XNGcGlZcmnDGwSjQFH7xerHP7TdTaqshbZB+BST9a2umARrMRDHm5Q4MFH?=
 =?us-ascii?Q?5WanHyNxcCp2pIEzLV/g0FCn89PUbZCm/3ZKqJVQdw+z5k48QB46vnt1Mbdc?=
 =?us-ascii?Q?19SqB6ZDXRERl9Ku6vGc83sokpHXmn5tkvJem1UEe37u1Slf8lmrpgASNYnV?=
 =?us-ascii?Q?vptpdGmrG+biRfAY0ujM4oYhsItifHUneNKHcGqGmWfSXxhVGjCyDFWGfb9V?=
 =?us-ascii?Q?psdBUWtzsjD2SgyiBVNazhRNDX2L0GviBHNAS+yz9ldxTBUCwiQ/crTKceKb?=
 =?us-ascii?Q?LY7uMnkPQKYs/2pq9cHV77TO7Q2xcJyjqF33VrZ45E561Bi/yFbPbWUyaJOf?=
 =?us-ascii?Q?Y9JuVaBLUHcuKW5X1IyKOGzABdBdt0o+VrCWW3WJPnjyYVwEadN1hiOQC6f2?=
 =?us-ascii?Q?wYxxgWCrLpP3xmR7PwAHOQHgkynb0DprK3qE0fJhKWrWzd3Iysluhyxsiwgo?=
 =?us-ascii?Q?CZKV9/fV/eoale+efHrK1Bp06sl83a6HE5L0M9B6V41IcMG0cU3IyKW+orjZ?=
 =?us-ascii?Q?MFfbsuAJD5NJQRZGiYD9c+4+5uL0PXY5OjJdjv3rIaxpnrBwBptSe6LRsIVj?=
 =?us-ascii?Q?vA15tfm9ibjtX0ZfDK4LiDeKM3RxaaPDFNkK19PVagWoklmBrY5I15EaXsd8?=
 =?us-ascii?Q?hyD4zAP8KTaygbXyaHz0mmLzQGAJmduLX1YwXVxuq+lfbGcEIaY54HHNUe7C?=
 =?us-ascii?Q?ez2i8e7fbspgKvGBg9rdkRSzk3qEwf2N1oiOkpdpVjIPCddfM+uYyroYoi+w?=
 =?us-ascii?Q?p9GINsCZEvIuORlEDYfFonINdn2/tDvlyJ4pk5QZ6WH+8j931Qm7Io0gozMX?=
 =?us-ascii?Q?GSKa3Yr8OcmDaTY7Rhy7RxdT79jbh1TF8NM849370dIb6SXQ8D53jq/AfPOi?=
 =?us-ascii?Q?D+tHkBfOeLKt5ciqlMWEPSf3HkjeCjk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e491312e-77ad-4a9e-b5f6-08da3c8a1ae7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 07:01:48.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ErqP9OLmTRwA3Kaf5Mw9q18MkdNqI0Hvw1rZL0FsakAxm0dfLxBS+w0KklnMPWDrkgyWWchxUCUqCD/UBLJY/CBMeCZ+hk3Ynp5tdAvXdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4405
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-23_02:2022-05-20,2022-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230037
X-Proofpoint-GUID: Cs2S02ZYr1gGuyusnp1BrSjULSKsvT8c
X-Proofpoint-ORIG-GUID: Cs2S02ZYr1gGuyusnp1BrSjULSKsvT8c
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Tony Lindgren,

The patch 925ea0fa5277: "tty: n_gsm: Fix packet data hex dump output"
from May 12, 2022, leads to the following Smatch static checker
warning:

	drivers/tty/n_gsm.c:720 gsm_data_kick()
	warn: sleeping in atomic context

drivers/tty/n_gsm.c
    698 static void gsm_data_kick(struct gsm_mux *gsm, struct gsm_dlci *dlci)
    699 {
    700         struct gsm_msg *msg, *nmsg;
    701         int len;
    702 
    703         list_for_each_entry_safe(msg, nmsg, &gsm->tx_list, list) {
    704                 if (gsm->constipated && msg->addr)
    705                         continue;
    706                 if (gsm->encoding != 0) {
    707                         gsm->txframe[0] = GSM1_SOF;
    708                         len = gsm_stuff_frame(msg->data,
    709                                                 gsm->txframe + 1, msg->len);
    710                         gsm->txframe[len + 1] = GSM1_SOF;
    711                         len += 2;
    712                 } else {
    713                         gsm->txframe[0] = GSM0_SOF;
    714                         memcpy(gsm->txframe + 1 , msg->data, msg->len);
    715                         gsm->txframe[msg->len + 1] = GSM0_SOF;
    716                         len = msg->len + 2;
    717                 }
    718 
    719                 if (debug & 4)
--> 720                         gsm_hex_dump_bytes(__func__, gsm->txframe, len);

gsm_control_message() is holding a spin lock so gsm_hex_dump_bytes()
might need to use GFP_ATOMIC instead of GFP_KERNEL.

    721                 if (gsmld_output(gsm, gsm->txframe, len) <= 0)
    722                         break;
    723                 /* FIXME: Can eliminate one SOF in many more cases */
    724                 gsm->tx_bytes -= msg->len;
    725 
    726                 list_del(&msg->list);
    727                 kfree(msg);
    728 
    729                 if (dlci) {
    730                         tty_port_tty_wakeup(&dlci->port);
    731                 } else {
    732                         int i = 0;
    733 
    734                         for (i = 0; i < NUM_DLCI; i++)
    735                                 if (gsm->dlci[i])
    736                                         tty_port_tty_wakeup(&gsm->dlci[i]->port);
    737                 }
    738         }
    739 }

regards,
dan carpenter
