Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9198ECD612F
	for <kernel-janitors@archiver.kernel.org>; Mon,  9 Oct 2023 20:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378512AbjJIUAK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 Oct 2023 16:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377401AbjJIUAJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Oct 2023 16:00:09 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68299A3
        for <kernel-janitors@vger.kernel.org>; Mon,  9 Oct 2023 13:00:04 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6c665b2469dso3282129a34.0
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Oct 2023 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696881603; x=1697486403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnnNZrfQHu6U702fU9qv9YujuMNy/CqVElyAPuDlNS8=;
        b=C774o6WSf/gt2YrkMRsHjeigz24wLn36GDvorNU0gUCxqUjrVcUsHb/F5XpmpaHRb9
         GI4v6CFdNJAWydxM1Gsft3erUrCeOjIn9yvdVpi8Cuvfd8MlGlVGiChGLhiq1yCUoicR
         pxLEmdRAdkdSZtOe55jC1HQc3RShNIEZNQI/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881603; x=1697486403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnnNZrfQHu6U702fU9qv9YujuMNy/CqVElyAPuDlNS8=;
        b=qWPYVj8xtpr3MJeF8yPgrJnTJuVljiv+73J/v2eRMQTfFc1ay4j6krch1EAAdFEtMe
         lJgxIn5D6PbzgdLT0QRqCb08DdHAMeGRQ+oqjzJoan8CDZVrkPm/8tl7rUc3O6vvb3BQ
         VHRe71bXQ6iMx7fKmdFkOsX7XfvEqTHgAOMf/xIbQyLLFGvwjtHQHiQVNyphd1iK5gJM
         SN1Lem83/jSCA97Q7Aa5ZQk6wvKQYN5fw7MvNSABoYi6KRrbfv89IimcJN2xaCY35DrM
         MX3VPlA+DJZfrSNZArxfqV185s7NExqLN809G1QomvRuTWJhWHwTzvfc0klC6MIOsNYz
         Z1ZA==
X-Gm-Message-State: AOJu0Yxrb4wPKBJAqL8CIBkhdQk2JlzNZjyTp3Yva4aOTWfJsR3z8qUe
        eWo/aaZEfpNVWCWdpME/e/056w==
X-Google-Smtp-Source: AGHT+IFr2diKV0FUnPCKvbVJgM9zVEQvrx9lAF5Q6PUGXjcm/39HFBRDZ6m3k4XI8U3B8QraX/ZFbw==
X-Received: by 2002:a05:6358:42a6:b0:143:321:f36b with SMTP id s38-20020a05635842a600b001430321f36bmr14035556rwc.18.1696881603565;
        Mon, 09 Oct 2023 13:00:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001bdc8a5e96csm10053257plc.169.2023.10.09.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:00:03 -0700 (PDT)
Date:   Mon, 9 Oct 2023 12:59:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: rockchip: Use struct_size()
Message-ID: <202310091259.1D9E73DAE@keescook>
References: <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 01, 2023 at 09:44:04AM +0200, Christophe JAILLET wrote:
> Use struct_size() instead of hand writing it.
> This is less verbose and more robust.
> 
> While at it, prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with __counted_by
> can have their accesses bounds-checked at run-time checking via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> strcpy/memcpy-family functions).
> 
> Also remove a useless comment about the position of a flex-array in a
> structure.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It seems the consensus is to keep the struct_size() changes together
with the __counted_by annotation, so yes, this looks correct to me:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
