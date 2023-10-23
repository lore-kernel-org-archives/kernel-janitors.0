Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89688C25B41
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 04:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjJWE7U (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 00:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjJWE7T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 00:59:19 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D69AF
        for <kernel-janitors@vger.kernel.org>; Sun, 22 Oct 2023 21:59:17 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32d9552d765so2113285f8f.2
        for <kernel-janitors@vger.kernel.org>; Sun, 22 Oct 2023 21:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698037156; x=1698641956; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MhhWhviPx7niC6LySiMSC2jRYxiUkdoa2unztX8UO6A=;
        b=I9WjKqAwO7pBCcLxs2higAfVOhEfqrndMrIbx0eXWdfY8uJewQYnsjNUhuwQztxd4Z
         aDIi8jCZCZ8IAP1l1KwiZ7TOEYAm2/ryhJldv2fcNHGl+uKII1PgOXkdkk1fWSTw3rUd
         FJlHnWIZFXq/lpZ2oqH6Niw9OcI8+thIi1vrLUHW4y6ukt1jiNbShtYWj5OtS+yFxZ2j
         SM8P+I6ghFgY6g70Zl50XeTdBVeb7RjtHRuVkneAIib0LNTuR+E+S9elQDqcsjc8q0vr
         NkR6wQt2GkYGCLcmcqIpbLsoG4GN7wV+d+/j3K6DLIkKudfSTw9LqATZI2aug9PsQbTz
         otSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698037156; x=1698641956;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhhWhviPx7niC6LySiMSC2jRYxiUkdoa2unztX8UO6A=;
        b=fHdLqzIcADEWTLJe5lr+IvVRz9+s0Iy5sR5UKQcrrWr9fQtHBiBcl0tePQJAIf/gF7
         h4V137i7Oe449UH/fo9BIHd+Qm4JB+Pycggs+DPczm7GrLvJed8w81Ts6BZcTvqJhbc4
         cW4JkhJj/5OcX02I42sICVonKaoRkY+u64i/YV4Yr6QhEX/28aAHx5sUurCkxd9i3v6O
         XTd/CFpJYE9hsBAyEmPFBYnxU4xKrabgSMRKaIXwEJ8SL7FLrPdHh885Tv9Vx0tXCDb9
         XYUWmxYOYUTnNZmmL8WcqilxHvhKGJGp5l4OT9zh2aM8bCtQo18JuhyLV8QjnAOGDXGx
         drXQ==
X-Gm-Message-State: AOJu0YxbSEW8U3O5IsUlmKKaTDl1HtrJtu9Y06CfEjJTLH0tCsqh7sso
        lWbPpeQsFkh/XOUkDtxnCvXD7A==
X-Google-Smtp-Source: AGHT+IG11S0kNIyWszNtmWWIkkB0hPJiW3I039K/bNzSxvKwGVaXZlCtOitbNSkvOfTWwdUNHR1ZDQ==
X-Received: by 2002:a5d:6b47:0:b0:32d:b411:4667 with SMTP id x7-20020a5d6b47000000b0032db4114667mr5757773wrw.30.1698037156022;
        Sun, 22 Oct 2023 21:59:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o15-20020adfcf0f000000b00327de0173f6sm6859039wrj.115.2023.10.22.21.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 21:59:15 -0700 (PDT)
Date:   Mon, 23 Oct 2023 07:59:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vishal Moola <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/khugepaged: Fix a NULL vs IS_ERR() bug in
 collapse_pte_mapped_thp()
Message-ID: <183a70ee-cf95-4101-b89b-e274c210229f@kadam.mountain>
References: <a1f3242f-1aae-4b46-9893-36b11ee0a6dd@moroto.mountain>
 <0882a964-770e-418c-9c34-1a64195baafc@moroto.mountain>
 <20231020093626.bae70759c0f0fe5ee5159eae@linux-foundation.org>
 <CAOzc2pzzwq2G9CV1cHh2i1RcXi2KLtd=aHaqK1HQjiJwgnjLKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pzzwq2G9CV1cHh2i1RcXi2KLtd=aHaqK1HQjiJwgnjLKQ@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2023 at 09:49:15AM -0700, Vishal Moola wrote:
> On Fri, Oct 20, 2023 at 9:36 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Fri, 20 Oct 2023 17:14:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > > This was changed from find_lock_page() which returns NULL to
> > > filemap_lock_folio() which returns error pointers.  Update the
> > > error checking to match.
> > >
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -1508,7 +1508,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > >
> > >       folio = filemap_lock_folio(vma->vm_file->f_mapping,
> > >                              linear_page_index(vma, haddr));
> > > -     if (!folio)
> > > +     if (IS_ERR(folio))
> > >               return SCAN_PAGE_NULL;
> > >
> > >       if (folio_order(folio) != HPAGE_PMD_ORDER) {
> >
> > Also doesn't appear applicable to current kernels?
> 
> Thanks for these. Both these fix patches address issues introduced by my
> khugepaged folio conversion patchset:
> https://lore.kernel.org/linux-mm/20231018203213.50224-1-vishal.moola@gmail.com/T/#t
> 
> Andrew already dropped the patchset from current kernels so I can fix a
> couple issues, v3 will include all these fixes.


Only this one was introduced by your patchset.  The other bug is older.
I don't know why it only showed up as a new bug now.  I had guessed that
it was other changes I had made to Smatch which affected this.

regards,
dan carpenter

