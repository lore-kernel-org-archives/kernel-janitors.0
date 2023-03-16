Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF87C7618B
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Mar 2023 15:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjCPPjA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Mar 2023 11:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjCPPil (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Mar 2023 11:38:41 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF28BE2756
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Mar 2023 08:36:56 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id y12so1211300ilq.4
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Mar 2023 08:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1678980957; x=1681572957;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYar2ybeVJqnai5t6j9VGmRtR2ovUMfBI/dkWezXyWc=;
        b=sVk1JuZmFUhd1tlBehU7iFt3sVXohrn+jnAzxsEhXyW1rV3rTUKOwK9OK1Sh1mDfzd
         Kdv9QjNsZcBRnPUFaxFo+MZqaO/wdpiUCKcD0WaWhPqnh8kAVh2LV8rzxLXlt/nl0ZkI
         zmuuw653yy4/0bfN11ybpCc2F1GxYJUez5q3lorEpqZmPHRWANi9M5ZirtBDnQaQV313
         h3yoZbRmcM/85ydvtqPw4hElb0MKrZBkT5NK+SHPVpIXcq/POirSUbuXiM63Nt1VDxJQ
         tmJwN2tMboNaBqDwf6Ag8Rl5xWxtCDFYcmMQQgdpU8duQc+zZpHZfsl8DtrjYmguNLfo
         5SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678980957; x=1681572957;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYar2ybeVJqnai5t6j9VGmRtR2ovUMfBI/dkWezXyWc=;
        b=OIjyTt8tRxmZlV1SNy6peny+CF7QtZbR+pJT/IuuitSA9D3Ny0UwJTbxPujCyeekTy
         VXclw68ETaj5Z2/fsKcMRzqoQwgdEXmdVar5Gsn0zbmtS9HkBhA8L5T40ixEtAW1mZ3p
         4Il+fDijRR9nL82UM208lcr+GYaagdkSHjyATpfa4u/1LCsDod6DN6wPBwsLYX+ti5Se
         4xDqGOU/oMHhkEVHvDAfCy8edhkpKM+VitPwtZtg/2hjlrSVezeoX/nmfxMJn62f5fPD
         l6uMX4T8Gv6QETBiSqJ2w3wRYQuAzs16IdgiWn0ZNxAerIp/7os+qo+RH0KmZ2EQ0+bd
         Lceg==
X-Gm-Message-State: AO0yUKWDLEo43gua/RzwkS6jPf4npjOjwVCx6nYllD5RFxTllGgdGxG3
        Fe/CBWiKo9vUhQ5tPRYbIoJ3MA==
X-Google-Smtp-Source: AK7set/W9ggxEyvzAzMZ4ShGBmfvBVdryiJ14kkiBwYaN78df/A1Lz33twWv8A/A/Ldki12xG+KOpg==
X-Received: by 2002:a92:d64f:0:b0:323:10c5:899e with SMTP id x15-20020a92d64f000000b0032310c5899emr4228071ilp.1.1678980957025;
        Thu, 16 Mar 2023 08:35:57 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id t8-20020a056638204800b004050d92f6d4sm726970jaj.50.2023.03.16.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 08:35:56 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230316111630.4897-1-lukas.bulwahn@gmail.com>
References: <20230316111630.4897-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] block: remove obsolete config BLOCK_COMPAT
Message-Id: <167898095613.31557.5292857532580529637.b4-ty@kernel.dk>
Date:   Thu, 16 Mar 2023 09:35:56 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Thu, 16 Mar 2023 12:16:30 +0100, Lukas Bulwahn wrote:
> Before commit bdc1ddad3e5f ("compat_ioctl: block: move
> blkdev_compat_ioctl() into ioctl.c"), the config BLOCK_COMPAT was used to
> include compat_ioctl.c into the kernel build. With this commit, the code
> is moved into ioctl.c and included with the config COMPAT. So, since then,
> the config BLOCK_COMPAT has no effect and any further purpose.
> 
> Remove this obsolete config BLOCK_COMPAT.
> 
> [...]

Applied, thanks!

[1/1] block: remove obsolete config BLOCK_COMPAT
      commit: 8f0d196e4dc137470bbd5de98278d941c8002fcb

Best regards,
-- 
Jens Axboe



