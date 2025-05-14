Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD91171C9
	for <kernel-janitors@vger.kernel.org>; Wed, 14 May 2025 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207758; cv=none; b=ZmPGnxFr6lxIM7xyVxQHkK+WD/PJi+KVI+qNmg236eAP9p3WXEZY3V+Kq4jBenv7FRfL3kLpbCF1YhApPWQoF1eayWtivkDrQULNNimisau+Auf1hDMf2nvfiEgnoj3xyuOTpNF12t4pEdd99SqHD5xK/5n1sOJ6uyS9JY3ijL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207758; c=relaxed/simple;
	bh=WY9nxPgCvde8fX6n7zhRAyJTTq9PldQtI0rtg67w0yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r713PgMON48LGWTJ23ySPCjIxiv3MzDHPeVSijZBJEkMwq3njIemBY+4KTISE7N9GYMnIBUhrEkV/koLfQo+McvhTK97iLMpNFOscTaF7+hJZwSWBPo87En4zHNs+8hp5YUXdDhdN8OsLypDQW5jhY6hwyhB33nNY6KTAV0qrhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5IcgT4A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5IcgT4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747207755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WY9nxPgCvde8fX6n7zhRAyJTTq9PldQtI0rtg67w0yE=;
	b=S5IcgT4AZHBK9J1gPcdv3IbHl6TMs2bxMoQrtf6Lj+8B9RPlqz4aRuMjONGSYWorcuYrC+
	uPH4Mo6KocxKAcUyT+XQk2EkBzsC6+BTr+oUKRw6HSJvHMU9ebZb+ugXNIFJlYMuzp2peH
	AKkdw5FbsJQhAQC8D1p4OM2/LQzpnug=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-KhA65itKP5e1dpIHKRdoNw-1; Wed, 14 May 2025 03:29:13 -0400
X-MC-Unique: KhA65itKP5e1dpIHKRdoNw-1
X-Mimecast-MFC-AGG-ID: KhA65itKP5e1dpIHKRdoNw_1747207752
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30cbf82bd11so2408426a91.3
        for <kernel-janitors@vger.kernel.org>; Wed, 14 May 2025 00:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207752; x=1747812552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY9nxPgCvde8fX6n7zhRAyJTTq9PldQtI0rtg67w0yE=;
        b=nv+1MUIgq9lRblXjd1i1jWYKFWGAvmlKLCdYWByDqHnMvv/rXnLLrNo2muS5957ciK
         4luG0CLlaHhKHEo9i1Hwss6yloCZtGGLW+p5pSO3wegEMDPSWXlYODhHAABC/HAEqn9j
         yW0YCQG7uRXftRXHVkcK5yHVc/3nnUDiFd8FwvALlbtgLpy39t2pDoi7/z9M+FPzGRYI
         bTjaa8DJOJ84tLCZgi6uhgExG0jsElV8Hav9k5hx50lA+Pn5524rSdH4mkre51lRYzAE
         VopEtPv3sQcUkp0WtZp/haKhbU/LbYlJHJAiJ18VVqKzH7CadkJX1xORLWKg5yOxZaf5
         63gA==
X-Forwarded-Encrypted: i=1; AJvYcCWBF79+vuYryFW+Kbz3s2O6BkaMd8PXte9DISIXg8Us9xzYpE9ppn+2hNXdE5U+0PnyUJN6lVSehEUvYo49i38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+S0Uyh4ekPqtWtsTDju+8RtUHSjV9DLRMnYSICRxsXAtt/0G+
	w8OnnBXmaxi7N/8AFwMoofqwSvJYRRIIR6W7UM/E3WDzyby0kYtC0HYUgdo2QGHYqkUcLiozbyn
	fJad5PCnHD8aoNom4tVFOiMToMrBhjGPN+tRBcUf9pO/dfb/KpUnRVnGkgd0n8mSFWxMttkGTJl
	KxQBfg+In4UFSFqlBngiTKYFtIkyc7Jvz1MqLpdIUe
X-Gm-Gg: ASbGncsth2dcOhzNRkkzCWIWjGnMN+gSAXBCXQKEtccB7/ywF8ULDrVMD7efAMGWVbP
	QHRI//EYQ4ne4ChjaQd/c47/vH1FVVzWfSjbcBu/ZA3ZT33jsD/abxS4szfRZHB2AWWeoFmEIdy
	TH580AjTPe6X00L+MlA8koiXCdtQ==
X-Received: by 2002:a17:90b:58ef:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-30e2e625f04mr2998510a91.23.1747207752301;
        Wed, 14 May 2025 00:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErZhOIhtd3hI4AKZUHoezz+kYbi9KNoNaaRDKtt38OZ6UI/QdvxrBZC4rk+6QrFDTtDOghmI+q8BJtDQ8PcGA=
X-Received: by 2002:a17:90b:58ef:b0:2ff:64c3:3bd9 with SMTP id
 98e67ed59e1d1-30e2e625f04mr2998476a91.23.1747207751899; Wed, 14 May 2025
 00:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514065513.463941-1-lukas.bulwahn@redhat.com> <a0c3a812-8a24-481c-9354-4475ac71d68b@flourine.local>
In-Reply-To: <a0c3a812-8a24-481c-9354-4475ac71d68b@flourine.local>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Wed, 14 May 2025 09:28:59 +0200
X-Gm-Features: AX0GCFvvwL92M4FGbZOgsDbYBNn-v06sRogm_7vOCHV7R_FGPG5EmYFbXDI9rTs
Message-ID: <CAOc5a3M2Nvv0oREzWN_kzOJqt4s+0zzmqWdG4tM58RJSWAb4BQ@mail.gmail.com>
Subject: Re: [PATCH] block: Remove obsolete configs BLK_MQ_{PCI,VIRTIO}
To: Daniel Wagner <dwagner@suse.de>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>, John Garry <john.g.garry@oracle.com>, 
	linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 9:10=E2=80=AFAM Daniel Wagner <dwagner@suse.de> wro=
te:
>
> On Wed, May 14, 2025 at 08:55:13AM +0200, Lukas Bulwahn wrote:
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit 9bc1e897a821 ("blk-mq: remove unused queue mapping helpers") mak=
es
> > the two config options, BLK_MQ_PCI and BLK_MQ_VIRTIO, have no remaining
> > effect.
> >
> > Remove the two obsolete config options.
>
> A quick grep revealed that there is at least a test config still in the
> tree which uses BLK_MQ_VIRTIO:
>
> drivers/gpu/drm/ci/x86_64.config
> 108:CONFIG_BLK_MQ_VIRTIO=3Dy
>
> Not sure how this is supposed to be handled.
>

I noticed that as well, but that is really yet another clean up.

Generally, these config files in the kernel tree are ill designed and
terribly maintained.

They are ill designed, because when they are created, they are dropped
as complete kernel configurations, whereas they intend to set a
specific fragment of options, and have the rest as default. That
creates needless large files, distracts from what is important in
those files, and creates some record of the default of various options
at this random point of time where the config was created, which now
makes the clean-up pretty complicated.

They are terribly maintained, i.e., the command
./scripts/checkkconfigsymbols.py | grep "configs" -B 1, will show all
the references to config options in those config files, for config
options that do not exist anymore in the current tree. In the current
linux-next tree, there are over 200 references to non-existing config
options from such config files. At this point, I do not worry about
adding one more such reference in one of those files.

This whole proper clean-up of those files is a larger project, though;
maybe for some later day.

Lukas

> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Reviewed-by: Daniel Wagner <dwagner@suse.de>
>

