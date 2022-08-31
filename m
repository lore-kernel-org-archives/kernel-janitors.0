Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33499ECAAD1
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Aug 2022 07:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiHaHIt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 Aug 2022 03:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiHaHIr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Aug 2022 03:08:47 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A077274BAC
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Aug 2022 00:08:45 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V5BrR4018732;
        Wed, 31 Aug 2022 07:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=x3ifHQYqEnbE2hWrHDINKfWGZRSDJD8RU4EOPZAvzHQ=;
 b=MP1L3/MTj1j+0aps68d4573adMX5zkl2SY3AwPLyk6t2CLf7JhFNqNW4GStklKcJFG4P
 dPBLzWAjOGF7rNORZFOYrYNYHVnPh2Dh2Bpfcso754atypq9XUgn7sGpguSxqQbGxGry
 3RIaRB//tSeBw4qsXM0fS/CkC0ueRrjXINJUrZY6fpUZ9CgBR8OZ6Lk8/rmOQEvIApMv
 IykoGMdBO9BG7j9BQiQL2Tg5y55N/276YQOQ0YiOxcI6LxaYaP5Phc1PUIKJyJpkfG+H
 bHMlDqquEpi+4o1meD1QGSf0ycKc9i49EkgT5fqwkLv/UmZlmwxhNWSJqGRRXn+u9bS9 GQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7b5a09mu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Aug 2022 07:08:37 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27V6r8iL013084;
        Wed, 31 Aug 2022 07:08:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3j79q4ttp4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Aug 2022 07:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkNevhDdLaPcPTSnlJxQmQQsf+EgQDzdOqcYFn6LZEBFdBn95JB5mHBL5TzaO+UuetRWrH4rIdUD/ynREbK6s6YZu8I9IhwyNhe4MbOmd8Qo/EegtEzAGvCJWamhZEgNjoDH8rvIfQGyOL8FTn8A2OhG0J97qynMMNpeTBGmEhmvPxhXDC/VoNxLOYdO8f8lJ6UJ15Ajd8jkhLvJ8riqXRtvMooGnpwA2SO/MKDzF4ZwgOgFmg6UHdTCAjZSdqDj3M5uF7VGCN4AP3IUhltAUSL4j+Rc6Eo73ta9OojXMQAY7HOkx8NPYz5hn/2i76CFiWkADmiJUlUyCCXmnOfOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vo+CfnykXxJzDVxTEg9nsOUUDwr5hkk7gNYpvBDZwxc=;
 b=E5nLSqizp0NNimkrooHJGbYOBypZA2JJTaXoH9emzjKfSoV1mUZSGLsgHbUKNocpoJpYBOiz+7kAfTInLVXCwwn8/LgjEBftGIQYlHnu/jM0XrgKR/682lwjppVoGEXrxtwTJoU0vdS79IwetdhvYarFsrOkOxtaTKfqO4Qr1sfA5YIf9Twa7lJHPjY2WElK0dGyv/uVeqmH/dtb0k6pHH6Fr02AwdzFvR7hK7OKhojjuDpVia20pOtpEGahCPJiTJlQBbVnZmN0SIDZzF+LdXnNMDd93zNW3SxHAQQb9aPN+0kN6fissX5Pz4LhqL9xeLKwVHsv/WVge4ks41oZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vo+CfnykXxJzDVxTEg9nsOUUDwr5hkk7gNYpvBDZwxc=;
 b=fpgHa65XrVFZRJp7GjNt7DQ4NIUTrm5Nw+NqCskgvJRKTCxumwPiuDGrP78/8RHwr3CkDSRfoVgUmLA+LUanYf6TFbpyjW7ZP5jMl/aL+SoiSd8Zh2hd/FOPEoIBON5XZZNlO4QdJcJ491+Xu7yAMYP671/sXQh5cfLtfULBqZI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5288.namprd10.prod.outlook.com
 (2603:10b6:408:12c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 07:08:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 07:08:33 +0000
Date:   Wed, 31 Aug 2022 10:08:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mkoutny@suse.com
Cc:     Tejun Heo <tj@kernel.org>, kernel-janitors@vger.kernel.org
Subject: [bug report] cgroup: Honor caller's cgroup NS when resolving path
Message-ID: <Yw8I2ef6OvlMaGEF@kili>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0088.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae23953e-c0b4-4e02-a743-08da8b1f9d34
X-MS-TrafficTypeDiagnostic: BN0PR10MB5288:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1ySgKZOpD94RlZMJULHUX/GitRD4sj3kmklOLvdreAgxMw8/NsXqHEtwngCuFDN0NIBGyJAHhK8Fsaip7FkLkUSfzFbuxCqeNB6k1la/YPUdtPTe3tgefcDvA951k0Z5I5JU5lUZF1xQIuuyrKQSZe+o+5jN68Rx+Ki23doFyNgtxAwO7Yu0/L3f3+5cqM/e5ZBcun8eybWrU7tVmjcI+vZAyy3u/37uT6Bp4aLrOtOyQpcr8Ihp+aw8a3nqVBIx7PCSc0YxOqimG+6EdYjIeUD3BBZ0PcNZcKyZryryvzmJJjhooM9uuFIH479yvHkC7yojYY6iVP4l8d18oKYz3fmSCN28dCd/3/jR1S1bs//ImFWfe7kwU3AnNLr36YR9xwaWF+RCradzmrADpTbQqmVj/f4yI/qJ23B9QHS1d7hfbOIQudypywdKgZC5ae0IRUPtNr0P83fdLkN4zOhJ1YTF6+Se0qsWZMlHgZq1ZX0JJ6wyR8cWW/NvvXaDm1SimWIsBssdYQM7WnzXWjksfoHTV4UUn8pdskp2Ir1Zu8ptdp25QFvpdTSUzMQvb/MPPrNEB6n1OoGL/CnJ/PjW0yOB7Ozw5gOJEd+eHjfVA7dGEePicK149YmrkuqCuF+ZDyOT8wBQCFGujTLfvs/t6bVO7og37Fw2Jkr0kv0nAmRu9O7Nhh5HSE+SKkosWafHB8YEcXMsNTSHk9BvnUyub3sfvLFMlPimdf4ReWzVWGN5p2/5wRrj9P4NIq7rKhpLIf1/CllbbpRUD+lTGmjPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(366004)(376002)(396003)(346002)(136003)(4744005)(8936002)(44832011)(5660300002)(38350700002)(38100700002)(66946007)(8676002)(4326008)(66476007)(66556008)(83380400001)(2906002)(41300700001)(6666004)(86362001)(186003)(6512007)(316002)(9686003)(33716001)(52116002)(26005)(6506007)(6916009)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TxwLlj9ul/MwP4QZ0y45cT043iJFwVshdrXBWbkLxn8IXy6cpr1IUDq/So?=
 =?iso-8859-1?Q?aboVzppd/CW1bHZnIFlxJRs2y6iduL8lkiwVfwoqvR3sfpe5+9zKQu6mgh?=
 =?iso-8859-1?Q?GtptKorKiVP/kmL/rSjeyceig6TWZD0BUUNYkzk6WVVn7TxHGgW/iwTMvb?=
 =?iso-8859-1?Q?mjouDzaSsa60tZVDhE/i7TiyB1DuCojQCaKZIncQVBErAcKHaeYD2D3yIK?=
 =?iso-8859-1?Q?P2lMDT1TXhSaExxmAjKNRJ6P1PJXxt/xCjnHQXiLQWEWYL/hS9uhjMEDN5?=
 =?iso-8859-1?Q?3JMbk3g/C67oe5Wpdr74GfNj0O6SvUIlXW+9FINR9NpKVBan8lETLurWo5?=
 =?iso-8859-1?Q?XoBHRqdijBk/rw/fWWrzfi7YVWjGmUD7UYoFuXDBNYc/b+kW5S4iziWTSs?=
 =?iso-8859-1?Q?sOR4u2QH2yYK+3gCUbtcHO1ZbtfLmJUkqtcWPvLo2Ktk8jGnA0ViMYRNW3?=
 =?iso-8859-1?Q?xvw7StgNJ6O5Aj7PjIcnRumJilR3ArAFQB14zQqZ7Oa1lRfRhtq6GEa7vu?=
 =?iso-8859-1?Q?x4CwKi2dPoGae0WtQu+EG578PRal2Tx4BkyMlrgv9VtaiZHlbLLQWMabhp?=
 =?iso-8859-1?Q?f7co5zJHqFj9VyL+LoX4ZnxrNYC6UJcDJVI5O/HfYUMMqZXNlG+84DtNT8?=
 =?iso-8859-1?Q?4zShJf+osyK0yyT9jPYMOEgdt/y/kImawWFclGroJuyScpE3BAatwJzF8J?=
 =?iso-8859-1?Q?vdQ4EaHV7TH7qdbteQdr4cuh8GRUopJVWpI8SEQ0ywgVaRBXpdlhHeCub1?=
 =?iso-8859-1?Q?RGDVmDz2mYZpJa0FXpQ2grlnCKB5gu7VzdwhDjhEoFai5AK5K8zf3ootnd?=
 =?iso-8859-1?Q?8VlX1MwtpQtApnimx019XbBYOBa3V05vBu0n4VZdA1e7Em2BcsHZ5C/9U+?=
 =?iso-8859-1?Q?M9qDYnQAWsz98M6AVQEUhS580Dp2fHQ1SvQEpRhoCL9nWe4MwuecdxEIqU?=
 =?iso-8859-1?Q?i8MaQAhmhWsoMG9F9+0xJ/96tfW1biv+1ecO8pEdqs4u80DvNBiocv/CAS?=
 =?iso-8859-1?Q?TP71vS1mjRh9L1DTH0fx5i14LVgdReeWnU1TYDmfCWjhpn/LAB/HR62WQ1?=
 =?iso-8859-1?Q?ynHZxKnDkOeBPLzhQHoTjoPDSBt9n5dBRHvFXTS07M+fsXnwcY0U4pguDK?=
 =?iso-8859-1?Q?5Sj5xUvLFffyVcIf33sU7JiEM9vs5B/YwuC/OVTAIiFIFvJagYbGLRrwQM?=
 =?iso-8859-1?Q?vn/1W+oJiS11LsaO5AlxT7HZdIGEExs0fYYvQ7rFfNtBtfzXdYFBON9FVg?=
 =?iso-8859-1?Q?On8P+YISqPDgJXHgRfB63oPMazNF8U3mMgvjmq39vZAWrdmfEgm2M6yj9r?=
 =?iso-8859-1?Q?TZG9+CSCjLrpTeMmzsyFLm+bo6m5ePCzie854eP9hdyTrZw91mi89oG7Wd?=
 =?iso-8859-1?Q?6ioPjBPzK4wF/6VtjeWiwpIaZSmaedA7a6IaJ1hEOYdfgPS4mYg/FeTzS7?=
 =?iso-8859-1?Q?0bCAFxXH0T5VWMjWeMFKLy819lb4Yig/c/8GHxeE+wmGzM91eYiNVG0KvP?=
 =?iso-8859-1?Q?I6j4/VPP6YR4Ca98pPuNRLB9VJxEFTlmRUVszoIQLQ21PcxTKgJEzAgpbA?=
 =?iso-8859-1?Q?s8aZnjnMSb5/wN85MTUT9kVO2RhHQ91wXdzANEd3W3BOV5bWzU9bXJLc0h?=
 =?iso-8859-1?Q?e7ZGxRV60pPiruF6ky7HkSPHHxUFxPdrbvL3VYrecpOq3tnWfY3q+5Sg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae23953e-c0b4-4e02-a743-08da8b1f9d34
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 07:08:33.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFi3roUGmY51zOl1gUeuSDkjYuGQKyJPTos76Ady75Y9Q18Gi2amMORPbkNcdhUSzlxeOpJVEE1MrOXvHucV9MdDU/MxN3U2E0CiTvN/Y1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5288
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_03,2022-08-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=574 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310035
X-Proofpoint-ORIG-GUID: IcwlX7K6QYeSdjYZZPrx2Bs09-PUmnoK
X-Proofpoint-GUID: IcwlX7K6QYeSdjYZZPrx2Bs09-PUmnoK
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Michal Koutný,

The patch 74e4b956eb1c: "cgroup: Honor caller's cgroup NS when
resolving path" from Aug 26, 2022, leads to the following Smatch
static checker warning:

	./include/linux/kernfs.h:600 kernfs_walk_and_get()
	warn: sleeping in atomic context

kernel/cgroup/cgroup.c
  6639  struct cgroup *cgroup_get_from_path(const char *path)
  6640  {
  6641          struct kernfs_node *kn;
  6642          struct cgroup *cgrp = ERR_PTR(-ENOENT);
  6643          struct cgroup *root_cgrp;
  6644  
  6645          spin_lock_irq(&css_set_lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  6646          root_cgrp = current_cgns_cgroup_from_root(&cgrp_dfl_root);
  6647          kn = kernfs_walk_and_get(root_cgrp->kn, path);
                     ^^^^^^^^^^^^^^^^^^^
The kernfs_walk_and_get() function calls down_read() (a semaphore) so
it can't be called while holding a spinlock.

  6648          spin_unlock_irq(&css_set_lock);
  6649          if (!kn)
  6650                  goto out;

regards,
dan carpenter
