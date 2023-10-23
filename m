Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A93FCDB474
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 14:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjJWOQm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 10:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjJWOQl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 10:16:41 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7ACB3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 07:16:39 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso24584055e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698070597; x=1698675397; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5iW1K0Yi1e4FvpckzyR1RHnUVcBJrUNHSLAnahLGys=;
        b=yz5jZUKbSy5rmabrf5h3+FyRHiQADlU5UzcJhet5ZxV77OCUig0Ba78llI4NG0UklS
         9RoLkDzN1OYjDM2lHYdnl5zSkDmHCjRIzlBhNNinu2i2H9/n71mbPWJF4loRHHv7re9V
         uOD7UcyFJlHRuWCC5LrNDs/LoB+nVeLUD3D8W7zBhldZLtcyTGl3vkGIQqxf1OQvCJdf
         kckVWUuUC5iGZGPLzV900yWFEVxMsDPsmplhpMt/8/iumARlCjHUVtN5nZeayxNxtY46
         mcF+fCwthkph+qoAY44ZcxQwcqfryP0pmBqHOiiUqtZzoUwWSiMmlF6nTvjxCWXL1THh
         e7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698070597; x=1698675397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5iW1K0Yi1e4FvpckzyR1RHnUVcBJrUNHSLAnahLGys=;
        b=p/Fy1bP4sK077x4A489NKnd1t8ZX2dIEG10ZebxiulRcDvN6n9h62ll2hCZSjWkM/q
         FnYJnOvFVvjJ5pQq3GmpjNgl0BUpoXCa6s0rz+jGcW6Ei3H69UZwWneJhcrBTHdjXiJT
         9iDJWUUfB+2PYzjM30sglwo7cMtTRqsqUtavXIYpwQzIgeUQZmGQ1XS4VrNtj5/Tzky1
         UCgsOpnJJLQHPjyeN6IpPqkV+6Jd6g6w2QhkJTjjoSsmkF0lDEAaBl2bxGUlBVquES+I
         vdhMGmU6oBjEUAQlx04UeGCaifUob3y5ZSiNAjaUnxC1DjCqQxV9ug/NuOJvubQNw9mU
         VUjw==
X-Gm-Message-State: AOJu0YwjKCPGCH1+qTtzAOs3uHS6o+IX08vrsNtjJ9deVcgkaiKGhlJ2
        45yQ2Qky6uma9Dw8Sax8WY0AOg==
X-Google-Smtp-Source: AGHT+IGGx/yvYrzQl788u+y8LS+2FpbnKdDk7w1H7ljsv4zkDSMMW+8W9HvMhJoIrmPWNrr/x050+Q==
X-Received: by 2002:a05:600c:3555:b0:3f9:b430:199b with SMTP id i21-20020a05600c355500b003f9b430199bmr7149362wmq.15.1698070597552;
        Mon, 23 Oct 2023 07:16:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i18-20020a05600c481200b00407b93d8085sm14105092wmo.27.2023.10.23.07.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:16:37 -0700 (PDT)
Date:   Mon, 23 Oct 2023 17:16:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vishal Moola <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/khugepaged: Fix a NULL vs IS_ERR() bug in
 collapse_pte_mapped_thp()
Message-ID: <0003b576-e63f-440a-ab24-739c0557dfb8@kadam.mountain>
References: <a1f3242f-1aae-4b46-9893-36b11ee0a6dd@moroto.mountain>
 <0882a964-770e-418c-9c34-1a64195baafc@moroto.mountain>
 <20231020093626.bae70759c0f0fe5ee5159eae@linux-foundation.org>
 <CAOzc2pzzwq2G9CV1cHh2i1RcXi2KLtd=aHaqK1HQjiJwgnjLKQ@mail.gmail.com>
 <183a70ee-cf95-4101-b89b-e274c210229f@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <183a70ee-cf95-4101-b89b-e274c210229f@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2023 at 07:59:12AM +0300, Dan Carpenter wrote:
> On Fri, Oct 20, 2023 at 09:49:15AM -0700, Vishal Moola wrote:
> > On Fri, Oct 20, 2023 at 9:36 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Fri, 20 Oct 2023 17:14:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > > This was changed from find_lock_page() which returns NULL to
> > > > filemap_lock_folio() which returns error pointers.  Update the
> > > > error checking to match.
> > > >
> > > > --- a/mm/khugepaged.c
> > > > +++ b/mm/khugepaged.c
> > > > @@ -1508,7 +1508,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> > > >
> > > >       folio = filemap_lock_folio(vma->vm_file->f_mapping,
> > > >                              linear_page_index(vma, haddr));
> > > > -     if (!folio)
> > > > +     if (IS_ERR(folio))
> > > >               return SCAN_PAGE_NULL;
> > > >
> > > >       if (folio_order(folio) != HPAGE_PMD_ORDER) {
> > >
> > > Also doesn't appear applicable to current kernels?
> > 
> > Thanks for these. Both these fix patches address issues introduced by my
> > khugepaged folio conversion patchset:
> > https://lore.kernel.org/linux-mm/20231018203213.50224-1-vishal.moola@gmail.com/T/#t
> > 
> > Andrew already dropped the patchset from current kernels so I can fix a
> > couple issues, v3 will include all these fixes.
> 
> 
> Only this one was introduced by your patchset.  The other bug is older.
> I don't know why it only showed up as a new bug now.  I had guessed that
> it was other changes I had made to Smatch which affected this.

Heh.  Nope.  I was wrong.  These were both introduces as part of the
folio conversion patchset.

Thanks for taking care of this, Vishal.

regards,
dan carpenter

