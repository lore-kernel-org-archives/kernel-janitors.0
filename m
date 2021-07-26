Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5352EC4338F
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jul 2021 10:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E73460F59
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jul 2021 10:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbhGZJuQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jul 2021 05:50:16 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15012 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231646AbhGZJuQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jul 2021 05:50:16 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16QABd37023055;
        Mon, 26 Jul 2021 10:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=4uAgWyA7WFzYStaCDSzHn/f1g8UOkqoL/ACB/yS2cIY=;
 b=L/HqWSc4/djyMUAqGuph4IND6AnumDzCi+DGaDD0h5hcvDgDOXtPIWTr+vhf9PA8opNy
 VZHkoD0MxgXSFXUdUASMFJyEI0wFuHg1aLwLl3eVAwMwD2k4ivM96B9pmxm609tKM8YI
 l8MrJW/bcN54n2ObJO2oRRvuATMObP99aFSy9e52u31SIQJ2Sd2fxEfs1vOD8vilvxhm
 x7/8Me5pwLuLd35n076noimDVzyM4FAWPfH9M6r+LMF4lbRILCbwgOHbI9VASdJxMzuu
 FLdbsy5DLUxAtaNJ8h5HabPHi6YmUmXHl1M+7aIlAvR4/mLtBfHT806xB8Xe5SfvWj0S qA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=4uAgWyA7WFzYStaCDSzHn/f1g8UOkqoL/ACB/yS2cIY=;
 b=buZ7oNGLKV3mSAxusR2myk3Pno/TL+VqEWKrcH+ls4sv1tgDQQs1FMSTv/1548S1w8IP
 Dcw+SjFJZrXAuv39438uEl13S4Qf4e3ZIG+gjGfvO8Jg3S3J0lBO5bCU1rx9WwJ2jVqQ
 75r4grz7cTKAtxGm0wIEFdT3UQCP5P9YKyfU5daag7g0P9+bsfD0Z10U1rTA6BOTNbuR
 xbQir8NcK5OcSRVEQiFKyPwlzY2cQi7Cv20ARwpbDL5bgJQuTjPmPmw17rcIDtxadR+o
 SbYiALx/7OAOtQ5GZ0igwZWaLs1xUXfzt7N7NqXDRgvVE5TRw/NJJBXhxYbp6/R0A61G 5Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a18nfs82t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 10:30:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16QABQDX024165;
        Mon, 26 Jul 2021 10:30:38 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        by aserp3020.oracle.com with ESMTP id 3a0n2freun-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 10:30:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+fToNHyRMsOZzQU0E1uNlkoOVrOZS5QhFOgrtagukdDQ3giyXsT+VOtkj2k5moH2wYG71A4jLwh3aZ8o10mg6LLQ4xzPM3eJybGFenxtxmiW0zHuoLbRv3RHBa4+JKx/ctGBExo9iP0Vyz1ZjBrbXytBwflXvHgVcGlY//ub4zhUV9BTwsXimidysPlRSmOl5cvhx2QidOTK74PVpBVNrx6xOVMblhl/el0HeJc+j+iriwVjR28GCxS0aHe+IjqUjp2tPgx9ezdI/7ulbs0DrUrVXyn84HPDTIWulTWYOyoC+TojmZjEINWh6KEx8TIeVBKUdSiAsWcSIqUxh01vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uAgWyA7WFzYStaCDSzHn/f1g8UOkqoL/ACB/yS2cIY=;
 b=jv4YQIRe8akhB2EmOcTmZmptNocbdOO5YryTMMpcagIOSm6QiQ56nLECs9TjZTjHp5GMsKPCi6VqN3EUkCThSAEGp12kGu2q6ClIxVPqe1Zcnt+MGTj9h8Pc1FfPa331tgsJekfizHBzqEBAnk+2XqLUMHKa/98maToZpc0swkdRCBo0wxmSD409C1DNs6QoVLYkZOqu625fdoV1gD3Tg/WbnHMLTnGCo7JDiIynQ7kJmS3Y8I3Ph5AIag22eIH1KNE7bVeVqdZh2hl5Eo/UwlUPgqeK6yKXE0tsFZjn+HQzA5efP44J1NQptbp0HQ0RyN4cPEv1Fgoll30N7yscHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uAgWyA7WFzYStaCDSzHn/f1g8UOkqoL/ACB/yS2cIY=;
 b=KJC8CIZyp4avAKrVpTedJsaLJUGc13Z/uDsxuqTMFu718SfDsdBr3hrm1YGoHBnApOC+KwSWhGXWzEA5T8UZkl4Vz1tPh1xp/G1xVpwbjquHC0Tqw+Rlno80fqSG8XIDi/neoYJRJvQEeB4F/0imqA35y5xXHdtl8EIisUPT/mg=
Authentication-Results: secunet.com; dkim=none (message not signed)
 header.d=none;secunet.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4433.namprd10.prod.outlook.com
 (2603:10b6:303:6e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Mon, 26 Jul
 2021 10:30:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 10:30:36 +0000
Date:   Mon, 26 Jul 2021 13:30:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     steffen.klassert@secunet.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] xfrm: Add possibility to set the default to block if we
 have no policy
Message-ID: <20210726103025.GA26690@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0124.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0124.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 10:30:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8549570e-25e7-4aa4-7c0e-08d950206816
X-MS-TrafficTypeDiagnostic: CO1PR10MB4433:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4433589CB4F6811D11CF4F5B8EE89@CO1PR10MB4433.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzsRA6uRSJuxWAKsTWtb23s/Sq5z4x/m44o7zTxUqTSYyhYTgRfFAhKJaucBm2nPs9scSTVo1VRsKWyzRgQrZ42WeQLCmbJfEKB1rQPJIN3gp1ycRk23LuVUHNtoJ2oP+5TEdg51lz3EFPoAM1NeS0TWo/nJzhLUSkS7NOJAMlHDaBp2/+ig3g5Vd+8DTBHOMynITBT/oFdgNZZ5Lfnyy7lNwNupn/kj08R0h/Pn2iEFtvuT2grWk4no/3g6Bixhgnh9eIKy+119CBeMDmS4c0jeN5vOg0svf1al5KSt+JXvSA+hKG37P1PZT293BJAiiwH9Ei5iwhHM5uhwWhD/UxTMGk3qTo3pW8OIV2DvLFgv0X8txh+Ssr5lLPSM75WupirNCYa/R3wg4eg1ybnKHeqPi5YQqljgmSRhKcya18fEqp+RB5ulz1TuRw+egXukSZ9DiWtfGJ7hUXw0HJmPCfDyvaFC05BBNg3DwnEX8CE4zShABHBKsTXKpF5eV9qVTJQtpQOjRP33f38WGqljlNjF9iXcNsWKo07z8kY0fS31l/N8GeUP0dxB5L9UxuqUoU6MSXYnL7Kmp7i/fg76SVnMcIWlIdXGouhnAqpfcVtAX2OrwfxQXzyqpRMDmu01NBn4AmjNyZQIdgmf7YS75BcJySIljePtihpRbE9JwPs5hEDbyCVdi2yXr9x8hreztwqaiwwHib346Exrra6uRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(346002)(366004)(396003)(4326008)(83380400001)(66476007)(38100700002)(66946007)(38350700002)(33716001)(316002)(8936002)(86362001)(26005)(52116002)(6496006)(186003)(1076003)(6916009)(2906002)(956004)(8676002)(5660300002)(33656002)(44832011)(9576002)(66556008)(6666004)(55016002)(478600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pgUZH3fvqW7Vp1l15vhaVq1sj+k8v6zbAUmu4iom+dgPuOF5fHahjoRRO9vw?=
 =?us-ascii?Q?ZH0k9n10LFVXWbBAHXElmtfamJFZoaIawG4/zOyI9cLBmzsl1s6JqUicWge3?=
 =?us-ascii?Q?9USne9iSOVYfZIGmt+H6Q1W38IqlzW2fBN8r+xnC3hvIlw8vII7htsvuquNq?=
 =?us-ascii?Q?gkl7snrTmbwJ9gkLObBSTuOrgkIMxOTmUc4ZrYIL8tBlkrH33kL7s1j7ekeo?=
 =?us-ascii?Q?4OkHIJJYrJ4nUI/EmMQP/L2cxJXIZ3dnmlmTbARkUJc+plhXGsTT2UBA8PLJ?=
 =?us-ascii?Q?iflFWCzwW1ZQIpInj19zJI6ePt47q4uY6IJe3v0CwSVdbdZSoDirO6wyBcxj?=
 =?us-ascii?Q?gQrKaQdj8QTNlfHh8RSqn0MrOciX2oqhBww7OAI2CJQ6uMNCZL+7C4+2knjn?=
 =?us-ascii?Q?rKr0bwC5iJ9nsCol1AD/K4454gIyoB3WtkYPN82IIs7Qt4mtaoIpCY1F3WJO?=
 =?us-ascii?Q?XgDsRcgVOporJtXRWA44Co+kAemP1eiwkwuapGNMkf4mJdnCVQ3cAEOr23VC?=
 =?us-ascii?Q?so2SCbXJ6hfP7eVVnQB42KO3pEWqw5wBXghdqOrYMuLviGzPy0C52zEkB/NP?=
 =?us-ascii?Q?LIaNd67/D0uPIoz4ZZ9ntjv/tpLBru4UsEjjLHykNy7phk8pwXQYg23XvZ6D?=
 =?us-ascii?Q?YX5A8V4mpzIGyPvkN+sHyuwpHeQJX9GzLrvmQG5DbFzpMGz9D484KgQIHbGr?=
 =?us-ascii?Q?Xnbiam/g719doj04+8KCOr1Zd1p/XF8EGE82ZppYJaF+4dBrXgW1ZcmZQSxS?=
 =?us-ascii?Q?wiqtD83SOhlBB1uYwqWb1uj7B/PLrGv0wNchaDIF1qfZciFTv6m+qrrNO3x1?=
 =?us-ascii?Q?lVOlighwJEWqzRObeM/Tw++w68jyqBSk8zzRdYm5uuYLqqZuIlC7ZwGQ2kXn?=
 =?us-ascii?Q?W9fn1axEN0qYcuTWaczx2uj57V9SF9LZMX5oSSjmvSXzYSqx0wUgkAbDEkkI?=
 =?us-ascii?Q?djzPK6traXDsLVZHJlMHaEXeJlW4/tINf1dEfY5j9+sSzaQ3x+3I19KHz9ZQ?=
 =?us-ascii?Q?rZfy/RC5DxqU+WLj/jrTNuH0U0CCPm12QoLsfo6lmIJhtJNzfqgDdDEYblvy?=
 =?us-ascii?Q?qMyYVfBp0TxMb7gj99tVZdnDsSe+R87cx3gY8fvk/oj4gpkaxGohwjkyaIhe?=
 =?us-ascii?Q?13l1+5gHOQrhRVysHerjU+14G0wWfWQCFQkdLSpZSgDJy7l7XnTj05MRxIwb?=
 =?us-ascii?Q?VlpqnrbFdvX2zTdEGugceaXYYmIyrgvfct3pVYCp7E/y1RjbbQ9jGaKi2ct0?=
 =?us-ascii?Q?MiycFERD9T+tKYAh/ZGdF8SMoFsJ7qXQgRK9I4DstnbpnXGHJyG0qzXItIAe?=
 =?us-ascii?Q?inJdrv/OsLJFNi1+LMCQdVFx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8549570e-25e7-4aa4-7c0e-08d950206816
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 10:30:36.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVYcIkYsefovpsb2AYyyjn0OTqbZWR3yOjh57gKuf8rd27mD92yOQRD+olAQ8WNWwc6aGMKfVPLrWqqBu8tSgdbeSHo5rlF9NOd8fgci4l4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4433
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260059
X-Proofpoint-GUID: 3HWcoBc82U2Z1eWrekzKidTSXjapffJt
X-Proofpoint-ORIG-GUID: 3HWcoBc82U2Z1eWrekzKidTSXjapffJt
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Steffen Klassert,

The patch 2d151d39073a: "xfrm: Add possibility to set the default to
block if we have no policy" from Jul 18, 2021, leads to the following
static checker warning:

	net/xfrm/xfrm_user.c:1969 xfrm_set_default()
	error: undefined (user controlled) shift '1 << up->dirmask'

net/xfrm/xfrm_user.c
    1964 static int xfrm_set_default(struct sk_buff *skb, struct nlmsghdr *nlh,
    1965 			    struct nlattr **attrs)
    1966 {
    1967 	struct net *net = sock_net(skb->sk);
    1968 	struct xfrm_userpolicy_default *up = nlmsg_data(nlh);
--> 1969 	u8 dirmask = (1 << up->dirmask) & XFRM_POL_DEFAULT_MASK;
                              ^^^^^^^^^^^^^^^^
I believe this does come from the user so it can shift wrap leading to
a syzbot/UBSan warning.  I don't know that the shift wrapping will have
any other real world impact.

    1970 	u8 old_default = net->xfrm.policy_default;
    1971 
    1972 	net->xfrm.policy_default = (old_default & (0xff ^ dirmask))
    1973 				    | (up->action << up->dirmask);
    1974 
    1975 	rt_genid_bump_all(net);
    1976 
    1977 	return 0;
    1978 }

regards,
dan carpenter
