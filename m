Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7884C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 00:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5E1F61186
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 00:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbhJFAYc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 5 Oct 2021 20:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237027AbhJFAYb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Oct 2021 20:24:31 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0003EC061749
        for <kernel-janitors@vger.kernel.org>; Tue,  5 Oct 2021 17:22:39 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id s4so1456380ybs.8
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Oct 2021 17:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1UpXLrh9ISxkV7+Pc26q+lSfTSBXoeABrn82Q2xNxwo=;
        b=ehSdwoVRZn9dzdH7fY9EO3PZLPES+2mwNTF8U86S5yn8M/SQRYUUKP42+aVVdYzq+9
         781w5Op0tRfCJGBEj1xtyN39UXZ92TAXGzIyEgnqYIbKyFFisBPTHsbqFkOtGe2msLII
         tmScH509RD6vXXH4THRdGf4Dj1BKVaAbI8K0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1UpXLrh9ISxkV7+Pc26q+lSfTSBXoeABrn82Q2xNxwo=;
        b=L9NkmWdVAg/G6YkFXxsijR0WI2KjfcmHwNCbZcbLxBZsvB2mDsQIz9cqGTQApLSy8O
         MCYTC+wkDMNgtPplGYEPDYCs+PXf3gBUl1pcFpUe+JZZkXIwVHFJqufhDscID5weXYJK
         RlgyO/Av2qQqkZ66/iqbhl6/p3oaXJUGuyJJT5BR2zz8M/17MIxBwu/vz65sJKhYFe6h
         FF2b/OYNz/ziJFFSRdV4LjFkpKjCaojvXh6v4nqx+T4EC8sfTJYuiFqm+N1WXVCRr+XG
         LFBERv0Waynca68rDkJvjiWHjrw5EWDP5Xg/zP/NaWIHbkj4xv8lQ7uS51+kDU0f1ini
         4w+w==
X-Gm-Message-State: AOAM5310KkdZjIjr5SKrT75F1VkpA/rLc/rRkMtJbdwC4dCBfjiyngn5
        XpAI9vM68wfUG8mgr1XsbVH54gakugTnk3+sIiyALQ==
X-Google-Smtp-Source: ABdhPJxWmhGNgWvP+DDobatjNQIbyTyTdSThgXaXp6AUedp/m2bJobNc3ftswm5zZAR60U4GaS7lk9i10qDc258Z/ZI=
X-Received: by 2002:a25:4586:: with SMTP id s128mr24279102yba.361.1633479759262;
 Tue, 05 Oct 2021 17:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211001110106.15056-1-colin.king@canonical.com> <YVxyNgyyxA7EnvJb@google.com>
In-Reply-To: <YVxyNgyyxA7EnvJb@google.com>
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 6 Oct 2021 09:22:28 +0900
Message-ID: <CAD=HUj7t0qRbpzXDs4EZDeLUK=cTTCAxSbh8V0FUCMzpq7rNFg@mail.gmail.com>
Subject: Re: [PATCH][next] KVM: x86: Fix allocation sizeof argument
To:     Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 6, 2021 at 12:41 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Oct 01, 2021, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The allocation for *gfn_track should be for a slot->npages lot of
> > short integers, however the current allocation is using sizeof(*gfn_track)
> > and that is the size of a pointer, which is too large. Fix this by
> > using sizeof(**gfn_track) instead.
> >
> > Addresses-Coverity: ("Wrong sizeof argument")
> > Fixes: 35b330bba6a7 ("KVM: x86: only allocate gfn_track when necessary")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  arch/x86/kvm/mmu/page_track.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> > index bb5d60bd4dbf..5b785a5f7dc9 100644
> > --- a/arch/x86/kvm/mmu/page_track.c
> > +++ b/arch/x86/kvm/mmu/page_track.c
> > @@ -92,7 +92,7 @@ int kvm_page_track_enable_mmu_write_tracking(struct kvm *kvm)
> >               slots = __kvm_memslots(kvm, i);
> >               kvm_for_each_memslot(slot, slots) {
> >                       gfn_track = slot->arch.gfn_track + KVM_PAGE_TRACK_WRITE;
> > -                     *gfn_track = kvcalloc(slot->npages, sizeof(*gfn_track),
> > +                     *gfn_track = kvcalloc(slot->npages, sizeof(**gfn_track),
> >                                             GFP_KERNEL_ACCOUNT);
>
> Eww (not your patch, the original code).  IMO the double indirection is completely
> unnecessary, e.g. I find this far easier to follow
>
> diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> index bb5d60bd4dbf..8cae41b831dd 100644
> --- a/arch/x86/kvm/mmu/page_track.c
> +++ b/arch/x86/kvm/mmu/page_track.c
> @@ -75,7 +75,7 @@ int kvm_page_track_enable_mmu_write_tracking(struct kvm *kvm)
>  {
>         struct kvm_memslots *slots;
>         struct kvm_memory_slot *slot;
> -       unsigned short **gfn_track;
> +       unsigned short *gfn_track;
>         int i;
>
>         if (write_tracking_enabled(kvm))
> @@ -91,13 +91,13 @@ int kvm_page_track_enable_mmu_write_tracking(struct kvm *kvm)
>         for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
>                 slots = __kvm_memslots(kvm, i);
>                 kvm_for_each_memslot(slot, slots) {
> -                       gfn_track = slot->arch.gfn_track + KVM_PAGE_TRACK_WRITE;
> -                       *gfn_track = kvcalloc(slot->npages, sizeof(*gfn_track),
> -                                             GFP_KERNEL_ACCOUNT);
> -                       if (*gfn_track == NULL) {
> +                       gfn_track = kvcalloc(slot->npages, sizeof(*gfn_track),
> +                                            GFP_KERNEL_ACCOUNT);
> +                       if (gfn_track == NULL) {
>                                 mutex_unlock(&kvm->slots_arch_lock);
>                                 return -ENOMEM;
>                         }
> +                       slot->arch.gfn_track[KVM_PAGE_TRACK_WRITE] = gfn_track;
>                 }
>         }
>
>
>
> >                       if (*gfn_track == NULL) {
> >                               mutex_unlock(&kvm->slots_arch_lock);
>
> Hrm, this fails to free the gfn_track allocations for previous memslots.  The
> on-demand rmaps code has the exact same bug (it frees rmaps for previous lpages
> in the _current_ slot, but does not free previous slots).
>
> And having two separate flows (and flags) for rmaps vs. gfn_track is pointless,
> and means we have to maintain two near-identical copies of non-obvious code.

I agree that's better than my patch. I can put together a new patch
once it's decided whether or not my patch should be dropped.

-David
