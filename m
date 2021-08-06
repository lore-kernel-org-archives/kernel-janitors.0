Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A541C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 08:38:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78BDB61078
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 08:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241735AbhHFIi7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Aug 2021 04:38:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40620 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241874AbhHFIi6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Aug 2021 04:38:58 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1768b6HB022196;
        Fri, 6 Aug 2021 08:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=umwDoAi2jzQKm1j/VoWa6LBG7r1SemAlQ3rWT+3sJGc=;
 b=pUTPfNWGL/CKmIQIV/XLmiWSFhwnlVN9P6S2zHxzlVxWzZ5/F3trY4fjHaJWKeG3LZmm
 grtHC3CT9nhtgDVgZPt4B5qY+XLNGcC0bUzTL/2EA8L8TfGGUm80cakJhxgoqBQZv2O8
 0WYaNLypHawsfMEj14lAJKtGlx3NLDc1bxBYzS8KEdW1dccHDe4ccrabALkRVDpAIsFR
 PgQQfAWscV5bREdiktxlocZU6wneMrWxYL6MKoq5sdYbSxIn7XQxHO04D6Xu7hStwrg5
 FraQdrGM60JI4PkcmcS6Gx495NjFJZH8IdqGi2V6OAlnSZB3IPpuDiBEQrjj16f8Ntw4 cQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=umwDoAi2jzQKm1j/VoWa6LBG7r1SemAlQ3rWT+3sJGc=;
 b=BqpRNfMpJdjMxx8OlvFI2lHXOfEHA7CoIkTNETWhUh7WDXHdcnsAakKZVmih1p+EhyJ2
 Uam4nCy5Ugn6oIi729ma78Ssa/e3Ap6ay3OnDnt91e4savuq+MeS0lsMVaOCROMwiKUT
 0ybBh1RKgco9Ru8XWUin7GGN7v0NpStrU32Fk33iSRI/+FZvTmH6u9yvKx4ovUXBVHRq
 SWWDl+HiIq9ikGSWASZolMlsBaD40LnTuvEjUvW9nV4LsQwEI6+qu22e8Mxo7jhiGtez
 LQ+6umsESUdQ5azfsbq3HNR5EOZ5xrD6KGOt56Hj78YG1yQcyEL9xaQeGO58cibdzsZZ SQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a7wqv4b06-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 06 Aug 2021 08:38:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1768c4CF106844;
        Fri, 6 Aug 2021 08:38:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by userp3020.oracle.com with ESMTP id 3a5ga1v78n-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 06 Aug 2021 08:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg5QypgfqSnEVk6wk2gaFtT4QcEGnlX8oBF4r9yjIYdjLxOm2JjevYUhfuyZFBEpLMpR3ePIiChU5VaY98AIdDoIyecnrMhnx1h6ZNnCz3931AhXgfRkxzqbj0msmrWLizkBfLvSOkci/93O9VVgfQOBuSLNmSAboLQltJWyjAYlew4xuQUoXvhV+nCWxscyHdBBy7/D+M5s+EwUOMLTysCZnrUuxWUYKi/77Yycr6vCZEcMBCCHZpPxLexocQtnrFwj9RJrHZE3i4Lu2KXhQT73xsDNzgd9bVDD1fbQIJvDqjTnqe6aKz/4JJ/E5KB0RFqli4++9NByMRefI01XEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umwDoAi2jzQKm1j/VoWa6LBG7r1SemAlQ3rWT+3sJGc=;
 b=ldcKt4MipChsvcC0Hkg229cHqWC3ROiWSyT7La5lrzMHuQya5uEXbG6I/yk5tBv9elUvIaqi7obsdeL7vI1xLXaUxK22iPqJNj/lfnCeYugJ9RLcTbRdzgMunAs8MAJhsgFoZdQhJGZJCsj+lDWUv0PSaYI8+VyJkzhN79IPG+yzfNfkMZmN6CLNbK/upuYRML3lW2hcxnmbj1yIjNoQTv4GSh3vyY8vnevmLFGDPDmu0sCIgIiWcfVe8patAV1vIo78nhjNOH/fj8d/cIugdrQ9j5z6BKjMDi+uDqrq/BokxcWeYvBstra9Vr7kkbUIuhqK8HIB4daq7/KkZ8WlMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umwDoAi2jzQKm1j/VoWa6LBG7r1SemAlQ3rWT+3sJGc=;
 b=fdhML7H1ioHVItapZL6I6Bv6o0w7RT9i1R6+5yGM313ltcm6AGGeTZrH4YP2R9eFeGZj3S2F3h/L0b6/rxFansk8VJeUfLwWqO9HziW9cgGEaMKcULSgcWu5m9tn2PnYK7RipWfYq6H0PNp+LkVjh2I+6oXvviSyUEhCvIZXcU0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2205.namprd10.prod.outlook.com
 (2603:10b6:301:2d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 08:38:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 08:38:29 +0000
Date:   Fri, 6 Aug 2021 11:38:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mszeredi@redhat.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] fuse: move fget() to fuse_get_tree()
Message-ID: <20210806083818.GA2797@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0026.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0026.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 08:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c87600a-70b7-43af-8b6f-08d958b590e8
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2205C4926C4F63D6CE3AEE6C8EF39@MWHPR1001MB2205.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L9EknGGATYOwdv0JgWluh5NJ6ejTQcfXBpUFNl1qQ9vYwMAedIHNAQu35uJpAVQypsGa66UdkC0weqMdcsNjlx8FzNBLuo8HXLSHEaX9A+ARCIRObr6vtyEVg+P0rGI/ktAwV/x91JDIXdylE6srQrlXiK4Xh1aRn986QnsXlH2muARB2FcaMoUa2kMVyWUBMiHanFkdStxG24o72iCjpLvi+AZKzl0CNAl6+SdJvC5X3rynjs7vOV0qIRhnPGqu9+7KTFlwgwQWGsWafVoz5XS/qKIbfEuv30yqr+g0L/q11I7Z/m/f85bRtaemCgqO+st3Sg15dSTiNfIcTjD/LJxYRNca4VEl1SD6B+uXNWIA02cizt7sG/6QVMShvGJN/UEoiNNc2naw7VXUivgkH6clGMFbOT/GQJb2ISi/yHs+RnqkLUrjdBEDcr8cLHC3pBTxzKvppfEpcApl4DDA1JohpYMvent3JdPF/QvwVtLHXf4qjGWNdlEcXLdr0Zz450LEYIsFEcVq2EHIU3LjHRQ217sk01tylGkL2sWCvP3wX3M/sADT22TJmBX8Wjha8Qk688+MeSw3jMj0Uuc+JSvLn857m5yGwKoXPHDesnT765DYXk+Uf4SYgjWPtlA8ATqsJQHQYUlAZw2wFVR95JychmWlnL+84PdG9CkIXnHOf/PxTji4F+k6OSBpGv1i+2oDuQgwaN/7s54URdeywQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(86362001)(508600001)(52116002)(9576002)(6496006)(316002)(6666004)(186003)(33656002)(4326008)(2906002)(6916009)(83380400001)(8676002)(44832011)(26005)(956004)(66556008)(66946007)(8936002)(1076003)(38350700002)(55016002)(66476007)(38100700002)(9686003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aD47ddSD8zPFNLlRfttxgleByjlSK7lou/QGMcqxmhg9bKGp5YSgXteU1Ibm?=
 =?us-ascii?Q?pDNAJcNG6C9yQG11x0OoH6K47a1fbR+HybPjEwEVUlz9n2tp9X5iMOy0cN3W?=
 =?us-ascii?Q?dK3A2CqHA6YjplmSLzBWOUGB8I6X2TXdVVDrpbAOecZWIkpH82dtmoTAKvUF?=
 =?us-ascii?Q?88uERlLmRFubuL6ULItFrOdREq5ymp2RgZY2315GXLy+hi4FrTSDf/mgGP50?=
 =?us-ascii?Q?EqIr3Z8HPOucGyrYfGC5rjjF0e9CyMEWaF3sEFr4dBnA/5Cns8fCgAwR1jcJ?=
 =?us-ascii?Q?sbBTO4b6iK+CrOaqPuTzfMI5KFfc5eM57IpmkcSuCCYhTNaOQTDIRTriJmHT?=
 =?us-ascii?Q?I/MAn+Ubi1xQdX4e6grcq5+haTRXUVsZGPW0NLQgubXpQurlIkfw1ai89kv3?=
 =?us-ascii?Q?U9zlE715r90vZ8nOeK87PXgsOrFnBJvfpTY5lZQreQYzo4u1/NGYWdW5plWV?=
 =?us-ascii?Q?cnAvB39NB8couZSflRTX8CQy9dez2kMrtzNNHWdGsEHBC7vMVncyPCJ1mWv9?=
 =?us-ascii?Q?UNACXhd30qGt+P/lulC9diversofjqCFglvlGQPU8K/MHV91FheCEmQhiBps?=
 =?us-ascii?Q?2Qvm9Fq/j4CunkMFBLI4GG0DtYGwCXpE/EuiLQ6k1DYzsySZMJTnUPT7Cxz7?=
 =?us-ascii?Q?ApuWtF6boiWME6icdNcXyvGqmJt3IhgU7pcu448vPLmxQEuWJEqfzm0P30FL?=
 =?us-ascii?Q?fQWzyKLfX7AzLDPMhY8EsPGIpZZkl3lgj/so9Z6RxSHNQ37sQ/KVGgcQ12Oh?=
 =?us-ascii?Q?Kkxl5wQMXz+UKXp+2Ik/2xI9CxDV0ADSOah38x4NNmycxMJ7WibJUsGMZA4L?=
 =?us-ascii?Q?6PztRqeswVV7SKOsx9EAelntV2zZji8juOleWrmRMbyhd0WmH/oGfYnS467u?=
 =?us-ascii?Q?l78HFaZD4mPF6I6ZkxRySPWfoM7dGlVCxUvg2bRG2L8EKb+sQ7SIOERjqXRB?=
 =?us-ascii?Q?jqsJH3PSaOWEZZfEeu+UZKcpjda2zyfBQTQIAI19sWjvsHRVj57Aonsq3E8X?=
 =?us-ascii?Q?3irh7r7Lo6bq66RX961Umj5PCBju1CORwVxnf8uqpg6bZdjN6mN8N2g1zYNY?=
 =?us-ascii?Q?9KKzfUAxRHtpGMr37M+a9WcTkqHsQGqUOBpcSc8LPa/QAQnBxUW+Lqi5OYs4?=
 =?us-ascii?Q?Ym49OX/zZJdl6fAnnEWZwwiiVsLrAVxsPZijAK1LNLdK39a1gTZ378L6+NSL?=
 =?us-ascii?Q?lVLJPEeQUiVi6Q4RLdSXtAQslKEYFKa6dhXRkAZDYwwl60OPvXqK8N+TKdZx?=
 =?us-ascii?Q?nKdQk32NNDfP3vsaMfqY7zf8QIdeO6uC+cXjwaqxQ5D8CxxIpWbxJaYffEdN?=
 =?us-ascii?Q?O/gS9lYOWj7L8BAmsWLMdNfU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c87600a-70b7-43af-8b6f-08d958b590e8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 08:38:29.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ws6YpBUSWLmSo2mgHS/U5qAUh50JM5JjyeDr3gGlFHYlVzVux/6D3mVaGav+/enwxUAdKLkrpBAq+XSlxFA2l6OuG+CVmX9Z11mwYXdlacg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2205
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=942 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060060
X-Proofpoint-GUID: TlqOhp8sidtsCExBN1Rgs3IUoLA07K0P
X-Proofpoint-ORIG-GUID: TlqOhp8sidtsCExBN1Rgs3IUoLA07K0P
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Miklos Szeredi,

The patch ff12b2314569: "fuse: move fget() to fuse_get_tree()" from
Aug 4, 2021, leads to the following static checker warning:

	fs/fuse/inode.c:1557 fuse_fill_super()
	error: uninitialized symbol 'err'.

fs/fuse/inode.c
    1508 static int fuse_fill_super(struct super_block *sb, struct fs_context *fsc)
    1509 {
    1510 	struct fuse_fs_context *ctx = fsc->fs_private;
    1511 	int err;
                ^^^^^^^

    1512 	struct fuse_conn *fc;
    1513 	struct fuse_mount *fm;
    1514 
    1515 	if (!ctx->file || !ctx->rootmode_present ||
    1516 	    !ctx->user_id_present || !ctx->group_id_present)
    1517 		return -EINVAL;
    1518 
    1519 	/*
    1520 	 * Require mount to happen from the same user namespace which
    1521 	 * opened /dev/fuse to prevent potential attacks.
    1522 	 */
    1523 	if ((ctx->file->f_op != &fuse_dev_operations) ||
    1524 	    (ctx->file->f_cred->user_ns != sb->s_user_ns))
    1525 		goto err;

This should be -EINVAL, right?

    1526 	ctx->fudptr = &ctx->file->private_data;
    1527 
    1528 	fc = kmalloc(sizeof(*fc), GFP_KERNEL);
    1529 	err = -ENOMEM;
    1530 	if (!fc)
    1531 		goto err;
    1532 
    1533 	fm = kzalloc(sizeof(*fm), GFP_KERNEL);
    1534 	if (!fm) {
    1535 		kfree(fc);
    1536 		goto err;
    1537 	}
    1538 
    1539 	fuse_conn_init(fc, fm, sb->s_user_ns, &fuse_dev_fiq_ops, NULL);
    1540 	fc->release = fuse_free_conn;
    1541 
    1542 	sb->s_fs_info = fm;
    1543 
    1544 	err = fuse_fill_super_common(sb, ctx);
    1545 	if (err)
    1546 		goto err_put_conn;
    1547 	/* file->private_data shall be visible on all CPUs after this */
    1548 	smp_mb();
    1549 	fuse_send_init(get_fuse_mount_super(sb));
    1550 	return 0;
    1551 
    1552  err_put_conn:
    1553 	fuse_conn_put(fc);
    1554 	kfree(fm);
    1555 	sb->s_fs_info = NULL;
    1556  err:
--> 1557 	return err;
    1558 }

regards,
dan carpenter
