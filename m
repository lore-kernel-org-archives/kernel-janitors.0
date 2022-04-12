Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68663C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Apr 2022 10:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354034AbiDLKb7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Apr 2022 06:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379600AbiDLKTp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Apr 2022 06:19:45 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35E9262
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Apr 2022 02:22:37 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23C7GBPO031505;
        Tue, 12 Apr 2022 09:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=vGkcbhHvBEOXt3cx19hmlPkoz5CMWC7BK/XiCbt2jN4=;
 b=Yhk7B+Y41n8tobqnRBzQcefilkBGKed+Q4+/m2oxgs7M44k39SZzpDhbcfhvSp6SQXit
 XFe8Dne6VHD1S6NNFw2AOlZNmGXDOR6gHpkqgcmcLz/jD8WMXKNwx0AgoO7Ybtrj+fOh
 FjV1lLZW/LLJR9Vvz5kjrCxKD9cNGuE6DZpgu6qxxhpPUmfzhGlutCT+c0p6EW+cyuWk
 hTdtquJi+OQKa0klykcWvZnD+ukI66V9BTqJe/OAhznVxqwYVIiv/t8a+p9pC42kS4rf
 87oiXZrGBRZGoxHvh2qdsvh/7o3iwhCsVcxrY58/yuHFAwwOGAQuoTivPEAVZvEUQrF1 Tw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb1rs68tt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 09:22:35 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23C9GEH5001305;
        Tue, 12 Apr 2022 09:22:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fcg9h6qbh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Apr 2022 09:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwaoubHtYE5sCwmid6x5XA5UaJWXtNv8aFr72Ds3hz7Cr/hcNK/EKJwUAeUj/B9jVk7LSGK9p5dux1HP84ov/zYmEpamXOgX+ImnbmmOHMV+m/q0tt1Ro73EW4/ky3oeAVafmwfvbGATayk0H5CR3Axrmyxfa8jsqY3LzEOEh8kF9Sp/0fFoCs+m3+9BIxos33Frg6DgS7x7haNNdajfVO70BliqXlS48eaSweAijmfDdgITRci3yRAHwoejzkhhgztagyTlhSKQFVvM4zRAJ7jlug9EkkKl3368RyQPEo1nbO0xhJUU0SRlDF4Cuh7aW0aic580llk56nzWwq+b1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGkcbhHvBEOXt3cx19hmlPkoz5CMWC7BK/XiCbt2jN4=;
 b=B0Exuqh6giBIhnYpVK2uhb+Cvn8gxAM79KM3Txo7q9w+QWR8lCzUcrt/goy1wMttLxYXnqH8E2gWVfGeKOESYlx0Dxk1/haVOBfooVqBAj0lbyc1ynlTGXfuzokcnzLIc6mEUrI9/I11f3I4g30rD3ieznMV84TX7kNccICE3SOShZczkR2m5maWmukNc97eIDlABeaqvj5ALOWdS+C1uYeD6C0Gfo0wxWKb7zE2xqM6/BU3h0nWkGCiff6fm2di3zw0m5FTkXwX1RqrDJcXPL9scbAEoF2O2xcxmNfNCG0oGVEYYARwf4uxwUdybApUzCfmjdcWNVUOsiMNEFt1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGkcbhHvBEOXt3cx19hmlPkoz5CMWC7BK/XiCbt2jN4=;
 b=v7tchHcJf+Ou5KfTCxJeym6rCSz/yJyaOk+dh8fcCLS2g/QMy+BsmF+GBzddfWX/gZk1UHuKYsPbISCfcRjpwh40SR2JhJqLGVVMvUfEwP4sqerwCazb99yGf8KR7ZA4LLFC6gqSsru8KeWRpM/HFnihY1u3fv1yd4iv0b1jWH4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5391.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 09:22:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 09:22:32 +0000
Date:   Tue, 12 Apr 2022 12:22:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     brijesh.singh@amd.com, kernel-janitors@vger.kernel.org
Subject: [bug report] virt: Add SEV-SNP guest driver
Message-ID: <20220412092223.GA3407@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0148.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25d9e37c-a5a7-436b-5da5-08da1c65f912
X-MS-TrafficTypeDiagnostic: DS7PR10MB5391:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB5391E01046EC194280ACC7AB8EED9@DS7PR10MB5391.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tkiHnUK9527Iaeemg0zCyArcZiStQ+oGi2pD6NuPCibXXOKZnYbGL+eB52Qu90BNFle9DRLQfcGlZhKncbKCdKJQL3+OiXSD6MizJ58to6ddwZv+8mWCSEzyCQXkFDSzP0VMenvQNPrCKheEe2WdcXzI9ttBoJ0VO7zzn7Pe9CnAoDTLNMWx3noxVZ4YgajP5EP7glzhClytKOEE+BT7T3a94hkd7/Kkl/HtcdmhmsVIe0VmAIH5PB7y3tg1OaMfUz+QuwkPg+VvJX/5Um2ikmjWLFyt1Jk35jA/8Y1ZgDPfddjfmiKdu5wpGZm9Fh10i82dJWRhG4aiY4oZAeVNj0kb8H96V0FPbLJCwPx/mhYoUP1fzjsc6aasYyr8VVMR0SptWo8n16Q+m4iHUOq3owpltmUqjjok2Fq8qN3arTR+2e4IeTBePni4ChecvY2kM6QEmfSlwJz/wtmCJZclFfdawn6hfpTR1HCT50uLlAofmcvRQzbTxtvF/zoXVnVIAW5P7oLpuhPtTXX/KZGpKMbmxcqVtKqNFz/c1OlbtLeudRHG7N1ZrsW7dVDL0iwVYTu2+ZtP1fmgAmf/levC9vdoKGi8m6EsXICDwYyycMRGquSxrrqhAGpbc4BYsyRvdubJ4qwRXdjZ0eX6ywtsIEKYudSDuimVXTXssfdnJ+R1jsXCm54k0MCEbdKZiyjH1Tb9OxTZrzdzghBVnCHzCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6486002)(508600001)(6666004)(66556008)(66476007)(66946007)(26005)(186003)(6506007)(52116002)(33656002)(8676002)(83380400001)(316002)(1076003)(86362001)(33716001)(8936002)(9686003)(6512007)(44832011)(38350700002)(38100700002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZSgeSaL2Y1dtQvc+EfgGyFY6H/d6jxmfY1wVIDI6FrgtQ0s6KFROapRWDlW?=
 =?us-ascii?Q?/lQGnHdNiDuiIuJDLvnDspUcNpK5UFMd4YSFtvqDZRaKFAEatgjTUmOBGrTQ?=
 =?us-ascii?Q?sEKWdM/qyYaSrQtWNrAjTK7vDaqLgjvEo8znzYTWCrAGk6f6ZcKbOwU7THuR?=
 =?us-ascii?Q?MV5/TbGySMd+l7KKAT4Fe6yIiMSIzbeR1o1vX4YbPxsJFiDDpPcYSrri81BO?=
 =?us-ascii?Q?u6EzM+1HNraAZnE+elwbNwQewkpIGdE3JxMgz7deOsBIYO/fYQ+jfIiHmuYc?=
 =?us-ascii?Q?JbpCUPE7UmSOuoxSrTWfS0VtAQ5+XAScDmwjbayhmmBahbqNXnZrP9NRms1f?=
 =?us-ascii?Q?W9WcB1TzNeMSEzD5IhChRB+UH4FUBs1LeuHAXySSbA91YxhAMiOJR6OJ4/47?=
 =?us-ascii?Q?q7kXWDHAU8NwFgrs0/6VXgnV1NLabxSVGX1jFnG8z/Dki16FuMKBrgOnkaxN?=
 =?us-ascii?Q?Ud8VOMe0GXrmzSGDlMGl6U1ZC6WokB3GkzNO812AM4ZO+77ZaKUBmWmjJ99i?=
 =?us-ascii?Q?2BNcw57VMLwTX6nNxJMy4QRGImGgAPWrzo5EAxxYrSPM1+RAgJlJla0h7HCh?=
 =?us-ascii?Q?b1KcqQyS77ilUOiPBzU0Qy2exXBlvBo8ynkB5kJpfLS2A75GSShJ6W1uRz5u?=
 =?us-ascii?Q?YrhWF8vc2kkKo2qSn75mdVxgmaj11ef7+uf0++59AizNLh8n0ekYp83U7/sa?=
 =?us-ascii?Q?jWHw+sFKzncJYK2f3HmgKqc434Cr3G+6Dgz1Ly8tvAiLZ9tVwyUZkq32i+W5?=
 =?us-ascii?Q?0Wix1KPYW81/zXYbOrVYdQCEqChrsVPb9Zhlw3xaoTOus2jA/pvrUJxcTbGW?=
 =?us-ascii?Q?GDoIYlAeMcF1Va7exfI+Xx+92R9kWUsi+ggjofp/KhCu74oiOqYG+Rj+F3ic?=
 =?us-ascii?Q?bcBsVlsekbl5hutmnMiTgTR6oZDePLoxZKPbFBE9kv77OZ7FhnbV/Vbmz9Zx?=
 =?us-ascii?Q?ZFMcsqsB79z7hJMbPC48n1w3UWORRcZRQb6+hqGp1a8l7hfO/z2ECQ0gD50I?=
 =?us-ascii?Q?Ys59U3NIpgv4nn3bWv5mnFGk5QvPB8AiPhGXvkF4jX2bP+QUGJsUenfb4yLy?=
 =?us-ascii?Q?dx3WRJB2Zy9FBThxtvoPc6ZPEZFnQchRYuMFsctbLojXPGzk3+tqZEQT2gus?=
 =?us-ascii?Q?rSidtSHOhKBdBNAQzQo9W7yougf+Q/9VJ9Kb84ra5BPXsJ+rcKZkQFvFcV0q?=
 =?us-ascii?Q?rjmocXLrJ8HY38zocU0KuwzksIQneGHIhIKRPQI57GOVyft70pf1gLK+rn/x?=
 =?us-ascii?Q?NTRE/Z6Vt/TD7fuwY+wWtS4JVkuzFZE8/ZEqe/42gbIobjB21BI54lFu5qer?=
 =?us-ascii?Q?qOFOxzGUxFdBmBy66FJopy1xmo6TCgGmQOEUV6qgHU44UwydxfS9iM2Vmo4a?=
 =?us-ascii?Q?R9WIbPifk+qCmshfjjcyIzBRKqp/JZCXmRXymrn6e/wufRXah0av6+Mi1yW5?=
 =?us-ascii?Q?xkGLVITxjaawkQN7+1fMNpr2EZGo8A0MW8teaNKfuB+DKlxpISW2zkRRBfyJ?=
 =?us-ascii?Q?gY2aJFqqsd93Wqwl8EcsmOvX1tTXO9HwGDGoA7JvKJLMYKHEGd9vaVu+7ot6?=
 =?us-ascii?Q?ZewzSHUpC9i8QQFiX8ZZ91rYKJ/WaDo/YUjIBodXPRp2OPtIoyS/zGB4voYC?=
 =?us-ascii?Q?z5/vN4eimL9PEsd4tunRaUn2EJhEPVS1WQhazjfwvGedyz01S9BBv1BSpzkv?=
 =?us-ascii?Q?KwMeYbEGOKg11K0jqAaO1Nz550VGHUQiKvjbYZyFBQnyLD/E8nb5hgJAuAxU?=
 =?us-ascii?Q?SXN3s4X40qJv1Xm5BX4HBm3QYrq2UgQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d9e37c-a5a7-436b-5da5-08da1c65f912
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 09:22:32.3601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mZVudvg5gkXwWZ5rI+DPdNd9qD9fUOEtMyrMoUutWEFb13Xr8zKVfuzEUFkv4BEYmhuuKzpJCnUO+Zq1sRoU5lse7TIErBFFHoki+rtdzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5391
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.858
 definitions=2022-04-12_03:2022-04-11,2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120043
X-Proofpoint-ORIG-GUID: pF901eX1P9otQIqiyV8j-b9fRSQCZUnx
X-Proofpoint-GUID: pF901eX1P9otQIqiyV8j-b9fRSQCZUnx
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Brijesh Singh,

The patch fce96cf04430: "virt: Add SEV-SNP guest driver" from Mar 7,
2022, leads to the following Smatch static checker warning:

drivers/virt/coco/sevguest/sevguest.c:298 enc_payload() warn: signedness bug returning '(-63)'
drivers/virt/coco/sevguest/sevguest.c:329 handle_guest_request() error: uninitialized symbol 'err'.
drivers/virt/coco/sevguest/sevguest.c:584 alloc_shared_pages() warn: 'page' is not an error pointer

drivers/virt/coco/sevguest/sevguest.c
   279        static bool enc_payload(struct snp_guest_dev *snp_dev, u64 seqno, int version, u8 type,
                     ^^^^
This should be int.

   280                                void *payload, size_t sz)
   281        {
   282                struct snp_guest_msg *req = snp_dev->request;
   283                struct snp_guest_msg_hdr *hdr = &req->hdr;
   284
   285                memset(req, 0, sizeof(*req));
   286
   287                hdr->algo = SNP_AEAD_AES_256_GCM;
   288                hdr->hdr_version = MSG_HDR_VER;
   289                hdr->hdr_sz = sizeof(*hdr);
   290                hdr->msg_type = type;
   291                hdr->msg_version = version;
   292                hdr->msg_seqno = seqno;
   293                hdr->msg_vmpck = vmpck_id;
   294                hdr->msg_sz = sz;
   295
   296                /* Verify the sequence number is non-zero */
   297                if (!hdr->msg_seqno)
   298                        return -ENOSR;
   299
   300                dev_dbg(snp_dev->dev, "request [seqno %lld type %d version %d sz %d]\n",
   301                        hdr->msg_seqno, hdr->msg_type, hdr->msg_version, hdr->msg_sz);
   302
   303                return __enc_payload(snp_dev, req, payload, sz);
   304        }
   305
   306        static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, int msg_ver,
   307                                        u8 type, void *req_buf, size_t req_sz, void *resp_buf,
   308                                        u32 resp_sz, __u64 *fw_err)
   309        {
   310                unsigned long err;
   311                u64 seqno;
   312                int rc;
   313
   314                /* Get message sequence and verify that its a non-zero */
   315                seqno = snp_get_msg_seqno(snp_dev);
   316                if (!seqno)
   317                        return -EIO;
   318
   319                memset(snp_dev->response, 0, sizeof(struct snp_guest_msg));
   320
   321                /* Encrypt the userspace provided payload */
   322                rc = enc_payload(snp_dev, seqno, msg_ver, type, req_buf, req_sz);
   323                if (rc)
   324                        return rc;
   325
   326                /* Call firmware to process the request */
   327                rc = snp_issue_guest_request(exit_code, &snp_dev->input, &err);
   328                if (fw_err)
   329                        *fw_err = err;

"err" can be uninitialized.

   330
   331                if (rc)
   332                        return rc;
   333
   334                /*
   335                 * The verify_and_dec_payload() will fail only if the hypervisor is
   336                 * actively modifying the message header or corrupting the encrypted payload.
   337                 * This hints that hypervisor is acting in a bad faith. Disable the VMPCK so that
   338                 * the key cannot be used for any communication. The key is disabled to ensure
   339                 * that AES-GCM does not use the same IV while encrypting the request payload.
   340                 */
   341                rc = verify_and_dec_payload(snp_dev, resp_buf, resp_sz);
   342                if (rc) {
   343                        dev_alert(snp_dev->dev,
   344                                  "Detected unexpected decode failure, disabling the vmpck_id %d\n",
   345                                  vmpck_id);
   346                        snp_disable_vmpck(snp_dev);
   347                        return rc;
   348                }
   349
   350                /* Increment to new message sequence after payload decryption was successful. */
   351                snp_inc_msg_seqno(snp_dev);
   352
   353                return 0;
   354        }

[ snip ]

   577        static void *alloc_shared_pages(size_t sz)
   578        {
   579                unsigned int npages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
   580                struct page *page;
   581                int ret;
   582
   583                page = alloc_pages(GFP_KERNEL_ACCOUNT, get_order(sz));
   584                if (IS_ERR(page))

if (!page)

   585                        return NULL;
   586
   587                ret = set_memory_decrypted((unsigned long)page_address(page), npages);
   588                if (ret) {
   589                        pr_err("failed to mark page shared, ret=%d\n", ret);
   590                        __free_pages(page, get_order(sz));
   591                        return NULL;
   592                }
   593
   594                return page_address(page);
   595        }
   596

regards,
dan carpenter
