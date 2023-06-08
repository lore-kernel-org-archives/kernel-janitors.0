Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C145C7EE25
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jun 2023 08:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbjFHIh3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbjFHIh1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Jun 2023 04:37:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A386106
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Jun 2023 01:37:26 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6dfc4e01fso2594125e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jun 2023 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686213445; x=1688805445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZCb5PdhS0IYwvvsDCa/VL+qib/TSEpn0dlyBBSbqu4=;
        b=xKQFIVRwB7u6411rnPYsy+hEEYogWdc8ES4TQnFINVLWFc25NgIeIXrP/VQnMgykrQ
         rjI6GEND5upFg3dpwUQY89Zxl4ZG5SH3PIjoaKwqKlz6i9UATKNayO/6LlVvaJrqIrQH
         4QTOJp2PRR8uMD4RQQCzHmNe324K7rBbzN86kAK8oPRXSbYV3BQasQW2KkjbPcjac4r6
         uKDieZr29nVwFV4cibwlYkwqvnPcsX75h3JKpXmmTfWIUxttT+jzCscA1NHZwAS74yCK
         XQ+8DsQpuhMWKcKQNX6bB7Xdkm+79fro+mLsj+33y/o1sHiAADv2XVuD4sRX1KWsA7kv
         nykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686213445; x=1688805445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZCb5PdhS0IYwvvsDCa/VL+qib/TSEpn0dlyBBSbqu4=;
        b=HpzP+pvqsK8wpzlV1NUWEQCglhzjEdKL+VHNBpvEOpw37uB5m4nahCKVWR/zDTx5fC
         zXZZ9Xpi+2ZqxMsyan/2NBgVB9OXXyNML509ZXQ4/TCLF3SNrLlYkqAOE9dMh4UhcChm
         6Pgz744p6kORrdESqn1sDJ6OcS46T/Cyg1XRDVoGUHdgivNlUEi1cK1SajtxPH6hTjei
         gmtAXDLBGjCzb2ZJcszBu4zikZoYAESql3paUGf0E3tkPC8dkDOrLaAM0wG7G08VCPGl
         /ecvsvXA7JNm9Ijtx3FRwARPXZYYDdYgGUamv/dLKA5G/AsmLvwuoUFtpqqSjuNRJ9g5
         0X4Q==
X-Gm-Message-State: AC+VfDwtJ0uK11Wy7/JX0Kq2PiyMPSkOn0r+U8BJ/Vs7YJjXwI2xQxSK
        gziCDobVvDNUzDeTAJIqaSzOYF5b2/WdfHK6ijU=
X-Google-Smtp-Source: ACHHUZ5vuL1W6b8niAAPfGRlfaNV/+KpO2VZNptTpFgmafvFmI1nX/PAJMGEPxfYM1xfvu/yuhX4OQ==
X-Received: by 2002:a7b:c84c:0:b0:3f6:128:36a5 with SMTP id c12-20020a7bc84c000000b003f6012836a5mr762472wml.10.1686213445085;
        Thu, 08 Jun 2023 01:37:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c294a00b003f6050d35c9sm1209725wmd.20.2023.06.08.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 01:37:23 -0700 (PDT)
Date:   Thu, 8 Jun 2023 11:37:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
        "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
        "airlied@gmail.com" <airlied@gmail.com>,
        "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
        "Shankar, Uma" <uma.shankar@intel.com>,
        "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/gsc: Fix error code in
 intel_gsc_uc_heci_cmd_submit_nonpriv()
Message-ID: <2cf8065f-6841-442e-b68c-14e0d2b055c8@kadam.mountain>
References: <ZH7sr+Vs4zOQoouU@moroto>
 <15829bd2d58a7439d416e2e36c5c4a17281b9fc2.camel@intel.com>
 <a0088658-d7d0-4047-9b5e-ea8e1987afc0@kadam.mountain>
 <9fae9daf7b2c745db1b8c359a822e4da88ce71c1.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fae9daf7b2c745db1b8c359a822e4da88ce71c1.camel@intel.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 07, 2023 at 06:44:54PM +0000, Teres Alexis, Alan Previn wrote:
> On Tue, 2023-06-06 at 21:32 +0300, Dan Carpenter wrote:
> > On Tue, Jun 06, 2023 at 06:07:19PM +0000, Teres Alexis, Alan Previn wrote:
> > > That was my bad, i could have sword i'd fixed that before the final rev. Thanks for fixing this.
> > > nit: below function applies to MTL only which at the moment is still force-probed, so not sure if the fixes tag is significant.
> > > 
> > 
> > The Fixes tag is correct.  It's definitely a bug fix.
> > 
> > (I invented the Fixes tag so technically that makes me the worlds #1
> > expert on Fixes tags).
> > 
> So sorry my bad.

LOL.

Presumably the appology was intended sarcastically?  Hopefully?  Oh my
goodness.  ROFL...

regards,
dan carpenter
