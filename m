Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68345C7EE22
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 May 2023 09:00:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233526AbjEHJAp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 May 2023 05:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbjEHJAg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 May 2023 05:00:36 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E6920755
        for <kernel-janitors@vger.kernel.org>; Mon,  8 May 2023 02:00:08 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so6454091a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 08 May 2023 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536407; x=1686128407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iALQJ4TleVOi463PGcNADtR4jMjReITCcEFEBaYKd9Q=;
        b=aXya+bZWAIdwD4ugTZRuzB/+UE4ZsSjgGnkCe2DTKELLASkkeet162rFVkbNC1D8dt
         0ZIh/Tuoio2/s67jexOScdqUpw7mMiH0VJSWwWq9oR3dbWrn7pibPAQZjYqZQ0PqTp6D
         yfGkK+mRvCgsVw0cgeULJaXWqas8BI8OkRnjy/Fm3XMfFHW2w1lx87RgQj7UqxTeK7wJ
         uv6cZwUKOzuj1/xxHtbTk0DDXyhmcMZ4jrhbwJ7FDHj2k3J2Sli3g2khkZvy9WsCcubw
         hDtVWhFo3FDWWEKYg8bF4jqPIQSZuRdU31zLYf+/P9R/XYfIAmRkxv0w1iI+miuULAks
         COKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536407; x=1686128407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iALQJ4TleVOi463PGcNADtR4jMjReITCcEFEBaYKd9Q=;
        b=lTINJvgga2oOPxVR9VdH3sMYWFJ3UGIFE0ECWhONPDIoD9JWwbZ5ii2HQ4tquxAkwy
         HNSr66NlaNH3BY1ksZ1Z3K1LU/1eZbD8ilU6v/JnAP/phKri8i3pHmQyr3whvw9/yotP
         AAdxd6v2r6Q7FNseTjLfNXkF7SO6F9ytxUr4h5SqAr8Tdw1dzMCUvWoWz8FmD5w42vXQ
         rVm0dhJvLfHGlpDQTBYqJ4yET8XbYEYpPq0Hoh7zHPKAWt5hPRNPbW3aItiIy8mu7wgh
         FgmCUQoibCBDumaYpZNp2v2q530OJJi3Oa4I/lWs02CHdFGdNOux8QSXHVHwpwBjPH/S
         xJeA==
X-Gm-Message-State: AC+VfDzJX8ALH6onvdqCK7xeQNChhfTmlJDyOKPUK1j4Ge49cXyFmKKt
        VncfokIeDBZRoYjXrmfa31Tqtg==
X-Google-Smtp-Source: ACHHUZ7PFt6i7K3b6K7iJKWEHoA2/r/pfQhVheH2GEzhXVWbEoMhkoE1E86CjEW+wM1QLVlaOa5HYg==
X-Received: by 2002:a17:907:808:b0:960:ddba:e5c6 with SMTP id wv8-20020a170907080800b00960ddbae5c6mr7165162ejb.22.1683536407353;
        Mon, 08 May 2023 02:00:07 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id jz4-20020a170906bb0400b0094bb4c75695sm4718953ejb.194.2023.05.08.02.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:00:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] w1: remove redundant initialization to variable result
Date:   Mon,  8 May 2023 10:59:40 +0200
Message-Id: <168353638585.78189.845440168403301888.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20210721103451.43026-1-colin.king@canonical.com>
References: <20210721103451.43026-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Wed, 21 Jul 2021 11:34:51 +0100, Colin King wrote:
> The variable result is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed.
> 
> 

Applied, thanks!

[1/1] w1: remove redundant initialization to variable result
      https://git.kernel.org/krzk/linux-w1/c/9033ff4c0fc65f3f168ee029b7e302a999c152ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
