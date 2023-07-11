Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3768EEB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 08:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGKIUs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 04:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGKIUr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 04:20:47 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8414E9C
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:20:46 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbfcc6daa9so44185875e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689063645; x=1691655645;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8lWjawHlVclNDSWEGq29N0b967SueKiHPqM+v2TDzE=;
        b=R1G4aF4EVATbvhCL1DAa5FefRu2NkRIzdMHhs4yTRuatv9exyCmRluZgmuU719dwdG
         ICuOulPDorELuHUtnF1o8xPcKJ8yNsL/D1Kjas181S3VoFyn3Mstdf8dEdanuZIxdVHl
         Dp1hmNOVIskQOayCud5uFBNXJHvfFyj9BLija0AjxjINIKa8KP9MIEBNEhqe1oRraaL3
         RsiOWZZoX53yk2Deu1eWgFpFTjPCJbtSO5KbmGsvN5eouOzGX2XO9nfSDwOCgC2Fn5Qs
         kVaT112Emddn070lXfqdINzaipMC28ujLMkw7ebF8euN/f0Qbt76PJ1I59KkMZ3Zsa4V
         LZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063645; x=1691655645;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8lWjawHlVclNDSWEGq29N0b967SueKiHPqM+v2TDzE=;
        b=huBE0Ic26YVwvjYB1HnufG+lnOlIQGaQCVVtIUGvAYVrWDzCQl5zFkZUWkfR1Auq5I
         Gw84W2F2fq8/CIHFrCq/YcRIZVatVvU/NRP36e+ooTtjWEbiTnXyGlhVYOphMtNjG0H0
         RRA3cAvvBJ0+XdowJ2qhux0YFZAPBrjiSP6v67/saho4bdRtYmctHil3RHbqggCIVGdz
         LxDkUvxXA4NfS+l47q6IXqvcpJJL3lZ+3YsBsI8bV83sRBETyK7ddTgXdvo9tQCYdzNO
         yoC9SbOw0JglkzDfp160LXSMqlMdV5cpfY5Csa444kNwGKyI+uXMFbHbLqyW6WDWTkiz
         e/2g==
X-Gm-Message-State: ABy/qLamSMRZpMV9VQ6f2pWmMMLe4jYx6JrG57hdUmdHZ73TOQigblSJ
        Sphp1DoKFkpiM9nkskNOI6I35w==
X-Google-Smtp-Source: APBJJlFxViETfwk0NPeCw6JJuzwbQOxNl4JhFOTf4b7WQw+EqA00xL4rHa31voGAKtfFRwsyqvOTVw==
X-Received: by 2002:a05:600c:2209:b0:3fc:b86:d3fa with SMTP id z9-20020a05600c220900b003fc0b86d3famr7198858wml.1.1689063645070;
        Tue, 11 Jul 2023 01:20:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n12-20020adff08c000000b0030ada01ca78sm1585438wro.10.2023.07.11.01.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:20:42 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:20:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 0/5 v4] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fixed in v4: Send the correct [PATCH 1/5] patch.

Fixed in v3: Redo messed up threading

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
