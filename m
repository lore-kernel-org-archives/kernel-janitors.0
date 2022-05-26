Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C219BC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 May 2022 09:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345786AbiEZJaV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 May 2022 05:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbiEZJaU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 May 2022 05:30:20 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C846C8BD1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 May 2022 02:30:18 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24Q6TT5T015855;
        Thu, 26 May 2022 09:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=UURnqqtWL81PJNZqXbPe1z6E3q1Ja6xUxF021vZXcEI=;
 b=se3mT32b8ZQzopki+Vgg3eS88XdvqjKXempQzU0cYWprF3gWEBHB8OhZEVMkFiWUA41x
 ZLBl/ySZUmq+xrU6nCF7i6dQbme7HtAKVWxHAWmuqXs3JeoykfQG2EkGSS/8UWk7hUfS
 Y4mOEY481jLs2GU4//Lc44CsKM7PUwCwfzyJK97zvIuCVmBdOBaeASzAwL2v+QdtMnmr
 lMSxzo+HiXUA2mCb25V6aSXLEV6ekhEDwMTuliAL8E9u22h1Rxr4VI7n8/Oh4WmglOHN
 ObZqtmxG+Q3mdWGnK7i4QQ3ANyHlbtmnJusUa5oQt9r37LXr497NYpaSE/gmGAEgvTkJ lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g93tbvc4h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 May 2022 09:30:17 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24Q9SLSh002691;
        Thu, 26 May 2022 09:30:16 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3g93ww4rrd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 May 2022 09:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVxp6YNkG/xADP/xpZ6mSHStUKA9fO1JDkHRXkcEMEUCiQShOO1HRiqPl5jrAOmaDSh0XokK3Ggm+cf7S6eygfrDDb2hNEMHPy5qw+YvI3BKiNdvIxj0Ox0wiKV964zU9pFWDDqRBq2P2jQLqzQ9/G+5A8E+l1vUEmJA/mmQzkjH2Td9CLTMktMpxf8Hti8aD6EGtgcYj3EA8Jv5bjsEYo+5QmS2GjSn1KjESq4nodpnJa7Rg/zwreZSRkumEGM+Yb+EqVxuVmJaVXtv7CVs2ljv28xU7J/vjcW6Qj4zpspGOBlzJWocqKvUvlGVx7jpC7aVPbJMMb9eL65+27y4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UURnqqtWL81PJNZqXbPe1z6E3q1Ja6xUxF021vZXcEI=;
 b=jo2Yla5Aah4Pr03d1oLV8zTvyvp+j7OWwluBhhekXdij0gllImiSxwbcFnML0cPFiO6CaLEk0Oq1nkjf/Eq+qdsPhUAz6KJnTx92DtyDwy10bsHSyzNvUZ+3hICyGkZB9EpViWke58bp903mEzEpk0LI/EpwIKsOrEpjOPWCWlsm4R5enGuF+Nh6sGrgpQRGxQH1B2R0fCRzAF8avfso0a1LkwY2GRj/bbs/MKVWx7A9x3Dd4SqNNl+5Vz9oBWtpzzdy4q5COBcYxi1n9BvdQRsuO7xNtqtyUcPEnpBrELhr4tgQ/2wBKofNVrn6pONZ3rIqALtBgaVixMup6gUA6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UURnqqtWL81PJNZqXbPe1z6E3q1Ja6xUxF021vZXcEI=;
 b=ni2KRFeDdAVizwCOi7/67feKGS9O8HrE26dHkzqhwBU+ifm5E4QuyMp3iNyPNpAnIh5gdTaa6UEwyVJ5LNYMota/xFb5h53BI46PRKh17Pkxgdrnjjt8M85wJEtqzA9Wg5IVL8xXv4c0qSq8HRxE7TkFKTJamOQXqcQJ6QwbEt8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4786.namprd10.prod.outlook.com
 (2603:10b6:303:6d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 09:30:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.023; Thu, 26 May 2022
 09:30:14 +0000
Date:   Thu, 26 May 2022 12:30:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     oded.gabbay@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] habanalabs: add gaudi asic-dependent code
Message-ID: <Yo9InUoXy3ISDQUd@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0160.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4979019b-2225-45fd-e3ee-08da3efa56c5
X-MS-TrafficTypeDiagnostic: CO1PR10MB4786:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4786817D8A295239B9F9E4688ED99@CO1PR10MB4786.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eI83LAUmAEjAT8OuFjBynlp6/3zOQM+99PRc+Okk1IcLI3+MbNSKgzX8GKx64TpDYu8F8VNQIMy1uvvxEZM4DwjrrFFD30Y6pSFR5pgNPq2jCTSQnoXNcoUejrghkIlakEeZfEk0roteB9c3TiGZSeC0EvCRep/21Kqhc/YtXlvBIYbsxznIu8/S3V5D/0rgqJxzD5kC00QVfgIODGRvWSz3c1uMZN6RvqJmZ+RNXt34kLldOH1W38vFrBZz18LmYnF1vOUT9sQcma/Qit/+qUgOfxr4xMMM8tWnJ90cvm86pUJn1JBxuzJDbk3FmT7Zp3Y0EmK38/p13zAYqhLx1H1+WHfAiu6gPF54+E9hatoShC01w5Ag2wbVbGAvO+T6oGUVdzrQ70kpiN7DDuA67MOjO+J6BwMssvmFaufCgcBV/Cgf1KjyJLf6fz+thARAQvLt7UnQWzJy34IQUFFncNuTg9CZ4rsO8xiMBJEhcNMXGlHGSVGCRw86K0MRW0OxbM4iQNks57uQrxDxukBtKXxgOC5ej6SFA6PNaX6sHskg/R9kgo7B69wJmcSGhHBw/qN6XBJNtr9HVCerHHSWfoPApBGoM8fJh1ZVEdom48qAtKkq//hYoYiAQ2fDj/Tas7Ukxwm/P38PaRwqKsTiOAOxPC9TSGtvAra5UlzBvO72fXzp5ojOH9k49ldB9dsPrU9vhCZMw4MGRinEZRM6+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6486002)(6666004)(2906002)(44832011)(8936002)(316002)(86362001)(6506007)(66946007)(33716001)(5660300002)(4326008)(66476007)(66556008)(52116002)(8676002)(508600001)(26005)(6512007)(9686003)(38100700002)(38350700002)(6916009)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vw/7ajvPDzBc5oWElBamavmYnEhccJelAmQsC8VIUIG9FQLpHcwxiZG6tpBl?=
 =?us-ascii?Q?DtHt0fUJih6chOIdp1bDkhl0OFi+N4R6FnxTr1CrcauOK/QOONfXYhRRpWwt?=
 =?us-ascii?Q?ggYorAY/Fth0Pq2W2bzomLyu3ODSXm7qhpgD7N4Mfkpt57VtQCgNeZWqLkvH?=
 =?us-ascii?Q?qNzkeGBVIWsCurXU2KCY2Wn7pVDe0nZyg7QXSqS8x0v8pHCQ0eu6hM6e3VMf?=
 =?us-ascii?Q?I8cFFsugJWI7RTwV45W9n7uJ8YP4uCSHWAevxStQKPPh0d3bJL1nyZF4YstH?=
 =?us-ascii?Q?h34nNWRIZhQJOe1NJlI+g5vbcpWa5e4sSwul3R2vY3eCkSyhpRkHabsPTxAP?=
 =?us-ascii?Q?RMLPzRP9QnoDsUDFsubKfXbHVvfv3gkTytxKW0kg9hfGMZ0xOSQmevk1p8uR?=
 =?us-ascii?Q?iIbKr2t+2oCHFg3Eiwd2+TDvVIcxtiVMXsCPhVlVYw4H8CJlfyJo7xcBqfYW?=
 =?us-ascii?Q?6AGAv9cJStoKdh6KXhqcRBl1n7GSmWfIwk9zhKnK6qk42/jV/GD/cNELs3YT?=
 =?us-ascii?Q?j8luBHm12oKB2ZXSA7h7OKEcRCGnt/xHHfg34R6ex59BwSpsiNHiDWNd8Svz?=
 =?us-ascii?Q?zFftJMjBkAYekv4ygr/ALEhpZ9SHgtORVAEQP1/h2I9dHl5BSK95koYeNqNt?=
 =?us-ascii?Q?vEgj/KJzuCsyWBRQ6Voqx7wphEOXfTUePrz47vRTDI0tde5xs/bATS2phezq?=
 =?us-ascii?Q?jmkKTueKVD0o7Y+gGSE0r81JJssWlbEKMv0xA+GG8MoTLo5fQWBNGgL8rESv?=
 =?us-ascii?Q?n6sBRuO8v47yzSWSc+GGkAjy1Ccrh0DO7OOjk7+lsSF5Oyst6DUGhac8BQA3?=
 =?us-ascii?Q?EzV1Hp/qJYAxggqL/CM1/pcJH03UUk+G0OP2DWk3IR2uUNpQ71XQins+VDR4?=
 =?us-ascii?Q?OX49PZA61TyNqlSFDU9AxtweC2CMsAmNMiubeJ+3z2lqY+pYvt4QQh4RW5DV?=
 =?us-ascii?Q?+LBZ8FVeU0M8DDI0fqmyoSNLDmQIZScS8CMKXaXF4N7S5WtIU4T/pyVw1JuQ?=
 =?us-ascii?Q?b6XCqZvfKb/LiJydYFPN/cHus8kNZSYrYQrsz1UgMa/n95FNBscEACor5eZj?=
 =?us-ascii?Q?XPYdOl6ZGwqn1h2AbL0SbELGnVsidhFYBAxOsc7LSbxMXGNkNRMaezrZLNoT?=
 =?us-ascii?Q?eI93T3ttSbQEMgMKts0A0gfigz6LZjnO002M6dZGoID+ePgOQelFDu6dq8VG?=
 =?us-ascii?Q?WoXAi9mNt9UUXsVVzuiGBZUoKDyGCOZHqo7vZW8FVJS5hE5IHDcwmkBJ/44a?=
 =?us-ascii?Q?gDQfDsJniNMEUoudXnTNN6RnG/q/xqJXtZe+jkMyHGlxgkQ+AkaHFcZgVkHE?=
 =?us-ascii?Q?JjV5wBiAjkjdKVzlyQbwhzz7Dut8aG8T6meECe6bELdw9IAux499R1cx+SGO?=
 =?us-ascii?Q?s8BnT8X3+mSnE6OC3Q1glq8G3JMXXD/Wf82+PBTwFtECm7mttoy/3TirA3F1?=
 =?us-ascii?Q?kz65iwE0/6R08k6lTE9CwW3GhzmsiJilXxxY31EQETh42NlCXYHSVttGcavn?=
 =?us-ascii?Q?nKn9WA6JceOz4e/pMu0vPahYQo9rd/oSuoziFuMRE4zV2dg5PS8nPGkj5zJY?=
 =?us-ascii?Q?aej09ue8n+74gBMt15K+tVB3h26cG0Y6bT2I2UiTAJQ6t0uD9DOaabSD0Yzw?=
 =?us-ascii?Q?rdD7ctVJDKJxJFlv4ZzVyBKGhg0AYI35JuJb7TEkUfM6aUdhVYOfzDHBtDlm?=
 =?us-ascii?Q?DON2mVGpr++GN+o1C76p5r47kuRAA4QVZKhpe43ygcI0QS/L+VWqf8gufqQ6?=
 =?us-ascii?Q?TUzEM+RbKuzQ3gyQzOlS1uPx+K8w/8Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4979019b-2225-45fd-e3ee-08da3efa56c5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 09:30:14.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/XidPdDYk13ia4HSCMNaUGVBCl4eSyY7Ht8641mPbksTPqxODOUnHOjh/phJci3SS8ItslQdh4lutJzPtgA6ZgqLjWRYBWBW5NToOFXj0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4786
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-26_03:2022-05-25,2022-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260047
X-Proofpoint-GUID: pspaGkr3wUCSA4xFjujFuaLmEP0Y4qSu
X-Proofpoint-ORIG-GUID: pspaGkr3wUCSA4xFjujFuaLmEP0Y4qSu
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Oded Gabbay,

The patch ac0ae6a96aa5: "habanalabs: add gaudi asic-dependent code"
from May 11, 2020, leads to the following Smatch static checker
warning:

	drivers/misc/habanalabs/gaudi/gaudi.c:5568 gaudi_parse_cb_mmu()
	error: 'parser->user_cb_size' from user is not capped properly

drivers/misc/habanalabs/gaudi/gaudi.c
    5526 static int gaudi_parse_cb_mmu(struct hl_device *hdev,
    5527                 struct hl_cs_parser *parser)
    5528 {
    5529         u64 handle;
    5530         u32 patched_cb_size;
    5531         struct hl_cb *user_cb;
    5532         int rc;
    5533 
    5534         /*
    5535          * The new CB should have space at the end for two MSG_PROT pkt:
    5536          * 1. A packet that will act as a completion packet
    5537          * 2. A packet that will generate MSI interrupt
    5538          */
    5539         if (parser->completion)
    5540                 parser->patched_cb_size = parser->user_cb_size +
    5541                                 sizeof(struct packet_msg_prot) * 2;
    5542         else
    5543                 parser->patched_cb_size = parser->user_cb_size;
    5544 
    5545         rc = hl_cb_create(hdev, &hdev->kernel_mem_mgr, hdev->kernel_ctx,
    5546                                 parser->patched_cb_size, false, false,
    5547                                 &handle);
    5548 
    5549         if (rc) {
    5550                 dev_err(hdev->dev,
    5551                         "Failed to allocate patched CB for DMA CS %d\n",
    5552                         rc);
    5553                 return rc;
    5554         }
    5555 
    5556         parser->patched_cb = hl_cb_get(&hdev->kernel_mem_mgr, handle);
    5557         /* hl_cb_get should never fail */
    5558         if (!parser->patched_cb) {
    5559                 dev_crit(hdev->dev, "DMA CB handle invalid 0x%llx\n", handle);
    5560                 rc = -EFAULT;
    5561                 goto out;
    5562         }
    5563 
    5564         /*
    5565          * The check that parser->user_cb_size <= parser->user_cb->size was done
    5566          * in validate_queue_index().

We are looking at cs_ioctl_default().

This comment is wrong.  There is no check for this in validate_queue_index().
There is a check in get_cb_from_cs_chunk() but that function is only
called when is_kernel_allocated_cb is true.

I feel like we should check if "chunk->cb_size > cb->size" on all user
input.  I think it is required.  But even if it's not, it would make the
code easier for Smatch to understand.

    5567          */
--> 5568         memcpy(parser->patched_cb->kernel_address,
    5569                 parser->user_cb->kernel_address,
    5570                 parser->user_cb_size);
                         ^^^^^^^^^^^^^^^^^^^^
Otherwise *boom* user controlled buffer overflow.

    5571 
    5572         patched_cb_size = parser->patched_cb_size;
    5573 
    5574         /* Validate patched CB instead of user CB */
    5575         user_cb = parser->user_cb;
    5576         parser->user_cb = parser->patched_cb;
    5577         rc = gaudi_validate_cb(hdev, parser, true);
    5578         parser->user_cb = user_cb;
    5579 
    5580         if (rc) {
    5581                 hl_cb_put(parser->patched_cb);
    5582                 goto out;
    5583         }
    5584 
    5585         if (patched_cb_size != parser->patched_cb_size) {
    5586                 dev_err(hdev->dev, "user CB size mismatch\n");
    5587                 hl_cb_put(parser->patched_cb);
    5588                 rc = -EINVAL;
    5589                 goto out;
    5590         }
    5591 
    5592 out:
    5593         /*
    5594          * Always call cb destroy here because we still have 1 reference
    5595          * to it by calling cb_get earlier. After the job will be completed,
    5596          * cb_put will release it, but here we want to remove it from the
    5597          * idr
    5598          */
    5599         hl_cb_destroy(&hdev->kernel_mem_mgr, handle);
    5600 
    5601         return rc;
    5602 }

regards,
dan carpenter
