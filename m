Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2D1C32772
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Aug 2022 12:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244499AbiHRMqU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Aug 2022 08:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244180AbiHRMqT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Aug 2022 08:46:19 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4055A8A5
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Aug 2022 05:46:16 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IBvY3n027867;
        Thu, 18 Aug 2022 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=JJu55RSEoDhwmMI6w9e84gXy0sGdT8Ct3Taaj828MMw=;
 b=z3BgdB9YVuLQ3qk5OgBLedVSWkGHlVeC3L/xlmOClO0XhXERmn+9/oZiuLuzPo9D05bj
 JkgGC39f3UZVrBmHkylge2kx3phtDvCh9Kg8MvY5vGcm0VXnztV4ULAcrTSXjriSiFH2
 U0b6/bGF5WgsaLVWEMwaVpTsbn3lgBoJylTw18S4PyyEO1ucXiPhPgFdVCcpqH3lLTCN
 sXrMnBuBc5QJb+uttWtE47BwrB3wTvi82PWR6q0WZDKuIrxWFFoamgeU7mAN4Ft0v6XY
 GnhBRsdqPg1aM77noRSG0YhrEenQ20VIi+mc6omZi3ehsSdIB9/8UwpVRBUeIwQsFeuo IQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j1n0sg3uc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Aug 2022 12:46:14 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27IAXsbx034332;
        Thu, 18 Aug 2022 12:46:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hx2d4edwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Aug 2022 12:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAPRIZcTZXkmLk6N7jN3afyHDv9CYAWoucqtsbZgC2mnBwlkpyTvA0MWr48GCjkEHPz/YVj5V1RdEuCGB0DrQmYJZom52nba4M+zoTmtKupps1NQSEEoELrWozcvsw/agqt50fLNjtKMV9UutNv8wAFDyDVrYI8cK5LfRBy0C9TcUHNx3ni9VQyCUsukZdAtjpzboliH+SOPCg01eCHDh9iBLSS9SncydWjK+LeY7TNEWuvmdTnhN24qdPxT3J8G3p0MLa0EAqeRKc2owBp4IkvKpRs+t864gxq6LzBanptz5M8XiSNZ4IHiWCerK+10RRKf2umVTjr6QnHTqkAlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJu55RSEoDhwmMI6w9e84gXy0sGdT8Ct3Taaj828MMw=;
 b=jp6QSwxivqSFjQC7s8vNDG9bClu54NvEIqBj+RR+q7Unzy5WJUB4rsh5OKojXdcNVXIuWmZDwUa6BSkd4iHmtnjok2qNZQ05fvgleg72uI+QgxmnPQuAVR1wvFwhc4N5kBYfKWf9dk2tghnF6RNY3wjqsaTfdbwA4IoqdPbJVvKhabl4N87wyHJie7uIxOpzOWNsDRYrajStZkPIb5u8OkuOndAPAOMMOdpzHR9q9HC81z+3xz/rXZ3JIxD1Q+zhC/SCzf+gm0ykXEeXFq24MlQPmTEWuOKD+CjWWeTNmqDcw3ipGTA6nCvYYtWnCqt8lcLeN2w/CmX7kOL1DUWe6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJu55RSEoDhwmMI6w9e84gXy0sGdT8Ct3Taaj828MMw=;
 b=ri6Fp1mmebtboul3XFXvQbwlt4GtnveffAZRx/Gua/vq9PfOwZb+BLaLapvCT2n4UUcFOCqI3kgZpudtTntHsYodOk/4kVfq+e7nXqszrCzD9et06sFkmwtvwbjeyizLK1+BsvxzIIxL7riIPeyBYXkj7X6J63WZ3mfTHYxPUyQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB3955.namprd10.prod.outlook.com
 (2603:10b6:a03:1f7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.23; Thu, 18 Aug
 2022 12:46:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 12:46:09 +0000
Date:   Thu, 18 Aug 2022 15:45:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     casper.casan@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: sparx5: Refactor mdb handling according to feedback
Message-ID: <Yv40ho1i5zVFQos+@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc9a9120-2384-4e63-9177-08da81179ffe
X-MS-TrafficTypeDiagnostic: BY5PR10MB3955:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JC/A0SB7+ufkWFTdS7gC5OYYxjdXoKTUSD9m3bLHLwUWBre3Gki3z9YmP/0whp6nkBtVlAEPLM1+hW+D49/1a0BFNcV06hA2GCw9lGaYTKWAd93/lMlEUnDnk/WVzhkPWw0DsHe9zcJCH0kIIJdo65lr+puaEJnxhLaRsfdFKDx4mUerRYKdjamxSr++rTedY15SGG4siIfRlUtS4OvfD3LR/jYGBAt0YrRUk52WGArFo/FU+98/4+zsUh4jzCIijHc3F7cLnRbPE7qMdzjiXnvwuSzNoSLpVlwCV33oXkjZraTSZpHcZgi40N5Jf5LGNujD+wfs6K1WwKkgteuyue+h3nJz553gyjhq3Hr+orZSenDwoAgOYHia57HxZMx/ONRQHFY1i8evbq/WtBt0/JnSvcWX+DhQ104Cejotf1W/eVp2q3P7s51uPBU9YkQYoo/wGN+em+kXRZBS9SC3om6tazuI4YpUlQZulARexgjG1gXH0LVN/yDHfAxL3ML8gIf2nvif5v6p4mCG+4wu8LBEG9OFojrJ0NdDW9XRaWKpBVtRgxLnWu3N58qASJz7KJqWbkIZgrvRcXrwdWQw/qCM8HtbCcs3ucOtdeSxj8D/6A7MlYxogQijyPE9ctyGWdELGo7jK1P7tpG6yt3LzNVwIhFV0avfg2Q0XjhFgWJLw6ZGnTgGAXl37KpqOY2FuTeYdmKyxtwKuCAFg99+wVJdb4F7YukZbspZrqGu1ZAoFD5UzJyWDeWA7FVwOI0GeVNByjZI3aJ/3dKas3E9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(39860400002)(136003)(366004)(346002)(376002)(478600001)(186003)(66946007)(6486002)(8936002)(66476007)(66556008)(4326008)(8676002)(83380400001)(52116002)(9686003)(5660300002)(6512007)(86362001)(44832011)(41300700001)(2906002)(6666004)(6506007)(316002)(26005)(38100700002)(38350700002)(33716001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n7WIDbRAGUaEKMepuryaHWwwd1p5FNa8SUdMMoxv25NtzApQrQ+K3zKqJ9R8?=
 =?us-ascii?Q?1Jf0v0l+YXsqFRxG4nBCW081laxRtqD9gv3GfoTEVIy7aFcOKGf78Qgy2ck7?=
 =?us-ascii?Q?3WzntaXkyV5Bfa68wmdy/w4Xyku/agPVk1RwWHeE+LfGt5see9vtkU0/qn/s?=
 =?us-ascii?Q?bUENrr83ytigERUAUaoKPB1O24NOXHns/QHAaNIT+wEnj2hChB4rtOBBbO8a?=
 =?us-ascii?Q?TuY1VWKkrt53165zn8e1OqzyxTaL7Sz0yE64YroCoTpVMR1OI9/CUPF9lfhc?=
 =?us-ascii?Q?PDmf7+GGfve71CT53J7mXNy2Z41JyxeQ0uuBpRyln3EesayJ8RrqCmr8kSsV?=
 =?us-ascii?Q?EjkH3tp0Iuwi5f9NaNBtp9CLMbbQO0FrpUzB2n3UcLp08YuJBoUuD+dPM79g?=
 =?us-ascii?Q?VwdDSyC8dilHI8nRvLquizwvILm6rkPVmrkumLFzhReZRDp+kWOsa3dN6LTB?=
 =?us-ascii?Q?Gz64311vVvk/vKteOXyhSUb4NhlnpRt2DYZRTMynltK4ow4B4oZ1oSCf/HVq?=
 =?us-ascii?Q?iE9XWajXCwwA55YQNxzgEezSr9j62W24swECV7zE0/QtShJoG94AxNdh5mcL?=
 =?us-ascii?Q?GTesXcHsIw0kDXJpy8RilkemqTR3si6WaEjN1ppeVQ5dw+CM/3tKcyBlZisg?=
 =?us-ascii?Q?8uyvsHyzPr5uxZmhaokaom9RnJO0EDRUXowUNM1K8BaXrYzregrY1xXgakC7?=
 =?us-ascii?Q?3djRYC2zAQ6MFovjRcfI6b11OPEnpep4nj3PY+aGdRBAGbym5AbIMJPQUSgg?=
 =?us-ascii?Q?Q8oiF9JrUd1dweI8p8Ts+uDssXts5GexoT+wlCMP6IDNcIYbAniy+z3A0g0S?=
 =?us-ascii?Q?G4UjWrc8U3O7IUmzpd8SylG0YLnPU6gBxpXAf+yVHztntyvsqeQfhnhtRyoz?=
 =?us-ascii?Q?peAZisc+1aISiCjYLyJ3VRyxVnDbR6m2BtAudjBBreIkBmsmiV8Yrk03U12+?=
 =?us-ascii?Q?ZkSoWnWENbsoPpExNLltt0/qN4QJrVNLtgTGg7g6/WFVHvGpxyVxf4ip5RNA?=
 =?us-ascii?Q?uSKAXaT7RFwsYO0Tjlp2qaiTjBIVLdCyT8jrINfu3iXle3La7xA6Q2ta3Frf?=
 =?us-ascii?Q?epeUV5ik+Faie+p2Ugr36HHnXT5qzZeNLDq4m6kLrvcA+t+Tb3hQSQWidAHD?=
 =?us-ascii?Q?gwGGlV2ndXRe1UjL5ZvR3vhIFeEiRkuCTAhADDYG6N8D9UAh+8gmurzb1UaD?=
 =?us-ascii?Q?ghXndnrYWeuaKVZOBAsqLsIIuM9PwDe9vU6HgABiVsObNNzQQEnyC6depIAg?=
 =?us-ascii?Q?jtEOE9wfE7cbG7tORvJP/6nqiPt85icCXXPEujG6mTQkLWjtI+d6MNz4STkq?=
 =?us-ascii?Q?lSBY/zcjxVfurZCRAmhUaMxD9R+C9U5RgZVh+r62rMQKnb7tq+jh78Vqg8Mb?=
 =?us-ascii?Q?2Ld1/p8OJoeqV0RvXXzxhP2Zpqw3AqiFzoZ52tgA4jQz1u8YLQwic/OPnxJF?=
 =?us-ascii?Q?zlepsCn9OBsY5zlz8AP6sBAsehr4WAitmpsEF5VL1/zKCWYFlrzvK9fKB6fO?=
 =?us-ascii?Q?U7lp9yCqiqQ1OBJ+RlF4VzBiyxhs+R7qG6R9VXsaaK7+9CCk2NTHflL6AaK9?=
 =?us-ascii?Q?i+YhcNgub0IzNogUP8wpOaeqahahwNNW2f2867qH9uu/gDG7kTrvg1wZmTTY?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xuyKtSYuhj5NWpZQbw2HFZ+yW3jI2KRhFMwfHWFNz9zX8MP83fXibczYQQ54IRDK6xyEb8bwWfBYOT3L3LjJYeTk+NvOGgc2K+7EdNr4ZYW83RitE86mGpEF4Av/zUmv9SKQKoI8nsitaU+NTDlLOZGyhXSj53chZXMjHC8mMSYKagMFDnbx2vf/O6CqH6lmgVVJkKPoTARWwD71bmqETipKgwsFVHUYL+JBuNTEme5DlvYo+T0Z3nisp3XdsvOMFUB9EU1NV8QiAmML0ADdnamUmcg2im+NSURW5mUjYIJ1Oeye56JoEyEd/7NBR1+RSf2Cp0tDj4Qxw3OGmCFR/2GgpzNVvi8CJKCyhtiwzm/iZyoDiFNaALW3ST8k1/z8jlSEUzD9cO4sdYKwJ4xcmsLxhskAEMzy3cz999dXA+egAcAQlpFaq6O975w4lmyV67AhcIJAZttHvWvGhSw35b25/luknQKNnTTNG6dAeWwoYk6HJ6LaJOSl1M9HTXZHqpXtBjtgt+8eCEwPqMP0wRHdhn66tkEjjmbMfH0Djiz3h7ILPaRt4/d3Frc9X6oLGocf703N+uXfhurdyPU+fHIy+KknFr4QtqAA6cZOhz8Hn98g3XXmmv6vofQrAHou3AL9GB6GM0WRb295Aj9A3UKCzzoppgkIPsPxw64wzHj8Kn7wR2YGfqiTU12KOuJ5WaSUsOwGCIvQOk1ujHFNqINKgzzlIIdnlqvPSkp1Gc3iJQiqsg5+P5xDAmfJzyRSpzKUeEy67jihOi5yRtNUFOzpalpJpDoIwUUF7kBNTFA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9a9120-2384-4e63-9177-08da81179ffe
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 12:46:09.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IyBIZr2mb3qtEOlwqOTjyaD6WQjXQKnMvygP+IkgDKf1GNPdn+i4zvVg6FKgKAetmjB1JBUroilas8i+lpaQwgpMkNY0CHgmF+F8Tym+3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208180044
X-Proofpoint-ORIG-GUID: 5TktQgHZNgsBplw4dCdclecdqrFsMr2d
X-Proofpoint-GUID: 5TktQgHZNgsBplw4dCdclecdqrFsMr2d
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Casper Andersson,

The patch ad238fc6de7d: "net: sparx5: Refactor mdb handling according
to feedback" from Mar 24, 2022, leads to the following Smatch static
checker warning:

	drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c:215 sparx5_mact_find()
	warn: potential negative cast to bool 'ret'

drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
    189 bool sparx5_mact_find(struct sparx5 *sparx5,
    190                       const unsigned char mac[ETH_ALEN], u16 vid, u32 *pcfg2)
    191 {
    192         int ret;
    193         u32 cfg2;
    194 
    195         mutex_lock(&sparx5->lock);
    196 
    197         sparx5_mact_select(sparx5, mac, vid);
    198 
    199         /* Issue a lookup command */
    200         spx5_wr(LRN_COMMON_ACCESS_CTRL_CPU_ACCESS_CMD_SET(MAC_CMD_LOOKUP) |
    201                 LRN_COMMON_ACCESS_CTRL_MAC_TABLE_ACCESS_SHOT_SET(1),
    202                 sparx5, LRN_COMMON_ACCESS_CTRL);
    203 
    204         ret = sparx5_mact_wait_for_completion(sparx5);
    205         if (ret == 0) {
    206                 cfg2 = spx5_rd(sparx5, LRN_MAC_ACCESS_CFG_2);
    207                 if (LRN_MAC_ACCESS_CFG_2_MAC_ENTRY_VLD_GET(cfg2))
    208                         *pcfg2 = cfg2;
    209                 else
    210                         ret = -ENOENT;

ret is set to -ENOENT but this function returns bool.  I guess it
returns true for failure and false for success?  So this isn't a bug
but it's super confusing.

    211         }
    212 
    213         mutex_unlock(&sparx5->lock);
    214 
--> 215         return ret;
    216 }

regards,
dan carpenter
