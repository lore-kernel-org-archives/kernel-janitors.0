Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14ACCE7B09
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Sep 2023 07:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjI1Hmg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Sep 2023 03:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjI1Hme (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Sep 2023 03:42:34 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D8C95
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Sep 2023 00:42:32 -0700 (PDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38S5x1Sa013131;
        Thu, 28 Sep 2023 07:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=HZQPjNFFPc/VaathMzTVD7xBzT5d69SqJ5pHxHxi2qw=;
 b=eLfDaZwL9/uipD1O6VnvAnY+kGGTU1TDnppL0pCVaa6JVk/9JFCeirx5wgscBkWbhn0q
 q5uZ4huDPSjAz+cuEOTWKwfNzOLJodCQrHhXWD8aUOyIsacu0kGi+lD0W6+L1Yb7pVbD
 xKROAR7u39ZM2mHeWBu0P2L2mDVy+9MpEp6YvCN/DrYcKCqzRr5624mY8O5bkaDDXRf6
 Rn3h0qF4baPLSLVYzJ4pwVi8ELMngegfgURR9utZBvPraM+RE8oLVA/O0RmvDX91ZlWj
 CiB+plk5LRxJrmltx+bA1IDbJSoGpHEB/4GPVHTKD6uQkSxrjJi4/dblPq7k1FdzlG8x XQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t9pxc3jew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Sep 2023 07:42:19 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38S71RkU034986;
        Thu, 28 Sep 2023 07:42:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t9pf9hx5r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Sep 2023 07:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbVCqC75wyi054CJAEZXougQSNOv7v5x6v/I4MsGIUbcr/+byQxaPgDYCPToQ1N8SLuzU0Gg0CEAmI8ixcQJJgwwVVzZkpkeqoCtXgKggs3ydXzfwGRirdJYtkYWsFIGFcZ6yXYBiOEOk4/rR3jbS9jurh45mkGu1h9ynbjlDhTin9EwERzrZE+ozQrUpkC9f/aJkGVYt+cNzYyyoPL+2Im44kkcFmWrHfRbWSdPQuPdtbqfc4OQtw4QqIREEUHQoHqNaIgTa+DLoHh28RC2XO2dMJf/hvPyZgQl9pfGxGC53nhq9e8zZtMcJfWvCD71icVPdrmB18Ewy4VtF69/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZQPjNFFPc/VaathMzTVD7xBzT5d69SqJ5pHxHxi2qw=;
 b=lkeNLpZlG1A/ih4HUA0/GTUPKpTvjCq89RxF1ZEScwHPWyZ8FZ1hSnbDeJMSJ07McsHwTmkrJIdc0hqIt7BawvyKQlO1PMp28RqUa3pkamkl9g6E1OGqXgaUkscpQ1mqXE2+q9N+E3JwkEGdoKkCueb6nS9uiPOTkzRT4nwYBnT8znAGrhG4p/9QqHCz3n30aPcOHoP0xKFN7x4zlUhFOxtTRK0fPzSPx7hFymcZkJI/RwD5qHM/8mtCkmzafRSMBaVL27q15C/mplS1OrnJIzl6ECFiQlN6gMOjDBlaX8wF8Xo3cf6azo4x+SMZM3mym0VJmzQ80oAfzrabV1oaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZQPjNFFPc/VaathMzTVD7xBzT5d69SqJ5pHxHxi2qw=;
 b=QIMbA90YT7olWxwXXAP0sy4NksbqIqQ2yBffnmL34U/Gfu3JCstty0nZiJFd+KrVNOg8iLDSJcw5XdYu6EoF4ER8GlJg4j4s8S+7u0rfquJVln7pvPeak/e01dVrKKXxe38cke7jW3MGbIzouXelNVkDmnJNBlNv9SeGmex91YA=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Thu, 28 Sep
 2023 07:42:17 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::c96b:bc13:b1d3:2ef]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::c96b:bc13:b1d3:2ef%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 07:42:17 +0000
Message-ID: <27812cb9-0f35-975b-5fb7-cf857a4be635@oracle.com>
Date:   Thu, 28 Sep 2023 00:42:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hugetlbfs: fix an NULL vs IS_ERR() bug
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
References: <1772c296-1417-486f-8eef-171af2192681@moroto.mountain>
Content-Language: en-US
From:   Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <1772c296-1417-486f-8eef-171af2192681@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ab5797-e9bf-440a-e306-08dbbff67047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qm86uMTcmMDivPspyB+dx33HdYICqfXy69VdCogiiqSFP18L1n3kZEE/T03WucwOaTEa0fJNokttruGqXXcSCc/ZlGZLTilutB01G5GUl1NetNyOQtpSR9sHNf+BQWTIaqE7dKXcn52Fk4/fxau3Ukv3zmL4Wi6FSIPcM4QjxBNNW3+maEZDeE1ezYVUy0KaktVtFp0vKSctQ8FtimcEgxZFdZQ/izH9iJsQFh4+u/h2BVjnd8RdXXoXKvJhRzGSLU82xLRyy2ZqZVFk/nGLjsXRRDHIIG+jerJ4THJH8B19aFnULJkaPpTdN5h/ovQNd3GTuTorG7xTNzORK3VPLXlyc8hQnzvjdJbGm7NvEKcns3cv6il1MhcMfuJBEQjChgyyxcH+qmqPF8Ejx3x4P8fZKFYB0JkNGkAFw85wq3L7gZYM2s0ZkuTJVeGUUqk1peTM0OuENCNSdmT4qih6tCq/ksGSoxio4+DFKafQiNLrC7St6vsWTbEOxV2EaHN78304FxeBVXY0En8OQXDNtWhD6BmTXKalN1rfaKVPfAAsO0hY49m2iPgjzySY4fO0ZjDtwMSG4UnQnR1cCqppBfQkzc2jtWxUguHEqq2ZRbcnPj63UrYMBbPLvgEvU8clSRWVMENByFCkujw/cXuTZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(36756003)(86362001)(31686004)(4326008)(38100700002)(6666004)(2906002)(31696002)(8676002)(6486002)(2616005)(8936002)(66556008)(5660300002)(83380400001)(6506007)(6512007)(6916009)(53546011)(316002)(41300700001)(54906003)(478600001)(44832011)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU42eFZ2Z1hkeGV3UHY5YTMvcU0xRXRDZlVRSWU1QUtKb08vbDdyTE9hcTZS?=
 =?utf-8?B?UTQ1VThDazZVM0dqSEZqK09FYkNRVnQ5U2YwZmVwc09sV3BCSmhSb2JsOE9J?=
 =?utf-8?B?a1Y3czJwYjdCc29zRktGMnBBeVp3TmU2anVaSHZ4dGN5SlVjTE9GNEtCLzhX?=
 =?utf-8?B?RkNnZEQvRzI1bmdlNEtSbk5iUGM5R2ZDK1ZXdmx2L1E4d2xIMXJZQytQN0xu?=
 =?utf-8?B?WUlnZG9qK2RtOHNYZEF4YmpWTEJtRDg5bUpJUTZramc2YWx3Rm9iMzAvc2lj?=
 =?utf-8?B?WTg1cXp1bXFaWnJrcTlGRHN6ZENnSnNiNGFKTm1Ebmd3enVQVFBKelVhN25T?=
 =?utf-8?B?bmdoOTQ3Sy9hSGpJdXpXSXcydGc1OXk4NkkrbFpmRUNjTU9jQ2JUVEhnQ3dE?=
 =?utf-8?B?SXZBLzRjOW9KcURtaWV0bnpFejJJMDdheEorcjV4NjNGK0ZweGd3TmxmR1NI?=
 =?utf-8?B?Vk9KNEhqOWp5TkRnc3d2d09KcmNqMlgyTTZJcG1iVjk1NGxkMEhvdW9ldVc1?=
 =?utf-8?B?Z0NRY0dMMmg1dElDeWNGSXVJMkI0eVY0bFVnei83Sk93dTdHdTN5bHhiZW1F?=
 =?utf-8?B?YzZqUmszTThhY2hjSHhGQjdEUWhJUHl6azBHRTBqQVRSTmxoemtiVmRHbzdl?=
 =?utf-8?B?cS9OeGJPQml3bWV0ZitJdW5EOEFVT09UVnczSEY2VWlxajc1bXVIWi9reVBK?=
 =?utf-8?B?MG9QbjNaSGtiMU1xZUlsa3VyNHRCeTlRS29UY0lGZHFXN21FUm5wVjhaWEVB?=
 =?utf-8?B?ajJ5RnJsM2dOaFI5UWJwZktDdFRqSU5VNHN3ZERRK2hGUHoySTRzclYxRWxP?=
 =?utf-8?B?aEdlWlQ3bUJ3dG1lQkN4Q3ZVY1ZoTThnaEk0ci90UGxSZnhORStyQXFHNmVX?=
 =?utf-8?B?Z2VHMGhjT2RqaHIwL1htSXJFOU1seCtpS2RnQkcrNDdLRFlpZ2o5b2Y5bDdk?=
 =?utf-8?B?Z0RWeFJaU2ZEQTY1VHFUNTI3UUg4V0RKdDF0c2RjK25zaTZHN3doaklXTSs0?=
 =?utf-8?B?VGx1WUN5bEpJajFjZDRkdXUxL3VxMXZPVlBxOWlHbWRsWUF0YlpSbk1yaStp?=
 =?utf-8?B?aHdpYWJpK2JMWHNkWmJsTEY1aThwMkc1aVFQQWhnemJ1ajA3NjZTL1BUcDJz?=
 =?utf-8?B?dCtoNzRnWFM1SC9reVgxU1BIN3RJQ21icVRSUnEvbUdHZUlXUjBXdVdpbUdU?=
 =?utf-8?B?NWZpU3oxWEExSnppd0x6Sm1OTFp3TWZFZmNCV3h3ei9iZVBEV292UGovMUJx?=
 =?utf-8?B?TlV4aFdIcjM0ZC9HM2FOZ2wyVWt6T0pUSk9Hb2grY0VGRXR6VklxT1QyYzdS?=
 =?utf-8?B?T2hnbndzbGhyRmF3OGY2N2syNlpvdk1lckoyT3RpekVhQnhqWVRITkV3ZVhU?=
 =?utf-8?B?dk9kcEhBRVhkVEFpSVBBN2Q5QnB2Yy9DWHlGRFFpZUNNUXM2eUJ3a3p3RU01?=
 =?utf-8?B?OHZtNGhENEFXNDRxNnJBcnpCNXEwaXIvbWZ0Y2hKZXhLMVVVUjhBQ2hjenl0?=
 =?utf-8?B?QzB4T3pMclNwR25YelJlak1UMDVSd1Z4UW5QMzlWWWh0UzRreEFiMlBYRHNS?=
 =?utf-8?B?S2o0aGNmVjdOU2NtMGo0RSsrM1pWZ3FTY013cGtDWmhoTDZvb2hubnI5WWkz?=
 =?utf-8?B?ODZPN3dEMllJRGFJTGVqckxCT1F0MFVrTHIreDhQWHh0ZTVVTjZPSnpuVG9X?=
 =?utf-8?B?NEgzWUlNZGs0N1ZmL1lqK2VicHg5NHpleXZzblB0NTd2V000ODNxUmsrNEI2?=
 =?utf-8?B?VXFDbVkwQ3VDVEU4SG1wZ01aekNjbTlCQVoxK3RoM0lXNTdoMnVaYnh5UGMx?=
 =?utf-8?B?YnNiYm1wZ05PU1NIblcyWmEvWmZQQzliN0p0UGo2R3VLa0pzVFdjYml6OGRP?=
 =?utf-8?B?UGlsNk9pZGEvTUZvRDVYZGFwcHlJR0R3cnE1RjBncFdGcHQ0b0QxR0wrYWpJ?=
 =?utf-8?B?TFF2b3dOaFpwZHljNnk4SWlHbkZOcXN0Z3k5SmZuVElLZ2o4SWFEWGFpNEdL?=
 =?utf-8?B?TUhrUE9wSVFiQzVLSzVrcnBlQi93Uk9VSDJzZktJVTBzYWphbno1Sktmc0M3?=
 =?utf-8?B?VElieVBTOGZBeTluSmUzRVBrN21CcmwvMTRKYWt0eFZHOHZpWS9XaTdyck1I?=
 =?utf-8?B?aXVBSUM5RTN0ejNWUFBCQ0dZL1JJSUNIYWNTU2Y0T1V2Z25iTndJQXRLUnJ4?=
 =?utf-8?Q?Cqgto62vRT/7QyCJkN01uUM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kqbfNY9cpXmarNfxqVqHPiXkA5uqMPfXFf0lFm45wYPkB4Bn5ebGkQ+gVwpJVx3+kgTBL0g9s0IH/xaEo3hU/AVY9350FGFkODWouH518ABcTbz6h2VTdG+0/m9gWZ/t4Ff2vPG9V2zIz4jGAu85cDd7M7LLln9xdfd8SWvnf7expK4RouabK7x6dKsiiJyFahTPtr0Iv4rbdI9EI+A9t+3HBv3XeYAC33PdZWPkefkAw06E5WkfkssKYrpBMEASFDkgxYA+w3Rz/6hWFZYr1/5+R2SNfSm372AkO9JOnKU15Pn2OU2DV7qsMckhggowofIvglnWL6WT5Y1p+OGvC6pTO6QisQlegB95sL7JR3TuQTzl9sohqIMz8nX2IKeETSlRlBUZfZfDTb0yrS5YdJfqTwa82YpLK1MXFMOv9EDsOE1mleUvmRIORsFLHhSpudbcXlVUEAGPMj2LLM8M4VL0zCF2rH5TWounKJfILWMYvy113FyOZ3QNF9VIzCcwGiNTxtpJqAKvIJ9um2Old5o0nuflX7mubzFe7XuM/ZEMppkcIzh4YyhTZkT8TSpsObZM0/yrrqRpR/Msl9jNuQH9IvLMS2Wv6sy2htVgXSUuieQMPMoFyaKcwkkfdK1mtqoIn383YxzK1I/xSkyAzyv8iFDm66w3ilRY/6cEcZs5j943Q7eI63dwujgyF/ItDzBNLSsnPw9gcRS415AnUAsqBsGrsDPXOJWIfBu2o5y5Ybe67K9N9rztzA4UXg/r4sz+31l+YDi1cGA2U95rBhBh/8mAnpbYKIv7iqa3+160V918VQYmbtvjzr3B3EgyjkAWOVlWO6KmFrNfnHg9jHPG2WBxWK4S4cYZcc/dYm2XhnHktGQ7A2ZIMh/P4eFcK4zdKEBczmdJVYuqPiL75A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ab5797-e9bf-440a-e306-08dbbff67047
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:42:17.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11ybhDivNjMvqP1rbT0Ka0uLQIoXFSrHr3ABsHJq3wAo/h9DEQXS2HskEyLOL6hNzlGDPZQubSw9djoh7Csa+s7jRyAG6QgSXwfHHudmq04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_04,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280064
X-Proofpoint-GUID: louuL9h8N5ZGCTlw0J5wUpftETUIoQPd
X-Proofpoint-ORIG-GUID: louuL9h8N5ZGCTlw0J5wUpftETUIoQPd
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/27/23 10:17 PM, Dan Carpenter wrote:
> This code was converted from using find_lock_page() which returns NULL,
> to calling filemap_lock_hugetlb_folio() which returns -ENOENT.  The
> check needs to be updated to match.  Also IS_ERR() has an unlikely()
> built in so we can remove that.
> 
> Fixes: 4649d8d5bb81 ("mm/filemap: remove hugetlb special casing in filemap.c")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> filemap_lock_hugetlb_folio() can return NULL if huge tables are disabled
> but that isn't the case here so there is no need to check for that.
> 
>   fs/hugetlbfs/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 3f2f0a4bfad0..91034b6e5b69 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -354,7 +354,7 @@ static ssize_t hugetlbfs_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   
>   		/* Find the folio */
>   		folio = filemap_lock_hugetlb_folio(h, mapping, index);
> -		if (unlikely(folio == NULL)) {
> +		if (IS_ERR(folio)) {
>   			/*
>   			 * We have a HOLE, zero out the user-buffer for the
>   			 * length of the hole or request.
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
