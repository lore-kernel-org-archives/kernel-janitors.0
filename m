Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B68DC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 May 2022 10:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351253AbiEEKeT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 May 2022 06:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355752AbiEEKdy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 May 2022 06:33:54 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EDA2E8
        for <kernel-janitors@vger.kernel.org>; Thu,  5 May 2022 03:30:14 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2459em97018676;
        Thu, 5 May 2022 10:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=AT+5rWoCTsKn+6I1Fn3L9qP8FeNMZ2+PftQYYPg+elo=;
 b=ZJc14e+ufX18lVBl2A9SAt3FExQKjtImTPorXViVVCMGfJszD4SfI9znVzXovHgh9My3
 EHmuTjWMkqpbONpxcKfjQXzBRK2ZO/79UFHi69YgI/WtMdLOLtu6cVna9aQuepbu1tfh
 aGpWoY/lX0hGE4PGZeNFGL1JlAB2sh2B+FPRUM/rNgqtQ3lvY3IK0LjdcvUC6hx83+7z
 xUHj3jgvKQNA1Jrzy7iekD6SO4Jzh3VrvyHxyP6rTX3z0jYNxUqpWN85MamNLPrSAE5f
 H34tHMnXUfVItZCqfoVOkjf8565Lzgl4v74qbZXTdtnfW4SiFgLNJHSjHzcHvEx4LLzq bw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntb0rd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 May 2022 10:30:04 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 245APcSX033930;
        Thu, 5 May 2022 10:30:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fusaghmbk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 May 2022 10:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+95l+ibUChLKrb2BOec3QCjTT1YW3cbDMPWEj8C/DP40BgYFcL7zBYTtYn64N+s3YIEuTiT/loGLr49xbIAZ/4h5/gv6r1nSZHbE7Cw/NsIhhEWe40AVj41qEoIp0j8MiL8mtNx5+Biwydkuq5hdD7Wb0MfSE9xHKOPnWduDwl1a4F1BlGj2YImqmqW88gcK2K9W62BfwGraeWIfK2vkaSZ5M54O3j0zffVfehqEuW7l/NtpzDc4cV6+5z0IkT0D/UttZSm1gJ+F3l9RtOily6iHvAjBBRBpxFkIK9m1GQPB5tIkfu6M/Pd59t3ElqXIjFzpuv8zZGguFupn3cOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AT+5rWoCTsKn+6I1Fn3L9qP8FeNMZ2+PftQYYPg+elo=;
 b=kN6bUdx6QPpRnS+KD3pmWqThR/4IUac1EjZi7UCHOnM1tc1AuexeUUJzBhm5/2TmdkkO0xVEZ2iAFHM0RLIbQYuat6wBRJu/fQdjUcNg92lng1LshFS6ihMG0Azgsdye/JJX6N6pHMPZz/SzgYxdPWl9gF6cAYpxFyAuzNcB8kLwOjFUKVV8AXuJNJmdE/mAdr4WCERkMI676d3jG+pI4zIsA8TVmjOvYiXPSZHwpDn5N/55bpLqe4CbSGJn9GO70BFpqJUlE70K5GC9JO0I4d6HPKzsq4d2N4Kz8HwYWB5q37TK/aieCNKuG59ccq+oF6ZfYiXOLQsCRB5rbYHZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AT+5rWoCTsKn+6I1Fn3L9qP8FeNMZ2+PftQYYPg+elo=;
 b=n+Hnz4EcUF3OzpdBtkZi3uhe0VpQEtR8vdk4PpgTC1Nz9hKtkd3AWq+AhwYMfYrN4UKCpjoqlIKdcCi8BXTFSy+N/0LwYY8J3jHQy6wsz9TvJF7blu5CziXHwvsFmfSPIN0M/filnh6JQrFye//jufoFtSucBFSZgrhtzaaeB88=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by DM5PR10MB1836.namprd10.prod.outlook.com
 (2603:10b6:3:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 10:30:01 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e%4]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 10:30:01 +0000
Date:   Thu, 5 May 2022 13:29:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hugh Dickins <hughd@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/shmem: Fix uninitialized variable bug
Message-ID: <YnOnHoGasHiIzXYQ@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42e5caec-5bce-4528-f47c-08da2e8235ec
X-MS-TrafficTypeDiagnostic: DM5PR10MB1836:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB18362BC9FF52CBCEDEFCDD818EC29@DM5PR10MB1836.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ztTuJW3jNz1R1rOU1amrNEgW/L/0guyLXLrpdbJVi039B4AeBiXuE9paFEffAU9yk/g1cq2N82sVN7UmER7m7bwk1BGllD81OeZW5SugngcNPpEZbHlSVf7fvj+1CuL8/LEdLbJYM5iFY7syc4ba/Sa/q+SNDjbwgQK1R5kq6n1Zrmdl3SaSdpL2HuIMGS2yMLdT0U4EWEtXydfSy7u8CGwkJCg0bVUIkh1N3dazZmwqnqjRJ63kciD5T1pXhyO/o13ryFZeU0fwuJFbAd2rqIdPWmrc/4kzM6vCFmdrNugBPFguuna8DaY4QFivhBojRZxeLcTDr97mC7sufFl3YMcrTsnLZdhvfZ8FWb/xtNg23Bn/LHI2o8HV9ERHKQWJ4LpD9TMX3TcyCadj7RsXYoz7cWMhe74YPlFPoD2VtrFlWSef+e5MGQ+PZmWDt5cF08iJ+kdcOxVdtrVK/Og5EbF1Okzy92+WtjH/Rupszqpo2qXDGLaxtPOZtHNRW09QUfl6Dj4IvCAvKbpbvW5Ijd6F8EoRlYDrll2i/aVCRGJ56VZ+KKe3tNMS7P1NTvZoKGJHwmMlO5JhMHXELmphrlrOV8dX6rhdaTNKQNQoBVyQ7VJS6e0IdFtAwB1CVX/5d6e38kr+JEWMf5ML58Deny7LTxPQHqgcnwZU7DhvY6YRDfeBTpGLNIwaEUjcLt6FS3KwariDnYNKjBcLhEmewA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(186003)(110136005)(9686003)(6512007)(86362001)(508600001)(6486002)(26005)(6506007)(316002)(33716001)(6666004)(52116002)(38100700002)(38350700002)(83380400001)(66556008)(66946007)(4326008)(66476007)(8676002)(5660300002)(4744005)(8936002)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y/Ro/Q0RN6TzEycZYgeScFZULT3Nzs9ZFcpaW0nBfOdVgGSH2Y/y2boe/bX2?=
 =?us-ascii?Q?4LXu/MIvFr0VU30LKyweGy1e8cAFJGVOhkNcUBjV+130kEwwNR2RXEBpEB/Q?=
 =?us-ascii?Q?4aKiC8h0HCFuL/GgeAcTueusGBt81Cg3oojmLYa5ClDqq+5CKly+0hsImPl3?=
 =?us-ascii?Q?kvoxPV7UWZrog6/FJHdVdU4N9Q71b9+RkewjycwgFfU4yuLPj3GQVHRU7HVv?=
 =?us-ascii?Q?bd1gTqMib/dRSbi6CxVRlQThQNLtphhFkQ87+jdDNEhCDAATz1aTcamTvzNw?=
 =?us-ascii?Q?FXtbsg8lHe/AdIwVQyyu2V0nuQM8r0Lgjn7Um3LgA9085iq5h2atcLqw1F8m?=
 =?us-ascii?Q?gMRBIUmib8BMKvnuHR0SBJQo+CfpSji2ZRjUwR6x2xESFGc80U0THhMpi+Mb?=
 =?us-ascii?Q?xNtVTuObz6rP6S5Z9Z0z8RFdBkHED/3Igak22WmSb5J1R/cSb/aAK6g+/IMd?=
 =?us-ascii?Q?Phv8l0U3+X7ShFIidyXK2hSNxU8lxuIo4B1nG07fFYYHc0Rv9yLDuqAoy5nU?=
 =?us-ascii?Q?bn/vVe4Ii0cIpbZ9F5BoR2r/zLLm5nc2lR0ogOTqtiZyu9z0vn5s0sJ9DCIA?=
 =?us-ascii?Q?L821LMvH/3jARMPyTrmq4k5h0EfKb/0YHACDGqqju7Cui8GHVn61+uIb924J?=
 =?us-ascii?Q?USSB9a1rFsHH3cSOoPFh7mxeaHITC5oW7XPCzK/nmTyL0lPQjuQ+C8NKc7nC?=
 =?us-ascii?Q?m3CWxVBBrYPkVRsR423Wloa95S0eBQqtfzDEOm9S8GfA2QpzIzHKejQ2i79Y?=
 =?us-ascii?Q?gfjJfEpX16uRW8X/jb30UOG4/wCW9H3xeCmbKB4puCi+CU2D0nIIQ1PdlDSB?=
 =?us-ascii?Q?01aZ1XK/L+0Evp1/cTHJv2X6SnjnpzmVLzMJxj4bYK9Tok5/n0zmiWGD42B+?=
 =?us-ascii?Q?FyEELmqrceIQshDA5lbJTlwlciAqilfmJKQ0bJDOgbAfgGtIqScuBR0OH6dd?=
 =?us-ascii?Q?lEWmHbCVG9ENT6YFkmaccvxqYqiQnyyZj6dmLcwzgMCCaNvZ0uWbIfCnZomC?=
 =?us-ascii?Q?ANJoTbMBeCf1pnxhwipMSlzYVgdugp7MPanDg6KDHIl+VezuC3k6x4pIyS8U?=
 =?us-ascii?Q?gr2BSz9PqmcmbQ9bN8Ojhhma0LmmD5IA3b68qIBgock6uKvbtRJ5GcmBrOeg?=
 =?us-ascii?Q?EN2BooAZPJHzoeqhCAieDjP4NUCLCPe9d5h6wkEe6vE+WvsFf/HCVqOzu+tk?=
 =?us-ascii?Q?9nRmxCgn7RMymGSo9jOuToL5oJxPeesyC7h99Qkatz8FhsnSFrn6LBQoCgeY?=
 =?us-ascii?Q?CQy6gQQJDNUNq9jluzbUtXQ1ahZnOhtsFcZcNNiC4da0KjZcMAyVsoWd/Jz6?=
 =?us-ascii?Q?+wTFs3xHruLLOY6SnRF7rMbmfwNyu0EYAFBDtFvEn5KUaZ4mKMCsnbbf/h3B?=
 =?us-ascii?Q?t9X7Saurg99lRTIEUYGr1jNixqhXdeZkU9BRXAp2Bpp6phHtIl+cKrqKT1P7?=
 =?us-ascii?Q?grEsXkKmaKTaA94Qcv12c1mUyNUenKqN3c5GchhSNS4AufEajec1wZgl2RSq?=
 =?us-ascii?Q?0kcKh0N37pNLDW7FyIAkQ24hCu8NjjDesx+2lDsegiYra24lKz0o0KfNg9wp?=
 =?us-ascii?Q?KabAjNhtbVBbpZJimdf99IfYmML4jldNuUgDYSL0o38z95sTNTWyefCqkSVh?=
 =?us-ascii?Q?D7fgjGYqX6VashfLm/SCjSDjR9umlYtAew96CuTcWsd7Y6avdww2hwyziXvU?=
 =?us-ascii?Q?HPtW0PSrsiuC4fw2wSGCvM5+yLcuZagTsLnR9IfgVB8s7CsY3pdvizOhXz1F?=
 =?us-ascii?Q?2S4hJcBLvrD1tDPK0WVF2l19nO9kjfg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e5caec-5bce-4528-f47c-08da2e8235ec
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 10:30:01.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwTbt8k3LUALmv5tfpuflKtkEKXgPbD4TzVpvXEG82x/zZSN7qvRZIKK28K3oQhIajcf9XLNRT2gBV4TcPnKiICv/vsnIvOj2RHFI02AuCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1836
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-05_04:2022-05-05,2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050074
X-Proofpoint-ORIG-GUID: -ZCHu8qtVZetapWny9xGKh7G6bghghZW
X-Proofpoint-GUID: -ZCHu8qtVZetapWny9xGKh7G6bghghZW
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "folio" pointer is not initialized on some of the early error
paths.

Fixes: 2b58b3f33ba2 ("mm/shmem: convert shmem_swapin_page() to shmem_swapin_folio()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This goes through Andrew's tree and will presumably be folded in with
the original patch.

 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 107f1e4dd0aa..97f9ea59a7d1 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1681,8 +1681,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct address_space *mapping = inode->i_mapping;
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct mm_struct *charge_mm = vma ? vma->vm_mm : NULL;
+	struct folio *folio = NULL;
 	struct page *page;
-	struct folio *folio;
 	swp_entry_t swap;
 	int error;
 
-- 
2.35.1

