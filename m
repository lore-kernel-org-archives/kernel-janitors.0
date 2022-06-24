Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A6EC43334
	for <kernel-janitors@archiver.kernel.org>; Fri, 24 Jun 2022 05:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiFXFQH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 24 Jun 2022 01:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiFXFQG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Jun 2022 01:16:06 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F7C522FC
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 22:16:04 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O4V8IM031418;
        Fri, 24 Jun 2022 05:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=TF4Ga+Ux2RR4uh6ydOSd5HiRoi03DQ+5qVazli7ikDU=;
 b=nzmYW5dj99OBBvAXKOqGIsXyX/Q1hTcfeXMQmRifOTr3rH1bHJDhTIdI7vezM9RKalZ6
 7eFqOSOIABS5aRqJccLTsBvZQzAztY6THijU48mh60lKvpsDhXZG5JRk2Ofj9WT3Cxsg
 +K2OtfwQoMagBrbXm5AbudhjWQ04s70j3+AnpeJDjk6MuAlyIH7OGshJwhd8lzK18sKG
 YciqBoj4lJFQU7CQzl3pFga6h1XYwfVHdUbS5tho83M1RiVGJQgisdaXnC/6J+O2sKSe
 4eh+0Rlc+kmgYex+t+lJbKxiVShLpLmkqeKwSMqOnESF9gZQ17MzsM7UKo8O2W34MOl7 XQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78u4tx0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jun 2022 05:15:59 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25O5Ai7X009044;
        Fri, 24 Jun 2022 05:15:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtg3y270g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jun 2022 05:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGyLwYlp6vUJwy3oH2zCmS588IGhH+bqn1dFPYHGzch85YryOJXLr/ICh+aA8J0MXgywoY0Lyc33mhdrVO8oGUAVP+x7WGQE58vvxUOkdLlmzIv+V1D4Ti45WgBp+zzTDt8XKmiWoyZVxoCBHXqh58/ajiKnDnrDl2rFUZt/TRcMXgQc+ATJhgtC2rFpMYyBj8F6S9pUmGZWM9FFftHF+C5DMTjtjiaSBxfVr1W9YEcFL1MUE0q5qMHqNTOSvICmnbON2i15Y2KLRwAxdxEb63Lf2lbrtb/N54uxYoEp+U219wExrpI7GOunWB3OMcMBdJv5Ysq3ulfZ8j+PFwZLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TF4Ga+Ux2RR4uh6ydOSd5HiRoi03DQ+5qVazli7ikDU=;
 b=Hhh3PjbMwSEkj1zZQVLI+LzLK9sPb28OE4zoUnh+/MB/lnSu0I3mNm1dBqPLgJV2FGtRB0w95oSdyK2bvkbx6KS1YGtMoASC9dlhywxKcZeE3AEFoElGTNFoLi/HRE4SX6T/voMv30DPAyo/0htlvlhlVRfyak55TYop2V9ouNFNGs3dr1o0QLQyG4Fx5VL/tml+cUswUdZukUZdzNfibSVAOlOhnYXwO+ILEjU1LFeIZ9KuPs111CHZ2oCUYF8rDapVmwLZZQQGH3gTibQxGK3ykygLGQgRaVYKW8Q6dPyUnduqDPh4dRa3It3ozxzZq/rRQqMPZuIUmZefT+7pTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TF4Ga+Ux2RR4uh6ydOSd5HiRoi03DQ+5qVazli7ikDU=;
 b=g+QAYtV2cePGkpFR5iFRw1kct9RPczWqGyFNZhQB8bGlcaJkDzgP7BVE8kXJVdZeYez5gbo1T5B4ibGkJfmZatlrimINPLVDkHdXhUe2rrG9GFnJEo8M9LMHW2SC2KR01/KIo4rYNAPJCk0vdn/IWvnoJ0P4ktXyhQ1RO5dBC8I=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN7PR10MB2579.namprd10.prod.outlook.com
 (2603:10b6:406:c7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 05:15:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 05:15:57 +0000
Date:   Fri, 24 Jun 2022 08:15:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Luz <luz666@daum.net>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Add Belimo to ftdi driver
Message-ID: <20220624051542.GS16517@kadam>
References: <20220623185238.3240-1-luz666@daum.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623185238.3240-1-luz666@daum.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0012.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 982c7f99-c3b7-4a62-660b-08da55a09e63
X-MS-TrafficTypeDiagnostic: BN7PR10MB2579:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //2ojupKin4HH8tAHcEk6Dks8v+HuaN8KmoAL8GYY58PesnGrDp76Y6V3MB1qyFK2SD8y45VO60s+C82t6GQCQunq5/cvWBJ3IAhtw9gG8V/Qmp1kvzATPPriDbpkbKZkeYQXsyc6x+zW4OYmFOHvYKbgkfK2a3fcZ+3Ik6qJPgoCB06gwyZofhDfNc/iMLEb6Ehg12hxOYrcZ2XDEF8b73WaXtHMy5qaTnd3pYsVCm7LyOWJUX0XyE/TcQYzf7ofQceX17KC4KIUSniAcR2aMLUdDKiweoWSZLS8Ejq0yj6BY7ELZ/VC3Sa1HbXjwsYu4ltKk+i9f9bQ1WnV0/bmyVvmgqwYWI79habRkR1E9DFp9A0UP4Sjtk06FrJ9CYzofWYmik1BInsXIHf9weSo2egd5pMZajOeMqkKaCmFwdemuov+oisCUBnM7m3eMcGAsjqic/u2z8qrt8ysiK6biCxLzSFfzkIRHbQpMwtmjYuyKNd7I8HDTIT4IIcnReyGQElQOk7wWtBNziV9xuGtwFh+Yld7Gv/yXb9nP2h7Ne+1+oNl7b1BnGak3+eNolxtypECeFEW+1LAsENxxcv6I+Gpai0Yi3WlR815064cJYZXJtpsvkYAFelUZ/kxRyUPn1649kT8KTmos9BTzmk5Bk3GlNJC2oaYNGDyniQyIc1akPM9gHO/rlaHtgRXIYXmxp/fXTBruDCJOzWmQvgl+BIb82r4tEDMrh1ITdLfK2HTKYWJvEIDXwpYr4m8LVftIE7VtIauDCVddKUGWpMJomCBkc2j50JIcVRyR+lmh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(366004)(396003)(136003)(376002)(39860400002)(6666004)(41300700001)(6506007)(6512007)(316002)(52116002)(6916009)(44832011)(186003)(9686003)(26005)(2906002)(4326008)(4744005)(33656002)(6486002)(66556008)(8676002)(38350700002)(86362001)(5660300002)(38100700002)(33716001)(66476007)(1076003)(478600001)(66946007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EZMuviFTo1sJR6ZOQ0pTkyP4Gl9c/AoNC11MFdA4ofF49byWeugb/yS3v7L4?=
 =?us-ascii?Q?rj1WFA1kd52Xqo1tT9fXEkn7SQ5aNiq/C6+MnTkDWHbAQQiUF9avTNLAYP/K?=
 =?us-ascii?Q?Rpn3YCrTh+TXPfkXi299qUhP8Zqh+E3tBSZjWAqFDvfWtxLPuqNEpvPe53N8?=
 =?us-ascii?Q?LzRvLBic0NoUxLJh1hwIlI69gskb9r8Z90X/phXM0iOCwJU/j4Y9xEy2kLO6?=
 =?us-ascii?Q?osmRz9rus12n1yVKyiiWwOC3TevONY8ubA4NeRr8z0xw1N53nmvXWD/4Yq4t?=
 =?us-ascii?Q?hFvMfWKnGtJHwGZAqTkt+cP2c7QTew0Nar7Nvw+FjpklPMfxEp8KaB0hpKB4?=
 =?us-ascii?Q?j9n/xdrJKzNpUZrVZFlcJ9SfJUK1DDMben2WWWLhLr95gzOKUiYZSVm7FIvf?=
 =?us-ascii?Q?w8k1ce1Vms3VytTMwJv49i4RIqNs1zYZH7JphjeXnrbZQs8c6z4N0HjKTQre?=
 =?us-ascii?Q?v8/4T+hEYQQFYu1zKV+8Pkj0b1UxMp1LdZiVjEpPQCXfiB+rM5w/JvQ44dsw?=
 =?us-ascii?Q?vxFwfdrYlrp8qP0+g/+jCsl1tXoMEV85/NRbChbJ/f7Ove38MBTpAqGnhQ5H?=
 =?us-ascii?Q?Zf+KxRB64ZAK9hMOVze0QtuBm2BPnI0sZJoqn1pj+HiZ54WHk9B1+cUGAvSm?=
 =?us-ascii?Q?lngsRK+rtfPxgk+tGnBgygU3nUTgrS9Cf7D3tkL7FmQD+oCNQEMTZXxrCPw4?=
 =?us-ascii?Q?3YTejl0J5f4Phc57nuOwUIDenlJ9xf0wr9NHsRulY9f+UkkEv/9EPVbQCFYN?=
 =?us-ascii?Q?3J9mZUk/MGTJf7ty5le9+57c8wIyf1n2mVD6D6q1b1aawFn2GKbXHYynu1+V?=
 =?us-ascii?Q?sjFnAO9QNMtnjy1jVEb1p1TCsOzDIZvmpMhWFr+RVvQAowsrGCVbyoYLalSj?=
 =?us-ascii?Q?55tPAKPtBBLp6YcXii4CaDsQXtV3M4oB5vQq+pjvYpyj+W/tKLbjffIy7Ynd?=
 =?us-ascii?Q?h8veNXR2l5TkWqU/ptFUoikWA5WajAWFSH8uNk9+5RsERRBZNBabMyrKzKPZ?=
 =?us-ascii?Q?gdWfnB0TNoB87es6h+CgPycnJ/I/1rb1dOyrq4uVL3H6tWfi2ZQsP/zUSF//?=
 =?us-ascii?Q?ZW7bMcbqhMc8f6sGi1bxXdhJ/HW8RIfe5sKUX+lz2wsv3xKdrQaoqtzxXW1i?=
 =?us-ascii?Q?rOtc+IR3I2RNOFT7E8B7T/aMAgIJOirzJLBUwFOHTPm+4B4Z1fUEYYturmCh?=
 =?us-ascii?Q?t+I87nVW1M6QQ3b/tOrrmP5kt3c+XYDntcyo76wZRkYiC9Z6OLqffzU6YVao?=
 =?us-ascii?Q?zSwYqteLLyYiGO3bp7txL7YjHWcSxq9anYyDzJCpKcMa2q6LaF6bN7Yf1gC4?=
 =?us-ascii?Q?YElfYKtv2xKbjHpHHZrYRxfK/vEYRyL1pV5eiF+KtqD+hCKWOuL94hoK0T5U?=
 =?us-ascii?Q?jPIp/avzA7qCzJ89aMXbhCUu9AXTZinZcw0N5Qj70da4NkKIEFpKjaOBATN1?=
 =?us-ascii?Q?pEKTuXi3AuHbTP9c+yJr1ehmK7ExAbsjwzuZxKS8Z/yMaxIPbM3s9xPYLmtS?=
 =?us-ascii?Q?qpGfUnl3O8jNZfB5ssep7HnAcm9h6t23zXdlBDxKcD/P0Jl08OFQJ9b3FD7j?=
 =?us-ascii?Q?BE7MMSUfACMod8WRUXxE7uR3RZ8t+OC1YLnC3npBWoBJqKnBJJuJxk4Xm8QP?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982c7f99-c3b7-4a62-660b-08da55a09e63
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 05:15:57.0070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQiP9ORc6N9E88em/RebWPx3Yj7u/1oxA3TfQUt6vRYHAHTm2lX3hdSa9xf3xoAPT9uMbzKTaEUrWMbBACTkAXu32mIfMYTO2G3deRyC/7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2579
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-24_03:2022-06-23,2022-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=828
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240019
X-Proofpoint-GUID: hQrsVxHh9RdZDOgZJTk1h-4uaIFRyglB
X-Proofpoint-ORIG-GUID: hQrsVxHh9RdZDOgZJTk1h-4uaIFRyglB
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

You'll need to resend this.

1) Cc all the proper people from:

$ ./scripts/get_maintainer.pl -f drivers/usb/serial/ftdi_sio.c
Johan Hovold <johan@kernel.org> (maintainer:USB SERIAL SUBSYSTEM)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
linux-usb@vger.kernel.org (open list:USB SERIAL SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)

2) The subject needs a subsystem prefix "USB: serial: ftdi_sio:":

[PATCH] USB: serial: ftdi_sio: add Belimo PCI ids

On Thu, Jun 23, 2022 at 08:52:38PM +0200, Luz wrote:
> Those two known usb attributes regarding the product id are known.
> 
> Signed-off-by: Luz <luz666@daum.net>

3) This has to be your full legal name that you use on legal documents.

regards,
dan carpenter

