Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C20C0015E
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jul 2023 06:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjGJG0v (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jul 2023 02:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjGJG0A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 02:26:00 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C84210C6
        for <kernel-janitors@vger.kernel.org>; Sun,  9 Jul 2023 23:25:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-313f1085ac2so3850366f8f.1
        for <kernel-janitors@vger.kernel.org>; Sun, 09 Jul 2023 23:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688970353; x=1691562353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTGPRaTPsW1oLolTdR1W2eMZbk+GEZzuxjroyHe18Es=;
        b=flOhQFeZ/g7IAS0o/33S3qkJ2Pu3MgxVosOMBDHErB6MylnolQt+eSCQqNfaiTNL51
         y5ouTWnFs6r4BWVtVOjrW7di8BqRRLkZLXX+ghMbnuqE83Bk+8+Fh1UauD+VFFgwBGYD
         cb1iq3pGmW6f5AGRjAqMI5NmHn/ruKENY6qorrmHSb2Zf+bkdRckYKVf58/DGRduaTGe
         C2Hhhz+0GimNMQ9I1g493hapvlmW/olUyKv8ilA3MOumkLzJL8mnSLkLtP+Hz2Ksr5Pw
         C8OQXCsDLOplFYvOgRu8M/64gk4DAbnkrK8DWTLkSa66HmapEABdp0Zd1UH9gqu278R6
         XNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688970353; x=1691562353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTGPRaTPsW1oLolTdR1W2eMZbk+GEZzuxjroyHe18Es=;
        b=hq3jD4dQOfbPfXa5hYBcPEq70JxDtgEJoQ7ZAnfhjWmV9DCCGZig0UsbtZ+wE73FtL
         02siQ5SW64XRhS3dbRxzRKUyvu/al8R5iLfStmOrQ1qK3nK3nGirSIwEZHZacJVWEB/G
         ffCBlvd3JXjdwX4fcjGxCmdAzanBzPY+FI0u0guO4ityr+0/o2KfekeHb84J41Ze+qQA
         bGpDH1IU/qkedkM0LDMmet05TDSAoZggIOtgyEO6oXoXOFL4tmzwK38kvkkobG9MzbqY
         ctDHsna50Kg75Gv1KfBWf9ROo5a3r8Xs8HYZYaZ5+1O7KSfaf+EMJs9fKsIFldXab7A1
         SCXg==
X-Gm-Message-State: ABy/qLbdKmN6yk0rv40xm0BZLEAzJDzS+GXvBZ/rw7l6fTDq/YQN8UrO
        t00uA0GRfH/SgQs7JCjMKwTJvA==
X-Google-Smtp-Source: APBJJlHe/ztQIOxhO5hduzvHISVsuPEATfvAy0wCgXbWJfUZ/z31/ad58Nmvho+qW0BLywAisppqAA==
X-Received: by 2002:a5d:6205:0:b0:313:f676:8343 with SMTP id y5-20020a5d6205000000b00313f6768343mr10235179wru.60.1688970352878;
        Sun, 09 Jul 2023 23:25:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i18-20020adfefd2000000b0031272fced4dsm10767459wrp.52.2023.07.09.23.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 23:25:50 -0700 (PDT)
Date:   Mon, 10 Jul 2023 09:25:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Koba Ko <koba.ko@canonical.com>
Cc:     "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
        "Luck, Tony" <tony.luck@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] EDAC/i10nm: shift exponent is negative
Message-ID: <dbfac4bd-a9e4-403d-86de-c70668f6e676@kadam.mountain>
References: <4ec2b7d2-11a5-6ab6-087a-175ed31faca4@web.de>
 <SJ1PR11MB60839A0FC6B5E79E3E5A7997FC29A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAJB-X+UB+eYoYOOVH2bqnnVEJcLrxaj5A7-zyfgBM7hOf4y8zw@mail.gmail.com>
 <SJ1PR11MB608383A5841E4AE8D3A64B79FC2FA@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAJB-X+VFYyTiQ7yhX=Z8-Q4QW-GMsGXMuEWxLjuoZ1aDB98qXg@mail.gmail.com>
 <SJ1PR11MB60832C7FFEF98EE33F255B9DFC2FA@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CY8PR11MB713495A12DE47EDC3B7C5E20892CA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <CAJB-X+X_KW=T4WOe2AS3SFFQKjt7VcQRFUCGYFcjipi5-aXdrw@mail.gmail.com>
 <CY8PR11MB71346D8945AAC57D3614CBE2892DA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <CAJB-X+Xe9H0O=-2o3hL+pz=aGdSRYX+hD0bAxUS11CZDRVZLKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJB-X+Xe9H0O=-2o3hL+pz=aGdSRYX+hD0bAxUS11CZDRVZLKg@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jul 09, 2023 at 11:42:22PM +0800, Koba Ko wrote:
> tested-by: koba.ko@canonical.com

It's better if you put the tag in the correct format.  There are a bunch
of tools which automatically add tags, but they only work if the tag is
in the correct format.

regards,
dan carpenter

