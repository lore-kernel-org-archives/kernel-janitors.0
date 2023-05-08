Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01073C77B75
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 May 2023 09:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbjEHJAs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 May 2023 05:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbjEHJAg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 May 2023 05:00:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F012F22F61
        for <kernel-janitors@vger.kernel.org>; Mon,  8 May 2023 02:00:09 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-959a3e2dd27so752867766b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 08 May 2023 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536408; x=1686128408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl/BPBGh2VygeBbr5k4Z8jCelLG5j/WEtxJHo5ILE74=;
        b=pVkY2f45E2qpSEv3mENat/NYpgfS/SMgf0Gy4hgv+o+9FwBz9uBTRRBVZWHFQbdi1e
         um4UXUIDHxfHIgi3gF/SnFSXHDeaItGF4bb3RkRo8OGEeuQ7Sh8EOGgo3kw7/uqaE1ZJ
         PyBqOwZJrSLfNJwy9AudjzRfo5rtmGGnCstpmGt5jI36dlpIbc6wOKkujrJ5VxdN3lY9
         HHjEYQ95DP3xDduTr0gCmBswNQ97S6T3nzptV6iZRiGV4iktmHQ6xcPfInO5uDLel6e9
         5vaCubwsHWgkW7I7eIJwQIOASL+TdwP/nGbekHI/xjfl8Y2Gti9WT0bIFG5IR9AOIz7n
         sEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536408; x=1686128408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nl/BPBGh2VygeBbr5k4Z8jCelLG5j/WEtxJHo5ILE74=;
        b=Or2eHoAyepePQAqni3heYMZ7WkKTapdvznIiFtoloOW/w0CNxctb12/r2sqNZM304D
         ALy1/VQrdZsb0Tgt5Kw118gEWOl0JJdktGX++TrGeKp3HiJFNYXVXJ3RVgBnHnBY9aT6
         JgqALYLA09OTNL/GbUg9sINBJrqv6eHkz/37+rgByiQt5l0Q6SMbJYyefshcjcGTTKZA
         U6RwDdcO1ZgS/3pEsB39G9/3rK0aKas6dTI1A7D/5IH/gthoSQtHXGWTalR7bOD33POV
         zobdxCnUvsArp1FWqH08kTTHBqjbv4OGJ9h5UHSpRMs8GOBMOlkh9AncSR65iHKWpzzP
         ceLw==
X-Gm-Message-State: AC+VfDyWOXxxdvy0Oh7Skxg2saCTrSKZrJkK8DO5zNj3uIdvv4cP4xLa
        KD0BWmvnktnLKfi7YWcKm5NjzA==
X-Google-Smtp-Source: ACHHUZ4ACNqi+WNJEe29c9Fkz0U+3NBY2+EEUqiFEvZxU7lXwKkgJ8Wn33fSAijXsV7uvgdK+ipQYg==
X-Received: by 2002:a17:906:fd8e:b0:961:a67:28d with SMTP id xa14-20020a170906fd8e00b009610a67028dmr7641831ejb.22.1683536408385;
        Mon, 08 May 2023 02:00:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id jz4-20020a170906bb0400b0094bb4c75695sm4718953ejb.194.2023.05.08.02.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:00:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        Dan Carpenter <error27@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Greg Kroah-Hartman <gregkh@suse.de>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: (subset) [PATCH] w1: fix loop in w1_fini()
Date:   Mon,  8 May 2023 10:59:41 +0200
Message-Id: <168353638586.78189.7497040406891984516.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <YKUeCfjQqt5NuSta@mwanda>
References: <YKUeCfjQqt5NuSta@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Wed, 19 May 2021 17:17:45 +0300, Dan Carpenter wrote:
> The __w1_remove_master_device() function calls:
> 
> 	list_del(&dev->w1_master_entry);
> 
> So presumably this can cause an endless loop.
> 
> 
> [...]

Applied, thanks!

[1/1] w1: fix loop in w1_fini()
      https://git.kernel.org/krzk/linux-w1/c/83f3fcf96fcc7e5405b37d9424c7ef26bfa203f8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
