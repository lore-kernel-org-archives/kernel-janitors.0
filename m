Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F765C43334
	for <kernel-janitors@archiver.kernel.org>; Fri,  8 Jul 2022 17:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239053AbiGHRt2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 8 Jul 2022 13:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239058AbiGHRt1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Jul 2022 13:49:27 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5729186EE
        for <kernel-janitors@vger.kernel.org>; Fri,  8 Jul 2022 10:49:25 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id b2so16913289plx.7
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Jul 2022 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iaX4oMlkYQaiZNZlnSZLy4aO15Umt0DimrsKT0WBN94=;
        b=AOnrCKW4iRtrjhFIeI1XHMgJsdJUZJpyMRA6aXnS03bzhFgINeXZon8QLvblOR2zaa
         XxGtuFxfBPK5rsPIxtEeLP59wE9GyCGAsF/oRdYQrWE64LL4haYYlMJzMLL0gsIMqllC
         eft0gu3zpVh2JXhP3BVcHuNVBsF08pvH0PS0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iaX4oMlkYQaiZNZlnSZLy4aO15Umt0DimrsKT0WBN94=;
        b=0yfqqBZ0z3KyxD6iTHnBBxDEizEX3rQ4/1LVBUBdtn62fzaEhyGpVfBHJie9O5Ximp
         E+oA2gCOQNe23QErozh3P8qFfytHuV3cNn+MRiir6zga5L7B4mkndRQqYrRKhNVv8RFE
         CSZ/dSctYNDK3yJbMaXesYOICRR3zT6c7If11AmGR/ItMFHsjOtqfMjSYkaEq4eyuO48
         sLakETdmlGk+qKBzJFdzUMSBev/mBzu2H74hOx2V/aDEYWSlw9kP+A5VLVuQifA2GU7i
         4GakwP/5BoHKVflef4tJjuSMiqIruAJ26hCRa6NY62fRl1hb00OlOkuPdJS478PY1Ccg
         12Zg==
X-Gm-Message-State: AJIora8YQi9rGtVA0CWCMIYF24hmtpvh2QnqIzyHvG7+WxLxlVqt5oTt
        1IS3FC1Ov1GHnYGluQ9AklFixg==
X-Google-Smtp-Source: AGRyM1vP2QB4szrzMUbieQDDUsxXoTfCV6IPBMycttXyZLt/UI3+U2cpbLeu9G0A2lhBL8CygjgDKw==
X-Received: by 2002:a17:903:185:b0:16a:6113:c01 with SMTP id z5-20020a170903018500b0016a61130c01mr4938266plg.113.1657302565221;
        Fri, 08 Jul 2022 10:49:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902768b00b001637997d0d4sm30099069pll.206.2022.07.08.10.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 10:49:24 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com
Cc:     Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org,
        bp@alien8.de, peterz@infradead.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
        hpa@zytor.com, luto@kernel.org
Subject: Re: [PATCH RESEND] x86: mm: refer to the intended config STRICT_DEVMEM in a comment
Date:   Fri,  8 Jul 2022 10:49:20 -0700
Message-Id: <165730255765.3882379.9761346871433228288.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707115442.21107-1-lukas.bulwahn@gmail.com>
References: <20220707115442.21107-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 7 Jul 2022 13:54:42 +0200, Lukas Bulwahn wrote:
> Commit a4866aa81251 ("mm: Tighten x86 /dev/mem with zeroing reads") adds a
> comment to the function devmem_is_allowed() referring to a non-existing
> config STRICT_IOMEM, whereas the comment very likely intended to refer to
> the config STRICT_DEVMEM, as the commit adds some behavior for the config
> STRICT_DEVMEM.
> 
> Most of the initial analysis was actually done by Dave Hansen in the
> email thread below (see Link).
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] x86: mm: refer to the intended config STRICT_DEVMEM in a comment
      https://git.kernel.org/kees/c/c09327d5673e

-- 
Kees Cook

