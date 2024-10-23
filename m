Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093A200BA8
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 20:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717191; cv=none; b=oXsWZn54VIxbQZvLqgNIFtPVqXC/KQKzsPH4d53vTsY3iBNULV/9ivQSqmChkWfIl1DKCbH9ZtMzcoO26jzlDiU1OC7wDJqefgzP+eikoOeMcGlEyrKsbEKRxuxSUBx08g//ag0l9eZmal+xLinAygEHFlhFwQldtcDKcxumJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717191; c=relaxed/simple;
	bh=TmutFJlUmdw0uYuqWKttwwFvJkpqSd7B7EwyjgnGLm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkm2vrOaXqz9Sg0tLnna5phzEmNdchPbJJan6cRBAcuB5XXvPtvZAvjVOWmCqF+rHSAI7CqWq2ek3gGEIEoLLqQSWng7ap7O3bKMT3fqxbdqvPKTb/+5AqHsqjH1iV2P3AvbTw7f3aqIbckswUJ83dojxnlE3rfjh6aSdCcQxzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=ZQs9Umhy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="ZQs9Umhy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43158625112so1880915e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 13:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729717186; x=1730321986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqBQuVSIycI00hdpx3lR5ACuKRsYQWaJxf8hFYYXxOk=;
        b=ZQs9UmhyP5w5eImHzv6nBklBaN8oBLxDW8t6CojGL8L0v8qyFBrFG+2z/1OXkzsm2t
         zu46USKJuP4puRXWo1NkFCAXgmyzui5ASDEXqL5v+3wCqgveGh6nlMdcRPpPH3SlDo+M
         WbKHIQKHEnu5ZNLTBpm0bPH4JrwRZx84YZhfGJWD78W1h+YM4eYHmSSidWSn6cj3C4yd
         zV3p9QRMKlS97SkEl5oEnLOQtliAo3F9Y/SSSxnI+dK3pgqS3oTWQt3wj9ZBoE064q4S
         ApEdCws/9b2DqEYcMNYoqsWR2LZacOJ3wyBFqjwNGjqUyUtWO8TfBEp88QJnxu4cVjRC
         40nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717186; x=1730321986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqBQuVSIycI00hdpx3lR5ACuKRsYQWaJxf8hFYYXxOk=;
        b=mHbMMYnzTxrlTvYZGPFIaa3A6XNzdmr2pf9RLODYwTGBXEk6+DqYC3OE1D6p39YLxM
         yphc+Xj3kUtI9cqFhgysl4OJydfESosv0KlqYAkv6khKlHV7v6ZISnecZSJzK3i0CXxs
         VUP/Q3Hgn0ehd5gDEL2dsMBjZHSpsVAFTYch5jS8ZmUq/geQxjjoFcCFYPF8K49jvVoZ
         XJUTE24YRi4J3p2h0t4C9nHcUrNmsrrOovJxSHr9606ZdsFmsSE/nyiQFIOEycd2cn6r
         W1c841AlvM42uedvpOopc3CRmWrg5USR++2Rk8NgEP0VV7C3yGRHtzcX8F31GPBJ/THk
         wOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv8vjJBz3AnN4P7icgfOZcfom5m8KG0g/esZgC53DW4urHNQQs7m1jLW+Rz8tj4f/PiLPNROjJiQMypA16y7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ7RwYZZZgCBCezw9dghvq3Lo9LrcqkiIBNfbYyHVA2r904NZ0
	GwGMAZ9srtEUU3F4JyN8JbRFLMxdSF/tJhvgEKkaSzOawwEdi4YbC1Dl5xgbVlgM28SfKWE94MJ
	kCs6m8pTNA5RJOZSdWdYtbwZXQc4/mZBz0Fjy0g==
X-Google-Smtp-Source: AGHT+IELL8lRAg7cArEXQHvrs//3nuGQjeroLsRRDAQdATMPf9GdpSIb/13x+Z9wrbZRpZVIDhudm8c3MtPuKR4g+mo=
X-Received: by 2002:a5d:5b92:0:b0:37d:43f1:57fd with SMTP id
 ffacd0b85a97d-37efcef528emr2325118f8f.6.1729717185866; Wed, 23 Oct 2024
 13:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010165801.3913-1-everestkc@everestkc.com.np> <ZxlYbVOLPQv-oWrv@intel.com>
In-Reply-To: <ZxlYbVOLPQv-oWrv@intel.com>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 23 Oct 2024 14:59:34 -0600
Message-ID: <CAEO-vhGzRxths0OG_MJEPqocyQ5C0hDXvJRWfYYv74qnCbCVCg@mail.gmail.com>
Subject: Re: [PATCH V4] drm/xe/guc: Fix dereference before NULL check
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org, michal.wajdeczko@intel.com, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 2:11=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
>
> On Thu, Oct 10, 2024 at 10:57:59AM -0600, Everest K.C. wrote:
> > The pointer list->list is dereferenced before the NULL check.
> > Fix this by moving the NULL check outside the for loop, so that
> > the check is performed before the dereferencing.
> > The list->list pointer cannot be NULL so this has no effect on runtime.
> > It's just a correctness issue.
> >
> > This issue was reported by Coverity Scan.
> > https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssu=
e=3D1600335
> >
> > Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into captu=
re list")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > V3 -> V4: - Corrected the Fixes tag
> >           - Added Reviewed-by tag
>
> For some reason it looks like nor CI nor lore has this v4 version.
Yeah, I just checked that and it's something strange.
> could you please resubmit it?
Yes, let me send it right away.
> > V2 -> V3: - Changed Null to NULL in the changelog
> >           - Corrected typo in the changelong
> >           - Added more description to the changelong
> >         - Fixed the link for Coverity Report
> >         - Removed the space after the Fixes tag
> > V1 -> V2: - Combined the `!list->list` check in preexisting if statemen=
t
> >         - Added Fixes tag
> >         - Added the link to the Coverity Scan report
> >
> >  drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/x=
e_guc_capture.c
> > index 41262bda20ed..947c3a6d0e5a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > @@ -1531,7 +1531,7 @@ read_reg_to_node(struct xe_hw_engine *hwe, const =
struct __guc_mmio_reg_descr_gro
> >  {
> >       int i;
> >
> > -     if (!list || list->num_regs =3D=3D 0)
> > +     if (!list || !list->list || list->num_regs =3D=3D 0)
> >               return;
> >
> >       if (!regs)
> > @@ -1541,9 +1541,6 @@ read_reg_to_node(struct xe_hw_engine *hwe, const =
struct __guc_mmio_reg_descr_gro
> >               struct __guc_mmio_reg_descr desc =3D list->list[i];
> >               u32 value;
> >
> > -             if (!list->list)
> > -                     return;
> > -
> >               if (list->type =3D=3D GUC_STATE_CAPTURE_TYPE_ENGINE_INSTA=
NCE) {
> >                       value =3D xe_hw_engine_mmio_read32(hwe, desc.reg)=
;
> >               } else {
> > --
> > 2.43.0
> >

With Regards,
Everest K C
