Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8E9C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Jun 2022 04:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238479AbiFCEdQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Jun 2022 00:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbiFCEdP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Jun 2022 00:33:15 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BA536315
        for <kernel-janitors@vger.kernel.org>; Thu,  2 Jun 2022 21:33:13 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t13so8854662wrg.9
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Jun 2022 21:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vD4OLfKIFfGtPa5y0jFVwdykOdv+Mnr0Uixx1FpZoy0=;
        b=yU/SgzSBAt1nzCv+gtsQNekuiPdjc7en8Za9CNTL+CXMx+z1HaYPZjPlIpqzf5rIlg
         cao9VPP6LfSHgTMgw3UZopSsoOgZQnYAPvnLEPez95+7+vUHCdbZLwoaMqIOfvZN/CNO
         W9qHVGZPGJGLpXImyr0XPjtFB0u0MBd5lBU8/3Trugv5obA4YQxLackcJW8QS5vTrSXs
         24EGlZZmaokB5XPj5tviqqAaOjogoR9AJTfM1FQQ0ewV9gkCw9ysoTgVq9ZOCkLH8DAa
         iGu6a1c0Rbe7onMz5grzmI1C9A5OZaPs5vdn1H84YoLg/yRQNJVUilWrbIj/mDa0vpZB
         0k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vD4OLfKIFfGtPa5y0jFVwdykOdv+Mnr0Uixx1FpZoy0=;
        b=hXa9G1RU6nhQspT/iCC3KevJRpw6ZBbXT7zEm5pVO2+0+LhSYe3KzXrv72bzb7EjGy
         P8dIKgSfCeMzG+5ZI7P6qDtW7tALBj4d9nrmh/t7atmiqo800DoXV705/5cHCvtcLrTB
         7Q6e1MkckAmTU2I4j4m4mFSS5BFZLsEATqz0p7kFmCyhjjKUZtWBFZKlAcFYSdvB/IGN
         my3QnejGWhBY1aszr7XEC0cvXeiAfp0f81y1b92Vw1FR7UY9rmJ7wRpPoDFddGfJgfnr
         5VOn4vJ7VITLr+6o5PbSu25LFiXGjMnnzBVHEowyE0HzIftfMpw/2wtfxq02fuOaRBu5
         bRrA==
X-Gm-Message-State: AOAM5327v8B2krwYHTPQpmdXr2ba1wEt4pF79hRguY96lYf41yplVYP3
        uQbMcC+GOLndVLeeqSvnD/gfbI6m8XD0A84m8srrwA==
X-Google-Smtp-Source: ABdhPJwt7W+KX4MtCMg6NzWsDLRyzubaw5RShkTBjOfLyk3i7t5J1gsnfZjgOrEkIxeXfFUcKMzwahlSWGkcgBksuGc=
X-Received: by 2002:a05:6000:1f18:b0:20f:e61b:520e with SMTP id
 bv24-20020a0560001f1800b0020fe61b520emr6348325wrb.214.1654230792135; Thu, 02
 Jun 2022 21:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220430191122.8667-6-Julia.Lawall@inria.fr> <mhng-523319d8-fda9-4737-9c43-d54bcfd7a7f2@palmer-ri-x1c9>
In-Reply-To: <mhng-523319d8-fda9-4737-9c43-d54bcfd7a7f2@palmer-ri-x1c9>
From:   Anup Patel <anup@brainfault.org>
Date:   Fri, 3 Jun 2022 10:03:00 +0530
Message-ID: <CAAhSdy3+imWabbArUAg0Bki3qvD1PGVB-L-xY5CvNa_YBu80aA@mail.gmail.com>
Subject: Re: (RISC-V KVM) Re: [PATCH] RISC-V: fix typos in comments
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Julia Lawall <Julia.Lawall@inria.fr>,
        kernel-janitors@vger.kernel.org,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        KVM General <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 2, 2022 at 9:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sat, 30 Apr 2022 12:11:20 PDT (-0700), Julia.Lawall@inria.fr wrote:
> > Various spelling mistakes in comments.
> > Detected with the help of Coccinelle.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >  arch/riscv/kvm/vmid.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> > index 2fa4f7b1813d..4a2178c60b5d 100644
> > --- a/arch/riscv/kvm/vmid.c
> > +++ b/arch/riscv/kvm/vmid.c
> > @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
> >                * We ran out of VMIDs so we increment vmid_version and
> >                * start assigning VMIDs from 1.
> >                *
> > -              * This also means existing VMIDs assignement to all Guest
> > +              * This also means existing VMIDs assignment to all Guest
> >                * instances is invalid and we have force VMID re-assignement
> >                * for all Guest instances. The Guest instances that were not
> >                * running will automatically pick-up new VMIDs because will
>
> Anup: I'm guessing you didn't see this because it didn't have KVM in the
> subject?
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> if that helps any, I don't see in anywhere but not sure if I'm just
> missing it.

Thanks Palmer, I had already planned to pick this as a RC fix for 5.19
but I forgot to reply here.

Regards,
Anup
