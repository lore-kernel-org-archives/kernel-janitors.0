Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA58C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 May 2022 06:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244229AbiEYG4d (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 May 2022 02:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244304AbiEYG4T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 May 2022 02:56:19 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FAB1182B
        for <kernel-janitors@vger.kernel.org>; Tue, 24 May 2022 23:56:18 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P6ntbD023375;
        Wed, 25 May 2022 06:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=qG2FTQ5p2/HwD0xdFO8c68LryU8IlwhQQFJoEZ5IBVI=;
 b=HVlGsLeECAP+sc1v+EJFOFQZWDCgSVCbrWNrH7SBTo51OJwi6RG/Wwxnx9qobAPsxL0l
 eQscORM7ecifj9zd59lQuq/8bR+RgL/juU9yMhSfqcbIRPIzGPkMDNqg4NQxsLRKJfPF
 wS1Fn2gAqL/SjkmpeqF7oGdIf40/H+JXxlcj0VrspdJCTYGy162vBZecgWd0zL2BEJV7
 wlKpr7wYOKY9qvOhEdZ61dDDH8r6cQA2M/+8m8AumjVbUmFpUC0uckFTyQkJDIsdJKwr
 Rl11RH5MOpz+xMITMpMd4Q7cMWqFsHcUq2FLRlA2qjcSDM8OsEahbvVsQQlsArgkYsKU uA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g93tbs915-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 May 2022 06:56:12 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24P6ZQlA015010;
        Wed, 25 May 2022 06:56:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g93wq6d7v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 May 2022 06:56:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e93BgoCTi8IFvDpuyRtGP3O3/XtyKNUxItSmx+ahq/71663mT2XK9VXRJu6eoktdYAD1fY/p7X6PbP5B8mMfsfO15S4g3j595F0813nbFrW6cw8PUeZ+SEeXmaVeRoY4uH2reR1WJ42+P79VnYSAdFj1lqh9hc3pGMZspy7G6sydiYJ12zqyNoJew11xGdVda1NypDTqwgVFKy4KJTPXqNqSuL17JWcmiTrz2IVA4AfisZvhk8ImUSMfdp6rhTsLQWEzr1aQ2hZ7p1jvst/Gb85gLeNEgnGkamZ7I2dYNATCPGgTYnXXthSalvYrRIgYdO9mZnxh7CtsT5lM6sJmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG2FTQ5p2/HwD0xdFO8c68LryU8IlwhQQFJoEZ5IBVI=;
 b=Pj70DPynMqgMrUVkRocSjmtDNI8Sm7ir3aoXqJWOOEbJrp/3RblS6VUC0pMnWe+bHA8uU+XBmyUX4da4aDguluahjd7gYft58uFEbSOUQJjsrV1sEO/at29FFyPwt91+L5fUHIDppkiXH/b/Fw5OxlX5lL+9pmRLRGWjObmIot2jE7YWbn8RjN+jo4LX8XYgpKnYDbvoYLVqRRhgcDFO7i//XhvcVxjTzfnktR8xvnPrSHRKfnpXFuZ0x1jcmkc78jjPazUIJ/9pOCieJAA9Z7YljPyvJBD0njVYQXgxs7vwXaUwKDYD6/2wESTRAXUpTCd58XUlqVkLmM3ckurxag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG2FTQ5p2/HwD0xdFO8c68LryU8IlwhQQFJoEZ5IBVI=;
 b=p8DaoIHJuhKr0DSdHpt6X2hlt/4XattynaVWVxl1uH9a8MPpQ3QpFJQ+e5JdGLbXY/fq6TfQ9HSMZ8mCqVnNKUIg3cG8sB79SPV8Q5WSWQ6SG6jkElZ8qUoyjQPkFswHTUcY/aDfRWuAAF17BJh6jNMSmDGplGDbju1RltSbrMM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5568.namprd10.prod.outlook.com
 (2603:10b6:a03:3d3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Wed, 25 May
 2022 06:56:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 06:56:08 +0000
Date:   Wed, 25 May 2022 09:55:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yuri Nudelman <ynudelman@habana.ai>
Cc:     Oded Gabbay <ogabbay@kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] habanalabs: convert ts to use unified memory manager
Message-ID: <20220525065557.GA2146@kadam>
References: <Yozj8HcJ3uTqd0c7@kili>
 <d238619e-243b-1333-5a69-9caccfa96969@habana.ai>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d238619e-243b-1333-5a69-9caccfa96969@habana.ai>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 440a1237-ff87-46c1-4f26-08da3e1ba544
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5568:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB55687A21B3DA2DBCEE225B8A8ED69@SJ0PR10MB5568.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wa8F2ogeJSE75mGVRRxByWIeRi9nXuq7bCMjylLnTatwKaiaYlSLdng6abNSwpvjJoZZcezDpV+SSuk8+YqzlMKGtp0swXCrds5Hw+QyH/Wtcyar3kueGEBKLoPNVG6IzXpnbRZgGwLhL9ZbUtkRP24o54YKQ7IhhAGBelFbVi+9aElQrVH8TtECnlsn7VdKfZ1xV3KdiMdTswFjYH0F7qrXwIFnG7N3Zl+RBEoChnlZcXiLmlAi9lUmMbSiolS5/62jvCp/lAvmXaNhWzqjja/tTNSMnX8Pu8UQ35BNzOBIdavqnAvf6Z4NvjdkeA32SIBUwLsTgnu8W47InGMAQ/W4yfiypi1XJvqYwWYta5eXUXbpsiCnnaMXU0A5dtPunSsyv8ddibPXlpXUJkn+yH55UoS+NDbd2/MucSK7kyZZjzEs49+q6QVgRYcJkKPf6dt3bVCcjNTtuOtw+AJYPXRNOM7ogybA/w5xnRItWSeHU608eMLdD9bfYClowM1BH55u8latHE90vAYBXzUhHEc2+8a0Orqz0AaSlM3XsLTatlHNjAr7Kt46Qj2SwUDyX+8uidbIqwfTa+mS05JF9zcGFiVlkfw0iXfJ04P5xdqv/PkdWWmoiWiUPZVAr/PvIwDnDlIIPmEluuFc6Y2eNo11HO8Oto+rliJ7zL51wvGZpSv1FJBiDYFlABCZurv0bp0Ap/DK3KyTo2oqO+rFgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(4744005)(38350700002)(186003)(44832011)(83380400001)(8936002)(1076003)(6506007)(26005)(38100700002)(6512007)(9686003)(54906003)(4326008)(5660300002)(6916009)(66946007)(66556008)(66476007)(8676002)(6666004)(508600001)(2906002)(33656002)(86362001)(6486002)(33716001)(316002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Wji+tHUZc2Gw7wYaRQqkHlKxgErHb+/v1his6Ry8lvFtK6TkOggGT+8ixXy?=
 =?us-ascii?Q?3kt4eu7lygFy267j3y62dpyOuLJpshyFcIStST7DE4y4+HY8XEljtdmNKdwe?=
 =?us-ascii?Q?WYqyC/A4LlzE58ldAPT9JdEtM66Ev40zfQI7pbkS1e7JzfY5gggaLzbz9tPB?=
 =?us-ascii?Q?qZxn3NxEVIbu7itg0fqqZJdx3A3VgfIwIrvrmRZMSlTKyJhXhm77IprLRN/w?=
 =?us-ascii?Q?pst9Rn7UeE5gTL7Ngon0ZwgPZqrqXHpo9UegXTTTqLNKYAgtF+qQ16ZyX4KH?=
 =?us-ascii?Q?o2BDf8UJ55/OGHwMDDsgOiIHn/6FwxG7vb6k0vwwZTi3bx9/OaxlgAjIJ9aF?=
 =?us-ascii?Q?YhXx3+ZH3RMowwg5oYbcp+d82fvhU37pqyXTQ9g19t6tDNJcfMpa70UvZYqe?=
 =?us-ascii?Q?YFl4eTmI+zUXZ+a0puOEleoE2JTVulZDNKcjDsqBags/pHsmQC0ql9oA3fSo?=
 =?us-ascii?Q?1w1vnf3JzyUrji8kELBvEtvvdgbYhZx4myShr1zcNeoj4FAw0Dt3jd4lSyP8?=
 =?us-ascii?Q?4PPsrFEF4+M4dpp9u+tkNC0PWk1/PfdgkWtGW/yO2nh9kRYTyOZZRdYAi03U?=
 =?us-ascii?Q?CrVUSeyi9LdnIAwJyf2IBa+WIAsoEF20dEHsqPspQZN+xd5l5to2Kg6GgSwX?=
 =?us-ascii?Q?MW2gHce8zRU7SikBa7QiSCIRKP7iajXtAAle72s9k0fgSbTLR9/yD0Tx9RKw?=
 =?us-ascii?Q?sVWFC4q6I1mtj3JLHv0ZWd2HIF2YAf2b3jaFHqw3hfanUCLFN5xnFI+GSI9y?=
 =?us-ascii?Q?7DKC8xImwbbi0zcpsBxValOavYCI14tgcuYcK9+8drqyagrKrGDg7cu/SgzQ?=
 =?us-ascii?Q?ldV6hTbJOjAradKg4WEDSkzg5BEwJ7oZGlN8IDKZCxoWtEZLitayqMMoXRtx?=
 =?us-ascii?Q?znWEngBvH4nsAOrinJw9a4+uq3SLMvgJp6wGuRz2N4FCdA6JF02mz55qy6KS?=
 =?us-ascii?Q?02J6XRyYRXf1bWWNdVeiGuri3uqvt8clZ+tsL8vg+s2y1yih9YjopzB4Ms6Z?=
 =?us-ascii?Q?+AI7B7I45rtQTINef5Y8I6ZYNlj8GgH3i66GXYM7Bn4Zvb3mwnpqfBt5QWYl?=
 =?us-ascii?Q?STslc8EaH9gMzBG6e7DhQ08K/V3p7qxfvQEer5qm/Jf0pY+qKGeYxytWYYL6?=
 =?us-ascii?Q?8gPE5V9bhZTc/Z/vxrhYmq0DEitK+UoKP8AP/m/SEFruTDWsh+QReckDYV94?=
 =?us-ascii?Q?HYDWnyI9XNuKvorLZ5xX8Jice4wV4e/i3RWQTMBH9imHIfV03m6dkZkuh66Q?=
 =?us-ascii?Q?657885GHhUkjkO3n6KatG8UMAtwp9ADZjAYG2sbmI44CKfwBiCcVZEyRYjmt?=
 =?us-ascii?Q?HsRiKFMtql8hHFzg5CTDte0nLTZncQHuK9kvMU4MfYre/jMtk1sFdnYx3nJ/?=
 =?us-ascii?Q?ss1oHqYce/lRarVeQvyCksyZT1hxK4F/xOykM3kF+XdnmV5TbSXNGyqHKHbA?=
 =?us-ascii?Q?n1rpyKYbwPWOP76LA/Oh3qxFzy1xMarmVGWmuwDhEx2pque1qSmjI57Ennj9?=
 =?us-ascii?Q?Wa3DZ7zCklLErHKq8QgDMhawHRfMctbNxPntefDsEfXrq0pktm2CFSGGlc3T?=
 =?us-ascii?Q?Um0qDLFMhh3JVklpe0JedHfNQZU/ldSEuJWKRhyaadlUvLgw3HuSbchwZ7sF?=
 =?us-ascii?Q?RYRHwMY47h66Fi1hjKnKxInJMn3K8hT88kJz6t/PJNFq7nULMJMq58/WiDP9?=
 =?us-ascii?Q?a8D/sp0rr3dLK3l5UndM53AKwNPC0T6QjOo7va2DHZYdWrYpKcV+hI7+H5RL?=
 =?us-ascii?Q?y9UOT2YpZzIp0D/7tVN89Xj1kEWlzz4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440a1237-ff87-46c1-4f26-08da3e1ba544
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 06:56:08.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agoX3LyzqL48enKnFVaGlsOn2JAZ6B09SGr9cg1vY4M5celaUBmOexoTEa6McD6H2rcl4+/kMp4wHk6zggiA0v5o3TAUxsVAistKMyBfqU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5568
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-25_02:2022-05-23,2022-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250033
X-Proofpoint-GUID: IWo34C5-uyPlpis3SZfeNbTC4a0Gs347
X-Proofpoint-ORIG-GUID: IWo34C5-uyPlpis3SZfeNbTC4a0Gs347
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 24, 2022 at 03:07:18PM +0000, Yuri Nudelman wrote:
> 
> Hi,
> 
> In this flow gfp cannot be atomic, so there is no severe problem with
> that. The fact I left explicit GFP_KERNEL flag in this code is a typo.
> 
> This function serves as a callback, and is invoked via a function pointer
> through the hl_mmap_mem_buf_alloc, which can receive a GFP_ATOMIC
> argument, but not in the flow when the callback is hl_ts_alloc_buf.

That's okay then.

> 
> I will change it from GFP_KERNEL to gfp to avoid the warning,

No don't do that.  Just ignore false positives.  Plus eventually we will
implement the other check that I mentioned.

regards,
dan carpenter
