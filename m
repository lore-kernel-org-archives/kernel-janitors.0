Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CFDCDB46E
	for <kernel-janitors@archiver.kernel.org>; Thu, 12 Oct 2023 16:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379466AbjJLQKR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 12 Oct 2023 12:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379454AbjJLQKP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Oct 2023 12:10:15 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C04C6
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 09:10:13 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c88b46710bso9035985ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Oct 2023 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697127013; x=1697731813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uywQQTLnXLWpXOPun4QKJKuWvTo48kWYaCdd1C3bRtY=;
        b=eXB57y8nF6Lv2jjt8DJUA5l8vtoO9MlqrHWgvl9EC/lLrBSxANJOHH8Zofq9nI0j5B
         a8yE0FsRdtOSnrjHXJN28K587uCxeTmtYXzxo2XlJs0YpHI3b65TaAvAsLiHgZsfuuZW
         +5ShGjLpTL7+ux/gIPtpAndl/Up79e8MWNCl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127013; x=1697731813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uywQQTLnXLWpXOPun4QKJKuWvTo48kWYaCdd1C3bRtY=;
        b=qyWyT0Qy/yxHXkmGmXdiG4ipsLnL14lHEhCgQZ84DiKjBy3+P21FlUhShfF4dYvh9p
         StbIonKk51WpoIIRyls59PEoPkTzHLqQ8ZxiAuSBRHzPgqaWpWquyO2EyABFvCp/057W
         8A8dsh95pKzipEKxFRSMi9DEcAnHs6sWiWFjQSqTylcrQe5ENXpri8F5kxpVy4e+ff8F
         WgKp3ivJ1URWXSNjM4Zd5GgiHPMkoULCY1CgRmBDP0gOvMXb32Ra8BNfBcoZ2UfNcszv
         gLXqtfK6sZ7i5oqGZGeuZrRSJR4EP/Rl7yKMM60nD2wFiIcUkQZFFPs0XypWygh34xVq
         oarQ==
X-Gm-Message-State: AOJu0YzmXSL9G8IDQNYp9UNpcGdrciMLpIWfvWJq4wlPIKwYwoNpm9LU
        /O99VRuOpfQNXxa9UUy+j4GH5Q==
X-Google-Smtp-Source: AGHT+IE70nC8DSZzov+QUlaT8psAeyZAo6cLbH9AArJEY5B9saYS5UPiiNtcut6ioYKyhJakE+UGSQ==
X-Received: by 2002:a17:903:120e:b0:1bb:c64f:9a5e with SMTP id l14-20020a170903120e00b001bbc64f9a5emr26657038plh.5.1697127012911;
        Thu, 12 Oct 2023 09:10:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f7-20020a17090274c700b001c72f51b84asm2177860plt.52.2023.10.12.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:10:12 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     iommu@lists.linux.dev, Joerg Roedel <jroedel@suse.de>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hardening: x86: drop reference to removed config AMD_IOMMU_V2
Date:   Thu, 12 Oct 2023 09:10:07 -0700
Message-Id: <169712700540.4491.11130004795723202092.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012045040.22088-1-lukas.bulwahn@gmail.com>
References: <20231012045040.22088-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 12 Oct 2023 06:50:40 +0200, Lukas Bulwahn wrote:
> Commit 5a0b11a180a9 ("iommu/amd: Remove iommu_v2 module") removes the
> config AMD_IOMMU_V2.
> 
> Remove the reference to this config in the x86 architecture-specific
> hardening config fragment as well.
> 
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] hardening: x86: drop reference to removed config AMD_IOMMU_V2
      https://git.kernel.org/kees/c/faed498d0db7

Take care,

-- 
Kees Cook

