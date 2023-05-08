Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54F8C77B75
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 May 2023 09:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbjEHJAn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 May 2023 05:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbjEHJAf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 May 2023 05:00:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBED22F51
        for <kernel-janitors@vger.kernel.org>; Mon,  8 May 2023 02:00:07 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so46759778a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 08 May 2023 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536406; x=1686128406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6EzVNW4fQCTXBtSpkwMKxHbE3BFH6PMWEnMor5twLE=;
        b=SfvyVxQGH4Lbdph5HqGS5KZ3pG8u6JRGK3cWkMYv/OBBUd3qn0UWqTN/CdDNY/OJLf
         hDeUxDuK2ekrSaRLhfpPsLl/XXTSqcnGbTkasqrCno42ZION19NHy3EHDmb0Nu8mu1xF
         vWfygMBgyu8nPAIqlYt7nTYEM0YjaTx7KaCWiXb1hijj4R8E4qq7vzWbE4R6GKDMM3le
         /RKX2uPBFSlqN/RFJpIUAIaZ3ds04rkS+6pn2Tkqvdl6Z7bK/XNdSREAx21HOe2JvjZ+
         CTXNuUYtYThe3HZESUj5dUP8eppz1ivbkf9/NBzxW/ZBGiyA1D9A5i1FhPjXis72OsrQ
         +ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536406; x=1686128406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6EzVNW4fQCTXBtSpkwMKxHbE3BFH6PMWEnMor5twLE=;
        b=Ofb6BvfH80jp21KABVPAoFJt8DogamiTLJ5m4xoDLJ8WCzOxCcLlMAtXNLot9ua0Ck
         AuH2Vn22gj2FQhGVRXSdaP6HcQqol5P9ufJg7BlIPXmwhrCbmxbB+EHA3ijNi6NRFT18
         8434EWKFBaeearpC8LlTOHLFpJg7zrSihcbbHHPXEBRWG2oixXPAjDbNKpEiPESLa+pl
         ejjkmAKo8HwJnBYjSy1drmLybJZZLGEx5vyUEA8udLRjxDa6+IRmDtRSi9gavltISHCK
         uEJK633q+UMRMX3VIKuRYgJBAgat9jHBHpQnyIifuwZOXNNPtUVI6iLcpyFuae4fPYED
         Q+Sw==
X-Gm-Message-State: AC+VfDw8ZAbt1/Grj/TUZQBRt/hl53R5bJcEyju8nhcIk7sicfvoMQnU
        gM51vsxbJs8qCc16dsIX8PxVKg==
X-Google-Smtp-Source: ACHHUZ5Nt5reP/wn2q6YaROGCfe/lUqNih2uJatZFAE1xj1ueZq4nVu0hWnQmynarzRg459hOzotzw==
X-Received: by 2002:a17:907:988:b0:965:ccc1:5468 with SMTP id bf8-20020a170907098800b00965ccc15468mr6468069ejc.36.1683536406421;
        Mon, 08 May 2023 02:00:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id jz4-20020a170906bb0400b0094bb4c75695sm4718953ejb.194.2023.05.08.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:00:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] w1: ds2438: remove redundant initialization of variable crc
Date:   Mon,  8 May 2023 10:59:39 +0200
Message-Id: <168353638586.78189.11302089932389518914.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220522194622.13277-1-colin.i.king@gmail.com>
References: <20220522194622.13277-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Sun, 22 May 2022 20:46:22 +0100, Colin Ian King wrote:
> Variable crc is being initialized with a value that is never read,
> it is being re-assigned later on. The initialization is redundant
> and can be removed.
> 
> Cleans up clang scan build warning:
> warning: Value stored to 'crc' is never read [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/1] w1: ds2438: remove redundant initialization of variable crc
      https://git.kernel.org/krzk/linux-w1/c/ee896c5bf21cbac3bed8f958507a449168e965d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
