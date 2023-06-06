Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82511C7EE43
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 06:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbjFGGkJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 02:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237719AbjFGGj5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 02:39:57 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC3410C3
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 23:39:56 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30c4c1fd511so5745292f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 23:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686119995; x=1688711995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HI9GdCgHoTGlfQU0exK8pWHJCdZzP4jYRRoNTOZ37xQ=;
        b=RosDcx37udii0ZeWmNfNQw33MgXpSbLBh1BulbpvPbCAgWogAhWiVGM/3pjgd6n2Kf
         oq1AvzeV7XoA8zoZhdJYYBnWieCKtU310GP36DINnoWyZhixEOuEeYio/lyTWQXB1L/k
         YRz3Y5t59PW2qfQxQTcaEw1S6oMpYW63/0oa31NkCHZt2NUQHZeHF14XMCrV3iKJswp2
         /zhrJIFQJA88yVPumlmCBwfrGbDCj4hYqbIxGXHSEDNrjbNFDJet15i6hlowqhqLx4m/
         pRe/HSCUoIZhvmuOvdcIkb8QbN5A3S8FBU3B6KYwkOCJcLUkvAl/NCePZxAbvCuzAifb
         qsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686119995; x=1688711995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HI9GdCgHoTGlfQU0exK8pWHJCdZzP4jYRRoNTOZ37xQ=;
        b=XPy/qmbJiSOT7HY+nosCt7hO9/zvWYDrKcm/FItlSFAM0M5u3evmGa5aRTqivdB/Pu
         Ekqd8u4RH1lxBkIRC3PbOaU1hGFsaerVUvOchPr8LsMUt+4ySIkKIVQMhB94wgWOmhxP
         3u39uaEaZmiylNyOzXV4ZaQsdKdEzjUYfBwNNoU3Afa1Tj7eTuI+ygMXF+x57lcpEzoY
         hAvRGEdNjTmVwJXpvv7apGlf/DXgvKGxQHR/zeXu4LhN/jofGikvwx0DCxKpKyEmGmcb
         qtz/mb0xtxc420EVqjXUs1p5N7AXE+QJ+gaXuDtkBMaBZ+kHOnQJ7jRGCx5MnxBQ46gc
         y0/A==
X-Gm-Message-State: AC+VfDw2nGJ7uS79PGx+lqgtb9RsMNjraIodSIBqp3UiYJxlPqn9k/Cp
        TxPeyJHgMsYwRnFIQeR4pDUjbA==
X-Google-Smtp-Source: ACHHUZ4/qEfuig8+pBDtHKvj+17QGcfaaoDYGfYpjItmrZ/JwJ0QdLy8j1q7Gdv88FeJuzPMts3g1Q==
X-Received: by 2002:a5d:6702:0:b0:2ef:b4a9:202f with SMTP id o2-20020a5d6702000000b002efb4a9202fmr5174080wru.69.1686119995427;
        Tue, 06 Jun 2023 23:39:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm14528126wrw.70.2023.06.06.23.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 23:39:53 -0700 (PDT)
Date:   Tue, 6 Jun 2023 21:32:16 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
        "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>,
        "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
        "Shankar, Uma" <uma.shankar@intel.com>,
        "airlied@gmail.com" <airlied@gmail.com>,
        "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/i915/gsc: Fix error code in
 intel_gsc_uc_heci_cmd_submit_nonpriv()
Message-ID: <a0088658-d7d0-4047-9b5e-ea8e1987afc0@kadam.mountain>
References: <ZH7sr+Vs4zOQoouU@moroto>
 <15829bd2d58a7439d416e2e36c5c4a17281b9fc2.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15829bd2d58a7439d416e2e36c5c4a17281b9fc2.camel@intel.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 06, 2023 at 06:07:19PM +0000, Teres Alexis, Alan Previn wrote:
> That was my bad, i could have sword i'd fixed that before the final rev. Thanks for fixing this.
> nit: below function applies to MTL only which at the moment is still force-probed, so not sure if the fixes tag is significant.
> 

The Fixes tag is correct.  It's definitely a bug fix.

(I invented the Fixes tag so technically that makes me the worlds #1
expert on Fixes tags).

regards,
dan carpenter
