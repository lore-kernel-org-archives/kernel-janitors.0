Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE15224CF
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Apr 2024 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713164301; cv=none; b=QcHgbUMP00o/RbvH93VZYgV+F6P9dzRk3x4/wI0/wQYmkQx8VVWf9H3cFJ7ixJYzsBvQRHbov3i8Ke2oyJ4k2l4dNbGYZuJabQiAPhm9B4zH9bVpLokZcTkDOkawzUlDtV3ZSCpDA+iHfiyv5yRwcGoH+aPGW41tJPd/zxGnSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713164301; c=relaxed/simple;
	bh=8zRocQO/rRgL1qKa5DTF7pfCxE7+mgM0HcYZDkfYtek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ik82ZsviDYB25uykb6ULhFN/F5xRB7ySRNLnvqIXmCcmOPuj3VFaYyYppzjnqy/ewWV6QOi8tbqZcEAy7dDWYaq8h0eiifq7Q25tX48AGc+xSVmZWc2LSaAqaDcGEQ+FFg+Ss7R6ftnDZG4C+Qzcd671vTQ15bUvz+Oi0O44C5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvTdNNNx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvTdNNNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713164298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8zRocQO/rRgL1qKa5DTF7pfCxE7+mgM0HcYZDkfYtek=;
	b=OvTdNNNxLhZpNDTjZF1SBowRw4BS9Z9Um1+gGgHhHR7LIV2k2cfIE3AQW4S235iX74eXNx
	3bziquNTan0AinX8K4Yzfr1AsSLQ2eAnzAT3HjWFUQW2+zbbUMfxLI5ac49Y/lsKuZ1mRJ
	LkKLdE6Y0iumk0H4GH5mRb6x5PSGBOQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-KwrJq0_sOS2kZmaGY9dOuw-1; Mon, 15 Apr 2024 02:58:17 -0400
X-MC-Unique: KwrJq0_sOS2kZmaGY9dOuw-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5cfda2f4716so1450922a12.3
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Apr 2024 23:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713164296; x=1713769096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zRocQO/rRgL1qKa5DTF7pfCxE7+mgM0HcYZDkfYtek=;
        b=tGcrFm3PiabnLYBuyOQfQt5mwIASBPSrffwQIEQQnrH/7uj1+a8CmASddA1rKD45gN
         599ecfsEh1BiSvVpHFmFtaPMOECJKjJpHjncDFl56b8Ow3KOy9ZqKrrU/B3kRfzawg/l
         zDk3fLaAku5+9LswOQQhyFsuxJBw3AxlAHX5OizsywC2IlpxFZaVGVvravE/XVONcEyi
         TxOJ9Gb13c2U7ozqaWLNXcrbbdRu+1TJjlS9vEuy8GJ4ToTT0+B974NZ8pcVnGCDEPK4
         ZX3eYkUGY3ke6wLCtCinwUOatalfpM+SZd2CxSUpXZrnxHN/iul8mkPYGzDLj+Qq4CQG
         wBzg==
X-Forwarded-Encrypted: i=1; AJvYcCXXeIK6jfPEu94Qa32XYxDgipy57vMyZrzBBs6eGLJWMsN1plo9JqhevWAQliv0EAbrg0LiYGPEOdSqFWIu63GmadCN8EiLQQMcPOU0Q9Hr
X-Gm-Message-State: AOJu0YyWhhrh1bKlPZ6m5KgCa5TRzZiiGr+49vgaJm46dUrLFjzs58pm
	fuBkTd9VzFGmAo6pBT8w22TqTrUHl5D6ColFwpY4w9PYwF1wX4NJSEGo8z6oJAarx7V4o2BCOff
	Wb4YXu0YmlsFK67viwjVZlz4nqD4SUw/5g4ntOsXSsYnGlYdhc2VNKu+JtpcPxFhtp2Bp7RWVBe
	tMRZSvh1+PFS1uuFiUyzT+tk4wOz9ki/TMjeFpWrA1
X-Received: by 2002:a05:6a21:191:b0:1a9:6d96:c700 with SMTP id le17-20020a056a21019100b001a96d96c700mr8932589pzb.48.1713164296250;
        Sun, 14 Apr 2024 23:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfCe10Cxttrxe8F4OkPc7KjxC+SFTe/Z0SKvR0xbdRbE8/iQQiMdWF3kDr6DPf/3wtsnu4W5Rb/yh0o2uaUZk=
X-Received: by 2002:a05:6a21:191:b0:1a9:6d96:c700 with SMTP id
 le17-20020a056a21019100b001a96d96c700mr8932578pzb.48.1713164295965; Sun, 14
 Apr 2024 23:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67c2edf49788c27d5f7a49fc701520b9fcf739b5.1713088999.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <67c2edf49788c27d5f7a49fc701520b9fcf739b5.1713088999.git.christophe.jaillet@wanadoo.fr>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 15 Apr 2024 14:58:04 +0800
Message-ID: <CACGkMEtufa6MqWkcsZqHW8eQzj4b2wCh8zFMSAuHkxpWowLmdQ@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: Remove usage of the deprecated
 ida_simple_xx() API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Simon Horman <horms@kernel.org>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2024 at 6:04=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
>
> Note that the upper limit of ida_simple_get() is exclusive, but the one o=
f
> ida_alloc_max() is inclusive. So a -1 has been added when needed.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Simon Horman <horms@kernel.org>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

