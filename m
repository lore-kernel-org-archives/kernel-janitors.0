Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1696ECAAD3
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Sep 2022 07:53:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiISHxa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Sep 2022 03:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiISHx2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Sep 2022 03:53:28 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5D21C133;
        Mon, 19 Sep 2022 00:53:26 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso4118361wma.1;
        Mon, 19 Sep 2022 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hbZ3Uikw6GbZ2PhGrGMY6TpC+x3HmuREGF1XvXmT7e0=;
        b=Pkp+fLiKDb29f/wOLS2m/aVunUyKVpRwQxHmZvPo+WjzF19IbqLh0cF5IeLOFk1DKo
         5uI8IN2X7sI46aRbw8b3J+PKHimqeNMkCeQCYmmR+fFGbESCDYpjmunT0nxaPHLdSkZi
         37DNwTOZpB11ZnmeK9qdpRLG/1e618fznvoOIjZ1aO75RXS77wE/GCluGHhe6tGYvGuY
         dcruBvHN/lOX66gsDk+1yE/e3j80/SNNJz+nKYvjFraFOlJY8Hleas3elDK1DumXjKsH
         WfEcb02+vorFL5z4uzqIpAB9Qoo1ZHUVfyiHiVIu6DUy8NP7mgWSdgyoXH7Y43TYrmkI
         CZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hbZ3Uikw6GbZ2PhGrGMY6TpC+x3HmuREGF1XvXmT7e0=;
        b=ptda/IhWUfrQaB4NCS27EtWMyQR1oMNmrfmJCp/DowsE7nZU1QCkrGRqKUS0UofII2
         jUtEdh2crqUnX0580wwuBaGIWriRQfVlasZYlaebKn0HM0ni9G6I/+pgqXzYoQh4CW7d
         k965WeS6Vu9eUKZgi4/4f2ugutlJx5NDIFNiXVUmXkz/3LgAWzLMF4xsDAO4SJhb1RwD
         baWMl9gqkqeCLtbZAugb0PcXrNmPNGsUzIEyvoa71tj46dxQlfD6YL1WbtlaLBAwHgmR
         VxK/GvVc8heFiHWe/GUV+0hcJ9NBlMgtqNAFoP8YymDWdshY3YVrWwrQrbmW4T9RhN1y
         1nHg==
X-Gm-Message-State: ACgBeo34EY3Odf9xkRbyb7LilImgF6cwBtXJNo1eY+KLv4wimBqwvMHX
        e3EiFPSq8kMo3Np3CrmTknEMWP3x1Lk=
X-Google-Smtp-Source: AA6agR5MA8Ch9rMWCxu5I2u8j3+yTpwy5r5r2ynaWSJbJcw9aklyJws+7L5VSHMrA78WlhWvYZVk5A==
X-Received: by 2002:a05:600c:a05:b0:3a6:71e6:47b8 with SMTP id z5-20020a05600c0a0500b003a671e647b8mr18175245wmp.29.1663574004662;
        Mon, 19 Sep 2022 00:53:24 -0700 (PDT)
Received: from felia.fritz.box (200116b826812b0018444688cfe72784.dip.versatel-1u1.de. [2001:16b8:2681:2b00:1844:4688:cfe7:2784])
        by smtp.gmail.com with ESMTPSA id m34-20020a05600c3b2200b003b341a2cfadsm13830630wms.17.2022.09.19.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 00:53:24 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH SECOND RESEND] MAINTAINERS: drop entry to removed file in ARM/RISCPC ARCHITECTURE
Date:   Mon, 19 Sep 2022 09:52:55 +0200
Message-Id: <20220919075255.386-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Commit c1fe8d054c0a ("ARM: riscpc: use GENERIC_IRQ_MULTI_HANDLER") removes
arch/arm/include/asm/hardware/entry-macro-iomd.S, but missed to adjust
MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Drop the file entry to the removed file in ARM/RISCPC ARCHITECTURE.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
PATCH v1: https://lore.kernel.org/linux-arm-kernel/20220311130957.17884-1-lukas.bulwahn@gmail.com/
PATCH RESEND: https://lore.kernel.org/lkml/20220713041727.8087-1-lukas.bulwahn@gmail.com/

Andrew, please pick this minor clean-up patch for MAINTAINERS.
The arm maintainers have not picked this up in the last six months.

Thanks.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c26a5c573a5d..46f3c706f487 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2695,7 +2695,6 @@ M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.armlinux.org.uk/
-F:	arch/arm/include/asm/hardware/entry-macro-iomd.S
 F:	arch/arm/include/asm/hardware/ioc.h
 F:	arch/arm/include/asm/hardware/iomd.h
 F:	arch/arm/include/asm/hardware/memc.h
-- 
2.17.1

