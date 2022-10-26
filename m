Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5988DC38A2D
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Oct 2022 08:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbiJZIv0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Oct 2022 04:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbiJZIvY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Oct 2022 04:51:24 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3088A1E1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 01:51:22 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q7wjiH020587;
        Wed, 26 Oct 2022 08:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=h3EI+n2FbwYjO2xxyLs1Jj6OwfmvYRjrZEDnZjkIMRk=;
 b=YT6VPmC9cLOXnPrnPi4S+3TxZnbTR1DUwCB6IIyUEAu4x621QBx5c+fF04yaEcqV4AMw
 4H8ynBXs/ZaSN4o2JPIKakM0M3EeVZIOqHRe+IOJhs8jZDVufE3oTEg5ezzm+b7W5OwP
 dniNI6pz/K2Q3lfZWRjvYGmzF/vsZIyYSD1qbyp9NYpn/kMbA1DkvSfTEsLJjt5ucudR
 TOGXWR4LeiwGvXZ1Oc8MH0SHEShqB/H8MZSfxG6CT9w9zNVZluUlP8RFGHl+7ahxmCnT
 9Vye1G5YZBhwOQ7qj9sBTTMydFOV/enTCAtI7HVxosffyV2URW/rQQ7TBOHqpWWRWTk0 oA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc7a3632s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Oct 2022 08:51:08 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q7A9mu038366;
        Wed, 26 Oct 2022 08:51:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kc6y591tq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Oct 2022 08:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbLCNJZhlfiLqh07zJHpGzc/W3CKao1wfsitPJ6FMllCkUS/DOubEBfh7XcuYglmC2e802Qw5RzlRYXOVLYdrdwypmglFe8w61lxDqbmr+PLgwfdkOvyzu+t07USqQQJ+8du/RZTFysQmbyfWvL8SrUPIkuY/SM/B/W34CR3h2qipabYWdV0vTAluJYrOnQFsNhP3jTNO0hL1y44zggo8vn2CoNEkq7rEXBhS/BlLcGiikGABI9dFroAYEcowX+4MdXDY+8DRmbRjNAz5e9C04mnBy4rIHG8KLdSTaj6b0g8usZgExSXcgmO/ox6R1FTp/NgbYigq1UcVpVkrfyfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3EI+n2FbwYjO2xxyLs1Jj6OwfmvYRjrZEDnZjkIMRk=;
 b=jmEaDdeUAYcqa7lNbTJWorjolTa5DJWYXAx2PpGu1m1eE8rjD9X1KAyVhDQY2O23tQEykNPtfeWjge4SnCTEjCG74cXSmaKLrh7DYmk5hhH1wk+P6mZE3edO4VgABGy6AcIpgKiXIiwvl4jzgrFZYXI671ghU/1JyIBrF7u26AUdE/mg/oMPVpSM36LqXNFp6xp+OWHFsvI3EY8cndMcKObSsLixi7z/tZ9/s7Tg7qxChZNbOCG0oohpB0FN+xeESI8JlpRw3+uh9/7Kho0BNx0bvLEGa/kTaOE1xsGWhJqdoEAKAi47Tq/dxRhREd0UEUJ4SAPvw7n+RbzgeeYxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3EI+n2FbwYjO2xxyLs1Jj6OwfmvYRjrZEDnZjkIMRk=;
 b=WbS0onkbT7r++4/PldvVR9J/Y5QqVaJAEv7Ygh81tCFKOHH/wm//NQZZWQ9jhJhQQz6aY/1X1/HzjhcTP4ZII7wsr837wnzzuF3EnqUw7f2ikNbZOlexeWiQP8R8owo/30kcA9sh4ZYnbIMsmI490QynV7qcEYaVVC49QCCkOZY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA1PR10MB5686.namprd10.prod.outlook.com
 (2603:10b6:806:236::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 08:51:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 26 Oct 2022
 08:51:04 +0000
Date:   Wed, 26 Oct 2022 11:50:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
Message-ID: <Y1j058PsWYj0MQrC@kadam>
References: <Y1aCiReTZDbPp/rS@kadam>
 <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
X-ClientProxiedBy: JN2P275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|SA1PR10MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: f23e15d7-baed-4d93-1fb6-08dab72f370c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1DiABtDiWTshfo3kUDSeoHvcGDqzVXx4NxgqwSJRB/Ei/AX3bGiqVH/sZ/zwMudO9HwFcFB6Wp/qLDJ7nzRkqYeADajOhIbmwTCVck1BppMvXoVCmzshb535r2VI1ElBKwEr3IxGJTCS39UMpdyjLr6/QuyoXyHYiQC0nz8OhMfSjJOv7j91sM5mBNK7IuIBP1u1SOuu7hG8Z0+MiaJwtj24Z0NM2fUqAv12tMjGbvEwUlqpl3IVZDesuaJLv/HOedl+j8Vhz4spDAl3Yt78U1PgmgT0IX5mZ/Dwc2IgDQ3biHGoXFAp4QBxb0ZlmZe4hFmctIK+JmHXm4l9LVnM1MJFdiUq66mlQT6Aq8zyT556ghrbcv+D+ke1BeNOwTJlOwWH0XSlcG9mCwF/xVmIE01axb7wPVFZ1ngMFfunisrUgD3PAcIiv85ThG3Ee64M2fTfO6HnZng4ooFJQnVBJFUhr4qXKgx2VsFN0AlMCJRsrfUv+ewuAgV9qT8PlAkUYIsFkt9aDBTd0XOiax+qzWg/8+kDL+qOSD01pgvZtoevksXwCPrz88RP6/CyleoS05glENGcxF/yyOkbUoY+uMMw8utwVQ1xE9df+wc/fSU3fEzWNnU4lSVwL6O5MsWeemfwPoqZwB9bUa/ZvhjeSypyNER6IS6/QeMKIfOfk9QyGRg1DpIfE1rtbdW+31bw4W9IzJ7PnqGzP2vjBUuEWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(33716001)(44832011)(8936002)(5660300002)(478600001)(4744005)(8676002)(316002)(4326008)(2906002)(6666004)(6486002)(38100700002)(86362001)(6506007)(186003)(26005)(6512007)(41300700001)(9686003)(6916009)(54906003)(66556008)(66476007)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nccaUxlRFirw990KxKr2eN/XR5X/DA0F9BVrhTpNqqYIfLTlSCPl/1UvIS1?=
 =?us-ascii?Q?hSQa7lO/cunJ6tLqGSwAN85D5NNonxI8Yne5lS7tB51YjrO+wJUvCPftOD//?=
 =?us-ascii?Q?+y/RfXBbU4hwVe3r2+NRD7IBzFNEGJWC2MdHkfJOY9rv3PmpTh5GfVFL+Tdb?=
 =?us-ascii?Q?n6rsm0CMaU+ZEoBAvX7o1v94pUQ/e0PO4XS5yfrlJ4GBN4bxJL0KRA1gABvf?=
 =?us-ascii?Q?3SUVdrDu0mJQ2QDVqXCB9oOGa5w9ieQmZbMgWfLJG3q+XH62aHvOlzwJ8Dje?=
 =?us-ascii?Q?FgNX+i6YxIveivXjY465OKYw8FVIlGcG7Zfk72mD8vaiDjZj9PyXwBu6GSk8?=
 =?us-ascii?Q?cEtBMKFPojyMZ5z3G9YRs9/Cplh1GMZ3bc/MOZEhHThZ+lOrN7pUTSxlCp9C?=
 =?us-ascii?Q?vO+6x/5T74hkI6IRj4YxEILHfuLwbd7Bk+sy7eWID+U3dzj/ZfGW8pxI6fQR?=
 =?us-ascii?Q?TvUkOiw08Ar7aolBmkLMC8I6wg9TA29IXuE6r44Y0iBNHTKo8vK/VgEf5Qot?=
 =?us-ascii?Q?AVGJEYf+M/uw7UhJtoKPDod7VBhKRX1V/Ve+kVRhmBf8Yc/Z+Kw//j/68Huh?=
 =?us-ascii?Q?XjQ8aZ4Za03JIZ6hbjP/VEE1JU5kUmyG4i3LTm6UkVFXAgoH2VdjVqOvAk4T?=
 =?us-ascii?Q?PMdIqLQivjEoROGvcDuS/a8k025odbWe6spq2fh6gHm01RuTv2IymWWmpZWi?=
 =?us-ascii?Q?ZwF1DmHLgP25zSerfbv0R2NfzKbb3t7KTjydgzlVIqAwLYbdHpkMkk5q47ja?=
 =?us-ascii?Q?S3JpsUwi04Vg3czYQG0bHAx+1JMVgSENn/M6C2Y1SbEhPVyRvzQZWPP7lHmH?=
 =?us-ascii?Q?QJtce42YPyhLhrUaUL/WOSurm4gKneFX8tSfXE1icAVsnBnjCXNhizb3Yyeg?=
 =?us-ascii?Q?WUL4q0SXiOsTDi+lbDwzDpQ8BJVCDZYqxHFqvB2KqJQOxmpAaf4VLmsMZ+yT?=
 =?us-ascii?Q?aywtj1YgNR/xUoy6L2JYZTZ/6wWCV5Hc81RrVjMPDxdynr2Y7fM5H4RNaNOv?=
 =?us-ascii?Q?Fu2MV+0ME+fN1MiW/dPcFC/6To1H639wzH5/n3BmhoKC2m7tJW14NxDopaaE?=
 =?us-ascii?Q?0PlTv9jwLrmLhrlIxHd86q4E0fDDLKPSRw2X+TIpw4hAsJP5A5J8DNI03bIA?=
 =?us-ascii?Q?W46RNJfUC0Et6KhyyQSNzoamivw/ookcMQ5PRVkRC/+7K60CkWUxeINsE77z?=
 =?us-ascii?Q?uVwMDuGlFdfWU/c3SgOWwYBgz/RRjSxP4O+V+fM0JD9TKuEJpP+deNBvo5B7?=
 =?us-ascii?Q?mjwomAylPMymQwm2n1vSv2vvGkjJq3yz88Y4jfyVzEm2xXjJq1yNlsBkNJjF?=
 =?us-ascii?Q?lePGVdRAx6gJRTSME+X6c4G6Q3YpfciIdN/KNZsolm3dJOmoJ+5l8Yx/HXEe?=
 =?us-ascii?Q?/e4P8BaCBV8gYHZEH09iar8XimjUMMKN/jmjffsMJyfaxr2RZBs/NNLfOg2k?=
 =?us-ascii?Q?0BsMgInXf4/l7Z6784UIf8I0t2n9FRHdsaLJwpRT08tjjRVRBgUof3Ck9Yj0?=
 =?us-ascii?Q?VgXbMvhXio/MjqcITkGeiTe1YjlQu+2RT/T7MniXk7dJKlCySIr8TlwGwFHM?=
 =?us-ascii?Q?uohuLUcvytT1Ne33+hOHycMNZHqk8Br+pGY2FTYKYPBpVbOUNJsz8kpski6U?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23e15d7-baed-4d93-1fb6-08dab72f370c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 08:51:04.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdOBCg/IXmzV79QBl7Pp1yPt+TuamWxJthdBUKDHJL7V9AaV7whiCGekrTXSvsTHYKUpPYxKOY2YlpVHFkruh0K6RNszj/ImHDf9OiUeVL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5686
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_04,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210260049
X-Proofpoint-GUID: LxaPxGOlBGj0Crcg_XaMeqO7ynMlUEse
X-Proofpoint-ORIG-GUID: LxaPxGOlBGj0Crcg_XaMeqO7ynMlUEse
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 26, 2022 at 03:24:48PM +0800, ChiYuan Huang wrote:
> 2) normal register access with negative length
> Unable to handle kernel paging request at virtual address ffffffc009cefff2
> pc : __memcpy+0x1dc/0x260
> lr : _regmap_raw_write_impl+0x6d4/0x828
> Call trace:
>  __memcpy+0x1dc/0x260
>  _regmap_raw_write+0xb4/0x130a
>  regmap_raw_write+0x74/0xb0
> 
> 
> After applying the patch, the first case is cleared.
> But for the case 2, the root cause is not the mt6370_regmap_write() size
> check. It's in __memcpy() before mt6370_regmap_write().
> 
> I'm wondering 'is it reasonable to give the negative value as the size?'
> 

Thanks for testing!

I'm not sure I understand exactly which code you're talking about.
Could you just create a diff with the check for negative just so I can
understand where the issue is?  We can re-work it into a proper patch
from there.

regards,
dan carpenter

