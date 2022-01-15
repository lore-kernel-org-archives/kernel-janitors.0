Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528F5C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 Jan 2022 11:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiAOLrs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 Jan 2022 06:47:48 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62756 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229486AbiAOLrr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 Jan 2022 06:47:47 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20F3wCOv018362;
        Sat, 15 Jan 2022 11:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=8y56tZypWetBldyQFbdhtH7RfPZms92lnekWE30aiRw=;
 b=KtOMH8jD3Zl0F6AhpV+fJMpu1Hhwti7PYmRosY2VxBFHeoyfZVqxg4d6d3+t52C6eAeL
 AKsb+k0UC4s8MvmJDwKJEakmyb5Ykqt0WhZGFtTkl9hhU8acalFjrr8KhYTdNYmSD/l7
 s1ChSHspvTFfo8MQd2f0TRBLPEHUiEDNkUCcBXNNed0jc6mWgFQ3x1OfpdceXAMGvDe0
 /QosiyQkcyKF1XTLkxWfrMk/bL6kuPcYeDbZIE56yqUAn0LIZll1pSxfGkDqk/S96Vrn
 JJH9xhsk9qipwAhEPj2YgP3UIyx5YXAqE7taTIdHf2x++DNgLoYE4q8mVnjXu2bVUzCn Wg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dkpttge22-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 Jan 2022 11:47:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20FBkJAA070251;
        Sat, 15 Jan 2022 11:47:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
        by aserp3020.oracle.com with ESMTP id 3dkp311x65-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 Jan 2022 11:47:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZpJr+VXOri/k92dgEJoF+rl9RPef7WH+OQ1EjIbFm8Rgqnk/aQeuRhikqySikLMb/uov/DvlJM6ZbL7Ckh59YaD22Esig5pKqc+G12yokGPhXn5Nnz2scCQ1PemqijDla9hyuVEqkCd6XnxmnEeYWLTnaO6Sn+bI4kxRSbIk5Tlq7ImbMXhVqk5CjXacx6kB6z3TYU+tnNLc2o95kotis04LghBl7myianVXxZHWlUErXobvW/TPbZugFHd9xR1yiQGWDF+T51pu7EwXf7L1SVo8XRNujJKV8c7hqymsUo8ToZtwQuAABgfGI/NKh0nym15dhFTugU7xMItDv8OEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y56tZypWetBldyQFbdhtH7RfPZms92lnekWE30aiRw=;
 b=W28giCBySoYmwxjYuueSkYbIkFM9TjOblHgSWRXRHfoNeUccm5KQMsI49VyZfwvoWbwXHzs9YY2XeTjvbwnt0M1V7nYiRx2dIqw+yKEiC4Y1PpFxClcImKdloEDoP4xv5LJ+5hU39S+QUGiJ2Hln6cAgFdyK9QtyMoV18oje7aIJwbQSzC9J7CT42dhRJrP71Q7K2s6KxIpqYEPYF8iyQJThpMQKMKOGtswwtrYGD+qE4Az6YS6/OMWokqq7zEmjILK5dC1jswjkBo6Ex9cukKaikpCb6ze4L7lNyBgo9m+CG7tZM0Pl49dxFNLROhhj5T1NQHJljrxPcjR4GYhlow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y56tZypWetBldyQFbdhtH7RfPZms92lnekWE30aiRw=;
 b=vxgxunuQSL87qu95b+v9CRnp5/7BfDaGwWah+PES+RWe4110YsxsZ/vP1VOVJgwoCy+rn9UB2W1Lq0wsCNTOU8p1/iR21VRbULqXBVC8tFoqNOCITghZQIOSYXkuJj2kj/USj4cDTZnYOVFHSK4McRgZq6RCoA7jhT3Elh4CdLk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sat, 15 Jan
 2022 11:47:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%5]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 11:47:39 +0000
Date:   Sat, 15 Jan 2022 14:47:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christine Caulfield <ccaulfie@redhat.com>,
        Alexander Aring <aahringo@redhat.com>
Cc:     David Teigland <teigland@redhat.com>, cluster-devel@redhat.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] fs: dlm: uninitialized variable on error in
 dlm_listen_for_all()
Message-ID: <20220115114725.GA7552@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0134.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c9c24bc-a957-4a97-2497-08d9d81cd524
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2365EF828E515C260873E2F48E559@MWHPR1001MB2365.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+8UAMomLp0tRY7K1v79HAD7iNm3eYgynkdOgOWkJDUdWkv6VneC5BvRiQXiHfMiHTW23obKVmjho/7Ox+Qjo7Kpk3oefch0rWJXzG25uG07VtLcnt5BdJzrAMQrIjWvVYKG4rlZmttwrWqkwN7V3izzs4K1fBNiGIkf+QH6ih8wfwE0+wGsehVzfbzFGxiuFSwI88wc3weNVWdWhadg9mzkvSCun9FbWlISviS9/DgCYiyWwCz7lYBL7OBe7VZQshru4zkTJAq6QjoXPutPAgQipSsUdp3CRH/L9gYmy+FdoWiT/Kiw5Uwiax1ndONdHZjuQ4L5bvgK1T+gzraocdZW+0Syp1mdmAUsXXpZ+bBn/y44oLYAc/lYnrPwar6O083ljzV9dAQ9J6EXG9auX379jy3YGpuaRERoB8LXLwu4uBdpGBVf3omjcO0Z9Rnq1p/9Q2OibAfgc9sBniVlVFRA7YsFan9wbrpGNKCxwEkUS0tisGNhS9cjQXBTQGykEcmPHuJKDJd/IBn+tYMBTujnb4BFqAWImdp05+5rshyo2jJ477caYH4zJvhAdRgIABIekuP6Z7LuhgCmiRacPQL04lkL2VRk+Q1vJmRcn/PkF3zvP51Ev2977UfTOH4LO/7xK1VgMQBceW7YYwWCC4HVdhFvH+jpC2w4WDtNmtmMpdUjZfLOObdWOhl7CzzJoM8BoPqBS9gf5GtGD0KYYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(6486002)(5660300002)(6666004)(316002)(508600001)(66946007)(4326008)(83380400001)(33656002)(52116002)(86362001)(9686003)(4744005)(6506007)(33716001)(6512007)(1076003)(26005)(38100700002)(38350700002)(8936002)(110136005)(44832011)(2906002)(66556008)(8676002)(186003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vQPlfru61B6YkReigO2Wd42VfmkuipnUnLeMtpFcAQkmMAIZNxx6JqDvwV9d?=
 =?us-ascii?Q?LqubvwLEE6Mr4+vmAldwGLNvseIdKmm6yXt20S4mvKaKUMfosrF5xHki8XMw?=
 =?us-ascii?Q?SOEt1WmHwgoU08yaRNwgvU55fR8WMYla9naYzp5w00B4yDaTq4FwqVENI238?=
 =?us-ascii?Q?CyZ96ko/kWtoes8gkKN9wFicrlOvn8Yxwj74XypIsEprE0V23wWPjl3IaX33?=
 =?us-ascii?Q?gNOs4I8qqspePtUakhLOn4COYCiTVOMCr0eI8qatSsUBBzBSnDEWHnvBXT+X?=
 =?us-ascii?Q?lZIoVFb9ai2152Du0DD1afb9aIEa2Z/2jzbUA4I37duqLqGq3oKolCXpEEFS?=
 =?us-ascii?Q?Q5OWOhmcOzG4cqQ/HRELt0NQjnCy3Ldn/BFRXjJi3sjY4K6FjeCQ7tMjtkZB?=
 =?us-ascii?Q?7oGPqzf1Ibzv8vWFUv/49TiIyn0EtQ7ajkS/8oj+hf2VzWmnW/GZhTi3KkWA?=
 =?us-ascii?Q?qqFQjFk1i6kUZYNIRkweBP7pwWyyjpKliR96JK0Mdr0tYqwkU7B56eMfBPcq?=
 =?us-ascii?Q?YSotoNQDEXFSSRow6JLHNXDT9hycQz4cZ4w972NatFrViXh6DSl2gm3Y1TA1?=
 =?us-ascii?Q?BJvKZY3CObJowQjvmZ9q/trUvpD6Psy7yXGqjkzSZe8BQ9BOC8lgurnOUcZV?=
 =?us-ascii?Q?x11iHQnNasU2dxIf1uruz/Sef432HWYneRGFvvu0FkN463Hy/BAignVQTh6n?=
 =?us-ascii?Q?BCDOAYA7Qqz29cw6JC7snnOyk9zcCq4O4p7QOc/ooqPv1YoRHH6hLdVvw/27?=
 =?us-ascii?Q?JO5mCOmE5etT3Acdc0l4Z8MJYUYIyOsaL42y7upQN0t3Cf6jHke3dBfq2NPI?=
 =?us-ascii?Q?Vkjf4hwubRTm0lPDBUaLu9pFKzwjVdozeDTfIfmQl9VCs/cXeW1EZi85vcQq?=
 =?us-ascii?Q?SrlI9CxFZOMR2Q56w74KFj1br0y8CqgIbX6vqnUhT435vr6dTP79G58vXoT6?=
 =?us-ascii?Q?dBlbUqYIwqYMVYz45o6t+kNUykDxVieQXnyldSjKV76D4WFQh5tVZAUufrBX?=
 =?us-ascii?Q?lrArPcw9Uc0WYJ+mrIkDv90d9Ce8/PhT7wuZ3s7BRHUtn2NyCbJZYeSZ33np?=
 =?us-ascii?Q?Hp7uZ9+v+awLmo+AlQb0jaVkPRTXgYq8x6ku/Rs+kzvYOHBBhGze33Azf9qy?=
 =?us-ascii?Q?rGxwDQkVVcbVIS8a7KFA87udGEUgHsA6qvYYAefVGHH1wfR3THEuhscGyLHT?=
 =?us-ascii?Q?+2HdV8uuP4Fa5QDWVD6/zyRtgXHfk6PSXTCBvJYXWg/fkk7KAL297jgba7Cd?=
 =?us-ascii?Q?dFuSP0TwKeXhmLwggMQtD8heXp+OM5sIy7wOPa7mJHQxcgjgkpMM+CkNMuYR?=
 =?us-ascii?Q?PlishqNHWqDLgdwaHS2PPbQB6XVM0l7Zkbir9d3u5NQh1dVezV4YYkSShn1S?=
 =?us-ascii?Q?/nhAdWHPrqQgTB3FOmI9fg9nR7jjeT/eiPGVUZCGK+HhjzebB6vz+B81v6a/?=
 =?us-ascii?Q?tTVJzvxC5QEqynF6u6T0C8baA+yPYt9kdxtpAnednq9UL0snRrHAl5pnYN08?=
 =?us-ascii?Q?ELeCUWa3q9SFCt56saukVohLgtWsxN7BzlF1vtIhek4ehT9461H4ARZfsNpx?=
 =?us-ascii?Q?jeitesqVFOsyGjjyf1NL4JzlhrHG9Sf8vN7LP7VB1YjyJY9wzA2uhuUqnx2+?=
 =?us-ascii?Q?fV06tfdtJtUA8Vr7vjte1dlOwGlfAWiKUFajCyQNmQmIQRKVDumvgMVPAZE6?=
 =?us-ascii?Q?n9+obDsgKaxtoUSITFZcIf8QAz8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9c24bc-a957-4a97-2497-08d9d81cd524
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 11:47:39.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrLnYYRczcOS8KvAzxEmgXTruCbKF3YBQSCPRHazlGojbaaIarHZfjRR8CW3wONU1+NMfdtV7tsNKanweLMDhLqikuK5FY+SU55C7GKuefQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2365
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10227 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201150072
X-Proofpoint-ORIG-GUID: Z8vt3szg421iwMz65lSo5PnjRRDcNSS8
X-Proofpoint-GUID: Z8vt3szg421iwMz65lSo5PnjRRDcNSS8
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "sock" variable is not initialized on this error path.

Cc: stable@vger.kernel.org
Fixes: 2dc6b1158c28 ("fs: dlm: introduce generic listen")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e284d696c1fd..6ed935ad8247 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1789,7 +1789,7 @@ static int dlm_listen_for_all(void)
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0) {
 		log_print("Can't create comms socket: %d", result);
-		goto out;
+		return result;
 	}
 
 	sock_set_mark(sock->sk, dlm_config.ci_mark);
-- 
2.20.1

