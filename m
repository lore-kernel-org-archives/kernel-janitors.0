Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0430BC77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 07:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjDSH6y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 03:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjDSH6x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 03:58:53 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EC84C35
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 00:58:51 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so968326wmb.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681891130; x=1684483130;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v9nhWTNFUot8DhVxJTGVf8U7r1UFd9xR4G2cjz6ra5U=;
        b=EGBfyPyJHJotUnoVy1IkY/z6izta25ZfsN2JEoy7WTUfA2I/BsJnN1O/cGBb9O6axs
         Q+SZT3mKAnoCtliZ+TRB+QWM9K5ES5jHA2a6j9xIpoo+tWdQvuF4XBrDs3085yMn2ajB
         XI5+iIOwoaCrXk1FmUiH+A4Sf9SnQvAjRjfzbKH2gFO5cCvpjvfRKxsXtSRaCJfGjG0I
         AaYKERq25347rd+waTxa58Ifxf5rRW5e+g8Q48fpTjblXj1heahw1x+1JG4b80FE2k33
         Q70fMZmKlNPuox0UJjNcIVPNS2gW0xmt+EN73JafKqhsrE8EFhtyP/MXLWBtBhEBXQEM
         vK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681891130; x=1684483130;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v9nhWTNFUot8DhVxJTGVf8U7r1UFd9xR4G2cjz6ra5U=;
        b=TTFyQy4O2tsUkkclULG4ThMx0OxS/a9W6Rn7nfRXnFc/4z1UnfVfcK+L1F2jnqIPqe
         gVM2S5nl0ejD3Ey5uxh6Nq8OhmwDpybQlJIyBDvEEoZTxfZnRmOgRt1p8F/Go2GjF4u1
         CLEqpk+GmhbkjTls/qIcBZBTzs9KfI9zO3x2JS/C8096FZtw1lsf2uHJdh+aZhl4FLb+
         TVzDPc05cCBlcjwk+y+bX4NTh2aoj6pvRaO9NGjqE/HSM4VrYEgT4ecQoSpuDNoWoeUu
         IB9r1ZZKUBJtaaiL1otwytG8RVuxatrccp72MzLKN38jOmsLBnt+SGa8ifVlbWA1px+n
         obKA==
X-Gm-Message-State: AAQBX9dcVll2GOxrD3fuGbXCSNruD1XMOKIjzM/8/jrJjswgATnFwzIX
        w7HIemRdlTdnlPHGeBDPnLGtvg==
X-Google-Smtp-Source: AKy350YWB4M+Tend0JFwwajhPdp0/tpo8ptDFpbt4km0eviie9q/Xfu+JpYBnj4Dy9cuZ/Ktki9wBA==
X-Received: by 2002:a7b:cbd0:0:b0:3f1:75b3:60df with SMTP id n16-20020a7bcbd0000000b003f175b360dfmr5955964wmi.41.1681891129997;
        Wed, 19 Apr 2023 00:58:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003f173a00304sm1330043wmg.17.2023.04.19.00.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 00:58:49 -0700 (PDT)
Date:   Wed, 19 Apr 2023 10:58:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     James Morse <james.morse@arm.com>
Cc:     Will Deacon <will@kernel.org>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Liu Song <liusong@linux.alibaba.com>,
        D Scott Phillips <scott@os.amperecomputing.com>,
        James Morse <james.morse@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] arm64: delete dead code in this_cpu_set_vectors()
Message-ID: <73859c9e-dea0-4764-bf01-7ae694fa2e37@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "slot" variable is an enum, and in this context it is an unsigned
int.  So the type means it can never be negative and also we never pass
invalid data to this function.  If something did pass invalid data then
this check would be insufficient protection.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/kernel/proton-pack.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index fca9cc6f5581..05f40c4e18fd 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -966,9 +966,6 @@ static void this_cpu_set_vectors(enum arm64_bp_harden_el1_vectors slot)
 {
 	const char *v = arm64_get_bp_hardening_vector(slot);
 
-	if (slot < 0)
-		return;
-
 	__this_cpu_write(this_cpu_vector, v);
 
 	/*
-- 
2.39.2

