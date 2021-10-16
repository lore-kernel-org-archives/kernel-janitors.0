Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEDBC433F5
	for <kernel-janitors@archiver.kernel.org>; Sat, 16 Oct 2021 19:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0C160E08
	for <kernel-janitors@archiver.kernel.org>; Sat, 16 Oct 2021 19:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240994AbhJPTfg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 16 Oct 2021 15:35:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12310 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241012AbhJPTfb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 16 Oct 2021 15:35:31 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19GGE4EG005467;
        Sat, 16 Oct 2021 19:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1xtfC6VYBOVp0MObTGVC27lvOiIzQd8U3Eyve/ivTKg=;
 b=FWez9R2k42cHPkVBsktdCoEdQ51usnSK8lP+YT0V0S8k2xnE0wj1ykd7sLEfs1xXd1fL
 KBnJQsnTShlxiUm49++WCVTgfR5QzqeFyYgaIasMr+Wa/YdkmU67UPHbf9X0P7204bQl
 u/vD3C/ej/qq71tglh0tRQcqHOs2iKrur08Ft9KtCtFKtXMtS2RwXk9nYqVEFBfuk2kS
 yziaKbC5F8QDqmScJLnzWArqivADzUyIX+i9fcOBXwOCfYuHRRjTQ8sZFDtijea24kWX
 MHE/OF//Um9FViVD+gAmnIV0UT5eV/jkG/ujbROnDHx7r6lcR3KVD/oqB7g8SfMUeJTg 1g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bqqm1980g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 16 Oct 2021 19:33:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19GJUcCs155727;
        Sat, 16 Oct 2021 19:33:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by aserp3030.oracle.com with ESMTP id 3bqmsbchsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 16 Oct 2021 19:33:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBzgWnasDmrxmefYcC8ZSH0cVQf6eq7a6oSEuRXawqM0Dojklg4zd6+yQVddkY/sWmgBlkzeQF18eRIRlzPnWNKWDZr/vOpueVqtfJ4OsiGliCS8/Xsauquiw7h+TcJAnPV2CMweSXN6bLHTc7TToPJx6tDtBCX/NTgXdKvA22SsmvW/YRi3sk/F6pkZhXxn3G1AHvgZGbF71xCP6A8w/7tjzHb5BDS2cNFrI4ujVqjhishH5MZXHVsLXbnXS+Lh1RFOn4DYTsCfHwB0br2ypG7l9v45YdTiLqDpKlB8NlGnxCGBThuH1mO9xeUwWLAMt3Z44JmD5pAW/hYxEdllPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xtfC6VYBOVp0MObTGVC27lvOiIzQd8U3Eyve/ivTKg=;
 b=TSthRl/zKg5DB2kzkbs4x0HTHUM3w/ZzRujerUZCIwdKNpWjvc9xygEY4fs7JpFYSX1rg0HMu6Me4DfRcKbmqweASADrbUcfIu9H4eeXfFfi2Zi4gmQVrjqdVgSP2elr0ZySdTFEhImaUAmHG8t/SYOOnIUeLLfyfB3+sl9QzjU8/ROXed8oDBHBeFdXkOi+ggcvclXec/omAT1jmt26OJNLlWUqGQXPBvl9UmKl++a+fi2l33NwaoLdmwb/Ne9SMss++Ur2J3UhSPMdvChiMCOwWIhIJHCj9yPMy6xqRkFxUv5vvxexgGXyWz4yJJcVHblIuMqwqw1tSKiqqUNIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xtfC6VYBOVp0MObTGVC27lvOiIzQd8U3Eyve/ivTKg=;
 b=w5AmpZ28C/kgecgu/3lxKyzAiG1/WwrKdKLFbMEJqbUtgjzamG/ymLHlGFhC1B01Xaq08CIO7B3BRjO3w37q5R33SIN1FW8BqoVFn0hNmvbM51PxTbZ+F+6YwWUSAmwXSDHYypDJjqCzGKq4W4R6ndCvZ6Qch3bjK1Uc5UBgN7M=
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4466.namprd10.prod.outlook.com
 (2603:10b6:303:9b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 19:33:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4608.018; Sat, 16 Oct 2021
 19:33:12 +0000
Date:   Sat, 16 Oct 2021 22:32:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-staging@lists.linux.dev, smatch@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: offline for the next two weeks
Message-ID: <20211016193256.GW8429@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend Transport; Sat, 16 Oct 2021 19:33:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ee27bc-b895-4ef4-f7d1-08d990dbcab2
X-MS-TrafficTypeDiagnostic: CO1PR10MB4466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB44668B0B005C408D8851062E8EBA9@CO1PR10MB4466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4B8M/SE+i8gisX2R0rTd9BEgSrGLcJ8qvudBWsQ89yvJW0GBWO1BU6bPkqFEXfbOeb0BSFYdMz69vw2IiErOQ7cdJOopXMX9Ym3NsSzUzicZeQg/7o0V0LfYk4xTDNdlq9qsoyXPQp2kzybRIjJHPHtaiIQmAgOnfNrVy9WCfLr8YBVzwuoT7uwzvK3UIh8jO5SkXvQa2fVClvBFwzBtWx/rUzgnwLjKEwPGRsQzNLm34940vp10GjgVEUGhD2sMQZ4gcXJc7TSxVAvapiiRJXyYthoK6yhHADU8F292KaqENpMfKN22UPYFDi/iFwj3rrDAtqk0pyUQB2eZYjz9hv6CIizgkkno2HPJJ3NaI/bd1m+K00lIFTDcnCVEZZkvOGgwOF3FSBam8p2IOl5FNVhcjauBQq1JNrJpoD01YOKX8cV5F7RcbRDo91n4D1wUxm2buVTq/6gX2TOh/msPl7Q22dcgCKEYYxrHYtjJ5iaZGwkGe+XiiGu/qmz3brcDLE8rjk/tLnM8QzEaXMQQVerfy6zhcRlkHoa+uiOr6jqDQj3AI4nWZwrtPJ1rc1N4EFNZgxOAj6D0UUGvr85M09rMmrEpJVxZB8/7hr0/t2v6Zzn2Pwcw5qyAgk8nLr+qQpD4ld4hDbFMfNz9uNB1Vi3K/DD7Xv9h8vpTdp95PJnWUxOlR8LuegD9M1QsBl6zZbg/kY3/sbF2XkNc4HCSxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(26005)(52116002)(55016002)(8676002)(558084003)(316002)(38350700002)(38100700002)(86362001)(9686003)(1076003)(9576002)(6666004)(66476007)(8936002)(2906002)(956004)(33656002)(44832011)(508600001)(66946007)(6496006)(5660300002)(186003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GhAck09/8gTh/pNS2Ir9dSVw3t7bEIT0q6cZLj+6ZWVIJhGamCDwlviW2+1U?=
 =?us-ascii?Q?meKWzehi3Dy0M+GlAXxxEgEPkmsj7zNoyC7o7fCfSLiOMY4Qo8FXjljZFDcZ?=
 =?us-ascii?Q?QElzqCAj0vraEqz+QnuBmkB+4Rff+ZDJiToxZnTAU8wNuyVmTM4KLnioknbx?=
 =?us-ascii?Q?5cJ3h/H1snJDIpPXs9HeEi7UyCfqyd4UsK/m9MFVncvlQLAq/bZpHmOsC8c6?=
 =?us-ascii?Q?JWLQqHzYy9TF9D2vu2JC4FTadXYYdVqWyb5QZtS2eiuMFtgZP4VfzOLwSsjK?=
 =?us-ascii?Q?9TtLFXbHbCwOxHMr2kUSBH7AMe92QwAMBpaRYwQJ76hqA2GRyEkLg4zcBTxb?=
 =?us-ascii?Q?c3QLD4Co4GWIaMMa8yW1s46a4gfJKPc/Bm/yLvkpHeECXlj6JgszGwJ8oAp2?=
 =?us-ascii?Q?0t12ru9m0AsFTLJTvnY3nQxIs2hn+FIWAyEX/1p45sknQu31nsb7ZtQM0bv6?=
 =?us-ascii?Q?jErUnzgluvy5hQ02giT8DYyZq0q6ZUztkWcMUeqwA4tlyZWSqKUNrCcMiid/?=
 =?us-ascii?Q?ynYcl4oAuM88crGlkOohRePt2mzo73FZjXCPgBpJ1xa7enrRBTFHWh8BWSh+?=
 =?us-ascii?Q?U1mXp5tRhbdOIKgsC9//UBhiskH9Zle2/24JrQndnh54gV4yQd+EjPCAxelM?=
 =?us-ascii?Q?OnhCqq4+tqeOp6a95po4sK3vkhceq9OPXac2sD6lneGVdUWTHcfI6m3e7wfY?=
 =?us-ascii?Q?wtn3uvwaVITRLN2/9TSVYKQsSVrtTsx2VJJI6VIYnIUCoroCMiViUZ0C4Quz?=
 =?us-ascii?Q?N2bVXL1JMVRlH7ggxkUsMBPglcx15Gq/7FmkVouOVaTZc2/zX+/77UT3id5F?=
 =?us-ascii?Q?J2DI4fL1NUQghARmBRwL/GrqeGnxlsBMYkP0MPaN4uFJFvfhljv1vW21Sd8t?=
 =?us-ascii?Q?fqj56rZfhvNWsPJuLssxQdrJMPK3sWad1XxT9QBQys/cr0Ecebatku9kq/mD?=
 =?us-ascii?Q?AsEHUmrUumZ8rF44alZAtsTjwvur9BmELBHTLJWr7Ue70xn+B+efnRb2UUbW?=
 =?us-ascii?Q?g0rv+hKg24rdZ0kPlAqNAqPwWO/T6b0dySQDBttRTlp8E05sFjL7nF5DIMww?=
 =?us-ascii?Q?vPXKEP3hDLp5NiqoWsU3aO9Gw1I8ukBtcLBdvBlmAALhTL+JhJouNWLf+n9u?=
 =?us-ascii?Q?4R7EyDyH4UCzuO4FC3+qVVqA5H/q/XsAb334gVH0BEcwiGMHgaLvG9QY4bFB?=
 =?us-ascii?Q?l+dWiV27YU3Z3THcD8NR0CrawKZRL0pkW0RMEkER9QKwSaQ4iWHeDcyF9IRj?=
 =?us-ascii?Q?RhImGAEBTSfxXWrV84TLipB9EVrn3oMLsXmXU4iYhJSorLdze+ADnT74PU31?=
 =?us-ascii?Q?ZlJ4vfIWI1jVjQZm5jtbZnCi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ee27bc-b895-4ef4-f7d1-08d990dbcab2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 19:33:12.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YVvadoktfBLhGth6G5EnVf8grbL7hcQBQOUnbmALFjAoshCigfhCvm6WRsYCvmoxEdRht8jmJ4uHEOgkgsi3ZjrYGpaasdej4wX4p2meUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10139 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=543 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110160132
X-Proofpoint-GUID: pWI6d3uAbERdJG3xmx8NmK9ub2grKAHe
X-Proofpoint-ORIG-GUID: pWI6d3uAbERdJG3xmx8NmK9ub2grKAHe
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I'm going to be offline for the next two weeks.  When I get back, I'll
probably take a week to go through my backlog of emails.  If I don't
reply by Nov 5 then ping me, because it is lost.

regards,
dan carpenter
