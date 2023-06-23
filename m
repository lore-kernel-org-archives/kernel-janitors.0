Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E28EB64D7
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jun 2023 06:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjFWGiB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jun 2023 02:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjFWGh7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jun 2023 02:37:59 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070021FEF
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Jun 2023 23:37:56 -0700 (PDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35N6aeBc029706;
        Fri, 23 Jun 2023 06:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=NrvNSPGSiTB9pmtvvUJvXQ9et0n8MwokigtMRltGbI0=;
 b=pO8sMwbgjlh4eLobVa2SsbSSmfiIQ7gf6TyqcPucb1s0oxDiMUZy1Qs96bSuA6r5fR1C
 aP0c8yayQXQM08IBSPcXLWk73Gua3krtL7K6B3oyAK+rcWJPGmaKii8fP2gfMtQrzNRT
 RXA0u8d1uyIuj3poz3OKp5wNeRFH6Gba3fQcW8eSw0SsQsRKJXC0gdy2JQl1A1pcDOjf
 OAph3qXECDYjVi9oNZq8TtVKqVY0CpVhS780ZQje7fYeTZYoR/ygNsp4Xdx/8FkwT47X
 lPagS3kF28Ec/cbcUaV2D0uuT6hmaZ66VymhsVFYkuKLsKi/8ATrv/eIC8xloueLxwnS Vg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93rbubpk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Jun 2023 06:37:46 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35N5WcnV005825;
        Fri, 23 Jun 2023 06:37:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r9398cpbm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Jun 2023 06:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDi+Gfdgg3caFU9+XtGmNigT2lPufLeqPHrgrQZPiXjPCK1sFJ6gl93TGZ3z6/+7NXHcvKVqC8HyHadOXesEYsekHxYmzuWydB25aQtMzXXhZVqfY56c3y3lNavIc+QmrtrNVaEd/s24QJvwsAdG16M15kmDBLDbS8j1tEpooEu7V+gxvN6uMt4YfE0RA17753EVU52gaSaqQdHgkbVFFYbS31oZAuzZ5aRL7cYBwpEFOHBI5Iwx4FAb7T7OMq+3ES0WCuFkSh+ehA/KA8h6+8Jjv7az3SbSYUr/j5Kt5CB3Qqek/lIkhaZxVF0zv4/Li44z0WZq4XQqlFQ9sEsSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrvNSPGSiTB9pmtvvUJvXQ9et0n8MwokigtMRltGbI0=;
 b=C7/BgrlDlE+D3fmUUUMBxrAcDkAlv13t5uwHPGgNLEnDuEte8c1CB/fy428z4p/miAdlahFAVcZt64PHmbBEwNTd9sqyLgf/etalGATdDBsa103E8ge4SZSpvclBcXH5x2+dWxNDpBS+flR70baoF3TFLhcImGbhGy/eehl2TjPm0ZOlRMaX2xtL3tH2g1HK/M33ms3T12sQPM1i7J62nyiUk+mBX8O2O1YRF6HJ+rt+WLfwXgLJxK8dZR1/6JehJ5ldlvIb1id/I+QIDAHAySrOp/7i0HEzwOq2G/lBqYnBTZQYkw95NPTL2YmG7fQVNcY0LH6Uz7tSKOzgYG6Lbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrvNSPGSiTB9pmtvvUJvXQ9et0n8MwokigtMRltGbI0=;
 b=Xat+B1RGnPBhU3LsyFu/Pelifx87C96Fz2KJRRniITFPOFEj8YA2c4Y5Sx8NnGFwNMm2IVx+E5l4U49VWgQggdLS9KBgAOdhyZ3dyiTGBaz0bG3mSbgqbq4lo4veR6Cfa8oqYxDDJ/xMEgD0zc/TPJYDCG1IsTHgchBn4QnnUhg=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by PH7PR10MB7838.namprd10.prod.outlook.com (2603:10b6:510:30a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 06:37:43 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::d9c0:689a:147b:ced5]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::d9c0:689a:147b:ced5%5]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 06:37:43 +0000
Message-ID: <276ff3e9-2126-84d3-59d8-faffd06edd39@oracle.com>
Date:   Thu, 22 Jun 2023 23:37:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mm/hugetlb: fix hugetlbfs_pagecache_present()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
References: <efa86091-6a2c-4064-8f55-9b44e1313015@moroto.mountain>
From:   Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <efa86091-6a2c-4064-8f55-9b44e1313015@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|PH7PR10MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daa5c6a-5add-4e07-52e9-08db73b45956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMDLD2z2cysQ+eeKWkBeeeQBsoSNuiWoidc508t+qRLq5TGc5rWhRv7oS1vBsz4DNTKJDokeL5ipmtkeCpzQtP9aIoVYjzHTOUoZvVHhF+j0FeHUQJGFw6g8LNw7o0A2HEqPPVa5/Jv/i/EIhSmvc86QGZ2HQUwTCgxILBswZFDPs1Y7h9Pq5wMPfDVEg99uYhB2lctlm/hIh/dj4SSAvFMj2fY5WI6UnvWLt6VuVIX+KdweYUbpEgo3imOKh5/mRnBAVdJPaLXKIrswvGwFbA35sg+v6JcJFzJHYbwBrrPrWTIBI0HNBUnuAtpnMB4WtbbmWu3PduokhEbJFwQqGTyBdvPkABz6U9tyC0hlihxKfOOryt3+BcGSO7wRVnr9wMn+m86aqOb41sg6kxj37+VUYbETj1hkMM4ND15uu7g9tk17qKGimMMlnnVe/Em1fZv1+iIpx++c14TqaFLBV316l1m9OaWs0lkjlowhfJYjNZBBqhnP+PwemreYbzSGrtZIHhjQQ5R83NNAXe4EhYI39AbTHzwuKB1ZjIWsfsVOv4CnKooxHfFMHCiQ8DeWQQz0tcwQzrDln1TrlhiEv/gCQtBrM9keC9jCcD08ijqtdiH0LZLDoPiRrTuf+VB+TMK8hR3r/LGCwJbjzIUiRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(2906002)(186003)(53546011)(6512007)(6506007)(66946007)(66476007)(41300700001)(5660300002)(4326008)(6636002)(316002)(86362001)(31696002)(54906003)(478600001)(110136005)(6486002)(38100700002)(83380400001)(2616005)(36756003)(44832011)(8936002)(8676002)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlN4TU5HMFdBbElVZUZPc3dqeE9lOTF0dC9vb0xwYTQ1ZENaY3l6aHk3OXZq?=
 =?utf-8?B?R1dLSjNtWjVTcDVsa0dZeTloOWtXU2FydTRyZXppYktwZzBUZnRvQlZTdnBi?=
 =?utf-8?B?RlFQM1dsV3hCeWl4empvR0Rvd1V0bXdDNkhJUHc3OVVrV1NUMkEzeTAwYThX?=
 =?utf-8?B?MExlWkRKeWJvclhvL0NrRDVwUHAyYlpsZWZwMjBkOEZITDA3alR5U0ZwNTMy?=
 =?utf-8?B?T3RJSllUaUd4bUgraFhLTyt2UXZ4aUZMR2RROWtYOUtJVWVYMVZ0d0t3M1RL?=
 =?utf-8?B?SjVCNnBuQ05MMWk3NFp6ZXNKdDB4aFpvSC91MHkvUWZHQVc5aDNZMlZYUWsz?=
 =?utf-8?B?anl2SmRiS0NmaVpGVEt3NjFkSVNyV2pObkJkdzZEWDlpaFpKZWpFQ29MbnBR?=
 =?utf-8?B?c1NrVXl4SXMzd044WG5FMXREUmNDQ2NsUzBxZ0VZeE16a0UrckVDRGNoUlNI?=
 =?utf-8?B?VHhBOVJxdDFSa1AzSHE5RjZ5a0JWcndpdUtzcTgyUDVnaFJKTkFjUllyRmla?=
 =?utf-8?B?dnF2ZmRjU2ZobFpyMjJXVUJiMUtibmFYc2pHL2JydUwvNEdJWGcwdFZORVFl?=
 =?utf-8?B?Qkt2TlRCS3pOOFB6VjNQR2dxM0ZZN3JvVkY5ZGFWbjJvdUYrdkhsMmFITnVp?=
 =?utf-8?B?RGFTUGRqOWJqb1J3aDErTzlHVDBVOFd5Tno1UWw2amVoY3lWQndaQVFSclJ0?=
 =?utf-8?B?SnpBZnI3VHR2ckJISFh1YkppUnJmMk5IMEF3eXBwZEFDVldWeVVpdzFLYkZy?=
 =?utf-8?B?TnJqeFd6TVpwUFRCV1M5MG9zdjZBK1VRNHNMbXFHd1JLTk9ueGphajhqU2lS?=
 =?utf-8?B?WmZKQmh4ZTBkSHJhV3Q4QUFnTzdORE1QTkhMTHBjckwxOUxHRnJyZXR3T1NU?=
 =?utf-8?B?cGJyT3F6U1Fid2dRa2U3RFBjWXR4NGNTM0dnWnZoUi9jaXJmcWJKWFpDK1Zz?=
 =?utf-8?B?QlhiUTk5ZWFwbEhieFNTSUxDZktUVUlkUlhIUTh2d0RqRkJtVGFURXRxMUpW?=
 =?utf-8?B?YTFka1g5cTV2Qk1Eb1RBMFNiZE5HMHRLTzNjcHM3cnF6RWJTMzhnZEprU0R2?=
 =?utf-8?B?a3BkclNXb1NFNHBYVXpJUnhKSHY2cWlqdnlMYjV4akx6bVI5U203K3JrMEph?=
 =?utf-8?B?U0p6bkhzZ2tmeUF5T1hrMWlmYzFtV3RybUlYUUlxSnZzcHpsNHVQM3l6L0FU?=
 =?utf-8?B?UkhnSnYxS0srRkNNOTZtZ1RUQ3JDQTc2YXVLNVo0Wnc5bmpqQWVtcVJ4WXA2?=
 =?utf-8?B?cGVBQ2hYRWpWWGVHeW14UEFyM2hCM3JaREtyUzlXMUNUVHpCKzN2WnJ5Nkx0?=
 =?utf-8?B?aUhpd2MrN1NpeVhlcVZiMndJTks2bXg2MnlQcHZOL2dreGFKc0pDeVdmekVh?=
 =?utf-8?B?OTQwTElVT0c1aHRqZmd4ZmN6QjJGdjV1WEpURElkU3NmTmNsS1V2dUlhQ1pm?=
 =?utf-8?B?ZE5pUi9Lc0lZalQ4L0JPN1dUUjhLblp1djNlMG1LbE1Ea3dOK25LckorVk16?=
 =?utf-8?B?MW8vOWVFVU5NOGRITHV0ZExVcEc2elBDdjB3N292WG1ZeS81eDdkNXhmcEtK?=
 =?utf-8?B?dFZtdWRTR2ljOWZDQVAvQUltME9Xbmt6REZuczRuczF0QkM3NEJMVUlBaHhZ?=
 =?utf-8?B?WWNVMGlQdlFQMVBqRk5YcEpaYWl6dytuVldVclFmL1huZjVFM0wxVG1QN2s3?=
 =?utf-8?B?aHZiMEhraHpmNWVEcFMxMkVUYmhDZWx4OGJBU2xJMnROSHFyNjRITUZjRnV5?=
 =?utf-8?B?QmtJSVV3WEVWOGJjcExJK2U3d3BlUlFpTCswQndhOGw3NENZU2lUOWUyUHI0?=
 =?utf-8?B?aEFMTEVJMDRDdkZzOE1MV255Q0I3VHUyaFNUT2paK1Q4aTdKZUFKS0RLaEVO?=
 =?utf-8?B?U0xnRTZzUm9KY1VlQjlPekNOeEszdVBZYXI0VTl6SXpuTTVXOFNKZ0p0SkNS?=
 =?utf-8?B?d0lFWXM0VlJpT3pNSVE3aXpMLzZDd0Vqa2pVNXpjYzJ0SDU1NHFrdjZpckgv?=
 =?utf-8?B?Yktha0w0UEJoQkszMkYydUFJQmdua01ucUsrMFZJVWhRN1VYQW1HVzFxWjFl?=
 =?utf-8?B?QU5jMWJNZzM5NUY2R2RSUGxWMEpvVllEL3R0RnhuY001dDgwQXhHcXpieUtk?=
 =?utf-8?B?R0wrWmJDMGl4R1k4SU9SdHFNcUlIclhoVGVjbnIxbHl5NnB2SVUzaENaSkow?=
 =?utf-8?Q?wTyzRKPKk/pDfvDp8geb1ik=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: egUrqj8V9NA0KhvEBsjYrVgwnGWLaWH4i9/ecoo/V5wddnaVFnZ0M7nYwKI2YW9ASvK51oxCaAjolfp1610R8WGdslnIbOK5VjUnIWN283mJ5E3SSkohQsQZCYncHoPvxcum4aye+wkph4dJxeJWihfUAx07x2S58k1jVdPRFqzqLk2qANaq7cFIo7JEoCGO91+E/JI/V9kQSGEB5u/rX9HkEo71x9Qe0RPWXziy5rjYBrjMbPRIyuJx34i9S8hx+W2F7LELZbsUm78G61MelMDFSSCGRKJ1zzIc56OSoBsG6xfHaJmSa9UxNp2WghLCPttXQtuCKjfGmqneKe06g4nP2w0IbZmPla08T5pNJZUfue20BDv5Lmzg6jr8FebgsCQtKbszupfXHyBj4Fyfx+tGQAcdrTKK2JFL8x8zIWXnYt2efejdsgCV+sqJBKwdL48iyi5bvL1jGg2htDNAx8G/Wofol0xkyaFeqQnm0TFDyKrjhYWz8tooimvGD3f6GDjd+Th9cWw3T1/nXF6YvlTDvksTtp2dmKPb5zjFIBfnR/JCVzQY60JiLdWbKgcCN3N6FAcZsM1AZCIUMspT2rcDQMk7CVF7FM7nihLtacG/AtSmZR4AYMB6W2+iSIat8YIgrJM8cWnQmbBYKWP6R4eq/tyYzNWw/AVxwXCxwHHmePGtr41CBski4OuRs+EpgtVI2kYuf76qFG9HZtBh0G4+sqwS36VJjRd9a2PqrbMp+qqIUt7sD+IpmtWXSz1vhcmXcPvNRxbHjExM7ClPSIww8n67ngBNgqdJO7nV0jfG1r9pBcYFeqeTCYg85GCQzYocB/b5dtuLTp6Yq6TntHnQbRmTz8ODkQAjppUbLjiZ6MnNEcCpkzFwJ04WERuQ3wm4wFdQNVcUSITlmpJvCg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daa5c6a-5add-4e07-52e9-08db73b45956
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 06:37:43.4750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNeb5N2vC0Feru9fnTnqAxii1itsPfEMBf/GPDOoBlEdvLdqwJp5kVrLfL8giDT+XmUKut6voWY1hcO5oMllENDzI75EfrN2jlJjSEVIVTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7838
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_02,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230060
X-Proofpoint-ORIG-GUID: 1J3rzJeAVp-QSyUFvus0HUYMYO5r1R_8
X-Proofpoint-GUID: 1J3rzJeAVp-QSyUFvus0HUYMYO5r1R_8
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/22/23 11:26 PM, Dan Carpenter wrote:
> The filemap_get_folio() function doesn't returns NULL, it returns error
> pointers.  So the "return folio != NULL;" statement means
> hugetlbfs_pagecache_present() always returns true.
> 
> Fixes: 267d6792f43b ("hugetlb: revert use of page_cache_next_miss()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   mm/hugetlb.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cb9077b96b43..bce28cca73a1 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5731,9 +5731,10 @@ static bool hugetlbfs_pagecache_present(struct hstate *h,
>   	struct folio *folio;
>   
>   	folio = filemap_get_folio(mapping, idx);
> -	if (!IS_ERR(folio))
> -		folio_put(folio);
> -	return folio != NULL;
> +	if (IS_ERR(folio))
> +		return false;
> +	folio_put(folio);
> +	return true;
>   }
>   
>   int hugetlb_add_to_page_cache(struct folio *folio, struct address_space *mapping,
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
