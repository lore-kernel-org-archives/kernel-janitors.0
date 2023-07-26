Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74ECC001DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Jul 2023 04:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjGZE6z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Jul 2023 00:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjGZE6x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Jul 2023 00:58:53 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40B4211F
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Jul 2023 21:58:48 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31758eb5db8so3179985f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Jul 2023 21:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690347527; x=1690952327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VSCNiqtjM63gyIxgjIBJEUZn4+F4fATzLK2EYdkNIY=;
        b=KAne/S+rw2HDnpOYoq0XxAAGGDmFqVEL+4b4QaJcz22Motczt/sEQi9P3+LqtencG5
         gffk18N2un8Un3gVDBbLDRJCSvj/U8kQRXbeQ3sQi+huU3lOUDhkEacR32UfE0BX4PXh
         R5/AZ6BiObX/u6qK7p5VAxfARPx+dYhRpdGh8YMNmi7dfD3cWvKAT9kHjYSnEJ5f8VY9
         O4DK8ND7BY98sdM+l45wVaQtDojEafUaGFQgGsLdy7qT7doz5fcB77x8RhaQWCvIVbYf
         16flgyVtRYvWqtls+t8zRp/16OIRitE9lb7iBK7d3/SPlHxDXZmPwzdX6fReubLyHpoC
         4YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690347527; x=1690952327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VSCNiqtjM63gyIxgjIBJEUZn4+F4fATzLK2EYdkNIY=;
        b=RQstv0OmQPQB3J8j+mNuFuN4ExqAfyMJgcJS8mEeZSwQDrecoZvQDdYyy4PCy4weyk
         uAYg+0AwU3QLC63NRjm8HO98nH/2jsX73l5FhNeoFQsZFWC3uKxfsaoQq6Iekvf2Jq29
         +EyVaDtK7NtTTsOPwEqnwM0A1Nu5vIEsS0luwcvr+/FZEYL5FvKGov2Tq4JhL6Xybvd7
         r4LDKBwXs9vyekicsINQiI21hNO41omL47DwQQ8TdU8rQMwz0b2Fw6piaXOFw86vCIbq
         fG+esRJMhpKgHHfFx3tXHl5z2BavyKRklmN3kgzn5tKYThTpySFW7u6Sp8hBARqwvWU3
         9PDA==
X-Gm-Message-State: ABy/qLZb2ihVVirHf23HWfJvsqJbb7LcIScXDcPF8mgHpy4wRLiEArmJ
        sHm2Ka5zg7ea1xrz0mrk+i7HlA==
X-Google-Smtp-Source: APBJJlGmyTCKXK1KhdP6dWBqtNLQ81LaRl/lodbuRe1N53MLle/JLuh+e2iJ/WFJxYTYet9lHw3Lew==
X-Received: by 2002:adf:e3c5:0:b0:317:5d1c:9719 with SMTP id k5-20020adfe3c5000000b003175d1c9719mr515001wrm.9.1690347527148;
        Tue, 25 Jul 2023 21:58:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d6e0a000000b003141e9e2f81sm18453128wrz.4.2023.07.25.21.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 21:58:46 -0700 (PDT)
Date:   Wed, 26 Jul 2023 07:58:44 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
        airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
        ndesaulniers@google.com, trix@redhat.com, andrzej.hajda@intel.com,
        intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mripard@kernel.org
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Message-ID: <a4350cec-4ed6-40bc-b68b-3a3a89aa08ac@kadam.mountain>
References: <5d096bcf-c394-4dad-b307-3d7e33ab6e6f@kadam.mountain>
 <630b9f2e-00e8-5b54-ad1c-3e4d404454a1@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <630b9f2e-00e8-5b54-ad1c-3e4d404454a1@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 26, 2023 at 09:21:50AM +0800, Su Hui wrote:
> On 2023/7/25 13:51, Dan Carpenter wrote:
> > The reason why the first five attempts had bugs is because we are
> > trying to write it in the most complicated way possible, shifting by
> > logical not what?
> Wonderful! Should I add your name as signed-of-by?

Sure.  Or you can put it as a Suggested-by.

regards,
dan carpenter

