Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3332DC0032E
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 16:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjJTQtd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 12:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjJTQtc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 12:49:32 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8F9CA
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 09:49:30 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1ea48ef2cbfso798800fac.2
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 09:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697820566; x=1698425366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yT1FhZ3b/ibL0Fh6OvbZfjd8B9u/pcLk4nz41h94Ws=;
        b=Pru0MRU6xoF597SafPhHsjyD9rLUE65VUGShFljD5/+jzIDkRmi5q1vbVYN8OOfF5T
         lWuuHJ6+4nU4NH4A2rb/e+GA4HoreY7gkN8qZSSnqst71/XSEn34i2vygk8cyePpNfUf
         dB8gpMb+6/ITbw4YJla10Tp+Fiw7jzF0aSBlEs9ShVKjwz8S0eFBzfQrHi1vTkn1ZdaR
         eV33nSwoKJpwSG8irMN6i4/hOyUVfQp08beAKDVP3NiQhZQZ4/WEl0mDd13ObIl8k9Xa
         8E6ReFKSwLclqa47R63AGPzBgMOtB0KL8Dw8I95qAg9+h6aJX7GVcDa26WBGPqZDX8UX
         ycow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697820566; x=1698425366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yT1FhZ3b/ibL0Fh6OvbZfjd8B9u/pcLk4nz41h94Ws=;
        b=lc1r4pISl7ameeZXqJ93eFoEc+/n+me72mVwE0hJTzIT1u0uXu0mGmcTXJkg7thfSO
         aWI13NpwwUoBJH41G/7pKcOyWCLSNXz22BSWxIwGgZZiguU3Sv3OYYPz9lxaoDXQNWNc
         4uYsXNeRPwXWA3yaqA5VJKX67srMMQSwhhHthzmSaGSmLjvE0DnCQsCv8cNDbRzTNL0S
         Kq65Nos8711FRImSCbMPK0fzrY8ZvH4OdGMrOC7am1MJrqGlfPHU7clSen06eRAQ8rFw
         9Il7JaVhOpEt3teBcdjSTCGTKrAMEdLVZ/YFi85/ITgsa5OMjofebD3mIMYNRrzetT0y
         MMPA==
X-Gm-Message-State: AOJu0YyMK5xTd3rkvXCvc07CD0a+YZrlQIPymVqHcTw4fUFuxhCMBs4f
        HevLE6eMCkRxc8akmAuI+Sym1TRvA8SUS4o/aKQ=
X-Google-Smtp-Source: AGHT+IFe2AqbZem12Ct2F0B+zqQDX0QDjsDeIc2tnLVO7E8floLQHExpjbvePO8+PcbOomECrxwTzTDZ6GiaAD/y3q0=
X-Received: by 2002:a05:6870:1382:b0:1e9:e5b2:759b with SMTP id
 2-20020a056870138200b001e9e5b2759bmr2068365oas.40.1697820566310; Fri, 20 Oct
 2023 09:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <a1f3242f-1aae-4b46-9893-36b11ee0a6dd@moroto.mountain>
 <0882a964-770e-418c-9c34-1a64195baafc@moroto.mountain> <20231020093626.bae70759c0f0fe5ee5159eae@linux-foundation.org>
In-Reply-To: <20231020093626.bae70759c0f0fe5ee5159eae@linux-foundation.org>
From:   Vishal Moola <vishal.moola@gmail.com>
Date:   Fri, 20 Oct 2023 09:49:15 -0700
Message-ID: <CAOzc2pzzwq2G9CV1cHh2i1RcXi2KLtd=aHaqK1HQjiJwgnjLKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/khugepaged: Fix a NULL vs IS_ERR() bug in collapse_pte_mapped_thp()
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2023 at 9:36=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 20 Oct 2023 17:14:36 +0300 Dan Carpenter <dan.carpenter@linaro.or=
g> wrote:
>
> > This was changed from find_lock_page() which returns NULL to
> > filemap_lock_folio() which returns error pointers.  Update the
> > error checking to match.
> >
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1508,7 +1508,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm,=
 unsigned long addr,
> >
> >       folio =3D filemap_lock_folio(vma->vm_file->f_mapping,
> >                              linear_page_index(vma, haddr));
> > -     if (!folio)
> > +     if (IS_ERR(folio))
> >               return SCAN_PAGE_NULL;
> >
> >       if (folio_order(folio) !=3D HPAGE_PMD_ORDER) {
>
> Also doesn't appear applicable to current kernels?

Thanks for these. Both these fix patches address issues introduced by my
khugepaged folio conversion patchset:
https://lore.kernel.org/linux-mm/20231018203213.50224-1-vishal.moola@gmail.=
com/T/#t

Andrew already dropped the patchset from current kernels so I can fix a
couple issues, v3 will include all these fixes.
