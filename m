Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D7AC433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 04:35:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B7E761437
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 04:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhEJEg0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 00:36:26 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60314 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbhEJEg0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 00:36:26 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A4ZIJW055506;
        Mon, 10 May 2021 04:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6Sz5H9JhhJ5OBF30Bk3XM5Yxhl3pPN27BnZFp52zztM=;
 b=fW4hJV8DZUH9TdURCQXiw5C7Z2we7Uk64SVsNtYc0b3ZEDKG/yk8cJkNfH9jpB/GFByd
 YqTh9KUDtrUBe8RC9MgLtEbqIN78RCAHbx2qk/ETWsBN3IbkYR1/s0gLeSt7FP8ZSsIT
 pEwy0UfPJmlWxTTDBsKqa//ntlOpCLIeUYCDhtIP8nEg9159WmpAKDK7YGX8afkQZmMo
 hg0FA0wiZWELlBjRAXpx3qj6XPx2B2RkRQaonuvkXx2U+G1D+YeVUp69O7Di6+OlAqEi
 pZKJHQHbHvMuGhIu8vCKIGAN8jf8Z8ZkjxSfIBvbOdxlfGuY57puyDVox3hwSqT5giOv Hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 38djkm9sqj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 04:35:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A4UaJe133705;
        Mon, 10 May 2021 04:35:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38djf5mc3x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 04:35:17 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14A4ZHgg146510;
        Mon, 10 May 2021 04:35:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 38djf5mc34-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 04:35:17 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14A4ZE7c021374;
        Mon, 10 May 2021 04:35:14 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 09 May 2021 21:35:13 -0700
Date:   Mon, 10 May 2021 07:35:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        christophe.jaillet@wanadoo.fr, kernel-janitors@vger.kernel.org
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
Message-ID: <20210510043508.GO1922@kadam>
References: <20210509004112.421100-1-eantoranz@gmail.com>
 <alpine.DEB.2.22.394.2105092315330.24280@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2105092315330.24280@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: b6M8Gz1n3FiqAnFgxHbM4q8BpJzLDGF9
X-Proofpoint-ORIG-GUID: b6M8Gz1n3FiqAnFgxHbM4q8BpJzLDGF9
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100032
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, May 09, 2021 at 11:17:42PM +0200, Julia Lawall wrote:
> ---------------------------
> 
> Patch of a recent linux next:
> 
> diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
> index 2e35354b61f5..ff75e928772a 100644
> --- a/arch/arm/mach-pxa/cm-x300.c
> +++ b/arch/arm/mach-pxa/cm-x300.c
> @@ -531,7 +531,7 @@ static int cm_x300_u2d_init(struct device *dev)
>  		pout_clk = clk_get(NULL, "CLK_POUT");
>  		if (IS_ERR(pout_clk)) {
>  			err = PTR_ERR(pout_clk);
> -			pr_err("failed to get CLK_POUT: %d\n", err);
> +			pr_err("failed to get CLK_POUT: %pe\n", err);

It has to print the pointer and not the err.   So it should be:

			pr_err("failed to get CLK_POUT: %pe\n", pout_clk);

But really someone needs to introduce an %e (and everyone can see the
need for %e but it's just a matter of finding someone who is feeling
motivated).

regards,
dan carpenter

