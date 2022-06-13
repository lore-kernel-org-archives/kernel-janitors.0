Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBF4C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 13 Jun 2022 19:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346930AbiFMTQx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 13 Jun 2022 15:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244530AbiFMTQj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jun 2022 15:16:39 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E8C24F1A
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jun 2022 10:13:59 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id w21so6354021pfc.0
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jun 2022 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QeOkcvX3znDxHyf5NSZPCw2521sMVjp/b+SUjQM63oY=;
        b=KPDsZ2ZIiectBfz7EK4WJ5pJ9CbQSHCuTC9DcYViAIZvC2AwqLo9jqCpnK6bQTWOO/
         +5mkx8P5Fk8uGASuuEU3hbPsFqcl3t3oRn0MsPg552e0b+ERWXQOP0tnLiyIZpzShmd9
         2Ag5a310uCQAW1lpYjfGyRLfav3KNE5kcA154=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QeOkcvX3znDxHyf5NSZPCw2521sMVjp/b+SUjQM63oY=;
        b=Z9wXHH7i+6ckTsYsY5GeICAvcTJTfWUXTSXFs6D0XP83VC9Mfx0nk4/07qldrPwsyQ
         YkfeLJNVsK7+n06J3spGskDDJQV4yH63IE2oFRz/ZJpG5EpnYDhsCXl8Rq6FMJ/IIJmw
         HyqroAHfn2nWrdJ+UAdqEj+cAN4KszesdFG+R/iEd+CHvycgYwXtACsjISFcyljRcz+G
         /1J210Shfjs6J9l0m571KhDMCwai5ZUEcmjQrFUjhAZQw8rMXP0t75+iyCJpe7Z8TTbZ
         +f/+DEkVKbFRUMs8sKBLw8suT+1Xlc/iNNB9/GOepQaCrn53+FyLxwP/KTaWyi++ARMb
         gJUA==
X-Gm-Message-State: AOAM530ZEyBQzh00dP+r27ZknVwyT/H8UQ5JpY5UkCI/SFja7K9w0KZ7
        LXJkBQPxu6lw5J1tdkTBej7SKQ==
X-Google-Smtp-Source: ABdhPJywR4BfcJFwuZ1Bd4Qs0nnw2UK8P6xQr196LoaHBmQlYW6nfk7/zGDL+Lqa2GkEfmmAgd1VGQ==
X-Received: by 2002:a63:1a1d:0:b0:3f5:eb02:b6b4 with SMTP id a29-20020a631a1d000000b003f5eb02b6b4mr518865pga.343.1655140439320;
        Mon, 13 Jun 2022 10:13:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p10-20020a62b80a000000b0050dc76281aasm5643639pfe.132.2022.06.13.10.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:13:59 -0700 (PDT)
Date:   Mon, 13 Jun 2022 10:13:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lkdtm: cfi: use NULL for a null pointer rather than zero
Message-ID: <202206131013.BC01222@keescook>
References: <20220612202708.2754270-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612202708.2754270-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jun 12, 2022 at 09:27:08PM +0100, Colin Ian King wrote:
> There is a pointer being initialized with a zero, use NULL instead.
> 
> Cleans up sparse warning:
> drivers/misc/lkdtm/cfi.c:100:27: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
