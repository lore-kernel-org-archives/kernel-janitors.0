Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FDBC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 May 2022 17:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240876AbiERRdG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 May 2022 13:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240875AbiERRdF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 May 2022 13:33:05 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3CF1DF64E
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 10:33:04 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IGewWc004907;
        Wed, 18 May 2022 17:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=iQvp1uMpQdL+/KBI1KAuPFV30v9wjX3zHCV3mIiHcUk=;
 b=rU+kiesEs6k4RrNPuz5isFWWP890K5r00AdFTn5pjXM5v4/OoKo6frSDVCUqNbjIbcEK
 F7NcJK7o/DBJLJrN0DWqknwx91CCYXS/W9S2k2UuVE0LkJhOrj967ZAHGlyw7/YGba5v
 +gyTfipSwbKhaxcoOmO0L4n0iAZ/0da8PRATaGqNivPhqkK816JqdP+Xf0pzJobejO/m
 ia85oFy09zNbaV7WGlRpTNQ2f+2bVa6s6vaPVZ6O2cguKvhpjpqkEn6CTUgokTB1X5St
 IKkWOe6XKdCM0eODrJgADP0yI6DVM4sqIVNYETky56W3KseXwdK3kC4TbM0UAo/dg4O+ rw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g237226w0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 May 2022 17:32:58 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24IHQ1jZ005605;
        Wed, 18 May 2022 17:32:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22va12su-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 May 2022 17:32:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLCVZko6g+MTFfRV6XQ4HjQUhz5csLWqWb8NjeRx/BhrlxQaJZHNtR8/XMZDyqzCEzr7qwE2PY1ruHxILCTgzqr3i1QX3lYxxlGRISa2lSQcOyzdfPLAFm0QlUNfcjGdw8SPUMMxHeOwLV33KEWgA/HiNGnU3mUoRzZOVWsATleQdxuLsthspggXpJI8DKsTY0lCWuvz+L75lxI0RAQvnr47Dc8OX7R7TETaze7boeRDBxGP20OQ9lRiM63Dk3w1AOdNeNMBAtJmS/ZQPElXcS61vZYUQ3fm9iujZ91v4IufyR2XG/OExuD6VhMu/00+63WCCeSMlv8JYRD2fXCPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQvp1uMpQdL+/KBI1KAuPFV30v9wjX3zHCV3mIiHcUk=;
 b=Xwr9eHbH14aViOP3i+CVuSDtmugXuNnUyAZh/cQC/ZAhAxkOsPprRtovY9GS3RWT1I4px/lIQNzwtfnxkMkQK6VM2/evKWCca0RfIWALzl14S3YT3oVQpzSWtUYDxq1wleCeCRoEI1ESPpYZoK7mOQRFOcx/3ra4crcQ/L8+X0thpmgUa4m3Q2orJlfoZ3Qe20hdK7Mp/V1RVX1yN9S1skgQiVG7K613kO9/aJiggXAx3/vo6QqLUDAtmo1z30wdiEzkuBptqdTz3pxhOYNEIR9xeSI/TUs8RHFf9OI9AXtMwnoDq2Q5oWyjKswDTRBBGDLpUTBRv0jhcv3Xxr179A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQvp1uMpQdL+/KBI1KAuPFV30v9wjX3zHCV3mIiHcUk=;
 b=NZuvP602iGNImLY70jqzP8UVToAVcgC3i8NUdfkVOBtzdd0LMwrgAHvxKCz+VXVDp7cTpUssUJgeIBWokCyIFGLOiAEhm9092k/rRvF7qM5QiS3m27dIyhXhkQX8AhuXABqtwFpOXCXQUwFdrS+z+9xWVVhNuz6GkfPRzXhcmWM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1927.namprd10.prod.outlook.com
 (2603:10b6:903:122::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 17:32:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 17:32:55 +0000
Date:   Wed, 18 May 2022 20:32:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ricky_wu@realtek.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] misc: rtsx: add rts5261 efuse function
Message-ID: <YoUtvUqoRiRyRcyy@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0192.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cf84a23-5cea-4595-73b9-08da38f47135
X-MS-TrafficTypeDiagnostic: CY4PR10MB1927:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1927CE27BC4082159A036BA18ED19@CY4PR10MB1927.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a45eS3+eGSf9cdejO2sp6ZHEsisvT9GXmFZM72rciqUah+HTvc0/p2DtNegUFuwj7I6K1gYCvWyMQTkvukM1R4hGm2JixOZWiPjZJb3g2N7mmUH8ZSAQ6WtG5X1M6Tyg7Y0XvSdR9YBG7p3mLqWXYAgs8JH5hR1yiPCMlhitwsGdmZVsvBFekoZDFC1qGUMZxUIVosJf7H5hU1J4hVNI2kRco8/6bIIdqC/aNkjQTIwGhGBleMoAQAzy8VmCFYd7zHaBoeI/LSY4fIofS1H+n65FS3iVZn5hO4Soh+k4ajxGoftv/Ms2PhvAkYUTlLEYqZYdXj606/QeykSeyWSMn8gLnqwI0dfDUdyKWBDCpff9zvbDRH3oZS5CnuiaqK0PdGAvD2YF/vd1EhO7wSLvC3Ss0L5vU2sC7hWdq4L4BQkF//RzvlZ0e6oTfBnoKWLzF8aMEqW87RSuohVV3lPVi3ppicYHTKsZ2S4v+QfjjeuvoQwRMykfOmB0VotSi9JaJPUg6sXrIZRoJ1nttYEd6hZInlj2Dc40PbodZuhCcioE4SR4+2Z1XuRLrrJzerHk5AV55tM7DoSRjfgtuOtZ9SuLDzX03hOhIFH2c6wNWh2o0FWvPIkrFUZ/tjs48OIj/ywtNLB5fnY0qXzXZpMI/tq/f6G39nWf8cpolYlTc9adomMYwIW5nZcnKtd/wLbcJRpLrGUBJE3+0JCCSIvx3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6486002)(52116002)(86362001)(44832011)(2906002)(508600001)(4326008)(186003)(6666004)(66946007)(6512007)(66476007)(38350700002)(316002)(83380400001)(6916009)(66556008)(6506007)(8676002)(9686003)(5660300002)(38100700002)(8936002)(33716001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zU59cVm4I1WtUE5v2JV5uGp6EzHKkPZlf4/iiYU2F3IscOT6P2XcJsynqt+T?=
 =?us-ascii?Q?JjBFuoen3YsOcfQ1lhax5tz3HbdeOFETOY4msXstO+oDu4SkRA2hOD4/v1Td?=
 =?us-ascii?Q?eGVxcdTN1SKRHQ2A/qJo5Up7XFsTMEOmcdY5QesLmpuUkQZm3hxH8COCRFYp?=
 =?us-ascii?Q?dCzbIrt1TpU3t3TOTMjDxcW5gn6JMZvTzx4L7aw2NUMlGoRHpXPXdeW20LiI?=
 =?us-ascii?Q?rbC8Cqh1ByVeOh1sPE3NusiXkhaV/l5aDBobb5fD7wFWxhXtWPlMz27Xr5ba?=
 =?us-ascii?Q?o18mCjp02lyfjCPoFNX9B6sgJgXG/iBFFe2kZAEDUR4gbLJekTZddADkfL23?=
 =?us-ascii?Q?UcNoSJoVAGmTldsw/Bp+oAHy7RMd69mVQf6WolIwaIiCPcZGldap4Kklg/CY?=
 =?us-ascii?Q?eISKL4AZlCjqtWXRC+u/D4QSYc8K0B2V9Rq1gmuWv66qh9/H/YbsBcK+9HoM?=
 =?us-ascii?Q?ObSWGqOWJ+OMs19cNcO7j7wfXoHZZN8EuiDexciSTbEUNxzRoUSC6+Tiu40I?=
 =?us-ascii?Q?CBXCaJakGiZh28xS8uOmhzNd3jHlXImfeIZQvw1sSfIeZjmmixoigsDfAPai?=
 =?us-ascii?Q?kKViW20SQL/QJ8aMndY1zoYG6VI68YkbgwRSEMocWUUurMWohunlPSjpA82L?=
 =?us-ascii?Q?BjgGQOFQpDJaofZ0eVeAoiM1hSpvpwjNiHZO41rhssvHzZWFRKiYPuuKjr3J?=
 =?us-ascii?Q?yn3PMWqBY9C1T10WC9oRX0sHQY2Zx8I+KR+qLfaGKPXzXzfWxLDftt0ViDna?=
 =?us-ascii?Q?3syTCu4xEwHaUll/5rqtJdndxU9c1lTW4hV+DwgeFFtlwtLha9ls1rX53IxJ?=
 =?us-ascii?Q?FFSNvZuwCMQVcZ6rKe9kfxasbg5dL80T080TRD/zTNbjQPgACqF+xt5SzMGF?=
 =?us-ascii?Q?saRza3UUPP4Sl7GaaHcRls1UHkewe1SWPDgXrrafw3yZx2Aj1a+RIkEiakPV?=
 =?us-ascii?Q?TVihf71Yt98128xxrGn8shYhqQZ2ky3ydevU6ANd81BhcXxs4kd8GrbxPjv8?=
 =?us-ascii?Q?7RyFE58Hak4qFjgvIlrOh4AxFxaQdMBSd8YuWH2CCmmzBxR6m5pVH4PCsFV2?=
 =?us-ascii?Q?nzsdLE81U7qZ14PPMxS/BupzwQ5I6w0t5DdKIFeSy5mC9zjKabFRh4GOL2Zg?=
 =?us-ascii?Q?0pIkdEz6Ymjd+VIKceEE1tO8QZ0Kmxe5LsSZ1UlziscPbQHn2TF5emDtIi0S?=
 =?us-ascii?Q?6W6rZaba3OJ8Wgvm1NLSSMWERziHiHagHvhT71Ov/zCGzj1IC+c8tImiAdY4?=
 =?us-ascii?Q?B/Wj+Q8pfEB8ZVHxnVz+GxmeZCwXGOt2eUxKTgkJSBCx08QHD9h0P+paqLii?=
 =?us-ascii?Q?tHg1c5CzHyz+wH7zcX5YCk40+koNd0X2dU6j1D9V5ln5R8iZ8sn5E3AOG7/X?=
 =?us-ascii?Q?Ao3GRLNiP3uZkYku7zMr7XrVwx4Jqev/K4GtuVzssik1HtCh4Yiuga8qKF2s?=
 =?us-ascii?Q?uvnVY2gjtAzbxFVleUYBRHcNupzrw5UgJP8IzS+4Gl4dglY19hBsOZ08eruv?=
 =?us-ascii?Q?+AdpIyJnAHDYzDMRNhzgqTmyewFNPGPbV7C+DtoMIRaQlpeXfi8zSjDoSX0u?=
 =?us-ascii?Q?RrwAQpBrz4+z7v96APgJVENBaFExfTr5O1OB7sLTPeHm83SMwQmDCClSmRR/?=
 =?us-ascii?Q?L0z5iVP/VEhg1qzxC9V8o/bpzBKPCWmwoeWBoe6ix8GfZK/dIYjL1cCWguCM?=
 =?us-ascii?Q?FgkohJdR+UT6CAYSIEt9e2jFIMAuw2WsAoxd3dJ+u2JeYxA5ve0IKyad1uEF?=
 =?us-ascii?Q?tRcgB8Nc2TiuAvnp759jYy0wQVFWv4Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf84a23-5cea-4595-73b9-08da38f47135
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 17:32:55.0725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVE7VVy1KUuheOcMRMXOFjUIIqk9usL6jTYBhuUfJsv2D0Ce0sHu/mOQf9V0YgOw+X6QGVhau6hCGsih6ymS6cPm4YbKRstK8/yiCg2arQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1927
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-18_06:2022-05-17,2022-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=830 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205180104
X-Proofpoint-GUID: 743h993RvIeul2j7mMl6bWO6_NehwNqo
X-Proofpoint-ORIG-GUID: 743h993RvIeul2j7mMl6bWO6_NehwNqo
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ricky WU,

The patch b1c5f3085149: "misc: rtsx: add rts5261 efuse function" from
Mar 21, 2022, leads to the following Smatch static checker warning:

drivers/misc/cardreader/rts5261.c:412 rts5261_init_from_hw() error: uninitialized symbol 'setting_reg2'.
drivers/misc/cardreader/rts5261.c:430 rts5261_init_from_hw() error: uninitialized symbol 'setting_reg1'.

drivers/misc/cardreader/rts5261.c
    383         rtsx_pci_read_register(pcr, RTS5261_EFUSE_READ_DATA, &tmp);
    384         efuse_valid = ((tmp & 0x0C) >> 2);
    385         pcr_dbg(pcr, "Load efuse valid: 0x%x\n", efuse_valid);
    386 
    387         pci_read_config_dword(pdev, PCR_SETTING_REG2, &lval2);
    388         pcr_dbg(pcr, "Cfg 0x%x: 0x%x\n", PCR_SETTING_REG2, lval2);
    389         /* 0x816 */
    390         valid = (u8)((lval2 >> 16) & 0x03);
    391 
    392         rtsx_pci_write_register(pcr, RTS5261_REG_PME_FORCE_CTL,
    393                 REG_EFUSE_POR, 0);
    394         pcr_dbg(pcr, "Disable efuse por!\n");
    395 
    396         if (efuse_valid == 2 || efuse_valid == 3) {
    397                 if (valid == 3) {
    398                         /* Bypass efuse */
    399                         setting_reg1 = PCR_SETTING_REG1;
    400                         setting_reg2 = PCR_SETTING_REG2;
    401                 } else {
    402                         /* Use efuse data */
    403                         setting_reg1 = PCR_SETTING_REG4;
    404                         setting_reg2 = PCR_SETTING_REG5;
    405                 }
    406         } else if (efuse_valid == 0) {
    407                 // default
    408                 setting_reg1 = PCR_SETTING_REG1;
    409                 setting_reg2 = PCR_SETTING_REG2;
    410         }

What if efuse_valid == 1?

    411 
--> 412         pci_read_config_dword(pdev, setting_reg2, &lval2);
                                            ^^^^^^^^^^^^

    413         pcr_dbg(pcr, "Cfg 0x%x: 0x%x\n", setting_reg2, lval2);
    414 

regards,
dan carpenter
