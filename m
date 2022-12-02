Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F48C4332F
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Dec 2022 21:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbiLBVRZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Dec 2022 16:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234409AbiLBVRW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Dec 2022 16:17:22 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25F4ED6A7
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Dec 2022 13:17:21 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d3so5740652plr.10
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Dec 2022 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CWCytxw2GwvkIRyjMsGItc6tSPW6eIa2hCojgQ491Zo=;
        b=bajllRR0W9wmzd4Nw2CalvIXB2XPAXMdlanCcbLZbvVXt1B1Pl6NTxmK3wxwqtM7kV
         CxHsUVrEXom1EL5rOfhhLf59se6NhxPVGd5NRmcIbnlGtNCpS088grJYnYJ0D+/YJFti
         6DL7+PfEWKWxxy02Ch2OcVaic0rs/mH/oVaMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWCytxw2GwvkIRyjMsGItc6tSPW6eIa2hCojgQ491Zo=;
        b=4xRbGqWafFyfbt756JKcSXFtYOUyP5csZ/xJQMpwN/1X+Wcw1rtbMXzec7HGL4tSkN
         eWjRq7/GZQiRhDVobFep2slg3Pyu7Jd7oDEPKUTrSH5kXWWBzqI3MBW6ktafP3XJ/K57
         fsLBCsC2FOsR2DAKPB6YX/sYhylEWaGadZerYuUV4BixWE/IhzCkVxRKUPL2IUlvCil/
         GuUuXlgJJZlwRiaMWRbc3ZvmI7HALt8jfdoUJXMV6jHYh8uBByPwlCr2UF8nEUj9P9mM
         KkJvYmGWQeOVhC7A4SPVqzLeL0/sIvRFILvLBKyaI0Lhy5ukWBO7OmhkEcE+MV0PVd3g
         H07Q==
X-Gm-Message-State: ANoB5pkD+IgbWrsDL9oyAlcOlwYAYo5ZGsRcPaOJpXIiNYLzFMmecvO3
        /lBPJid1r2XmKXPO2hK7gaw5vw==
X-Google-Smtp-Source: AA0mqf4yK8k4jj9BxYD7YjYVNBTxiTDeEOIyTukBKrDUunylOzFFlU/7UtMvczkInCXPtJNqJ5N5zw==
X-Received: by 2002:a17:90a:b703:b0:20d:7716:b05f with SMTP id l3-20020a17090ab70300b0020d7716b05fmr38392031pjr.104.1670015841306;
        Fri, 02 Dec 2022 13:17:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f88-20020a17090a28e100b001f94d25bfabsm7005868pjd.28.2022.12.02.13.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 13:17:20 -0800 (PST)
Date:   Fri, 2 Dec 2022 13:17:19 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jason@zx2c4.com, kuba@kernel.org, tytso@mit.edu, elver@google.com,
        yury.norov@gmail.com, linux@dominikbrodowski.net,
        gregkh@linuxfoundation.org, pmladek@suse.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] random: Include <linux/once.h> in the right header
Message-ID: <202212021317.80F5899CBD@keescook>
References: <212adb212cb0234a7d395daf31b2578b9409d492.1670015476.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <212adb212cb0234a7d395daf31b2578b9409d492.1670015476.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Dec 02, 2022 at 10:13:36PM +0100, Christophe JAILLET wrote:
> <linux/prandom.h> uses DO_ONCE(). So it should include <linux/once.h>
> directly.
> 
> On the contrary, <linux/random.h> doesn't use functionalities from
> <linux/once.h>, so it should be removed.
> 
> All this is true since commit c0842fbc1b18 ("random32: move the
> pseudo-random 32-bit definitions to prandom.h")
> 
> Move the #include <linux/once.h> in the right file.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
