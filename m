Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FA3CDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 15:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346398AbjJSPoE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 11:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346499AbjJSPnu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 11:43:50 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D309119F
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 08:43:43 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JFg47i024879;
        Thu, 19 Oct 2023 15:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-03-30;
 bh=Ltu4Y2zwA2TKYJNtQHUC6lKXz0drQgnnCPVt52OQgsY=;
 b=s0O+2yRV8NoGLDyIwuG94LGh1NNl4Cz5pl732AZ8pDlpnhBt8jl5o3XK05yR9poS8qWj
 /bNG3ZjMPOm9ZFQr3q6tSEYciA/Lewse6ArWctggQhAn5Dzyxby0AwEnvy6jB+DfL/y1
 eLHOwAO4CUV2BAJwYjn8YWb7jsTLLPCA6FsWGIJ9+8Fsbn3M4otko9tn/BuxnIR8nzPm
 aQRM7AMgeJwg3dbjgPqx2Pw5FoPV+Xbfe+QkKRRk/amqcjxADEdbr6tAkwsjO3sBj5gN
 v77SXfpu9YcfPKcCR7Dj1Fha8JdYotFZcSwahQ9GmuViavaZArra4Ye8XsTh62nLNali Yw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tqk1btx67-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Oct 2023 15:43:30 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39JFghi1040573;
        Thu, 19 Oct 2023 15:43:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3trfyqchpu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Oct 2023 15:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hovl34gi/YMuAgKYuv/Oz0uk6ZDg2MRz9lOeUBts980yDMr0KeIvW382lKIulBtuohxemJoUygIM7WSxUxnSQ4iGwSu8yg90zXAXEuElXy1AqtzxBAII+yVFNboK/i1VvkeM7Rle0ucsz61oaAwR+oulqAuWO7JTC/CM74DXzUAc+odl+ow7b41eVIEbzkRoatLJ7RoJSFN1dqmRF1wZ+QKHJWl3QK5rH7bKK1onDPWWLRLNQhT8qpKqlY7MbjeM7hgXnV3/DWN/gmr8992MBiQPIk/ziwzSTiuqMdA7EaZv2K2ohjygM0Uwk5fhn1WBhwUVC2Cfo0BG2XhxLYbN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ltu4Y2zwA2TKYJNtQHUC6lKXz0drQgnnCPVt52OQgsY=;
 b=DaHOjbAd2wjmcX48vUwD7LIecFBew9csVbM9P3Hq9uMxlqvMJSStNQU1bJppHfE77NewSrddYGLTX+QVnz4v1EipM+GmTsv+6GPUx+/evNJneGPdxQ9N5kG4DqkL8RgKAvhK8p3zZz1QAkTWJDnb0roDU38bbMRdoUiAVLmu1sZeKez05VSvQHJkqwToZvmf1hGDOYojwVUoahybRKee+fmrpDNMwsjIlkuq7v+x39901dbFoVun9mR/CGCTzt+p3nCUeYt/OvF3Z0IihMcFAHbzgoS+FhXQs5c2ruBWntz7jhu0l3MCYvVi91J2hjP90tfcEmKNIvAVGgnW80IIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ltu4Y2zwA2TKYJNtQHUC6lKXz0drQgnnCPVt52OQgsY=;
 b=ZMDytYNN66e8jir/t3tc/8zWxqm9zNa1GQrWy3C5rwf/bj4K9uK/7HxmX42ediuL1FD+qLlnk44KMy8KWQT1ay+TN1hGOiMtLm+Kh2RwuRvUk1S0YCxMl8j+2Nq0CNrjjRV0GnqXz3TN/8n4enhZ7G212QqUlrEZl+3QjZvuZDk=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.40; Thu, 19 Oct
 2023 15:43:08 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 15:43:08 +0000
Date:   Thu, 19 Oct 2023 11:43:05 -0400
From:   "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231019154305.25zuhajtcsffroxq@revolver>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
 <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4683c7-9259-4a41-d60d-08dbd0ba1771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HX3ScPvgxQWved7obQTtRRRJB4MQ8wII4xiJdRiaebrLJ8iZzxrmltPQWQTG2xyyPXLQBPhmkR12OqThC67y4xUEClx88pihWmWelriG2hhseZt8dt5CGn2ZssU+8ZzHNcEdYDoMqbS/WJigCoiE1Q88CBuemWpxLcycXXzNOxXkQ2PPnnn5bj4tPm5FCXOqjjDapr7LVg8uMxkUU/jP875LR3kWpZyipUsoKr3TEAXgW0V5bgmyZPC6E+C6L18BZvb6uMDMb/CTp0Swx0moYSCKp9hdK4AzrV9F7b6DEygaZTSWLsS5ttQCrLOHUN4Spu3cLZLlI6e8EALn8fFytpupP5pAuG86xNKgFWlI7N95MKa1pvmNgTE3y5KLi+QLrXpfeAhiSNebacoV2rE6eRJCo9OIJ33iWnWEe5xqSG7gnyKfJQaNDJvvZ2rQO6g5yNhe0rItTrZuYWO17epgKQhvKfZlz372hznamFFDYkYgT5WuX829ZzmLROmzYyC0Prfuo1ZyVFYPk+TlTx/sz+ifrwV1IAr6rixacYAGN0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(396003)(376002)(366004)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(3480700007)(38100700002)(83380400001)(54906003)(5660300002)(66946007)(8676002)(4326008)(8936002)(66476007)(1076003)(316002)(86362001)(2906002)(66556008)(6916009)(966005)(6486002)(53546011)(6506007)(6666004)(478600001)(6512007)(41300700001)(33716001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZPTmZ2T2kyM2Y0dkhhRzZoTkFMYWk4M0tyTCtRRm9ybXVoZ0dQcDlPOXpQ?=
 =?utf-8?B?YVNwTjVmOHc0L0hBVW40bkpIMGsyT0xxdlBxYUpCL3huL0thTFFSclowTmlG?=
 =?utf-8?B?MmQySEE0Y3hSM2VqNEFaTHRhckNGbHkwcXNRRmxsckd2YzRqdjdyTkNWM1Zj?=
 =?utf-8?B?RFlQN2dobG9XWUs5RENnekg5N3hvSEtGZmgya2RwcWxickJSQXZxY2YzZzBq?=
 =?utf-8?B?eFVyblNBU2JHWWRLTE5TMEJzZUFBdldRZllqZEdEUmxSeHNMajkzanZQdXdX?=
 =?utf-8?B?c2tpYmNPUVJqWXZ5M2V2RC8rZjlzUVM1ektGYTJ2OTBjTU9KRmozNHAySVJq?=
 =?utf-8?B?b3pvYytWdVQzY0dSUlkxMW81UlZxc1BQU2IzNzFPRXRVbEdHVElKZnI3eDJz?=
 =?utf-8?B?THViZTh4enYzZTFDOWQrRzFtU3hqSnZpR0krblloalpGV2FRUUU4NHYvYkhM?=
 =?utf-8?B?ZUE2d0JGNGJIMmVFSCs3cWF0VGhMVVBKWTlhaEhIQTJVVzRRbEgyaE8vc2N5?=
 =?utf-8?B?MnlxZGxKSnd6cDlPVWN6L3AzdWlhSEVrT0s5UmNuUmpkTDRMRG52ZWNlQk9q?=
 =?utf-8?B?U0lTOFYrRDZUYW9CbGxjcHl0bk43VDkveFo5Y3pvM1Y2YzhiV3lXYy96RFZs?=
 =?utf-8?B?L1J2S3hDdnd5N1BqYVRJVGJ6MytaWFgxL3pxM1NrODVWNnF2Uk16ckJUVkRR?=
 =?utf-8?B?Q3JvNmg5MVRYVzF1TWJOQTJUTFZmSUZPV0M4VmZ6WmNrU3lSRGxkSEt3Q3NC?=
 =?utf-8?B?YVFnSlE2WEVhSUJvZGw0ZDJNZEtralVCcXpCNmp5S3puUGlJZGxJZ1BnVUl6?=
 =?utf-8?B?N2NDNVJ3clUxcWxWUk96UmQzSHNpTVh1disza0lCR0Z3dENIUVlhVXpSdGsr?=
 =?utf-8?B?UkdPRktJam9rbWM3MEtJWitpV0ZqVXJUeVFnakY2ZTFudk10MWpzWFc1VVhu?=
 =?utf-8?B?Z2lzd0tOQklRUDFlK2FhaWJML3cyRmNRNmYvRk0yTis3MnVWTXU0WVJucUZq?=
 =?utf-8?B?aEYxYlFaLzRZQTg2TUZYblo4ZnRlZElDMGtUWmpDZEVnSGJBd05kNURUVWRB?=
 =?utf-8?B?T2QzU1JXNFF1VisyYzNlZEs4WmY4aEdjZ0xRYnoxNUhnTUowVFptYXhCMHVZ?=
 =?utf-8?B?K2V0YnBMZkV0RkI1UzlESWR0SU5YazlMQjd6QkpxOXNvU0Y2ODNGWnNaTHNq?=
 =?utf-8?B?Uyt4N0Ryd1QrWFR6RDFKNzVndzljb3FrUlk0TFdaOVJacG1nUmg5UnliWFBy?=
 =?utf-8?B?R1BSem1VYlpPZW5UQUc0SEtDK3lJbEJGdk5pcnZYYkt4SFB3bDJPTnhhTVlx?=
 =?utf-8?B?bVAzM05tZjNVQ3FvTW4rMm1BdW15RzhvdHQwaDRYdHhCeDBQeXJxM1dOaFpT?=
 =?utf-8?B?ZGhndDdnYk1tUVVoWFlBYnJLN1VsWHh2WDFpcmxBWWVIWTlrRVU0anlrZ2Ux?=
 =?utf-8?B?QStTSmhNUkFQV2VuMWY5c0Rid09nSnJrV2Y1eFViMzZOVmN1bHYxZzFDbC9X?=
 =?utf-8?B?RkQrT3czSjdwbmV0WTA5ZkZOdHRYczY3MUphM0RBWWZaWTJwRU5EVTRnM3lh?=
 =?utf-8?B?RHFkZm0xbDhINzJoVkl6d05rOVZYa1NPR2FXQUtoNWhYWXpqL3dkbTFWQnRu?=
 =?utf-8?B?OU1lRW8rbzhDZ205NEF3SWtwNzc4S1pqL1FTd21SOGx6Vnc5ZWhldWN2STNQ?=
 =?utf-8?B?dmRnekpFMnBUZThZNm9Zc0tlYXNwd2t4SlUxL1hRY1BwZHdCS3FrWjhENm5m?=
 =?utf-8?B?NGxDblNBYkdsUWhiQzF4ZjlpcjBzOGNsLy84dXpGeTJVWnFUaVRxNzhZZEdV?=
 =?utf-8?B?anRVK0FFbTFHRDM5NERTL2hrUW1HQ0hLK1dhN015WktTL0c5RVkxaFJPNXUr?=
 =?utf-8?B?N2V3dnJjdm1JVmh1RW5ieExiTHNjUk4ramxreDlCWGtJU0lxZmlxZ09QamJN?=
 =?utf-8?B?SloranpUajhHOTg1VXRLUUpjMitzVHh3VjNodGtuRXB5cTVreGRwKzY3UXNO?=
 =?utf-8?B?L3ZPR1BQZHJOeVNJNTJRU2lJVGZ5dW5wN2RCUGR0UTFTTEltMWlwQnRRS1l1?=
 =?utf-8?B?VDY0QkV6YlRKQjZhSE9YSHB5VWJXNEVmcEIzK0llcmZ1cGRxdjNDZ3BrSEFC?=
 =?utf-8?Q?opIzC6tclH3YBl7igm8hZtBUm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oZBx5UatdK66WCdro1Ce8fwQA/koZTCMnk7foak1k+HmLI1NUaqIMnjmQsIhVsgwggG69keaEA3n/JLCP5as8m0wAQHEqeSw0nzUdJM7phWWPp7Xkpx3ocafjSgMm5ky4XPqqQb4GHmPFT8GNArrpSBv3uTUQlXOI6HylpGFlV2D3sIrRGou0pgUOnGp20BH5ch5tJqgrs2ctf9M3b/4VWi0rHO8JZZJ+jSBy5sedDNPoJdZ+8CgQyUGl3ggab7Mgs18+ikRX4aLktgKMPYurjsOABSejN2v2rw23oJXIN98JTb7LnnHKuagu169iTlbcCPA0ozqSGtCPxL++CmlXAi+DGYev2pn004trymOdL5ECpTm5DFztFWFBiGCsSr+YnToqQ+clnxG+6c+V8B05xdh16dE22ww2Yd1RDTdSNWj2NKdeQatUV5Jl+bwrvf7NkznTb/BW2dKv7ROA8N2PENEISHQuBhv0wUIVCjkRR5zfohEJm215UE+WGJHak9+uQ4W4NuF2nGIaWcQckSHMkMXJYvn/9lR/u6xR9/ALwOEfP6tMQONzCcPk8jy3IilNfcUdetq8u+l6KRqUz+ssUzA+H/ZKIM0E2ipMG8B7rj2CSFNfR5gmNux4z5XxMDwteMbTsA3B/g7JxxceYXy0QyArIRhqxTg3fWmcEkH9kJZFmjwOecx0+esfOEKtCkBUtsTpTDz1cFNjxpP9baKiw+TeIknQPoqZZ487MtjjYN4umC79nBjoh8OsYffemRZN6vuwRzn+rvhns8P/zSbd89ZGeQ9fYKX7Rx+F25eBof1AzPbI46m3ibqUW9L7/RfDX639pE1CU+SYTO3gYa86xmr1B1BtMPA4oLzCtD/sCxNBkcv9ywoBCEWQadIWBSw
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4683c7-9259-4a41-d60d-08dbd0ba1771
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 15:43:07.9868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfxukOukxViaJLilNMLxENKj4X49hiaFcs7W2IGY/EjlPU/lhq4f1T6qK96aNSvex93iHoj00kxYdAUeOmAxfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_15,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=572 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190133
X-Proofpoint-GUID: XjH018cEOXaD3hBb6-IaXhy4V_8it2rX
X-Proofpoint-ORIG-GUID: XjH018cEOXaD3hBb6-IaXhy4V_8it2rX
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

* Geert Uytterhoeven <geert@linux-m68k.org> [231019 09:21]:
> On Thu, Oct 19, 2023 at 2:50=E2=80=AFPM Linus Walleij <linus.walleij@lina=
roorg> wrote:
> > On Thu, Oct 19, 2023 at 6:11=E2=80=AFAM Dan Carpenter <dan.carpenter@li=
naroorg> wrote:
> > > We could add that kind of
> > > thing to a todo list by using a KTODO line.
> > >
> > > KTODO: add check for failure in function_something()
> > >
> > > Then people can look on lore or use lei to find small tasks to work o=
n
> > > or they could use lei.
> > >
> > > lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=3Dmid =
'KTODO AND rt:6.month.ago..'
> > >
> > > Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.
> >
> > I like it! There are too many of these things falling on the floor.
> > An easy way to stash it on the technological debt hitlist would be
> > really helpful.
>=20
> And if people use appropriate Closes: tags, someone can write a tool
> to only list non-closed items.

Could the tool also look at potential git commits to the affected
function if Closes is lacking (potential opened issues)?  Sort of like
the stable kernel failed to apply patch emails list potential patches
that may also be needed?

We all try our best to have closes tags, etc but sometimes they are
missed.

Thanks,
Liam
