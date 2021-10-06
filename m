Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0CBC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 00:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE43E611C6
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 00:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236985AbhJFAnH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 5 Oct 2021 20:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236966AbhJFAnG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Oct 2021 20:43:06 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533A0C061749
        for <kernel-janitors@vger.kernel.org>; Tue,  5 Oct 2021 17:41:15 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id a73so971306pge.0
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Oct 2021 17:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/Twg3K4gp+yGHpRxWybK7U//bFNhuubvyWg25c1dXUA=;
        b=LtSHvLTg5hUhnlUSroodmREz1Y3HjVdqPk4Gb70XZsg9cRgV0BiVFpKJVxPQWGZicK
         +GRQioBNmN5oLYSFPySIP2G5riMlYbyv6g5lG5iL5XpX04iVEItn2zOhwNICiUUW0GgV
         U1wsWBWW4JNMSkMKPM1sbK+AHaM6KDDrUq98BuGYwgbF7OYP2TJZvzvLvs4UCIu9EmoX
         aK8hKBze0scL52eJ63yBe+YktNLC3dRNtPjq9RenSrKrP/GlthiZdNtKw8xJSXZfho1F
         cei8+285B5Bqh7nIaJu9CfFsWmb/N6LWyRQB9sduQwweLTdPg84LGEI4igBkOtSZy06j
         qgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/Twg3K4gp+yGHpRxWybK7U//bFNhuubvyWg25c1dXUA=;
        b=D8HbdHePZ1nWnyxCKsNojwLsBs43Tt7EyZ0ftqtUfoN6IOjDEYJsM7PvAAcyuZZtMW
         3dFjfPIYjPSmm0iLlJHhxvzp0kbVSNYlgVp08GscOpgbwTD46AX9Lb8txPMYbsFK2i96
         +VbIScEjwRiugADZBPpCB5K4njXOlQlnDn7ztuFaSk6S1vFYvrYOGHDAYPgMtlnuaXPb
         XzmvtpLF3SSD6BLvs+TkhqATvlThwZ4zVxhJXK6HoPn8dY6cuRp5VKuVmSqZZqny7mT3
         Cmc12e82sInsLcvec+bVlISPnXHCUSS0ijIOK2eUvTFIr0h8D9os6vPXLf34270FPT8s
         2pfw==
X-Gm-Message-State: AOAM5328wVLe+PTjm6WdlrbqYgg/xFAzUWtdgHDg3TsWG7TA2tHbGA2E
        iDz/prBJyjSE7g8tnvT8ZRyFdg==
X-Google-Smtp-Source: ABdhPJw+wQW5MK+6oVivNcDSO/mJgzoT4+thkQFYhWLzXbm1PJO9hCHq9u3cAAseI4Oi5526qLOwkg==
X-Received: by 2002:a65:62d1:: with SMTP id m17mr18013771pgv.370.1633480874547;
        Tue, 05 Oct 2021 17:41:14 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id o16sm18276979pgv.29.2021.10.05.17.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:41:13 -0700 (PDT)
Date:   Wed, 6 Oct 2021 00:41:10 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Colin King <colin.king@canonical.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        kvm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] KVM: x86: Fix allocation sizeof argument
Message-ID: <YVzwpjSmGuVczgEG@google.com>
References: <20211001110106.15056-1-colin.king@canonical.com>
 <YVxyNgyyxA7EnvJb@google.com>
 <CAD=HUj7t0qRbpzXDs4EZDeLUK=cTTCAxSbh8V0FUCMzpq7rNFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj7t0qRbpzXDs4EZDeLUK=cTTCAxSbh8V0FUCMzpq7rNFg@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 06, 2021, David Stevens wrote:
> On Wed, Oct 6, 2021 at 12:41 AM Sean Christopherson <seanjc@google.com> wrote:
> > Hrm, this fails to free the gfn_track allocations for previous memslots.  The
> > on-demand rmaps code has the exact same bug (it frees rmaps for previous lpages
> > in the _current_ slot, but does not free previous slots).
> >
> > And having two separate flows (and flags) for rmaps vs. gfn_track is pointless,
> > and means we have to maintain two near-identical copies of non-obvious code.
> 
> I agree that's better than my patch. I can put together a new patch
> once it's decided whether or not my patch should be dropped.

All yours, unless Paolo wants to fight you for it :-)  I'm totally ok doing
cleanup/fixes on top.
