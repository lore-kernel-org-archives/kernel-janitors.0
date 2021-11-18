Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1F8C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 10:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1652461AA3
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 10:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245735AbhKRKo2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 05:44:28 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46356 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245720AbhKRKoZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 05:44:25 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI9SXlN000720;
        Thu, 18 Nov 2021 10:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=b/mPqgjD2lLtmen46iJFOh65Zy84w/IdSoxWX9c8Gjs=;
 b=kIprD/5mlqBBokrzzd3Yl/eWf+PaFA9DFVkOn+q6CATYAX6MP/gr4M0N6652tD6Tj2XU
 UrktH2vJm5mSl57wcj75/zZvWktOHqyV5RmAoda5H3HV7Pn0EXEqd1aZS45vuxRsD8/t
 HuX7+yxuWRGhhW7+bNDlAWzqGh6BujRliYnMw0Utj+K3k1xpSW/xg+jbDDrPlyqdftwN
 K09W/VnohOFcxQTfyAXONfDc+wKyin3atiy6nT5KcJlynKrmj2Jd5/nqQuxkOhjhq1F6
 mRnFEq5KWcwAVqA0cC6HA21VthnX3xxMMDdi0GlX4HdMNs6DJJgG/x4//QBRPU1s9UNa 0g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cd205epyx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 10:41:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAb9uh169627;
        Thu, 18 Nov 2021 10:41:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by userp3020.oracle.com with ESMTP id 3caq4vsws8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 10:41:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Porw7HLjcvUxsHIQpagkirNUFQdrpzMUp7VhNaTyl80VFZaYwmDbAzX4JV4tGyMZDhHEfRL3q+Cr/7oC0siuYqWaU4nBb1QFMfaIxjSXtausqebzF/YKZ/W+/c/5EgLLvp9l6pglI0X70anO1NJNsBz4XHjUFjFTM9TJW+537QTEOgQ/z22Ky6PuZPc8SYqM03c2zQNThjDuJt22moGFolU96CDz8c2u1eyYdHEZwjDRoHykOqWpOofNtdCrk3AYjuus47PGqxTtdeshX3+N9TsqCnADdMtl7tkLTpfEM+/pAgez76DN7/JJqYr/HxIUh6hQOFSglzlON3kk8YVpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/mPqgjD2lLtmen46iJFOh65Zy84w/IdSoxWX9c8Gjs=;
 b=blObL66Bk+Oo5Kb9m8NKyFP4x6kiDexC9vvjWCm8GkOZOBE4/NH9586kAN7temolZQvxqTQmBU9BIqqI5o3jEDenuMR9kJCa8p0eRras2/kDl6SQfBeQIEITmY5iXGmL5ZDgG0waLlHTbMezGfQrah/KwkJmIBy7DmeWIIa3QMHgJrnLTk7Pc3KhK7Rtmhjm0RfPQJbuyZheI6dYzPn6W1uNjv6KEHwrlIKZYcIMyWWdNY5joY0N1RvSM6hcSIgVUT00CPcBJpKg9Tq9HUn01XZRv2d2zxyaIV8x92i6+qK5EImdAv9l6PSB5Mbz6lVUIFfq7mhv+/B1pCAvjIZ2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/mPqgjD2lLtmen46iJFOh65Zy84w/IdSoxWX9c8Gjs=;
 b=m9eVkXhB3IwhQ4rE29c9ZS+2LXLkEHNQQOK5vFV+K14lkyew7MP3jgGAdb3G5q2uywMHg0Hh4zgNBwlEYV6B8BcpRzXPDJ2Ch7N1TGW2oE1k6GukALUaTMmGSVGJYDxBC6HVcX9ZCIH0aosGCFAXm2tTvAsADGC2joRJLnlab74=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2320.namprd10.prod.outlook.com
 (2603:10b6:301:2e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Thu, 18 Nov
 2021 10:41:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 10:41:15 +0000
Date:   Thu, 18 Nov 2021 13:40:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mfd: lp87565: Handle optional reset pin
Message-ID: <20211118104056.GM27562@kadam>
References: <20211117111701.GA23355@kili>
 <YZYQ9KtYvsP7RfzX@google.com>
 <20211118084731.GL27562@kadam>
 <YZYWS0N7nluXjfKA@google.com>
 <ca9ee8e3-b996-5703-ffe0-81ccab93b872@lucaceresoli.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca9ee8e3-b996-5703-ffe0-81ccab93b872@lucaceresoli.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JN2P275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend Transport; Thu, 18 Nov 2021 10:41:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c062e390-c441-4ace-614c-08d9aa7ff24f
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2320:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB232052E3469968FC4E2E8B698E9B9@MWHPR1001MB2320.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRLrsPAm67hD6Fwe/8J9XSQYpRN/sMRRJkp5cs6EcScPR6Tok2aeAUkiD4AaUt3JaUBiEVEDCbRDLFKaNqkHN/OXEzTPoBs3AvNew4i75EAdMSdKlh7Tob35e/FHrilBJ6L8G6bJAL4DCuSLMbR+9CM+UlKYcWZ5N20nKH06+HvyJo7G4p7ohAGVpjLOmF3D+L8LuYvRHgIOA7UISaBxryMQzytuJsP3rA7McODn8voM0lC3lUSBQ6fjpGWyR/e4dI0zEEGLH2z14J1ztxT6N1tR6z3GW2tzdlHB/B6g95lJLRft9/uMT7ViNB2dTLMYdJ5vw0auDWTfxyzTY9r2OBpeTApgBXIPrQzRQLlpoCg8TVypkhwEf+ziYexXHcV7fh2UEC9yFq1x1EaE0/kpkTTQ7Fn1MbvzECFRfTsOqiJxRdvazXWsxPGssDB3BDVa4trKDfRzGSeLBD4aSqC+2tVVygxMKrcfm4ZoAvCg5fRizzPyWlsApi1XMxjlY5BgzfWtlpIFL1PQUXGGdKoyELzIHTUKLSnLkx9LRoB3kca2TbqAVU8+aam8XiI36vTSvEfpfdwxo18CYFi0Z3dXEhmszS4NX9N9E1zd/WScMUoQTMi2MwcqOUkH4Y5GA7c/ctL9b/6hJ40xX/9JIdyEx7aWyc75oIUNi21bh3C+WtGgq71PXPLDisoqXJdT7zyT+DHIofhBJx3kirkklzHQcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(956004)(6916009)(2906002)(508600001)(33716001)(33656002)(5660300002)(6666004)(55016002)(1076003)(38100700002)(6496006)(66556008)(52116002)(66476007)(86362001)(9686003)(66946007)(38350700002)(26005)(316002)(9576002)(4326008)(8936002)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V5nB4ZT6gO2KQ2wxoUs7FqlNpFqyNlNhYHZhEE7bnlNp23OHizMTtwFpcDM5?=
 =?us-ascii?Q?9vyehmKrWZ2uMP9j0kQXx5YQx8DooYIkMKnVHkd0vd/dHHYabd0Tuc2F2mdl?=
 =?us-ascii?Q?I3SQalvtiPVet+KZCwQq974cl64u8rCHA4KdnutQzjSnVXLUNYp0WPzhQJZR?=
 =?us-ascii?Q?JtaAUtO/2UUR3lSRAPXnykLlqWHMiZ9SWNeRA7yphZk2l3+zr9vglEbJE3yp?=
 =?us-ascii?Q?e/zDNJZN6V1hAm+ek9RT+0fzhngUc93z5kQRjX5Zb9l5IUSOhFhd4wUM7szg?=
 =?us-ascii?Q?2kkBPjhyOYy6zPx4R/9D23IxvqDi/qkd2gEwvwZUydliiGFRx3XuMgrdmfCA?=
 =?us-ascii?Q?BzHfUb5uXzOxJB59NCy/QKi1+h79dlOEQbQX+1dITOIf7OUvcIdknkOi7Lry?=
 =?us-ascii?Q?SxnxCXMd6XHmsRtgChaiNd9SdVWhDGnqDsOrPYelI/oBInbCh0N0KeHb1Kb8?=
 =?us-ascii?Q?Vct8vDIBJVqyGV/ancnvjRMJiOWWqbyoZur05bsO8hm3NjUZzWCNPuFp7bbX?=
 =?us-ascii?Q?tp2xy3mXojTvOklv/DhaDKLqAJwlUNkYwf7LPdOn0LXk8IqrK0h5Xi9ABtd0?=
 =?us-ascii?Q?yv0Ngel58AfOGqy8Yv2rHh/Bai1sDCDIzrBe56Ikb5bRCHO2TnEZqQnKkAjk?=
 =?us-ascii?Q?/MTybx0BpElO3TCSrfduWDwp07YTvYguY1AaEjRzC+E9iHPcJrn8ygCZMKg0?=
 =?us-ascii?Q?sd9z49G0iRM89O2huAZu8k87KKcvDwrWT14Y8dbp32R1EvYf8SpVdO3JtOT+?=
 =?us-ascii?Q?4sWQAaGchkAr+ojqkSKnRX/b9xNQoGz6CLsqjqgnll0qo730c9Wx3fQPKdfN?=
 =?us-ascii?Q?ANkA8FqorwIMC4OS6I6wnTyZKU2ogKffhKPbn9S9MLdsBugqVPlqKTRnk5nw?=
 =?us-ascii?Q?v3F97NuomUEGCjybwY9UdAl2I9GqIjT1d3IkJ8yTla3Uw8tNgUHOaqxi+qF+?=
 =?us-ascii?Q?o6EvoQvwZkMbsVa7GmTMYBD+3/iwcXGnqeqROeAuFj95z354lc90ALYLYaIa?=
 =?us-ascii?Q?uxhOhLgpxo21m/D/ph0zDK9eCBZeoeR17hBXM8bxVgAy9RbntD0Ynvy+s4ik?=
 =?us-ascii?Q?DzA5juKeNOouUx84jAQjdAvfmbcgXvbWYP5OJPtAYnDIFKnxu6n8quEYyFDS?=
 =?us-ascii?Q?l+NWLmKLUYqxXno51M1QlZv/7yWFycoaqrfiBJC3NTJbYkfSqw3NQr/LRXKa?=
 =?us-ascii?Q?mf96vkhQqmG1TX/0/IhchU8Xr+YAAFEVo+LvjsDVaf38OHHe5eDK+S/hj1K8?=
 =?us-ascii?Q?V1HVtJDHyp/md8jlBv4WOowHpJtbcNgLDkkCR7kXGr020GPl27zIOxiBpG+J?=
 =?us-ascii?Q?NUb/rixE2Lv47i8VKXI4MoXChccU37ljLBXXaE5gLRkCGwY0BPjmEuRqG4mI?=
 =?us-ascii?Q?M5dk4+F7UUvadqJCSAMiSaDAbuVRMPIVdYWr1K4C6aHBk/TRK8hf/pDwPDDs?=
 =?us-ascii?Q?bwZkHWk89Gipc3X/3Imlt/pBwu5yOswGS7yTsuu3U7Zws3L9VtnzS2Ge08y3?=
 =?us-ascii?Q?V4PaplTuIBKn2/es2n/ayB4jwpQfV3XqB+Ly++Ch5T1SArHG7pdsjl6DEY5y?=
 =?us-ascii?Q?yJ4E46qD4gtsBx0fHmcUBSxRpQfGy86rWIdg9VPFXVYtH5YaIznUEcPOlMfc?=
 =?us-ascii?Q?dW/7uxzIW1JZS1DCPvLyRtEOZbSQ/LwWS1BGW1ckKaDmC8Mhno4wLUihI5jk?=
 =?us-ascii?Q?oeyls430fGwMlyYBsvb70Q1Z2W4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c062e390-c441-4ace-614c-08d9aa7ff24f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:41:15.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VquPatgSGjEAUTMF4yOXSTl11GLnNIRjmVKoxtNfB8CNa0zR7uGstcXpSor6LDHUEd9W/Ev9QQXsRLt9BFqMqrq26eTZ68w8NnJQ/8uIDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2320
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=580 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180062
X-Proofpoint-ORIG-GUID: lCddkAmlISjCTEs8nkhV4oe4aSWPuIOz
X-Proofpoint-GUID: lCddkAmlISjCTEs8nkhV4oe4aSWPuIOz
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Nov 18, 2021 at 10:22:52AM +0100, Luca Ceresoli wrote:
> 
> As the author of the code to blame, I wrote this patch, but just needed
> a little time to test it before sending:
> 
>     lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
>                                                   GPIOD_OUT_LOW);
>     if (IS_ERR(lp87565->reset_gpio))
>         return dev_err_probe(lp87565->dev, PTR_ERR(lp87565->reset_gpio),
>                              "Failed getting reset GPIO");
> 
>     if (lp87565->reset_gpio) {
>     ...
> 
> I prefer to exit on any error as it would be either -EPROBE_DEFER of a
> _real_ error (e.g. GPIO already in use). If there's no GPIO specified,
> then devm_gpiod_get_optional() returns NULL and libgpio ignores NULL
> pointers gracefully.
> 
> Would that work?

I generally prefer that as well, because to me optional means it's up to
the user not that it's up to the kernel.  But it depends on if the
system can boot without it etc...

I guess in this case we know that no one was relying on the old behavior
because that would have crashed so returning errors is safe.

regards,
dan carpenter
