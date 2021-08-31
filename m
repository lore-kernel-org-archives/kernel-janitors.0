Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F62FC432BE
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 07:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEE1760F9E
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 07:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238052AbhHaHHZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 03:07:25 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:11178 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232209AbhHaHHY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 03:07:24 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17V6xv8s031055;
        Tue, 31 Aug 2021 00:06:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=VKdnkGm3oCc1VOji907palIz3o9N7s57TqtTfI8z5pI=;
 b=e+HPj/ULfX4Fs6LnuLKrYuMWCLCg2cQyFyiZPLwZY8IogVsbyLz27Qn8O6QEsPsgFLAR
 sS7u8PPbFSTiKtUFjx+KGyoG98Elhynt8+sX3khgn1Od47ZVsOKfHbcNpys9OnCVvUd8
 plgJNWAE3AdxX1jpUy4OLAgRrvHO2eHbZ3E= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3arnw18c55-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 31 Aug 2021 00:06:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 31 Aug 2021 00:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMkB+GAhg7ifHJ4uqnmCtiZqOWeEZv7hwWKVXcrYP8XTkWprewtyiTfSBmrvW7xk2pXcaoSroXvTz/Zz0Sq5V+V0vfwz8FpT6Q1+XaDxYut3yXfRqn7J76J/6Olt/Amtd399q6OmnaOQ3d0qUAunub4AjfYcwZ+jF0rHQQNU9jmc8+UD47EizQsLNKvN5GsRdGsoTOJ4L995HKynlpnE2zuq36wPQ4sodcRMVomQT+30tY3/NRDWWh5FP2jk10ehVt4mkmUiAnQyyx4GyvSf/aFT2/VNR8UhbifMygImGtgQCRqckRCqi0c9HTnOuQnO4Wrp+BbjBQlgQvEGKoHOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKdnkGm3oCc1VOji907palIz3o9N7s57TqtTfI8z5pI=;
 b=HDVByXDpLcMwW0mN4e25ueJz927ut8Rjk4U6KRw+31a6D6VbFR4sZO6kWcL7suH2pFFXI+ydYDUx2uroHAaBkIWw1U4Ga552ATAkuZ7k8Vph0d6WSZkP9foc+cYCrie3q/49Cy//vORHoRHyV87rQc2y5ldJkp12E/vlD4APhuBl+qU7Ft5K1MyXTmH1F/wPSeRzE6k4KdvnM2GbShe7Qr2fojGvEgQ5LSKHht08lxrFIP/E33xETzwhVsSr7bLoAj9M0LCWPidS2D1o7qvlvKopuDdgHYFtYuXSTSD2SNOD+JPxcb5SO7O4IlAByXaXvardnIZPramwxt7NpC3CTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=fb.com;
Received: from SJ0PR15MB4679.namprd15.prod.outlook.com (2603:10b6:a03:37c::6)
 by SJ0PR15MB4757.namprd15.prod.outlook.com (2603:10b6:a03:37a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 07:06:24 +0000
Received: from SJ0PR15MB4679.namprd15.prod.outlook.com
 ([fe80::a5bd:16f2:44fe:4af2]) by SJ0PR15MB4679.namprd15.prod.outlook.com
 ([fe80::a5bd:16f2:44fe:4af2%3]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 07:06:24 +0000
Date:   Tue, 31 Aug 2021 00:06:21 -0700
From:   Andrey Ignatov <rdna@fb.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     <kernel-janitors@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [bug report] rtnetlink: Return correct error on changing device
 netns
Message-ID: <YS3U7SwGhXVTdI1g@rdna-mbp.dhcp.thefacebook.com>
References: <20210830090405.GA6314@kili>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210830090405.GA6314@kili>
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To SJ0PR15MB4679.namprd15.prod.outlook.com
 (2603:10b6:a03:37c::6)
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2620:10d:c090:400::5:7a93) by BYAPR06CA0038.namprd06.prod.outlook.com (2603:10b6:a03:14b::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 07:06:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65b2a9ce-f76a-4158-c0ec-08d96c4dd7c6
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4757:
X-Microsoft-Antispam-PRVS: <SJ0PR15MB4757C4C147DB974DC1377905A8CC9@SJ0PR15MB4757.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zwrmQ3lHGfV6D89mZrudzHzxmZO5sQPUBf43+qXJI5zY/8BY7H2nnetGkxxWD+Am8e3XsbP4R6XuXQUX9pkfPC3Nx/97GrLRY+95wO1twf3HEMmJT7Hq6ZrJpEhPMsW7sTIS3NTtYUP4AxA0LcgIPplLYyD3RwLE2JIk53k9Ep/flevZQyyaGh/MSlMtRt2KI+sBjuG9m8AFAIsjj3NQls1uX87EhNn439XLAdyScqPresNKcW81ReKNO3yC+GhqaDUdDU/7NnDOJaI9v5Ju67zqpymIwItTj3rp9TG3lB4s6KITim+mvq+I6mWCPx36yjNlHCc3sbRvw2KtQo0jHCGAETMuQi4m1GlxPdF/SNYToedcVxXWeh/3/J2Aio8W8v1Bv9QPz7VSxEjPAGs45deV1iN+V3rFMr622g5wvHuvaXtQHKkg6wz/Q7KLdH9loRUbvai+n3j5I+jJOH1vn4jLK1h9JrcXHZAKd87d/mUhW0MPfhn7RqDExgcPGmgWHE6nXBqn1c1lBc2zJV0pttETVtBAzpj702NOQlamtBuoUjKYgzgVNa3AX0syDTcw5X0bGm49zt029hhwwyA51Po4jXHVW23J+SO1At3a6pQ7wKc4dSGreMwUwmNwqnj2CR/XNbLOIp3IHJi/zoOMUiir7Tt6TAYGCaJkXAiMILYLcNNo6rRlUOhsr8LEtc94iuvWWOXCYhgdf2OpX5rHFpYAJ9stS8oo+A3kHWHAcf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4679.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(83380400001)(2906002)(66946007)(52116002)(8936002)(4326008)(66476007)(186003)(66556008)(316002)(6496006)(5660300002)(478600001)(9686003)(38100700002)(966005)(6486002)(8676002)(6916009)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3RhdVZpT1FBRkczQTM1TlZWVTVZVzh0OWw1a0NlUWNtb3VYN0NJWDR1WWpv?=
 =?utf-8?B?WUFxTldheU93T0N4OUFUeTNJVzd6RDlJRXlTWWVHOXZjZ2s0am1pRDNIZ0o4?=
 =?utf-8?B?NkhhdUZ4Z1JkUGlTZnYvRzFJY3FqTGd2VExNRDBlTDAzWjN5aU11UlZ6aVJK?=
 =?utf-8?B?VzdUdWhaMUFVOTh0N0VYeUNuQkpWUTNoU0gyb0hkNUF3b3hqU2xpNXcvODRs?=
 =?utf-8?B?MEw3REJOTTY1R0IzeUNlMUtZdU1iVTJLWkFMb1VHanRjVk8vY25Na1Y3L3pk?=
 =?utf-8?B?bWVYL0VzUVAydnF4NXdaN3UwMkxoVFFtY1IzUUtsVmZHcHJHSmJmK0pob3pM?=
 =?utf-8?B?c3ZUMHBWUW9DNUxoVUlPSHFndGQvNnFIZGF1ejdnTFFwRlAwWG1LOTJBVndR?=
 =?utf-8?B?MUxVcThLQmlWdDl2UXAyLytKZFV4UTFCYlF4TTlmZ0FhS0VHemhYU21FU0t2?=
 =?utf-8?B?NWNTL2l3cFdHbXptdjhpVTNNQUhvVU4wbGp5L2ZzZmVLVVFGemdOaE9mbEZJ?=
 =?utf-8?B?SmNITnBiRnNDc01oRDViQTZDRUI3WEFWN1lzV21XclA0MC84M2Y1MEVrQUlh?=
 =?utf-8?B?VXEyMHFXaU81eU13NkNvV1B4ZTUvTnhXY1QrbDJJMTVPZGJOR1k1SW01M1NF?=
 =?utf-8?B?OVJxTFUzdlV6UDZTVHdHRENSeEtBV052TFo3ZGxJR0xPeEQzYzlNZ3JwUlg3?=
 =?utf-8?B?MW02SXJxK2FTOENycEtuVnZBaXNOSlc5M1E4Z2I0L3luTHNIZ2hTRC9IRE9L?=
 =?utf-8?B?NWZzZ0hPZUY3bTU3TGtJRnJQekhGTVZKMkNCcmFVeEQvZ1NiTFdCSndpOGE4?=
 =?utf-8?B?eHc2MHVNSGlGdGdvOVVQMEhxMUthbERvcXI3WWZNQlZaUmU0TjRha0F2alkx?=
 =?utf-8?B?RDRSdFZTWkZlaEQyOFR5TXVlVHFXZ2V1Zk1PZEN3dlF0WlVDRUY5Ylhpa01F?=
 =?utf-8?B?K3YvQitxMkJPTHY2L0YwdkwrM001RkNoNkFrTGw4Z1RRVWYxQmw2RkEvdmNq?=
 =?utf-8?B?ZEllb1FDSG5iODVWZ2puV293elVFRUFCSzNhaDVRS3ZSSHg1cit2S3hJZlVl?=
 =?utf-8?B?Vjd0dGFobXVYRHZHaXVqZUR3STlsZ09qRVRQMW9xTkJTV2FuRUtVVjU5Nncz?=
 =?utf-8?B?b2VxaVpJbEpEVWZSb2VzZURpRHRzREZ1RW5FNXh2ZUhONytOcXFaSVdjLy84?=
 =?utf-8?B?elgwcW0yQ3BMdUxTdFZhQWpzalF3RnNjdUlhbjI5UWlKSWhhem5ZM0x3ajJ4?=
 =?utf-8?B?bGxOM1pzR25TSmtlNVpFT3NQN0RsTzFrcTJISWYzMHQ3UmdGcWIvM2FYU3BK?=
 =?utf-8?B?Uzljb0pIK3MzWm92MFA0SlE0S0pCMDZCUmRQRGx1SUNZUnpvY2g4eEltWFNH?=
 =?utf-8?B?QmY2aytwOXBiRzJYajNEVklZWElwMHRJMEZ4M21xVlNoaStFdlloUFAvYmRp?=
 =?utf-8?B?K2hEWS9HWWZmNnJvaEJzU3NUUkVVN3FEMzFhQUlWOUZON0d3VnAxSVdOVEtE?=
 =?utf-8?B?SkpJeTZuQXNGM3lWeXhpc1J5ajNGWlRMcm9xZjYzcGFFZU5zWS9RVTNhTTBq?=
 =?utf-8?B?NG82dHBCbHp1c0FEL0dPdTNNdmh6VjF4eEtKQmtrRGNKcjAxRHlZWWFtOXVT?=
 =?utf-8?B?WFB1SWFFQ0crZkQ3Sk01VXdBVTdFZUlwQnZSTTNqVFYrY2NHc3BINWRrb2p4?=
 =?utf-8?B?bXlqTjVidFV0RFpnUUFTOFVPM1RUQzlaQS9YRkpDK1p2aFBLMlVEajhORU9W?=
 =?utf-8?B?TTEyU1dmMG9RTnY3TjZ3c3QrOGxSQVk2bExUUmYwa0hzVnNEYi9LOXNLUTBx?=
 =?utf-8?B?V1Y5Z2lxRmdJcHZFS1VsQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b2a9ce-f76a-4158-c0ec-08d96c4dd7c6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4679.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 07:06:24.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mp0CieM/gfNQP0g8dciNJ7JtKLOrBqODYjkJUWZCoE0J2iVGpG9LSY+bW0edpqY9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4757
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: BmQxU91ICqOfxSY5KCQltHjyi99TJYnt
X-Proofpoint-GUID: BmQxU91ICqOfxSY5KCQltHjyi99TJYnt
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-31_03:2021-08-30,2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 clxscore=1011
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310041
X-FB-Internal: deliver
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> [Mon, 2021-08-30 02:04 -0700]:
> Hello Andrey Ignatov,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 96a6b93b6988: "rtnetlink: Return correct error on changing
> device netns" from Aug 25, 2021, leads to the following Smatch
> complaint:
> 
>     net/core/rtnetlink.c:2698 do_setlink()
>     error: we previously assumed 'ifname' could be null (see line 2608)
> 
> net/core/rtnetlink.c
>   2607		if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_NETNSID]) {
>   2608			const char *pat = ifname && ifname[0] ? ifname : NULL;
>                                           ^^^^^^
> The patch adds a new check for if "ifname" is NULL.  Is this required?

Yes. There is one do_setlink() call that passes NULL as ifname:

net/core/rtnetlink.c

static int rtnl_group_changelink(const struct sk_buff *skb,
...
			err = do_setlink(skb, dev, ifm, extack, tb, NULL, 0);

It handles IFLA_GROUP that can be used with these netns attributes.

W/o the NULL check something like `ip link set group GROUP netns NETNS`
would cause a panic like this:

# ./ifname.sh
+ ip netns add ns0
+ ip link add g1 group 1 type dummy
+ ip link show group 1
10: g1: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN mode DEFAULT group 1 qlen 1000
    link/ether ba:3c:5e:9d:8e:ab brd ff:ff:ff:ff:ff:ff
+ ip link set group 1 netns ns0
[    7.566918] BUG: kernel NULL pointer dereference, address: 0000000000000000
[    7.567746] #PF: supervisor read access in kernel mode
[    7.568299] #PF: error_code(0x0000) - not-present page
[    7.568853] PGD 8000000107758067 P4D 8000000107758067 PUD 107757067 PMD 0
[    7.569638] Oops: 0000 [#1] SMP PTI
[    7.570007] CPU: 2 PID: 242 Comm: ip Not tainted 5.14.0-rc7-00093-g1a6436f37512-dirty #533
[    7.570918] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[    7.572126] RIP: 0010:do_setlink+0x69/0x1070
...

>   2609			struct net *net;
>   2610			int new_ifindex;
>   2611	
>   2612			net = rtnl_link_get_net_capable(skb, dev_net(dev),
>   2613							tb, CAP_NET_ADMIN);
>   2614			if (IS_ERR(net)) {
>   2615				err = PTR_ERR(net);
>   2616				goto errout;
>   2617			}
>   2618	
>   2619			if (tb[IFLA_NEW_IFINDEX])
>   2620				new_ifindex = nla_get_s32(tb[IFLA_NEW_IFINDEX]);
>   2621			else
>   2622				new_ifindex = 0;
>   2623	
>   2624			err = __dev_change_net_namespace(dev, net, pat, new_ifindex);
>   2625			put_net(net);
>   2626			if (err)
>   2627				goto errout;
>   2628			status |= DO_SETLINK_MODIFIED;
>   2629		}
...
>   2693		/*
>   2694		 * Interface selected by interface index but interface
>   2695		 * name provided implies that a name change has been
>   2696		 * requested.
>   2697		 */
>   2698		if (ifm->ifi_index > 0 && ifname[0]) {
>                                           ^^^^^^^^^
> The existing code does not check.

+Jakub

As Jakub explained in [0] this code can not be called with ifname=NULL
because the only do_setlink() call with ifname=NULL is done only when
`ifm->ifi_index == 0` so it looks like false positive.

[0]
https://lore.kernel.org/netdev/20210830094301.4f6ada72@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/


-- 
Andrey Ignatov
