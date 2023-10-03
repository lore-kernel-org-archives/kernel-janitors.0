Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83E5E75433
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Oct 2023 08:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239413AbjJCIaU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Oct 2023 04:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239439AbjJCIaS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Oct 2023 04:30:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791C3A3
        for <kernel-janitors@vger.kernel.org>; Tue,  3 Oct 2023 01:30:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso737122e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Oct 2023 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696321813; x=1696926613; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCVLlGuDttXDAeKBU2+UulxgkQbSJpXxQEIW9ibhWmE=;
        b=XtV2aQ5pP3lijq+WPAGkg0AonpQvNinUqaEFjGYaTtgLgElc/rHZDyudwKEeOmW4Rj
         gYLN2Jv2nxOkIjGxAjdY3g3eHJmR9Fk1fZXCHylRl505aMlAzcEZjUnNDoqst+l4crFx
         HVIqcXbAMr+cUQvBBeQ/Dn3Daz6pMnAfwUN3Pg5JwKtt6KucIMOqKnrsuL8ZrB/gymd2
         nsMiKk+nXbozizb9/Wcv1RNWwpsD4FzVXjgA9QscN73gkoOAxKzSBwFIxS1IEmmoUy0c
         XNEANSME1h/nwbucZZrSBkjtQRDgTdwIvyfQ992SJ4eTg711bFsNy8fAn+yAblJr9Dgx
         sy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696321813; x=1696926613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCVLlGuDttXDAeKBU2+UulxgkQbSJpXxQEIW9ibhWmE=;
        b=szIqBX99zg8Pwp8Ltd3GcOPc0IS10XoFwbwyxkvZD+5diaoTtieAmR16FG+L5iCQ7+
         jzxm3gCnG+ZsoYro8dnZEs67YopvCFsV7BxHIstmGott1f3Rmx5E3dB3YNNTedV5ngnt
         yaMM9wYAkCEwIfGKRAEDs3ECOu/Qn6hqsgBuzMhiA++dow6uXYnC7sPBbxy2hckSE6BJ
         hSvR081vXtHlbdgAeBfVCi77odyT4yqwb7gnr/LalDp/kcxNNW5+I0QVT/TlSB8hm/5F
         d9QTZRVoCKSv0J+J44NAFemiTUtqKD7p7acZvSQrNNOfV2ianKWLJoLIUchuN/ie3/3v
         X+ug==
X-Gm-Message-State: AOJu0YzHF/EIbz5QRMMhxtBcgnz4DSs9c52PE2//vtcnxBkRhb0I6RXM
        qW6WnmiAWIWsKeUtarilZM5RXA==
X-Google-Smtp-Source: AGHT+IF5jqCZuut1egRUR+esMIoO1bSWn9DsA6o33yNuDo0JmBUPqEnTCoPt8mrVyD2S7D9i02Vjdg==
X-Received: by 2002:a05:6512:360a:b0:502:d35b:5058 with SMTP id f10-20020a056512360a00b00502d35b5058mr10185024lfs.4.1696321812713;
        Tue, 03 Oct 2023 01:30:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b00401b242e2e6sm8801252wmq.47.2023.10.03.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 01:30:11 -0700 (PDT)
Date:   Tue, 3 Oct 2023 11:30:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "T.J. Mercier" <tjmercier@google.com>
Cc:     John Stultz <jstultz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf: heaps: Fix off by one in cma_heap_vm_fault()
Message-ID: <04ea5706-7373-48c4-a93e-e69c50816a0b@kadam.mountain>
References: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
 <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 02, 2023 at 10:16:24AM -0700, T.J. Mercier wrote:
> On Mon, Oct 2, 2023 at 12:04 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The buffer->pages[] has "buffer->pagecount" elements so this > comparison
> > has to be changed to >= to avoid reading beyond the end of the array.
> > The buffer->pages[] array is allocated in cma_heap_allocate().
> >
> > Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index ee899f8e6721..bea7e574f916 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
> >         struct vm_area_struct *vma = vmf->vma;
> >         struct cma_heap_buffer *buffer = vma->vm_private_data;
> >
> > -       if (vmf->pgoff > buffer->pagecount)
> > +       if (vmf->pgoff >= buffer->pagecount)
> >                 return VM_FAULT_SIGBUS;
> >
> Hi Dan,
> 
> Your fix looks correct to me, but I'm curious if you observed this
> problem on a device? The mmap in dma-buf.c looks like it prevents
> creating a mapping that is too large, and I think an access beyond the
> VMA should segfault before reaching here.

This is from static analysis and not from testing.  You could be correct
that this bug can't affect real life.

regards,
dan carpenter

