Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2721DC433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Apr 2022 15:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449504AbiDVPuE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Apr 2022 11:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbiDVPuD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Apr 2022 11:50:03 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BD25DA17
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Apr 2022 08:47:09 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23MDQLF8014729;
        Fri, 22 Apr 2022 15:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ill76KwAWiA8LaptnYKpRW8mwDtXiJcRERxJnHhuVpo=;
 b=RCm8IR0sxY3p0yrg7QpJuqYoUuBiaQHZt4bVM1HInow2utTf/Stl8o5pT8hFoWfIrfFD
 3PvSkIqX19yd4kusManRfyZuJ6uGprVPCydX8VNYVL45GCp4NAisOj0M2Fv1IhV4IRR4
 AjfQProk/Rk/w68yyuUK9+a0Nvzd3E/anKAlCkYgJdUBOsfFdASM5wn7bLpCJyB9oPIj
 YawaLByGJiUt7AORJK/ABTAgd2mL3GCtt2NehK67N5Qnckyc6vuw9c5T0InyJib9+3EA
 D0/YPiM4ehNgf2lZUcVFP+u8QyP/mu448lBBn1ZoyA+EMYf1Mg5aUfpZq83NDEj7IX4b iA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ffndtq4xt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Apr 2022 15:47:01 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23MFeAY5036141;
        Fri, 22 Apr 2022 15:47:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fkw6xnj4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Apr 2022 15:47:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJSHzulaWfdyjHrparRdYR4TABlCo2Y9SY1xBD/FTB3EbqED6qEKk7ZPWFNhsEmv4O9ih0DYbV1/VjF9WTxgXAaD7zGH75cmEEc/X3XTkKZOKM34/mh23iQ6uWbuCa9+6N4zRkg1R9ECL5M/TBXcKm5ubW2p1oLGst6P47TskaPvcKkqLXJjSQ8Uke68yFZtid83o3tVwDfclRgAVQanwEQTKzTDMXwDmRI08U7i0eMytTKM8zLcx2wrXL0jlHMaSyAJvF5oxG2Yr/5Ge0tSDFLy5Pcq0l8+vGSeL6E6a8b2upi2BX8fD0OEzgtsLiVze3Rn7UDIetv2mFzbJKx2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ill76KwAWiA8LaptnYKpRW8mwDtXiJcRERxJnHhuVpo=;
 b=RyKh7tlGlSHVHo171BbnDq8oE4HNOoYlNZkLfuQtJQrIM+TyhCC31fDJKY63ummBsDfJ8uB/03eGVdidPzkKchwZDyP1LdQzEkft5R4Zn0soh5B5JJKLZLRls7mp4uRWy6yy0jwhz4vcwoU4q5NInX5fhd+gQMdiknCAhSibeVrbdo4y9vya7ktgrgg5boGy07WgPSijuRFivW+0Y8BdPfy3T26BNASZqeCFeP9uNeYGot3gAPHvKpQ/98cT/k7P/9UsTW7No/Sir1G5gm1r9UPzSp70Qf3/18hm9+tnBf+41RJKFQVNtxf7EKi6tZ6RlxRSbeu2SF7XsC2E7GGtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ill76KwAWiA8LaptnYKpRW8mwDtXiJcRERxJnHhuVpo=;
 b=ay1wxejp5dIwUAONcCur/CRBKqefJ0kcy8s5v+aR5A8g+mPE5O0ydmr+XzyW4Rdg8rypb+NynNXIAb22bElSMWlAgql9R4h8zCrveDn47siLU9ralZDCaOI1xy/cVzd+aRHU7PVnOAk8JcxdDy6/Hpb5e9CHrid3y8IexTqkgCI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3732.namprd10.prod.outlook.com
 (2603:10b6:408:be::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 15:46:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Fri, 22 Apr 2022
 15:46:58 +0000
Date:   Fri, 22 Apr 2022 18:46:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     chenhao288@hisilicon.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: hns3: add log for setting tx spare buf size
Message-ID: <YmLN5zB2iVpp/qy/@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189831d1-5fee-4df7-e868-08da247755a1
X-MS-TrafficTypeDiagnostic: BN8PR10MB3732:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB37320FC4DDFBB673E5401C1E8EF79@BN8PR10MB3732.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fUX6uNzNZfAO7apCqC9UMzQtryKU6YB9iaSVKTQTVKokAeswz22hmeSoxAFtVx4f6F+qX7ueIUL+cFbsceWEsTaXWDDF4MltJ9Gv3fJkl8EZUZTBdtdBxyzfcS+hc8+f+z2kIVpsLb/o0DWwONh2fbU76YOMxHiozyY401tKrER6QYvmVajhG1eiBxUAaqLDRQmbP+WvybELtdHUpnl7oIdwcM4tsKyr/xb+TYs4+AlmI8BawN8wTwbj1gOAuuLEjq6SW1W6tL0rvLU0fOzqAJOi0x8bI4t1PDs6ILUadFnDOv6BNeZ5aI/je37UaBPwsw/OFumvT4I+dqKw19fK8H5YzTGm9sFL8qQMFxkoJzKf80VlHY8+njVYDmgg6/PzLXdi4sWNtcD/RngzuZvCD7//kuZMm6AU8hMn4NrNiFhdVb+nOo0XWli8TW7+d3REoPtI5OftO7Cz4vQ/B5eRjYQCrx3MOcVtLhGFfNf+dhQjjXyHfNRKY22YC86jw4ZZaMhJPJR5b+kCh8BRm93XmrWUkkcphGCg+iwNtcJFaMYW3tiBq1gZpSoiYD8i9G4pVADJx8eScuCXRtNRcT6+NOEOblfvV1VmFVLpNk5CrVcCPNRwwY8c2NOdWpOecerCw8gIgamrW+qQPVVDpP6grRnTvnailWMhsaNEkFM8F7Bk6/LJ80hdwxzrUFXxPyO2jTxyC5awD1GCS4bLXBbhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(52116002)(33716001)(2906002)(26005)(38350700002)(4326008)(9686003)(8936002)(6666004)(44832011)(6506007)(5660300002)(83380400001)(66946007)(6512007)(508600001)(186003)(38100700002)(66476007)(316002)(86362001)(66556008)(8676002)(6486002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQnWQ+J/O3FZiB2JNlFgXMfoHKyGccSn11/8VLLRFGKfBt5XG7NFG5ALMJGx?=
 =?us-ascii?Q?3K1qlHFmbAOPeBes7WE1a+8r0SLnttt0laB/iG1XdY+wW2ZsVm5zOuRl1BZw?=
 =?us-ascii?Q?clOXzqbpq+f8L7MiuvmoavsQ1FU+nACE34DU14hQA8QAK4xRbaX4t0lYStLt?=
 =?us-ascii?Q?kFNd7nuMiuBzRo9NuPJgRAd7W8i25vFPVPJUzudV+r3NdLzfr+BbcbSkjPIU?=
 =?us-ascii?Q?UJIFZlGFsPgM14UN9Ozf5C2Nd/hYWFsxbLFWgnP6h8Ux73sxdX0JNUtf2bzo?=
 =?us-ascii?Q?iZhlMZAnUL/dLZUZoc8MEaf7LGatBsNSitlFpGMHEOPcqKhbpS8YSQxzGTf6?=
 =?us-ascii?Q?3HuNOL3rZ8JTU/xp42z4468BpziEi4LXQ6Gt1qhHGFGtLocYNmjCfLX8I2fq?=
 =?us-ascii?Q?uh5eA7ok2zPqsLDahVH+ulVy21se72DeozegnYS69GtJNldri+l562kPt916?=
 =?us-ascii?Q?AAXxIKYQiuH/B1XUbbtf0S7kSu7SusbOASF5dzdmnTplojOl1hQwuF5nh8dz?=
 =?us-ascii?Q?2tcH/7FiVrWcQQk1avf+IjisA2mZKLmb/aUJmwHiAz9aIp6P++69vzMW5PAb?=
 =?us-ascii?Q?+dFOC7S0EDm32YxPL6UlC6A3BfMXlW+QiezyeSU5XJYhB6mZGZNojClFiTLh?=
 =?us-ascii?Q?mJnCl3BK09HauEbILapVGPmdxg63ZTTTmzh2S7nThq35Ik6yMGfUL5zJHvIr?=
 =?us-ascii?Q?SrHznQZqT5u15SPlIbGC8A8jWQRstdeYW7pbMthX5M5oqxsGSDN/gqj6PTWp?=
 =?us-ascii?Q?cvbUJlPp98olek9Cn57f46/J3PavfT+AbcMRC5Ef74GpLN5NjeUbdygt3+u1?=
 =?us-ascii?Q?ShQNHy281No+mM+u9x2/F/SkOvRLEqEQUVNVqUJIXK6kjktUQVzhc00bRGnE?=
 =?us-ascii?Q?BWQ2FXYE9r9Y6JwrO8TVsj/vUkHd7Ig7kiE7ZvOCgbGpMtmR9HfdC4OmECRc?=
 =?us-ascii?Q?tMqw82Pu38yAQwlmWiMFyuyFySp54MJtuhWmD3gL2i02jogfeHHKmQXQPbz6?=
 =?us-ascii?Q?X/sW1AyJnYE+7kB7jkH2sGsZgSkza5l10O1bfHVPWJjDc93De85kLstHnnwF?=
 =?us-ascii?Q?gxK4gzz+Ozx/aHYfRK+pobUh+XP1+4FoZF6V31COdGRXiM7MQapolGpAHMBA?=
 =?us-ascii?Q?EcULjX3IRrkEvz5x3tDWikiPEAFgwCEJddPbMeDJCCJdbeHuiX49+rRv/IMX?=
 =?us-ascii?Q?qEu0dmoUPbFz6FkobfKvXJMNazfrf7uSGcwEP7X9fxKGFJHPg4sA1r8M/C8w?=
 =?us-ascii?Q?GUykeMjqT6dlsYbF2xxR+wRTjmpOOGo/WjnqTdOIsCO4D8b7JFizeVXqOGTg?=
 =?us-ascii?Q?BMhP0/KsTgmZHolAL+lWrDN5lGUUCatNUgyJPw7yhQoCCcw5g7g+f03weN/b?=
 =?us-ascii?Q?6xNcLnZdVR6kpWdtS4Ragv4FWwMGuFXAprCcbbGYXFSSciVixzh9dHiH8GAS?=
 =?us-ascii?Q?5wH96P4CRFHrH6BQEvN1wYwKLG+2j2UF3v3kpu2vygVv7SXAUEGmCFqFcOqG?=
 =?us-ascii?Q?eFW3LSmTB0MivAZFSxIxUZrpvu1fvo0YR4CS1f34ib4g0rct4/OYu4onFV+R?=
 =?us-ascii?Q?jaIaH+/XnpDZK6npX2F+RvHz7gRidWgiCkwA4Y6XKfDBmykxBI9nBIIUN9vg?=
 =?us-ascii?Q?LYrccHQwJRK3zoJftiz1LtToJK/GMHCTRo3zkiAeTA7LYlBymgNdf+uXZDje?=
 =?us-ascii?Q?UI18+8XX3ZWkSr2u3wWf8VJaxYPqecj8cm4UWPUbgsZTjhGagMQfpiQj1jzI?=
 =?us-ascii?Q?99Ob9EyzMjbB8mNTafb1GTxFeXta6oc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189831d1-5fee-4df7-e868-08da247755a1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 15:46:58.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqycfXZTX0aBc1lBRMTl9OtG/epBUIvskCUD9OenWpKHYlF4CHbm+Zot78UK2rFqZ24TWOpSZ51aV+0a3Eov1SpC4ieER9S6DjxUdJAhBwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3732
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-22_04:2022-04-22,2022-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=587 adultscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204220069
X-Proofpoint-ORIG-GUID: N5gEd-t9rtdFiQcCygkhHhQXFQ96LHyP
X-Proofpoint-GUID: N5gEd-t9rtdFiQcCygkhHhQXFQ96LHyP
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Hao Chen,

This is a semi-automatic email about new static checker warnings.

The patch 2373b35c24ff: "net: hns3: add log for setting tx spare buf 
size" from Apr 19, 2022, leads to the following Smatch complaint:

    drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:1919 hns3_set_tunable()
    error: we previously assumed 'priv->ring->tx_spare' could be null (see line 1904)

drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
  1903			if (ret ||
  1904			    (!priv->ring->tx_spare && new_tx_spare_buf_size != 0)) {
                             ^^^^^^^^^^^^^^^^^^^^^
Assume priv->ring->tx_spare is NULL but new_tx_spare_buf_size is non-zero.

  1905				int ret1;
  1906	
  1907				netdev_warn(netdev, "change tx spare buf size fail, revert to old value\n");
  1908				ret1 = hns3_set_tx_spare_buf_size(netdev,
  1909								  old_tx_spare_buf_size);
  1910				if (ret1) {
  1911					netdev_err(netdev, "revert to old tx spare buf size fail\n");
  1912					return ret1;
  1913				}
  1914	
  1915				return ret;
  1916			}
  1917	
  1918			netdev_info(netdev, "the actvie tx spare buf size is %u, due to page order\n",
  1919				    priv->ring->tx_spare->len);
                                    ^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

  1920	
  1921			break;

regards,
dan carpenter
