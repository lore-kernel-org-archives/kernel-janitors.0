Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E5DC46467
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Jan 2023 23:38:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjASXi2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Jan 2023 18:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjASXiZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Jan 2023 18:38:25 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84059F066
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Jan 2023 15:38:18 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id n14-20020a170902d2ce00b00194a2301b10so2129942plc.8
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Jan 2023 15:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ml9HXgsWlhngPnr5LLGuwB7yZz4iONvMOGsoPpn+lFs=;
        b=sRQGguvtprbdmw+e8cPYJH8/ogys3HECUlSwrzw5y4MYeybvAva39pmFs73NJfk5l6
         RJMr8/EIO3bmkz3y5PMzE7c3GNdyx/YcNjIzMbVCj7zMHMqdfMhu7G2Pa84/w18B+qgB
         gIo0trzYoAlaecwGOnEg1wmQF1crmm8IDPMqejURYCUkX2B1XqDshijYAszDNo2PDk1+
         scCsc8/34YIwuUaR96rqE95pR8oNPCG71cJcq50LnqkVAn4QkW6nGObq+pMWmgZX4r3E
         IRXxgUHVp2wRpO+MkO2p4qicjlSMjF3RnFsJtRAQm2Gk6FHtEawj4/A5diFt1Ez8zJLy
         9CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ml9HXgsWlhngPnr5LLGuwB7yZz4iONvMOGsoPpn+lFs=;
        b=bKuiEx0GvpdSb6k/jKYlBmjqpZnATPXe1PGNgu3H5RL3hQ8U1eF6/MgJG7LyUb0eV5
         1oPu/59qyXduAbpZLB30VTTw6fFkW0kb0/81XlsSAi744M2I8OS07Fn+mPfQ15ZxfB3f
         H2JDFK4M+x+j8FetP20esXaO84e2L//wvUGztHBDW4c9Nw8Fwkr1fGsgT9EUEzj1Tyqs
         uF5R8MbJODsIX7/sOWrJI3Ql4Z/Q22sf4yW76mvGyoqv/d5d1e9I5K/EN1aJ2sIzvjhC
         SME8phtFQ8tYMangY9hHanDKYncsolHwqL3yp6CyKkqBkpkxZFBh/6t6ld/gkyMMiXFd
         NOSw==
X-Gm-Message-State: AFqh2kr6dURTcmUq4JNVsWzweVZjBAb3l9GzG7L7pBR8DtDFKOBl5vMa
        6FXpiBmThrQKDOJdXiJrCmm3jKVtkts=
X-Google-Smtp-Source: AMrXdXuNY7nE6cPrEZuTnpdSnSbNpQnHAujMZmdw0F814eGvjY4r6VbiQta65zMxBxyRuPG3p6HE3cIFUd0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:d995:b0:225:eaa2:3f5d with SMTP id
 d21-20020a17090ad99500b00225eaa23f5dmr14069pjv.2.1674171497748; Thu, 19 Jan
 2023 15:38:17 -0800 (PST)
Date:   Thu, 19 Jan 2023 23:37:39 +0000
In-Reply-To: <670882aa04dbdd171b46d3b20ffab87158454616.1673689135.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
References: <670882aa04dbdd171b46d3b20ffab87158454616.1673689135.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <167416883797.2559854.8461573625576324226.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: x86/mmu: Use kstrtobool() instead of strtobool()
From:   Sean Christopherson <seanjc@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 14 Jan 2023 10:39:11 +0100, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> [...]

Applied to kvm-x86 mmu, thanks!

[1/1] KVM: x86/mmu: Use kstrtobool() instead of strtobool()
      https://github.com/kvm-x86/linux/commit/48350639019f

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes
