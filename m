Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA81C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 12:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDE3960F93
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 12:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbhKLMj5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:39:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21850 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231652AbhKLMj5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Nov 2021 07:39:57 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACBgH3O021429;
        Fri, 12 Nov 2021 12:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=s9lRA7B2ImBtzHcCx9ozzycfEUcxMINdAE+QfHQs7yQ=;
 b=Eq1GM2v43xNsC1j7iAAQ2nOkJMlmuW80OjkniLmWOYeg6gbnlY0c5FTNE2nGLCecxzQK
 dhprdxbMmV9iOheLWkyRKzxlHLVpn1WIxAqB9yYbTlUQ1twcGeIRt7GpZg9EphEh6gOH
 6m1Mu4Ygkw8QLNuaflkczh8DCgWHEBXGCgwPgIMIqZUzrkf0lM/KQRyD9u0Sl4NYWQOB
 fwb+ZyETCATTW4RhAaxUh4RePiBQ1yVsj53yy96PeuDkL5mvU1ZafbZEmcI+T0uuxDM2
 Qa1GWiDW5cfVcWeIJQ91gC+GoK3TW+ds1wh9kaE1vkTOjU2oD60+Y6fcKRfFURfD5kYY xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c9qmm8806-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Nov 2021 12:37:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ACCaScD072321;
        Fri, 12 Nov 2021 12:37:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
        by aserp3030.oracle.com with ESMTP id 3c5frjbx3u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Nov 2021 12:37:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJbLFZ89W0LFFwg23HzCn1PBlv3vwwwTcLr1xyqK3ClfJHtfqc0m7xfuFKvi9wmR0XVZOEwYTCYKQp9YI2+B02a/jwLd5sv1tmuevv4HKAPlf/OCzf/3mE+dLaygEK/d2SaNnbo6pZuw4+exyhh17Z1pHEJqwPAAAbAc9E84GqGLmWxnP1oTKCg+wUdn/1WWu2Yolxodr7p4QuM4p+uHgzf8aNeQLuSDoV8lYe/14QRnL1ONGhPn3AcfQ72ODOXxSG57hjHv05W45byEwAshf/xoTjmKF0p5I8GURMRGOED1RVlKdZ/hRoNgP938od1mkU3ajRHgnWWm9eeLWXVs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9lRA7B2ImBtzHcCx9ozzycfEUcxMINdAE+QfHQs7yQ=;
 b=RY5di2XmPcz5bv/GqpbDgmPzVHOhUDXpzBCx7ywggf8lhAt8R9A2099JRZAQSBrvqrT7GbdBmdV7T/89L58Bx1nX7WBzlG5Z9p37FU+42/BjtdOHX0aGl+5AifIvU6Ja0raOccKovLiN4v6DWdhtMMa4l6TU3Pv3gRReBQUHaSX2XfQiB/EjJ41Zudnwx0ib7KUAyIkqsyaLi0/WDLu9mpD3KZxj0Dsz6HX8UD4NVDyQYN9qYrKIx5BtA62vrkb+tQ7rG7N7gOuW5NNl9MyYcJWcHEXqck2vRIYDmu3zhYAfP0waY4bUc/4XEWidItshSrd+6b5G4CuEe0g3tG1iVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9lRA7B2ImBtzHcCx9ozzycfEUcxMINdAE+QfHQs7yQ=;
 b=j9G6pWY/7IbOV/k6zy0zcIcL940PUhoQsg7rq9tZb60cW8tXm3hlkciKiwszUYv3OYkNBXnRveYcRxsRzkdLAcF5TovKM3gyPxY3XMbIOlZnSAXg4UCkctdQHz0XE/YRVp7raDB98gj6FrHRj66GMVLOCkXpK6ljmh8BBO8d4Os=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1486.namprd10.prod.outlook.com
 (2603:10b6:300:24::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 12:37:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Fri, 12 Nov 2021
 12:37:00 +0000
Date:   Fri, 12 Nov 2021 15:36:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     l.stelmach@samsung.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ax88796c: ASIX AX88796C SPI Ethernet Adapter Driver
Message-ID: <20211112123648.GA21129@kili>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0119.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0119.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend Transport; Fri, 12 Nov 2021 12:36:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e54c5de-f391-4b66-7006-08d9a5d91ecc
X-MS-TrafficTypeDiagnostic: MWHPR10MB1486:
X-Microsoft-Antispam-PRVS: <MWHPR10MB148675E736D371B72563BD848E959@MWHPR10MB1486.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8jP5HP+Gj0kN7apuZt06Yd/ALHy3spN/eDPxj0z53zuYD0kIlWc+6zfZ0TR21dkZLiPsFtk0WzmeQh088VerJeR5vAK3J2O7ahRQ7Qd31TAfms6L1h7jNzHq8ptOJSHJleu4yp7gpNdEqAtldVBxBlLMZzzCaN5lnEV2JSGrf/t8tLQM7nRPI482baGpzZ3CbQvBS0tnU74vwVfMiDFBpgg6WJtfeLN+4hgyq79G2/rBOz3/jg2KQ8RTO1nUaeLDcX9am09NZIYZ2pmWIbcGp0ENbzghiK3bikdshkNiWmu6nrH7HDtRbtzLwzMJpzKDr5/lxJoEQBEEKQxb2zaZPHYjxjxcOhPmLGfAvoj7Ieea7aF0Vo1kqa33AwcuCeiTxL04M4h/sTOXwwnFGQ22y7nQViDnYcvkyyJO4n6HIdP3FwFOOBtYoLLUufwzC9/rLqymjd7rTpAt4dWCIBN/N37VilkL2hhR/X+J6GxqwT8iIawxvoMHN8AATR1k1/mUg8vjGLS7E9xKNzdsPW3M80BF4FBFw3XbwMl35D+hUPvhjjXHFsqRL1T1D//q8Fnp6lDFLuT2xqL5uHFjQ4t22e3Y2+fCGtdO7FvWKhCoTgdWla8w5nzN+vcj5kcoYwZ+e5Rt6GYpJmVyA2xDSkuLNOmjXOQyClfMxFzV0OKq7yN2Oy8cHGq8H3Pqp3qIN6zhRA46Qv+WQD+7bNR3YjPJ8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(316002)(55016002)(66946007)(1076003)(4744005)(5660300002)(2906002)(9686003)(66556008)(66476007)(83380400001)(956004)(44832011)(9576002)(52116002)(33716001)(8676002)(6666004)(8936002)(33656002)(6916009)(26005)(4326008)(38350700002)(86362001)(38100700002)(186003)(6496006)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEt1NVNISThucXE3KzY0bmUrNWlzcDRGU3d4cTZEVW94Y2xSKzVaUHRBamhK?=
 =?utf-8?B?am56QmlYUjdENGFLUTl3ZEtqNDhZY2pjNlc2dE5IVUJ3ZHgzV09EZFQzaHBD?=
 =?utf-8?B?Vlp0NW5VTXpDNGI2RE9JVTZheFZUdUljYllEQVBxZTU1Qmp1dGp3YVltZUFU?=
 =?utf-8?B?amVweHFaaHJjRlg2SUxxUHdUMUgzRG85NDRuL2ZXdEhseElvN2hVcys2Qm5X?=
 =?utf-8?B?Tzd5OGYyM05uQUQvV2lsTko4RmZobDFHejBTOTZ1NUw5YWNCWHpBWGY4bkc4?=
 =?utf-8?B?SkVSUXJnVmQxUEJ3RUp0NW91WnoybFdkTldONUZVN2ZQTFZwU1dFSS9TN2dW?=
 =?utf-8?B?QXgyc2QydXRhRWY2aS9lQjFnTDFsV1VYVEF4RzhydUJjYVd4NmREN0ZYUWZI?=
 =?utf-8?B?cHNJYkhaMko0bWpFVkREbisxdWNHTW5wcGkrWHVwVzNXdm0wandvUmY0aHVF?=
 =?utf-8?B?OVg4SFVydlZhL3FGbjFlTm1BMUFjRFQ2d3pYWUthQ3ovZzBnVytFZ3lpUGRs?=
 =?utf-8?B?S3hCcUJHdXZJNm1Pa2V5U1F2SElXUHExeXEzbnQrUUNDS0xuYk9hY0w3Z0Qy?=
 =?utf-8?B?dFBtNGhSeW1ScDdqMHRGbjI0dDU4dlpMUXBHS1kxRzlPV0ZPSjNCcTZjM0Ix?=
 =?utf-8?B?MkduR0J4dkRnNU5tV2xqRjlSZnFIV2owT3EvZFRLZDF0eEx6UHUzTGk3YWFS?=
 =?utf-8?B?VVNxdEdONmUvaEpzOFdtZWNuLyt0bDJWcjhQeENTdWxWeVFlbERBcnI4d2Fl?=
 =?utf-8?B?SnR2MFEvYW9ISDdFV3JFSXZhQkJ5Rzc0WGVhMmpTd2ovSFBsRGJ1clhXYnJE?=
 =?utf-8?B?NVB4Wjh4cjhWekZWUHZoTElwOWIrT0JMdDZtWmQ5YkpidU40K1J6Vk92VDJG?=
 =?utf-8?B?a0M5ZVdOc0dJcHRkemI2TDZRbEFnWjlqSWIxQ01vbGk3bjMvMzZBa3NwL3U0?=
 =?utf-8?B?d0tyWmk2WEY4dnRYUXpIYXVjYmFsZjJwMUpHRG0wcTl1ek81N0huL2JpSm5V?=
 =?utf-8?B?SFh2alBncWFTRXFpLzB6dWI5ZW8xZ3B4eUpTc0VqVVRBdStnNHBPTFFKWGF0?=
 =?utf-8?B?SGJFcy8yNVBFNEw2bjUvenNCQWd1SHlZZmxMeTZRckI5TFF4cE84aS9nOEhh?=
 =?utf-8?B?OUdnTTlTMkx3MEpnV3liOXF4ditNZmlKM0Q4b2kzU29aTEt6ZFVLa3B1TkFG?=
 =?utf-8?B?MXZuc2c2Mmo1aUR3OVA3d2djT2JyejBZTUdlTVJaeEgyTzNZbVgzT0V1Z1VH?=
 =?utf-8?B?a3BUdXl5VEZyb1pKK2x2bmFlMU1NOThOUDhpcG1jSEQ5c1pSVnloZHZHWnZ2?=
 =?utf-8?B?d1BHTjhzekk1ZlZhVVFqcGtrMHBwalJ1Z2dwZ1VUcVAvcmJraVhDTmRsNmJT?=
 =?utf-8?B?R2JWNng3dkhoNVZNaXpwc2ZCWmx2b0MrNGVQNnVVMWFrTW1qelNSSTl6ckdv?=
 =?utf-8?B?Ri9CRFFwTHhRcUlSdG15SGM2RDJDOXQ1M3Zod2Y1VXpKWTlJdlJadEFQUWhM?=
 =?utf-8?B?aVlDRDEyOUs5MGlmUDcyNElVeTcxa1F3eU96SEU0K3NnWkN3WEFvN1Q4MmNH?=
 =?utf-8?B?TVhMT21QRUgyODFpVXJKNUlMNlZhNk1rbmhaekdyV0NQM3hiZTZSK0VyaFN4?=
 =?utf-8?B?NTJJUnlMNEJCOUx4VXg5eitjNnRSb29iclA4cVBmVlk1M29zNkwzN1hiRVhz?=
 =?utf-8?B?YUpYUm50Y29ObjAzVDNXTGxaTjBIZTE5OTUyNkZqOXd2a1dzWVh4b3BQQjYv?=
 =?utf-8?B?b1ZVbFJVNFlTbUZsUC81bTBiNklNZU94S2hwS2tmbUt1bGJkancySk5QclJs?=
 =?utf-8?B?aGd4VGhoNkliLzBKckh4aytiYk1CWFdnOXVSMlBOZE90WjNodEpYTEc2aWFu?=
 =?utf-8?B?Qm1HVnpLcTVtMnM2QnpvSGZFYytPRkszUzF6Z2hVWHl0VWdHN3RaTC9MbXJj?=
 =?utf-8?B?RXd3R2ZqeEtpNVkxZnViNkVjOTBpQkN4SnJDSTNoQ3RQanNjNGxrWFNTcjlR?=
 =?utf-8?B?YzZRbHNqMDZnbmRhcVRQd3dBRDJwWUNYVnE1bDFVT21FRDNUdHhyVW5uZUVO?=
 =?utf-8?B?QU9FZUlIak9rTVg2UEpxS1VBYUxzU0l5UWpPQnR3Z1J0NStIdEwyOHZvTUVp?=
 =?utf-8?B?Z2dHNTNxQ0hnaTh2Nk0zUW9tMGlJZWQxTWo2TGhncktCbWQzamx3alB1RTk5?=
 =?utf-8?B?bGRrcVJHeGNCMnBNbVZJVVBOVkhjdkFVd1FTTXNHdlFVc2JmRkI0c2xZNTRk?=
 =?utf-8?Q?ZDNO1BnkPKVTBDVwNpsolmI8cIjuyFuvHs8iDnYVcA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e54c5de-f391-4b66-7006-08d9a5d91ecc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:36:59.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZe/SW5M0NBnNib64aA2OcEmERsq45z+I0GwR93tBIDV+u0d8ZlQ8Bnsq5McmJE2DOx0YCVhqMUhTxwNMoMFwbo33AiFS1zh7YqXB6tU8ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1486
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10165 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=919 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111120071
X-Proofpoint-GUID: mIs3VHglcqiE-zIBaRggRkLezdeUcpva
X-Proofpoint-ORIG-GUID: mIs3VHglcqiE-zIBaRggRkLezdeUcpva
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Łukasz Stelmach,

The patch a97c69ba4f30: "net: ax88796c: ASIX AX88796C SPI Ethernet
Adapter Driver" from Oct 20, 2021, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/asix/ax88796c_main.c:391 ax88796c_start_xmit()
	warn: test_bit() takes a bit number

drivers/net/ethernet/asix/ax88796c_main.c
    382 static int
    383 ax88796c_start_xmit(struct sk_buff *skb, struct net_device *ndev)
    384 {
    385         struct ax88796c_device *ax_local = to_ax88796c_device(ndev);
    386 
    387         skb_queue_tail(&ax_local->tx_wait_q, skb);
    388         if (skb_queue_len(&ax_local->tx_wait_q) > TX_QUEUE_HIGH_WATER)
    389                 netif_stop_queue(ndev);
    390 
--> 391         set_bit(EVENT_TX, &ax_local->flags);

EVENT_TX is BIT(1) so this ends up being a double BIT(BIT(1));.  Which
is fine because it seems to be done consistently.  But probably it
should be:

#define EVENT_INTR		0
#define EVENT_TX		1
#define EVENT_SET_MULTI		2

    392         schedule_work(&ax_local->ax_work);
    393 
    394         return NETDEV_TX_OK;
    395 }

regards,
dan carpenter
