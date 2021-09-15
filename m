Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5483C4332F
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Sep 2021 07:37:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C620360F5B
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Sep 2021 07:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236699AbhIOHjD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Sep 2021 03:39:03 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50770
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236614AbhIOHiz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Sep 2021 03:38:55 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3835E40264
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Sep 2021 07:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631691456;
        bh=VNhuMSVYlZ4RBI+HKhhCa21E7CHalYPb5KZF4Ga++fk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=d4PhT/B/Withgs/PtbcwedTYKqwZ+96+rmurQFdSzd2whvlt5fXix0ddUHA9eC3HV
         3+zM55Fx5wsGSZ4plwhQI2GbpSwx/G4r3d+xMqnAQufhaHUN230mxjbKRECSTsbRUG
         0GBDyH/p2n+4Z/vtCmEefKejx3W4PGvOjHSxy8G4VlEd6pGfwMjXlaawZdD2UaYBSW
         80hGv5VyCxF62VuUbAaheVfDM8MJzRG7MglRlqslA5wZvYHarloOKhjRX5fxJ4GyfP
         2z+Sx+HMss0SOPsWjUJhaTqI3GSX1RvCb7iyZbEnoNi/emY+XxtLPuU8A2bxCUSLaF
         OoeWSqcYCgtUw==
Received: by mail-ej1-f70.google.com with SMTP id z15-20020a170906074f00b005ef9f1d0e97so1019233ejb.19
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Sep 2021 00:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNhuMSVYlZ4RBI+HKhhCa21E7CHalYPb5KZF4Ga++fk=;
        b=ijSNAReHpju1dDOcyDtE/ERtshum9HJTcy6sLLm8iPS+a3Nl5Gowd5vsJ0Cp+IWmy7
         Jn7tv8fcDlFcn5Mo/wxhm5lKIMi8/NdrMgAg6edsIA65veNAco5oMwi5hcaWK3XgEoy3
         JIil1szMeuRnF+3Xz4BXbkvSSC7H5JuoCXpGA42jvvOoTRkgxDN3JqPfgqTOjZDXA+Pv
         YxCnrbMFMJIcnbhFQ+gpeB8PpVToVPCC5oU3jrEqoCDBNMAJYWJ8mK0p+7oPzk4+lGtp
         7fV7iGq6yQzZ8y9PuRpodiryrKZmYFw5qeIPULgws4EI/y1aj43oB3p0sp/gQhdr0FED
         p3TA==
X-Gm-Message-State: AOAM5307OPyHLwGapwRfYptQWz1ezEXiKqNDopdHkMpbCQ1YYS2jru2b
        pgTmLq9m1pcffmnu+PgIzQyDF5j6bLC+7pC7dKgXfGt4fjt7tVlNhwRPqYHzDmnjdTJ2sszKmhh
        Sk5PdOU+rPzcXFXf2EPFukaiHVEusB0aSNzj12vrUHloobw==
X-Received: by 2002:a05:6402:104a:: with SMTP id e10mr24334299edu.139.1631691455982;
        Wed, 15 Sep 2021 00:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSzwU3Zeg/51JAZYchT+uOWuELdhcjWBmcCJ7x2Vabn8Iq1N66iQvk09tApR5D6ty9v5slQA==
X-Received: by 2002:a05:6402:104a:: with SMTP id e10mr24334288edu.139.1631691455872;
        Wed, 15 Sep 2021 00:37:35 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d22sm5871832ejk.5.2021.09.15.00.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 00:37:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Colin King <colin.king@canonical.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: make the array list static const, makes object smaller
Date:   Wed, 15 Sep 2021 09:37:26 +0200
Message-Id: <163169144169.13297.295852962982920269.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819133155.10441-1-colin.king@canonical.com>
References: <20210819133155.10441-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 19 Aug 2021 14:31:55 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array list on the stack but instead it
> static const. Makes the object code smaller by 110 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>   37713   21992      64   59769    e979 .../tegra/tegra210-emc-cc-r21021.o
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: make the array list static const, makes object smaller
      commit: d71b90e3633ff4af8e915ba7adc3c26f7f5edcfe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
