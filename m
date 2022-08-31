Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F5FECAAD1
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Aug 2022 10:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiHaKIX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 Aug 2022 06:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbiHaKIR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Aug 2022 06:08:17 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9837CCD5B
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Aug 2022 03:08:14 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V8nSnv018723;
        Wed, 31 Aug 2022 10:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=W2rt6BF062/dF7YinwUDdzHL5Syyl/Y1Ev8lsPNk1AM=;
 b=yhaUM9W4aKPrrZa4jNgI2iZC8ekKUToXo+0VrSrb47m2d/fQEEP3nwq+3+1WIb4brceT
 0OWwPucKsfWCeEVgLIg5oVx6KT0Qk4RvxHcEdVnXibvizqzMrzO+atTnF3P+/o4HX7cn
 spccAt2+hV2Lx5x6pLDhfZQA6h1OMU/hR8MctRUo4vqdEcjq2DQ46lf1Fn9e0wUAQTys
 ew/pCJ8+rrSzOgg3AiBDan8p5XmX1T1w8DS9pV5QICG0eO7JsXA0OnrfO1s+ejeOsOvE
 2b0uW1vyThUDvgpxjwyXjFfX7vXVeRvpOtiEO2FYABE0/dE87f485Ds56F5ozqX/CVBd MQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7b5a0p4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Aug 2022 10:08:03 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27V6lKfL007581;
        Wed, 31 Aug 2022 10:08:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3j79qb73d9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Aug 2022 10:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTfvTBZlLpXvd88qMioItqiwZADmqRymQWcnoYSNsLMhQjcnXLVrVqXocNM2YcrcljU45RnfwFUFGWae0qEWz+7+DQ1/Weww3AiiIGRNKPorpLSsggarfFI809qNBTDszEgj/CjingIaPbvAzmCf2/VHl0wYc6FBG/kN/nlViGNy3fhgi7vMjcdJViw1ipuR6D9dZAsKfqGwxWoW76m4z7/zJiicKcZEfta9Pq7C1Iz9zNo5KfJuI69r4PV6hn9TQWOuCYrqD+ZJd1/XxiJcDhuW10KCsjsCPgqjCUCe7/VrVuy+rqyg6NSOJ0ixe+4P6dwqvbpzu8v0NSrCqKSsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ux4lPcomuPE92eBSyBuYX64OZXinRbJnp4synA2KLGw=;
 b=c8dVbJaif1pPEbfBUvVGa99pIpEEJX0k+ExTIWhpAdDzmBz7FZEVcmEX9Vv7uirsrjk2/y0C2O1H/W2n3VEAWPezyh4CVMkB0qjbu6NY/u/w2jlCVNJ4lpjfSlkz1NIHtwbwqAWUdNlfs/njRRGLvCCNUpAu9ulwtE01+qLR4hfNpzuXpiF+jqCdF2O8MTt47SSdkksSYssE3kwVZ5wA3F/aCD4ESFAFtUQOLUzcgC6S8SWn2XbUjWg36k1UgRD5QLw0v6r/vDqTlvNOe4Fjv6vUeyhBtUq2esBeQyGvR+dP6QOjW5SpVNIlZCoTm9N3mh6tGlJYa7qreOh7VHTjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux4lPcomuPE92eBSyBuYX64OZXinRbJnp4synA2KLGw=;
 b=aXEJ0HiG+ajPQVkWz/CPYyyZoE0r45rCCMmRXF511NlcLNaRD8l4LFvbzpM9Z7VNuYJhbQsijH1HXna5YATXKijCTNQh1p/87Jwb+eS6rsEgc8LboHbd3OYb51x/9zTAdXBgwJZc3NdzgntY+tQXhIBtxSro2LI3wE2eYGMKmp8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5846.namprd10.prod.outlook.com
 (2603:10b6:510:14c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Wed, 31 Aug
 2022 10:07:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 10:07:59 +0000
Date:   Wed, 31 Aug 2022 13:07:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc:     Tejun Heo <tj@kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] cgroup: Honor caller's cgroup NS when resolving path
Message-ID: <20220831100748.GJ2071@kadam>
References: <Yw8I2ef6OvlMaGEF@kili>
 <20220831090042.GB1845@blackbody.suse.cz>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220831090042.GB1845@blackbody.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::32)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f12db25-3dcd-452b-fe6a-08da8b38ae78
X-MS-TrafficTypeDiagnostic: PH0PR10MB5846:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+3DeB70CAImitucATENzzTFuYlCrh8rKuaMx9JyH6HRt48PEEzluB+2nuWmadbHWHSb+OW2DgLzgbrSiQpNDl1f234hluX6jEAlhC3GJKIwQhB5Ui2WtLT356TBnxLQJaMN3X2ka18Bfp09JOOdGrkPecD4W+5j0D9t02PwAKFvl/y/EUkxxbovSgWRwQApjmgKgycSnYj1bX/iR8PGWLRmcBTXOjxZjZ/BS9iyu3XKRBOsNikvG1B5rAhyY7rpPs01VViQWvBR/u+JYJOTUp9v1TWToudKCHfI4LgBWQNiOlNlOlhejMDEbjSA1lKIYNUKrFxMShKPHKf2To4/yebYuJHjpAdbfIY+f/yoLhwaNik3PhLvJZLRVa0mzaHyDgqSNj7QofTcw8muXaRjQnf+nCPbNsNKrUPMpdfMBk7P4mwqjLNbjgYbbeNi3dkUCqW2LKX8pOBwz19NLWNWNm/q0y1j24F3/vjOTWYf2rDhbpyJVs98YNDaG9EHIzAmThjaGfWXnmTDcpn5Tq+6wLDwpMVQ5zPUxjOkXXfT20ukeVnEySWDaY9ntm+mHkNcLmUFgoIeUto3y1K3c0CK0PUsA+nTIpqmf1IEP8pqLX2r9xh4d+1Pfdp5eyT/xQApAJJFKOADvjO2ArOuTRg6uZn/RZK+nopp9QaVuVsUYE17WV8lU89sfoHygC7OULFanSZ5HmLCfHbsf234ZoeTFCb3pO/KvFzJlELBrWD4n+nDcuV3dGDZNQYLdGkfl0GBKPZMGjyvjWojKPzQgLG/Cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(396003)(376002)(136003)(366004)(39860400002)(66556008)(33716001)(38350700002)(86362001)(6486002)(4326008)(8676002)(66946007)(8936002)(5660300002)(41300700001)(478600001)(38100700002)(6916009)(1076003)(316002)(186003)(6666004)(83380400001)(6506007)(33656002)(4744005)(52116002)(6512007)(66476007)(26005)(9686003)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hx49iLg2RNnk4PA9I8d1Nh5WAieEfV2/Z3Ab61IvAP0ZWb3coPVr2KeL8C?=
 =?iso-8859-1?Q?vTtN5f6XFrzo309aNfh4E0ddcTlx0kV/ZILjvgDTb0lrxeC1NS2aTmwBsQ?=
 =?iso-8859-1?Q?98ULTHHMT4U3SalTJnPOsKUEDgCIFDX9nOpwsXRUJP2+JDO+37cuw8Iw0N?=
 =?iso-8859-1?Q?zpRHwFiQTEJ5Ay2D/k9y5G+qfN+lTlZmas2cex24C+m0nY0CfETdqEaAmp?=
 =?iso-8859-1?Q?KWJWu0l0jJZWByeTABo/kzeu5t/OX4isIEFiyuyzah+c3OtXFWBbwwRZkY?=
 =?iso-8859-1?Q?ybVS0myK0FY3mVy39vOKA7r2KhQtkSe4cM2oKlK+8/0a35z7HW25cQffMj?=
 =?iso-8859-1?Q?s38lxHHFpdnw56zWavn78FNAsxocaQ8FNzwKHPJ76vtbdXatizJzYqL8tr?=
 =?iso-8859-1?Q?f6EcR970LdVRVqp9xrgP0lBOMWFUrWyKG98Jj6SwtZULprLK9l3LHvev7Z?=
 =?iso-8859-1?Q?7nNZnaM/oN8uoRJ7Taf/vf00/7udnblP/bpGMNhdglUzU7VVTywtz2TQNN?=
 =?iso-8859-1?Q?h32xY23HpP38cKB9sjdjnpZjHHDx3QSbaRZaM1Du/YvQxnmw7tQAD13Tma?=
 =?iso-8859-1?Q?vTnSXh7rgPka+yR01qwqTr4odBlq/N74wFjTa5yxnrfpUD0S7Nvt5cl+P7?=
 =?iso-8859-1?Q?Lsq8Qizy2LuiySfaGC5fjJPZP13nNN1TE53i0eGKh0HrJjQCEvjfKtM5Mk?=
 =?iso-8859-1?Q?uKlYLsz2PzQesX6TKTUWEqVZHJzYsanmUjIjyjoYRJcLpnf5Q9Uns4/5hO?=
 =?iso-8859-1?Q?Ii/ENfccW1bIUumLu2EnAuyda6T/ARS0Ww7LYLHN1yqYZJ5FVbQD0M8TD5?=
 =?iso-8859-1?Q?FColvJoscCs2LHjFoPvQQ830frAjfv7+M13+gtZssS6jT3cF1VyZBiZLqt?=
 =?iso-8859-1?Q?pOq/xGVu5mZZG2jpB3h9igz32anH3IDMBHY6w3xKgPoKtf8rvcM58DsvRq?=
 =?iso-8859-1?Q?wraUCeePfzOOl5jHNFV++fx3XHqRysl7YbYbGEN/dO4b9Sy3LTG3C6hg18?=
 =?iso-8859-1?Q?n3Bu7WAcnu4o54YC/r7l0LPPpTTHTsT49+Iz02RLlMPlwWIDBppGmgAW/+?=
 =?iso-8859-1?Q?GYUwe7elktZqkNuqYZD9A2n8DH25SDmpWaKNjqrJNJA4Y9SUNU17nql2Pe?=
 =?iso-8859-1?Q?huRYkKUI3htUpeegmk3gJeyh++JqUCxYafo4RUCQlg/nmXeK2pMWt+tBPx?=
 =?iso-8859-1?Q?4HToQJaa31QZytRNtk30nc2mzJr/s2VkHJOm0WFwCR7qSiVvzQPnuYQhur?=
 =?iso-8859-1?Q?RlOsm1pPMBr2yPJyC2oA257Z3/NjxW6jnz0Uofm4NExph4ZCfwlqmMas4e?=
 =?iso-8859-1?Q?oKjoDf1nFhBziNyVsPmk7eM8w9ZbhQl2ydNzILuM2JvTBAsEals2wP+hVV?=
 =?iso-8859-1?Q?JOaP4RVGdY5gLLaOCfJSSyLEFwgNU1tlV5aAbw8ZzW013dDcsJvQXSU8Iu?=
 =?iso-8859-1?Q?WsX33wJ0RpabkqSZDVMMj6JUqAoPAhEb+e8PgyzGjCZe3erN6oMVtSqW/V?=
 =?iso-8859-1?Q?sAKBF40iwoH1vFSjutr32Acjhg61JezjuKPkdo9tsznJOaZVWLT0Qwu2hs?=
 =?iso-8859-1?Q?6vvkMImzWCZFl/KC+vFh68LSJKgdVmlOHvk+6xBDWR3tao63F/tF9SBKn7?=
 =?iso-8859-1?Q?UR2Y9UOZ8anoDX7MfWUncYLTOR7y4TcwhG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f12db25-3dcd-452b-fe6a-08da8b38ae78
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 10:07:58.9659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjYSYO5oMIkMN68MaaihWkfFEr+R7X/lTKfqgfgMmEcFNQgmXn6oIM+qzdSP4N4Cbhxu5frx7p2oLQPnvEzLVUGlTCBG7uPRdOJVgY/fqLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5846
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_05,2022-08-31_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=783 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310050
X-Proofpoint-ORIG-GUID: BVJ9xdQeeZAdZ_jj6REfG3RmcCJLm3fq
X-Proofpoint-GUID: BVJ9xdQeeZAdZ_jj6REfG3RmcCJLm3fq
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 31, 2022 at 11:00:42AM +0200, Michal Koutný wrote:
> Hello Dan Carpenter.
> 
> On Wed, Aug 31, 2022 at 10:08:09AM +0300, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > The kernfs_walk_and_get() function calls down_read() (a semaphore) so
> > it can't be called while holding a spinlock.
> 
> Thanks for the report (I should have looked deeper into
> kernfs_walk_and_get).
> 
> I'd propose a patch like bellow.
> 
> Are you OK with adding 
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> as I'll send the proposed patch to public mailing lists.
> 

Yes, please.  Thanks!

regards,
dan carpenter

