Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBECCC77B7A
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jun 2023 01:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbjFBBZR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jun 2023 21:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbjFBBZP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jun 2023 21:25:15 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008F91A5
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Jun 2023 18:25:12 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b043b9acf0so14269305ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Jun 2023 18:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685669112; x=1688261112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ogo0ACLRXvN9mYdk6iIQOzAO0yNB55tAwPeqYZ6uA=;
        b=fXFTlIW2NrYvQfix8ljatUPE1vnGf8igwXZjblSazTj1v7yw+YHbbG0YYLv6qEkHOD
         AtjWpnV1P5frULvo6fEkTw6zDEtAcxUTw/04caL8ezjnLMYZWsqBJcD8NwcFqOauomVB
         ybXs7sGlTvtBqTWWPMmxGfsm3jfZCW57xECjygrjCePaMIjyzPe/QQeBBN3LxQoFM2kY
         IG87Cu13HtaHUTgCfIESH2OFILtui7imzIJs3k4Eao/BGUW8Dx7ooaB7DTkUh38IWxKS
         nKJzxKoUWQapYg3X0aqy11J1MW/13BlNPWTElYoRIY86ZM0pvEKOJ2ceKVInUCLOEZ4w
         4k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685669112; x=1688261112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ogo0ACLRXvN9mYdk6iIQOzAO0yNB55tAwPeqYZ6uA=;
        b=F8fzbIessoLWXhJ32sk1m7oyKMxdYAhbL1SVYfOoWbkW8f9teGz/xHtkVm0vR165+L
         QxM41bHetgYrQXy1tmfmuuyhf+Y+YtD01rDwSSttHMDugtB6wnfCHov3wJHrZT20+19s
         GopNGbwZGxAKsNnE3SwpzvTWQeP3T2kxfpZVY3bjBWxT1ROx3krqgcuvXzm3MidAT1At
         UehYFR1yyU4mdwtK8EAaMnFHLoU7hr8KjfsBKE4OI1IWOjWpGcHCXB1j2fL5hxZfqpxI
         kNKJSSo419CUensUr+yXUGp+95fJcE0MfPaVmnrmetWH8RM2nBSq1ifUAWR1cLH0YYBD
         logA==
X-Gm-Message-State: AC+VfDzQEgWZTsowzFoMcgCGdL6EkO0U78NdLuHqxsRUIqANfpoP2Xp3
        SAADiryplWS9PEEuy1iYbFuSsUGfna4=
X-Google-Smtp-Source: ACHHUZ5ON75IRIcN2tIJppeawkiG3e6QBxtwTIPutsCSCn/nqvH5ACl+7kjzQXtu5Tpy04tH/jiZI2DvMao=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c20d:b0:1ac:6a97:5286 with SMTP id
 13-20020a170902c20d00b001ac6a975286mr277309pll.5.1685669112526; Thu, 01 Jun
 2023 18:25:12 -0700 (PDT)
Date:   Thu,  1 Jun 2023 18:23:34 -0700
In-Reply-To: <20230417175322.53249-1-colin.i.king@gmail.com>
Mime-Version: 1.0
References: <20230417175322.53249-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.41.0.rc2.161.g9c6817b8e7-goog
Message-ID: <168512562861.2752648.4897347510489297628.b4-ty@google.com>
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake "miliseconds"
 -> "milliseconds"
From:   Sean Christopherson <seanjc@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 17 Apr 2023 18:53:22 +0100, Colin Ian King wrote:
> There is a spelling mistake in the help for the -p option. Fix it.
> 
> 

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix spelling mistake "miliseconds" -> "milliseconds"
      https://github.com/kvm-x86/linux/commit/56f413f2cd37

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes
