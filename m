Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93289C19F28
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Aug 2022 13:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbiHCN6G (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Aug 2022 09:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238436AbiHCN5p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Aug 2022 09:57:45 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A17CBE0B
        for <kernel-janitors@vger.kernel.org>; Wed,  3 Aug 2022 06:57:36 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 273Dl0qs011911
        for <kernel-janitors@vger.kernel.org>; Wed, 3 Aug 2022 13:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=tOeOR8qyWKyvwqv6KbD2Dml3dEWNC4I+4/5PRZFGgx8=;
 b=KS0zB15PJwyQL+6slxWIvtLv4ddW/d6lZgXPKBmLhoqaxLZzhtLUlVXY9JSD8AELk3bs
 +f2VgjFqPBz1gK49c8zrUdY/GQCbCOtnTCp2IzIFMx+j0caxE3assBdCvTCuFGTBIfYI
 /0CHWkHWWBdjNbxPD0lfE4RKWy7Nx1eNu3BjAnwKtlBBTgC+BAjcciZMipq2O4sdcn/v
 YY3fVAOQZsMgWvHFAhq8/1ljQ8n5JG+i4ReEyKITHVgP4ast4in1cdaxHx7pCQ8gWijp
 cJhY3WwH+0Z6/S9RyNhvzClqxVYXe6RYhT2Y+6/twr69OjnEKHmw+LNOmTcEDYlTRCKV yQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmu8120aa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Aug 2022 13:57:35 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 273BGwQC001458
        for <kernel-janitors@vger.kernel.org>; Wed, 3 Aug 2022 13:57:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hp57s7f5n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Aug 2022 13:57:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEbc5V7YhmvdF1lNNgtILWK7NgnILamK0ghYQmB/rYeoPfslEqVCA1Qzn+GnmJrKW0zwbGHGxPlot9MmARwcNO8uJD0KTkLvCznUPL5GfMjUWnTBtzKuEJvPD7kjexlhjnC7PvKn7f7kaKUBDh4zZN/VO5rylkm+lUPFmrUYtlxm7Zt4f51xrnzv8yyES6qiFHZfc1J1/uEHH2bh+InNoK0HsP05aoN8P3N4zI5FPo8WEa0S2Ju8ED1iyTbMD6avhN5wX/6Y9OnqQEf6Ar4+LCd8jK6lX/zZTfYod41R0hheSKpQznMkRnkLPxebx9ddrmsI9DoKkFkj3dlDNhcnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOeOR8qyWKyvwqv6KbD2Dml3dEWNC4I+4/5PRZFGgx8=;
 b=HmEzEcJLfZP5tj168y9djzSGDjAOOIGbAEiwfH39B388Mhe2fBgE0gLeiksHNuMj2dIk2qkXKniYnmu6KQrPFRf4IRoVlQHPGrPju7LsC2m/mpKyfpwywNeB9AbjEkOoQTuZ79CL98mjoVSlLUSKJLNdbVn8xjU2Ldbe3bWJiZsccUz3X74cnqwOPMg07l9KEPhUXCB/HwhYgicDH/RJKsy8ZvNzUjnc9UkSStoPSrJ6pNsCT36Hgx7nozm2riGNkkADy1dmUKarblC49t+PEoEhWcKGLxX28PEoW8hv141/rgcPN1DeirXIXfYZ4N/oMrXSZ5Ipmpdy8S/EqROTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOeOR8qyWKyvwqv6KbD2Dml3dEWNC4I+4/5PRZFGgx8=;
 b=LFQEKJJv+j90iYbLw5iyGNKN4H6S7ws+UqZNiKKL33opVuFjS/RBHKSgdgUOaOzTHlyM6yP9CtEUSIHa3P6jvyP1CJ2W17abu+GQciJiBRZDHOr+PCn5+9sXEOWNzmqlnZrstPigxSIhY1nd1XJmRZUUHVFonKmUzfldquf7HPQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5833.namprd10.prod.outlook.com
 (2603:10b6:a03:3ed::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 3 Aug
 2022 13:57:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 13:57:32 +0000
Date:   Wed, 3 Aug 2022 16:57:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Foglietta, Roberto" <roberto.foglietta.ext@siemens.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH]  ww_mutex_lock/interruptible GPL-only exported w/wo
 CONFIG_DEBUG_LOCK_ALLOC
Message-ID: <20220803135715.GE3438@kadam>
References: <AM0PR10MB20207EAFEC027FA5E3605306AA9C9@AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR10MB20207EAFEC027FA5E3605306AA9C9@AM0PR10MB2020.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0060.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56557ac0-3009-4234-566c-08da75581c9d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5833:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5yOUA8Ytt1eg8AMN8acMI52eP4sEsayADkwkSHxbPuTx3UrQ3zFmyuixgOdaYMTbzKl4aLUMkdB/HMY6L7HEnWOn7bKVQWBHNMSd4W+ZF4u1TFJcyYMh0fCv5TCU2fghpq3AFtD017fYNawbUqsF/6L0fOuEOqDKCHjjPyYF9YLrD8hHauv8PwSlBM+ov7e2slyi4eSSlqA7nMtNV7gYqEN2mTdngu56OcGEpNuACHm4qlN7Tqt3ZbkQ/xT5/bcngXCrn++qhjsNQkg1ZE321g0NccsTO6GyXtiGjO+BpdTwSxQY0KhgOMraFgIxJvc8LwIiNvg/319adUR4sH/cxZ/s5qPSCIUyf8j71PiW09V71BdrEqq+VaNZOI0MpKscMzMXxQzybl+GzWdtKzvSXfmg9taZ5Y4cb+t0OMPwtQhAEQB+g8JAOK1RXLgyYtTp0/GKMFy3bvFVv+9k3AFfDgvER0ALD029UCEoOB/NbSbC8bo4sKbt7Z1bUFCZs2LGJAcSq+ShO6/fbX+LcCcrkAs97Mh2bu1m3QCkUhkIkfwRlQXJmFYVsTbs9p+hi590OjbgqUDAGnPHYiCkd3yq17XAJ2wWALKQxG/vu8YdxhG8Brgp2qcd3f6+MkkRr5KHuCfxRRggrgARfirW0j5ipB0Yn49earZ/pRdIYKhhizzsm2LB/gy+slhwPV0p3ymPNpjrKtX5UIwEWO6jG7nPkf2BQDv6AhIwyJuKpiUU3qEjF3Zi6qOyrjyAyqXEOzJ2YRm/EkA41Sr/z/xusTVAbY2jy8PbZi8HrNtZg+jmoljlALI3RRkv/z15SKc14oI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(6666004)(9686003)(6512007)(26005)(478600001)(5660300002)(41300700001)(86362001)(6862004)(8936002)(8676002)(66946007)(6486002)(66476007)(66556008)(4326008)(186003)(83380400001)(1076003)(33716001)(4744005)(44832011)(52116002)(38350700002)(2906002)(38100700002)(33656002)(6506007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RH3lmFtbM7clyadYVklSDqc+0TCfv47jiO/JqxjtJrlMy4Zc7KQN8Lql9BRJ?=
 =?us-ascii?Q?v56mL4aoxFeEkUSVUmg5yDFcJ5byhmt7w8v7Nnhe4eMimfQozoc6Go+QY5ng?=
 =?us-ascii?Q?QwHbvDIqDfzIMlYFCSz+7hXNCqDgBeVHdVFMAQuX966P9tME/tFuTBVM+aW/?=
 =?us-ascii?Q?62YoAYkk3D6rlyZAC0nj0o08/hJm9YC4R4xsOuwG2A/Vu7JnGa5a5Q9zZJ2m?=
 =?us-ascii?Q?pZwKYL0dRXcLfHnGsxq0vOuEE0YGLo3GBKioTMxtn3YX1IUkPZkrP5YOT8D6?=
 =?us-ascii?Q?ZM3KoOuoQp5Iy0XYF6HpSnlmJYYtM/8eVwcl4aJUyxIYRgD4hw8ZWOdCC9aM?=
 =?us-ascii?Q?sGHyLZyhhi6F7xSWYT+SsPFtZkrVa0PurC0ptKJcRFHDq7B1KzbvDPpopKVd?=
 =?us-ascii?Q?7uaFM3IoER1HOc1hRjIMj2No/n2SBN7+qjENtWvl1+98GVECZIv2HcVh0eEL?=
 =?us-ascii?Q?NR7BQ1ENTBTA4FRIJI+XkEeBlngGWHD5AY6cuFk3Aya+VZgpE6XC1fdMZ0il?=
 =?us-ascii?Q?+UlqonvJf4FUAkipHg9wrGRUBs2QCFA/DnU8IHII+9CbrHSd419+1sNad0zh?=
 =?us-ascii?Q?JNA/Y4QJHFPvB0TGLJYrZKvJDuuy7j/BqvQBbF1ofeITV5NROAOse7IbNVrK?=
 =?us-ascii?Q?dPwOBrWV+y9KcnDfJvknjN9De6dJlop+zm3OJ/mtXqBC8+UFo5V/va49UkDL?=
 =?us-ascii?Q?yrJK2Lnihz0dgsKNFI7RSEYqBosxEufiJj4x6ffj+6gDaaezbFickSbr6oY1?=
 =?us-ascii?Q?3Zc+ufciNBm9tTpCsDM09oucC/JgTil15l6t+OeIpBxuCfH8dTK7et7X6eT0?=
 =?us-ascii?Q?276mVpUBu7sBDu3tV8ZU3YtZlTHzXKNdL3LeF+6Kdgt3ErfTlq96H94LU4jt?=
 =?us-ascii?Q?p1WbmMZR9QBbmHxhCSb8hP1rcdqx4gFSIY6xoILCVRT4tvt3AQ3A+6E7eSi3?=
 =?us-ascii?Q?GdLQDFp7XF6saTMSnR2pI9uXdAAFYo8L7uJZy8Vydi5yVxaF0y1rQEsflquS?=
 =?us-ascii?Q?X2GbbVcnYnC8QmeD2plmAkyEzsaOt6ITKamn+N/aXcr8sN2kbVC/ZA9DTjLh?=
 =?us-ascii?Q?Tiq3fawVBWfrIMea0zujQ4o5DWulzX+DNT8Ftbr5twajmDnSDixd9mVVswuE?=
 =?us-ascii?Q?Adoz8eM3yOpBxTpvZkxysW/FpHdC13RqZtZxXgaVW45ICufNOFocLgFXosoU?=
 =?us-ascii?Q?cCbycVIIyeUzTVQTLPe7+TM/+usWx/INmUpiRK1Z00Q7rdozQ5+Ld84Hk93B?=
 =?us-ascii?Q?O6IU1Jx0HVvCvn8WRRM9APYT1DZA3iMoW6ZZTdMpRyHIzFGu0xyQ48vUsPPY?=
 =?us-ascii?Q?KYOD/Eo0w5fENh4VtvRtyzpKvRV8nptATsoV+dS/LXYyN8lNezXD5L+aSjYD?=
 =?us-ascii?Q?wcfUB/KvvB6rJd2IH8LPcymI/pgMGUDRMmJbIG/AFNDqXdBHJurwr0h76Yf+?=
 =?us-ascii?Q?72eQzHrIwwr7b568XqKsHBmuutM4Uo3Ej3hKjgErlbUsLrQJI+ZQ7SWLAKPk?=
 =?us-ascii?Q?CiP1/NQLPELBmL7RQ8OwGYKH+fSromNtUSDX9Cz+RsRrZSd/62hATX0tnTYP?=
 =?us-ascii?Q?2R9BxYf9ukz+wVutxTiZligPGiZVxeUP/5dOZJRFYlM0JMT5vM07zF2XBzpG?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56557ac0-3009-4234-566c-08da75581c9d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 13:57:32.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YqjNGr0GqajtxMVEz9q8T/+xqhlifsV2jeYvGhzEDXekrNvWx5T5iYil3fPodyeqGTOkLB84utCOjdQlFt1I7ZzQSAr9GW8H4ncSfaa/98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5833
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=820
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030062
X-Proofpoint-ORIG-GUID: Dx-Y0fm7_QzDkJc-RcVBB4qga1_Vwi47
X-Proofpoint-GUID: Dx-Y0fm7_QzDkJc-RcVBB4qga1_Vwi47
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Roberto,

Those were added in 040a0a371005 ("mutex: Add support for wound/wait
style locks").  There is no documentation, but it's possible it was
done deliberately because when you have debugging enabled that's linux
specific hence the GPL?

I wouldn't encourage you to send this as a first patch...

1) Patches need to be inline (not as attachment)
2) Need a subsystem prefix in the subject.
3) The Rationale needs to be in the commit message.
4) Send the patch to the people from ./scripts/get_maintainer.pl

regards,
dan carpenter

