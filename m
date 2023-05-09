Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7117C7EE22
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 May 2023 09:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjEIJHY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 May 2023 05:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234247AbjEIJHW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 May 2023 05:07:22 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6C49EE9
        for <kernel-janitors@vger.kernel.org>; Tue,  9 May 2023 02:07:18 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f427118644so17341845e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 09 May 2023 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683623237; x=1686215237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlZTPdckZBfMkSfDWWxdgwam/c6cJ1kKCtZOHi20Sao=;
        b=LB5O02tNG4cpJDDD+nlRElHlkqW+EMQGIds7DI/MTS0bU1Dkx8aV4GMXjkuyuydSsx
         9oELVaBsmpYmj3A/h8W0JHgDaaj9tXA0yF/NU69dRpY623lsw/n1EUgMDOtRCMqTubdz
         I8Rm9K/1448M+PIqkzbqF1KKIUImxWR1siubAyxdJkQG/nASj/UwEiTkHsM9d/xlIwwx
         aYSuxL+837ZEcxhTWlBYig6CLB8M4COQFh4KEsYKRR0y2wFKAkKsq33WJRKX2Amjb4w/
         9hYymrm+sz/fYdsWvBo/kLISjbJLsKGieEjV/82yE1W5a7eKKalc4AigKHOP39BO9XW1
         xreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623237; x=1686215237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZTPdckZBfMkSfDWWxdgwam/c6cJ1kKCtZOHi20Sao=;
        b=dyWfVag6JnDBeoRRSoT5pWlefAj68t4mUUgaZzLfQMAXAdV3tSkBLbMNeqEC/CPUD6
         KOQZFD08p1MloNTQanoNJwLLLjno+Iq7+JOVPYJBWZlITLZNVvQC2MVyKgsgQFATcWmr
         3WXeOwhsrY1FCZaS5NVY2EyGaMEE2Ht99xawu9hmZ2A2jgDYGabyGVldFKpkV3fIQpss
         vCw1LiZY9H0e244hZ/kabCsVYalzLzEDj7XWw4jkp4SyxhuUZw+7M6ZJPeXhVWtiuxFU
         whF96cIdr7OK7lR2cVhXxauDLIxCPu03/hRQpD6bvnAKJnT2SygXkKFmmb19kqk91c9A
         AJLA==
X-Gm-Message-State: AC+VfDwXSXOAgduXr00vGbSJ5QOI5UpKQPLMZZ0BE0rKWdOZVYJ1qUVG
        2ZS4ZzL6tbvJ+3wGtrKoGdh+4w==
X-Google-Smtp-Source: ACHHUZ7iJXBAdt8ysM3IiR8hzOEKnnYDA8+73kBAPfQIC0Q88i49UGx4gyd+FA0kAyPxAnLxdCb6/Q==
X-Received: by 2002:a1c:f202:0:b0:3f2:5be3:cd6a with SMTP id s2-20020a1cf202000000b003f25be3cd6amr9406111wmc.4.1683623237391;
        Tue, 09 May 2023 02:07:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c365500b003f42cc3262asm762152wmq.34.2023.05.09.02.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:07:16 -0700 (PDT)
Date:   Tue, 9 May 2023 12:07:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: firewire-digi00x: prevent potential use after free
Message-ID: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code was supposed to return an error code if init_stream()
failed, but it instead freed dg00x->rx_stream and returned success.
This potentially leads to a use after free.

Fixes: 9a08067ec318 ("ALSA: firewire-digi00x: support AMDTP domain")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/firewire/digi00x/digi00x-stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index a15f55b0dce3..295163bb8abb 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -259,8 +259,10 @@ int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x)
 		return err;
 
 	err = init_stream(dg00x, &dg00x->tx_stream);
-	if (err < 0)
+	if (err < 0) {
 		destroy_stream(dg00x, &dg00x->rx_stream);
+		return err;
+	}
 
 	err = amdtp_domain_init(&dg00x->domain);
 	if (err < 0) {
-- 
2.39.2

