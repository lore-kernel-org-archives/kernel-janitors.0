Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64507C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 08:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4111560EAF
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 08:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244747AbhKRIvo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:51:44 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61906 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244746AbhKRIvf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 03:51:35 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI86Rk7032131;
        Thu, 18 Nov 2021 08:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=cRjzRnMhP+qKSGW0dhACQ34om53u+A6QGY6ftt0RkFQ=;
 b=GB5M/Ai0cNUtw7XFeWx1NH7h9XpoSpKsNkVXRZAD0s61RsR2VscplpBkxdoXlHKp1uJ/
 aLi0TjFtwICXIqiX76p2o3zEWq5hS2mzMaGPaoSchIJ/t0+Pmk5BR3vWWnzDOTFT2qzy
 4XAH8to2MS7m283ZQd5sA1UbTtfUXzh4dcsXuUCOv1IEklP7w6eMWKkF76XZT12JnjLh
 wHmcnKqvmbwtLXceiPG2lHP5vw7B872pCIv06iiYWPTxDJvYuPECP6zNv6lHBJLqX1wv
 XWOCsDHOs7NTxWXyd5O0cxAXj8bV9v1Y7JVDxAMXW7Nryv2ROuCHqGYutXzQZ8GvY1Xp xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cd2ajnjcr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 08:48:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AI8eVIi133472;
        Thu, 18 Nov 2021 08:48:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
        by aserp3030.oracle.com with ESMTP id 3ccccrdfej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 08:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQNsjcxt2p7h+YK4U4gj+kw5voTsAQtaVXMyiJgImtA3OzQ6DvTOPegLDGPWYFYpc3Gyy2/y26YAZ/ixM7FUsOyBdp9wKKjDZoVMFRLMu1BPpIveP71fBcuPdN61F3mrYfKAXVYWijUliTt+ZllatXWoiM1/J7W7eXnuT2873CDjOwRJA/Z1cDsMrH6waI2lI0bZYEFtD0Ho5yq2iNPZrdgF5SV9IgkqefEB2VKOXlPU2wQZ4A4f+ENSDbX8d3EE7NCood7kVgaCttf17xpp6QoxhfQSpQlNE0YEYXtyog4GjZ7GBreopR5nbYTb0SjjwvSkvihiliVbDDw5CLnBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRjzRnMhP+qKSGW0dhACQ34om53u+A6QGY6ftt0RkFQ=;
 b=QLEuA+KaUXQe7J+YCwNNWXNDuQISwt1aYSzbVT1VW+0YbHe12U8/tEbQexSvZjyLHrUi9ULarLCgeto3bSMLUblsTjGZgNVWQUEBNXCevfB+saoqLTz1fIhUUnRIzTKJZ3k1U4QKMBAivkHrnEB3MpHJckoN5NfJZWrXD7lx1R8+Cuh2sQRIjgdXiI557oXOmgyRAc0PflCvhz2rZbzM88IBncIDMgffH+p4xCHEetSMxhzWGrUnf9JD5cTfv9RFqS+gEYnTqAiGzE1woVBCjK64u2RjrA1D9liTdNGloDMtcZSBKXp5ua60MmTJu46SZOkujPwjuiz0gw4i+xr+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRjzRnMhP+qKSGW0dhACQ34om53u+A6QGY6ftt0RkFQ=;
 b=QJTAb5btlGZ6MZGFaJpckVAlYS5EJ+5yCES8QiCbRXj/I7Q6Li+Y48YvSgDuMCgyyP+w0Sl0SBgaqnp4hBQP5BdZk8PbXtbO0lOiUztoGriwC47ZpZkgE4OjDyriPvQAsyMjhJXwpob/jZqsoj7GbbewzhIk0dgDxDHxZFMH8zY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2254.namprd10.prod.outlook.com
 (2603:10b6:301:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Thu, 18 Nov
 2021 08:48:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 08:48:22 +0000
Date:   Thu, 18 Nov 2021 11:47:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     luca@lucaceresoli.net, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mfd: lp87565: Handle optional reset pin
Message-ID: <20211118084731.GL27562@kadam>
References: <20211117111701.GA23355@kili>
 <YZYQ9KtYvsP7RfzX@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZYQ9KtYvsP7RfzX@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0067.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0067.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 08:48:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e8810b-36a3-4070-cd9b-08d9aa702d65
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2254:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2254F63DFBAED31CD5B119BB8E9B9@MWHPR1001MB2254.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3grZgEE6+TXVe0+ffStBwkMd3qideeVvaDjKQvT0yXtyB1h5gb556cWCMihiEUJmdIsE+q08pe+6gvGYrgxrryp3PUWqHrj+oCfAWqTIOioQNYJ++2fHLpHbRmHn150DTIs3v/J7oXCIjgyMAM0P9tjPc32vdTgLjnG5kvQU58H373U2uMfVFb6VMG0p4aDKpr/GvLHquMnKdvsemVMH4Uekp9OPAYZH+vM7AclRa8q3+/CpelZbt/T3nOBoqrZixtxjZxz/Vq6mcMzi/P3LRz5CHqBKf8oWdtGL3JgYZFqdToQ4ksZfJDiIXn7k3o9xbffNhGk89bRZwtcTc8nG7mdpAoDKoy2KseUyAIm0EX3m5DRdoCBG2qIV+gNnfzroQKhaMY1uQivwCP+ynRoQfcqAYW2Ll50Y7mH9MfWlye3fPGUCvdAvdxEeW4AoLO4nYjFcQc1geshBRj+ailSr+I7odLM1drDtyGyn+ZEOlEMAh39hcCL7k51w5Gr/y2/F/8TkR1bu8Qum1JGr71Qj0JxSBvK7o8P1aly174Ent1lWHK+nqUCVOGVKYA8jFd1ep88b0FvO6RPK9d/KyELbz642xuXNkp06y+ji8K5yJHrZAi/ar+MY8fZVlDH0jJcsgBOMFMeiVFtoC3NbNsZO/aeGdFm3i1fm3RJK8IsJvFHDFW1wLsaDMG+gRMARPCR9dDizLLQu4WXCdwAPI3Wdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(9576002)(86362001)(83380400001)(55016002)(33656002)(9686003)(6496006)(52116002)(1076003)(2906002)(66476007)(66556008)(66946007)(8936002)(44832011)(33716001)(6666004)(4326008)(956004)(38100700002)(6916009)(316002)(5660300002)(186003)(508600001)(8676002)(26005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOYcnLh97irFhiI0CbVHcRCZ3Xc54kP1+z9XO5nbLnUHqU3FCUH7ytYAW8qQ?=
 =?us-ascii?Q?BzOq6UOyAFRWpPELdVjjUHqMqMQ6OCh7fMEtpv/kZRCPnxd5TBH62/h4Hw8F?=
 =?us-ascii?Q?fc0Auzy+1kvd1Ifro4m0BAB7iZ4O8NAIicRRyH8Jk3lA0/2sRcEi4g4ScmU7?=
 =?us-ascii?Q?swCAgzH9HtPBH6UkHB2V24Qs5Fv6cEq8OHS2RoX1lxUALh05iGTcU5xQt9pK?=
 =?us-ascii?Q?XJu7ZWAVQ47Wl69l8u7qD82Cq3aD4oYDbvqZl+IHr4YfuXnwVk88Oq9qG/JH?=
 =?us-ascii?Q?UCLuEh6TJP8+5TdwiWzpp8OMXf4c8vK7IGldVBt4WXEpV3gUFHbGxJuDIbPp?=
 =?us-ascii?Q?06r3dkAH6YmmSu8TSHi+3e3i2fDMbhSV1XmkA14pSdrExBz+qM0+14xfy4Tr?=
 =?us-ascii?Q?JXGaJKvGvHE6Zwzy8ItIogDLciFFxPSUveR0Ase4UIxTqwvWPkkN5jixv1bw?=
 =?us-ascii?Q?+0ztTBxPaBe0+qEnlD4qzLVKLKGv1g8P4Mv2Tb0hpHKAi0sMLP2hAob/IfrC?=
 =?us-ascii?Q?MgxnjOaQDtMlVzsJZpeejnneRidctXSD7X+rKwQJiuQ+A+EMuei3PNyt4RtA?=
 =?us-ascii?Q?i46q/tx5VTJFCMpTrFMWDWS5ztlrZ/QyfCOBg6i23FfG/33m7DWLwYAhR+qC?=
 =?us-ascii?Q?43MUnBNA0mN4/E/hPTsiYW93BeN18atLbgxFmYPUbKJ/ZQE0R1RDquc+Q+jI?=
 =?us-ascii?Q?O3qP4gg6e5ycj4YOHocJG4SAeBMgdFcZeWLUxLbEUshMU1M5DToJA+SXxmkF?=
 =?us-ascii?Q?C5+90CLahYS/Ln94ZQ37HbJcTxe8ZvIg9RtmDwi20TdE5+2+P+oT5gEYgtGp?=
 =?us-ascii?Q?B3zGd7SNI9ZDNI8LZtv60TQ17bekxmoBmTlJagaRjdkOraHXWZnceesrVHD/?=
 =?us-ascii?Q?+bVhFdw1AqGC79OpiBCh0NC1lbqQQEAPiu5uxXsjNkQA6MA0DHfRApfic0A7?=
 =?us-ascii?Q?/jgprz/grV1vxZJhkPXT1y8uwHb1WqkTaEbAfm8we0yXO+XAUscxPfOElYH+?=
 =?us-ascii?Q?XlhucEUWikU/r3NnP99eXoT2bfT2GQNQn6thAEkoYBNiudCz3spE3TyW9Pvs?=
 =?us-ascii?Q?BGF6KBVP1LTmSS9rzstnwYDK1WZQ6muwbpMqcozO69HwL/X60c1iXtbonYp6?=
 =?us-ascii?Q?Qk1UlsnSWYJtXXayy+FiAi4kycoUkUhpGGt5QkiSoR/IMW1bqTverRmzFlXU?=
 =?us-ascii?Q?Fq+wYMafG2svWrWZdPauxt9tO5IbM+BwAaxFz9VcNQZGbpshOa9W8mAkjkEk?=
 =?us-ascii?Q?MdJksD3GSKXK2LPml/jtHdf4AAAg1mYQ7TdsjnINotDuUNu4LI6GPcfO9Bz3?=
 =?us-ascii?Q?u75l9SUdnYQxEdCmOU4RRBz+o2V3G9UE8m/5EDEdauu9YwH6I3RRuLs76BlM?=
 =?us-ascii?Q?nzNIxQxy2D1mxkoA5zo4mqYsijl5opOLrf1tQ0GW9WAQ2dB4Hm62hkCpHplQ?=
 =?us-ascii?Q?KBG5JwYKQiEnPj4keEtrac1cW94EfXWLOwC0E3liVIzAkj9ZNdxLok8RIgIa?=
 =?us-ascii?Q?hM9Gt70D832842EsbNALxiu7utMkyriD2qJrNB3p3WMu2fgA97qkgnoOjvHw?=
 =?us-ascii?Q?OkcmriRdLhhaJFSc5p7fjj1R/2Yh2Lt/rA939B5ZdTmCAfP2p19eUUAkW/SH?=
 =?us-ascii?Q?2McYwDATO3nHKf8W7PCsx6x2+XaDHaAeKqa2t4rLugiOtGklBB7KvwvCRRvs?=
 =?us-ascii?Q?tcoxA1PPKQpX1nge/uLpclH3VM8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e8810b-36a3-4070-cd9b-08d9aa702d65
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:48:22.5720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh+0Ptr1bE4uUFyKAkoFJZwK4qsg9PXgdHB18lbDYlkm0r9ADxL7YO8w1SRNE9u8iTzTRxKpEhTabo6h6poI6CD8C1WD2Im598KLtJNZM00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2254
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=992 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180050
X-Proofpoint-GUID: 5Jt0v2EF0nbCXe9cBm_ZJhzsnOh0-Ibg
X-Proofpoint-ORIG-GUID: 5Jt0v2EF0nbCXe9cBm_ZJhzsnOh0-Ibg
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Nov 18, 2021 at 08:38:12AM +0000, Lee Jones wrote:
> On Wed, 17 Nov 2021, Dan Carpenter wrote:
> 
> > Hello Luca Ceresoli,
> > 
> > The patch 50e4d7a2a667: "mfd: lp87565: Handle optional reset pin"
> > from Feb 26, 2021, leads to the following Smatch static checker
> > warning:
> > 
> > 	drivers/mfd/lp87565.c:76 lp87565_probe()
> > 	warn: 'lp87565->reset_gpio' could be an error pointer
> > 
> > drivers/mfd/lp87565.c
> >     46 static int lp87565_probe(struct i2c_client *client,
> >     47                          const struct i2c_device_id *ids)
> >     48 {
> >     49         struct lp87565 *lp87565;
> >     50         const struct of_device_id *of_id;
> >     51         int ret;
> >     52         unsigned int otpid;
> >     53 
> >     54         lp87565 = devm_kzalloc(&client->dev, sizeof(*lp87565), GFP_KERNEL);
> >     55         if (!lp87565)
> >     56                 return -ENOMEM;
> >     57 
> >     58         lp87565->dev = &client->dev;
> >     59 
> >     60         lp87565->regmap = devm_regmap_init_i2c(client, &lp87565_regmap_config);
> >     61         if (IS_ERR(lp87565->regmap)) {
> >     62                 ret = PTR_ERR(lp87565->regmap);
> >     63                 dev_err(lp87565->dev,
> >     64                         "Failed to initialize register map: %d\n", ret);
> >     65                 return ret;
> >     66         }
> >     67 
> >     68         lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
> >     69                                                       GPIOD_OUT_LOW);
> >     70         if (IS_ERR(lp87565->reset_gpio)) {
> >     71                 ret = PTR_ERR(lp87565->reset_gpio);
> >     72                 if (ret == -EPROBE_DEFER)
> >     73                         return ret;
> > 
> > Only "ret = -EPROBE_DEFER" is handled.  Other error pointer will lead to
> > a crash.
> > 
> >     74         }
> >     75 
> > --> 76         if (lp87565->reset_gpio) {
> 
> I guess this should be:
> 
>     if (lp87565->reset_gpio >= 0)
> 
> If 0 is valid, or '>' if it's not.
> 

lp87565->reset_gpio is a pointer so that's not going to work.

There are two options.  The first is to just "return ret;" for all
errors.  The second option is to say something like:

	if (IS_ERR(lp87565->reset_gpio)) {
		ret = dev_err_probe(lp87565->dev, PTR_ERR(lp87565->reset_gpio),
				    "no GPIO error for ->reset_gpio");
		if (ret == -EPROBE_DEFER)
			return;
		lp87565->reset_gpio = NULL;
	}

regards,
dan carpenter

