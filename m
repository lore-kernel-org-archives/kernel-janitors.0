Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2088BC433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 06:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFD2C61421
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 06:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhEJGE5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 02:04:57 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:56292 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhEJGE4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 02:04:56 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A63nbq047855;
        Mon, 10 May 2021 06:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=QywDe9YsQxWZhDU/wIjc+u4ZyrU1cOVlwrfhHlbKAgM=;
 b=TOqC02s8vmmyTvy7kd3TjY17nea2DYNpW9Qthiy16QFF97XL7pt2bAK6ohLlWAxDtUhj
 wTdlq5+MsCETELdKDQYyKFu81XE6KmaSTywc2sRJBoKrFOp46/tXtKI/v6WbyNjz9kDx
 sN2aW1D2NYbLSVNcSQxnKzdW6CFn4m4xiSoyDIKNSxUsdxvctbbzOpVcUpgkdm4upkfe
 9PyD/MQVB8uRyuHYhd1jstYj4auXjOfqJqiDMvPKPMOJIwBpQG82hfWzTGlaglT+1c1h
 0R2f9GRCT9YQrMKhrd+uw8SwE3JSJyCuaSfRiYgSuq2/m//tZ/PMV/mSHzGVgHoWpy/P zQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 38dg5ba1v9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 06:03:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A5tVJA054897;
        Mon, 10 May 2021 06:03:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38dfruqkuu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 06:03:48 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14A63miZ082313;
        Mon, 10 May 2021 06:03:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38dfruqkum-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 06:03:48 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14A63kDu011797;
        Mon, 10 May 2021 06:03:47 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 09 May 2021 23:03:46 -0700
Date:   Mon, 10 May 2021 09:03:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        christophe.jaillet@wanadoo.fr, kernel-janitors@vger.kernel.org
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
Message-ID: <20210510060340.GP1955@kadam>
References: <20210509004112.421100-1-eantoranz@gmail.com>
 <alpine.DEB.2.22.394.2105092315330.24280@hadrien>
 <20210510043508.GO1922@kadam>
 <alpine.DEB.2.22.394.2105100703230.3126@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2105100703230.3126@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: KgLskM6zCvix-iTrhjmPYCP_2Aj_cMBe
X-Proofpoint-ORIG-GUID: KgLskM6zCvix-iTrhjmPYCP_2Aj_cMBe
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100044
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 10, 2021 at 07:03:59AM +0200, Julia Lawall wrote:
> 
> 
> On Mon, 10 May 2021, Dan Carpenter wrote:
> 
> > On Sun, May 09, 2021 at 11:17:42PM +0200, Julia Lawall wrote:
> > > ---------------------------
> > >
> > > Patch of a recent linux next:
> > >
> > > diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
> > > index 2e35354b61f5..ff75e928772a 100644
> > > --- a/arch/arm/mach-pxa/cm-x300.c
> > > +++ b/arch/arm/mach-pxa/cm-x300.c
> > > @@ -531,7 +531,7 @@ static int cm_x300_u2d_init(struct device *dev)
> > >  		pout_clk = clk_get(NULL, "CLK_POUT");
> > >  		if (IS_ERR(pout_clk)) {
> > >  			err = PTR_ERR(pout_clk);
> > > -			pr_err("failed to get CLK_POUT: %d\n", err);
> > > +			pr_err("failed to get CLK_POUT: %pe\n", err);
> >
> > It has to print the pointer and not the err.   So it should be:
> >
> > 			pr_err("failed to get CLK_POUT: %pe\n", pout_clk);
> 
> Oops!  Thanks.  That is easy to fix.

Yeah, but I would prefer to wait until %e exists and use that instead.

regards,
dan carpenter

