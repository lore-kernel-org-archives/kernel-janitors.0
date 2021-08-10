Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9B4C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 19:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE4C66056B
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 19:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhHJTR5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Aug 2021 15:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbhHJTR5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Aug 2021 15:17:57 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BFAC0613C1;
        Tue, 10 Aug 2021 12:17:34 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m12so27699697wru.12;
        Tue, 10 Aug 2021 12:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=W9H2cZXxDiW6HgzrDrn9Lm7UX5p8AAFrlCEFoY1RN+s=;
        b=J7KMJtXp50Twwb7G7HzMTu1AxCkNzwCLxVIxAeygHBvEupGapnuqDmtLBppxSIORz+
         d7Oy00bpsCzSNHIfLUXaOoFfWwlVEuH/gF6iDsIfvcJRHSA7aDK1PInaKZSP3jKIX867
         1Mow1mdAHJKitolNjHZ2FW6UFdO4Scjxu4izNSxHLwHztyBUIREdM1gqpMFEc0I1w10R
         7h0uFeQPXF3/GmLPj5GI8pTGWeSqvuTy0Hmd2BGfBM0caP0Akg4GeCKtUUAqIEHCSaXx
         nY+0Ks/gjQA9VuX4NofAMMnaLzU/ZTtU6P5m+F8Hl93ZjgcG9L+bu1rjy5rE24eKJTWQ
         fwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=W9H2cZXxDiW6HgzrDrn9Lm7UX5p8AAFrlCEFoY1RN+s=;
        b=hHYtxuxiASV8Owf0LNujkbJ85dxtnMu+1LnzOXZJbLQ0kO6gK+4eUrDB10w6nf+K+7
         9aJD4/BzFSd7YlUq3a4mfmZBJoZUWR9ilrSDD0suSujmnEWh1yaOmp8Ix7h8OygxTMoF
         s4KtyFqpydLVQg+luFkxR8gpEEW+qUWOx58ok1oAU2TUzJk1fd0fThbD0NtJ1/AiAzoO
         4NzedmGrn1TS/2sQ1Cz+mvbOiZBFD99Vu+7f/6R00oiEyEjAroomb2Wbg1hGeQm+pRoN
         nUDQRiccEtPqylLJk1wzaeVRpSJuecjZzgu/evT2W1PV1LXjurOpPd+pWeEyvlr8Qh6v
         7dwQ==
X-Gm-Message-State: AOAM533PycXbjPaLyE2Ylmt09bOeFOMz+JtHJXaSfDYkrIFhHxl5+yRc
        nLIwZ2w9Iaoo4RmoMDV84tM=
X-Google-Smtp-Source: ABdhPJzbFAc8q2itt2CGkOsjisesuOhaW8EnnW2mh/2CPVtTWKWZOpgYHYvdKCRnCuB48lRplw6tFA==
X-Received: by 2002:a5d:688e:: with SMTP id h14mr32474652wru.117.1628623053045;
        Tue, 10 Aug 2021 12:17:33 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dbc:4b00:1831:60bd:976c:2b5a])
        by smtp.gmail.com with ESMTPSA id w4sm24600695wrm.24.2021.08.10.12.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 12:17:32 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust ARM/NOMADIK/Ux500 ARCHITECTURES to file renaming
Date:   Tue, 10 Aug 2021 21:17:24 +0200
Message-Id: <20210810191724.24452-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Commit 8f00b3c41ae7 ("mfd: db8500-prcmu: Rename register header") renames
dbx500-prcmu-regs.h to db8500-prcmu-regs.h in ./drivers/mfd/, but misses
to adjust the ARM/NOMADIK/Ux500 ARCHITECTURES section in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/mfd/dbx500*

Remove the obsolete file entry after this file renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210810

Linus, Lee, please pick this patch on your -next tree on top of the patch
mentioned above.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index efac6221afe1..706e9a556747 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2258,7 +2258,6 @@ F:	drivers/iio/adc/ab8500-gpadc.c
 F:	drivers/mfd/ab8500*
 F:	drivers/mfd/abx500*
 F:	drivers/mfd/db8500*
-F:	drivers/mfd/dbx500*
 F:	drivers/pinctrl/nomadik/
 F:	drivers/rtc/rtc-ab8500.c
 F:	drivers/rtc/rtc-pl031.c
-- 
2.17.1

