Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4A3C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Feb 2022 07:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347759AbiBKHnG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 11 Feb 2022 02:43:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243498AbiBKHnF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Feb 2022 02:43:05 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A4B2A6
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 23:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644565383; x=1676101383;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xV1Xt7qZuIJbKdhiwEYGnwXjYuIyIN/x/fsiGnpmYYw=;
  b=gR0CMY5xOiGsFv1MY7269WO0VyHR2C3p/fNCQm1UWgGizlARj75eQhMa
   2VrO+scOjWGgXOE9vYzsmp6RFaEJJ56oKWsNxy3DF/afOL6nmqyqeMapg
   bD0JydhIjxYSu4Wqd2Bu9JpAEzhul/OrqEmGfvAwkj0mB2tK3ky19GvDV
   myE5KTPNSEh5nt7s05LZ81Aq17bF/cF3bfkeWiI3JiUllQrbegA4Pxpwt
   xYuif8KxAOl0e+6cfl9gG3ysQm2sUS34AaqH8NJHN+d4TpTsPL7yMztYK
   f3bZJOFnBwyzEpzztduDd3YhOgBk1Qv5Om4xReDCdbZvOTgYLuPY9GSO/
   g==;
X-IronPort-AV: E=Sophos;i="5.88,359,1635177600"; 
   d="scan'208";a="192675431"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2022 15:43:02 +0800
IronPort-SDR: jFV6QmDFeTZp7hVZ42MWZ/0EicM9yZ7nM3N6noOL9k6rWwLq9y/7x+q4MovhvOSdOSOlYrSGFN
 CZJLKclWAUvm4SMLBIIQ7Gy8HNsDQsgcXVemz9v+qqjV5xgCOFXzw2OSLM5pCqLb3rjKPZsKdC
 Z7iLy4QTC5A9+EaZniezdgGo/sSyDmSWPx0+f73tVZCC2ZZf+jOpTfXRqMVR5v5s3SSB7dWqnX
 aBCpJmdJ7QoTt3NPzDMRQ0mMsQp8iBFdShQ2MGJ3lgm2iNZqUo9i1xQD7/bghmadiWcj+UjmOf
 edLsXCUv5bCbL04ttWfnpyo/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 23:14:50 -0800
IronPort-SDR: 5RE0OWWXScMND5IunUVgqi8iucT58QT6H2nh69QyFyv3QDM6TwFhCf53T9APPDDBRLlzuUFVl6
 2ODsWkePOA7LAu0Z/MuKKo27MHQy/6pal4syo2QSvqJjuUQ63IV+WEMrK3BadkvcNQjQsNR9+n
 xvELZyb92hnmQn1IFOQZz2VY4GYxSCVCDi/j24eu3+Zp6O9Y1AVvTYrDsL1SXQQuZTnJLcosLX
 SxL5WKuFN8GIeSz0kEHEUn8zctF0QMRReLXodltpLLRewb+zmeTHDn2pUHX5JoPcrZpnkAP9+f
 4HE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 23:43:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jw5FN0DrWz1SVp2
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 23:43:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1644565383; x=1647157384; bh=xV1Xt7qZuIJbKdhiwEYGnwXjYuIyIN/x/fs
        iGnpmYYw=; b=JshSfVVOYE959No6nGQxRVk63PT3RmP6PQaYbL6DMAGcEbn159d
        J7fyaH3wFhG73FJZng8Cp6a2tocOx8Z8+tHXzJ8yVuW8dNbaY7DlArOW2LLzN5Ba
        dbQGF08J3JNDzSP+tnvqAwZq05WwsUH/bi/k5bzqxSklFFXoilKZttGp1S62vWE/
        WVffW6JiKk92wkwsJ7u6IqAPjormbCW/BAcYR86tjoXuPt+EmoS0SvJb9o78SYIW
        CtaHXBnTEkBurbDsWhNaLIOX08FmNqf1n16YYlbrSvB9RLcLwUmH18iNmQ1qmgPP
        qhI6xEyGfZKKEObLKgYPeRfqj379FfVaOgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id sQvmhjpaeb2j for <kernel-janitors@vger.kernel.org>;
        Thu, 10 Feb 2022 23:43:03 -0800 (PST)
Received: from [10.225.163.67] (unknown [10.225.163.67])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jw5FL664Gz1SHwl;
        Thu, 10 Feb 2022 23:43:02 -0800 (PST)
Message-ID: <ddc1de5f-04b2-19a3-ef95-dad189a66d04@opensource.wdc.com>
Date:   Fri, 11 Feb 2022 16:43:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/9] pata_mpc52xx: use GFP_KERNEL
Content-Language: en-US
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
 <20220210204223.104181-6-Julia.Lawall@inria.fr>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220210204223.104181-6-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/11/22 05:42, Julia Lawall wrote:
> Platform_driver probe functions aren't called with locks held
> and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> Problem found with Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to for-5.18. Thanks !


-- 
Damien Le Moal
Western Digital Research
