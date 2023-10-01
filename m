Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5408BE78491
	for <kernel-janitors@archiver.kernel.org>; Sun,  1 Oct 2023 21:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbjJAVW1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 1 Oct 2023 17:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235249AbjJAVW0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Oct 2023 17:22:26 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FC7D3
        for <kernel-janitors@vger.kernel.org>; Sun,  1 Oct 2023 14:22:23 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-57bab4e9e1aso6867024eaf.3
        for <kernel-janitors@vger.kernel.org>; Sun, 01 Oct 2023 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696195343; x=1696800143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHJrlgm7LFwgtNAlZtL3Zhw4zS1ia4QUcX3TsUNW/zY=;
        b=K8ahlFg2t0R6P640XZbVxn1n2eDcpclSPylMTjfPl2JXWodDr6kLrmiNBWzklmDxfH
         Aw2tK9NBINlcbwYXlmiUEecoy2Zwz4jDigiPKrVjpnE7TY7Rvf5x+y+PkzQQHURorboz
         xCH+3AnjYHGTOI1euqmlPVViIwmcqqhQwYQ1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696195343; x=1696800143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHJrlgm7LFwgtNAlZtL3Zhw4zS1ia4QUcX3TsUNW/zY=;
        b=tTSSsr42iJY5qQ8eA3AithTlIDvZMtk6bWaoYdyAy5D7HWSxPMp2y/K5BwqaO4KqRQ
         JoKC7R+rzoNHgrUwu7+tAmQ7GyLqZMWhGBtRMDQDd35ueCasveZLhrsfuDdDCaEjNqVH
         xiO6IvIGLuO+xUEtjFrCbn3mE68zPfFvMnf6utJVZ45nJ0XCw6N7J8UNmEFSCHmojuNg
         RIhNpNS+fuqIaDyG8QHUABDKb4VFo91kf9zZr1/yWDP/2kH3WJDE9uJKGFb5tmVGKDxR
         xF+J7jBx4ILAmHrYfkbNi5yEoCOHflGldHKWoQ9VfcWnwQMuNve5T/Y+8vyOS4BBRoHT
         IenQ==
X-Gm-Message-State: AOJu0Yz6mw6xeKlf/Z0Z3cP7o4dFgRTF6SLCMk08iIB9P4KXvMO+WBfc
        u5/EFXFCJaffPn3u5vsosuBnSA==
X-Google-Smtp-Source: AGHT+IFJ8g4Z37QS8SaU2llcFOkETm2VqxZtmL7Bq8TmJ06CIdCQ3MlUKaTsGOWE7trNihoFqgoeXw==
X-Received: by 2002:a05:6358:91c:b0:139:cb15:ecd3 with SMTP id r28-20020a056358091c00b00139cb15ecd3mr12488851rwi.8.1696195342750;
        Sun, 01 Oct 2023 14:22:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y5-20020a62b505000000b0068ffb8da107sm18363405pfe.212.2023.10.01.14.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 14:22:22 -0700 (PDT)
Date:   Sun, 1 Oct 2023 14:22:17 -0700
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
Message-ID: <202310011421.C4F19D45@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
 <202309301342.5B5BED40A1@keescook>
 <alpine.DEB.2.22.394.2310010945130.3166@hadrien>
 <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
 <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
 <202310011405.7599BA9@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310011405.7599BA9@keescook>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 01, 2023 at 02:05:46PM -0700, Kees Cook wrote:
> On Sun, Oct 01, 2023 at 09:14:02PM +0200, Julia Lawall wrote:
> > Kees,
> > 
> > You can try the following.
> 
> Cool! Yeah, this finds the example:
> 
> drivers/comedi/drivers/rti800.c:74: struct comedi_lrange: field at offset 0 is the counter for the flex array
> drivers/comedi/drivers/rti800.c:83: struct comedi_lrange: field at offset 0 is the counter for the flex array
> drivers/comedi/drivers/rti800.c:92: struct comedi_lrange: field at offset 0 is the counter for the flex array
> 
> I'll run it on the whole codebase...

It found only the struct comedi_lrange instances, but that's good to
know. :)

-- 
Kees Cook
