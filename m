Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD29E78493
	for <kernel-janitors@archiver.kernel.org>; Sun,  1 Oct 2023 21:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbjJAVF7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 1 Oct 2023 17:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235355AbjJAVF7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Oct 2023 17:05:59 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAD2CE
        for <kernel-janitors@vger.kernel.org>; Sun,  1 Oct 2023 14:05:50 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-690d2441b95so1694790b3a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 01 Oct 2023 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696194350; x=1696799150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPET9w0ktAjq+TgFKzzsSU899+RQr2NesK2FVmHe4kw=;
        b=hfQm/i2c3iIU6NuDvBvdAwDcI2x6tSxTZDkToKU5jkDdjFSSCOstKg0ihGXLm7fTzQ
         VdLnCATCoPwOsnDceiE4gi0zT4yc7hTroxnRJS/k2TBqjc6+h5xMhJraaDGR8dIkzLr7
         Kd82n8lq/zAIiV/3VGo+BrjoXUMGW8O+w+Fb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696194350; x=1696799150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPET9w0ktAjq+TgFKzzsSU899+RQr2NesK2FVmHe4kw=;
        b=aKfve03gaSXWm5DvTe7rapXdmkV09s2cw8qHxBhMbwycXoH0gLPL7W8gNngDD0T13B
         PtrOZ/b//jfOMoK5iMV6sJb9VunW0vn0ls6yh18dasOWQW3Nkymo9aL3Szg38aQozMXt
         1J2b8MRVsebVSoEtcArKy0Mkadvop7PARxOjAY5nRl0KqOhntJJadu9MUExgAUqUsn+N
         b9YW7BwMxArfMNgUDzA/PQE6yctaYLSCXjIpRKsaZp6y/p3U8Pin1GZzUJEcG+Nu2A9y
         1xX7jygHEEuYQ1Lr6gZcsE/INSFuwL0UBKWSS/WDpeLe/OLSsIjFleQcpmV84SEfpnc5
         JHSw==
X-Gm-Message-State: AOJu0YzWMlAzKqRBYVyoG2nqtrNPa6nM/goq8zBW+KOtlGrWoljDz7Te
        qN7zj+FED1qPoxdfrRhoXgXNXw==
X-Google-Smtp-Source: AGHT+IH3XCX1bFhdggGosLrTWDSZbda+DgRtjDOd4Jr02++pIlTQr7eU8vyMgOL14EARFIWEhjY/yg==
X-Received: by 2002:a05:6a00:1886:b0:68f:cc67:e709 with SMTP id x6-20020a056a00188600b0068fcc67e709mr18341051pfh.16.1696194350427;
        Sun, 01 Oct 2023 14:05:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm9552553pgc.80.2023.10.01.14.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 14:05:49 -0700 (PDT)
Date:   Sun, 1 Oct 2023 14:05:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Kees Cook <kees@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] comedi: Annotate struct comedi_lrange with __counted_by
Message-ID: <202310011405.7599BA9@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
 <202309301342.5B5BED40A1@keescook>
 <alpine.DEB.2.22.394.2310010945130.3166@hadrien>
 <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
 <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 01, 2023 at 09:14:02PM +0200, Julia Lawall wrote:
> Kees,
> 
> You can try the following.

Cool! Yeah, this finds the example:

drivers/comedi/drivers/rti800.c:74: struct comedi_lrange: field at offset 0 is the counter for the flex array
drivers/comedi/drivers/rti800.c:83: struct comedi_lrange: field at offset 0 is the counter for the flex array
drivers/comedi/drivers/rti800.c:92: struct comedi_lrange: field at offset 0 is the counter for the flex array

I'll run it on the whole codebase...

-- 
Kees Cook
