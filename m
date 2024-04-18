Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60B171E68
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Apr 2024 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460756; cv=none; b=DafVe8qJbpamlhOFFBJ2n7InlwR9ouT8D9gh8cnmqc08oL1+tS2VtPM2kkRwoK3zB9ZyCi96rN/wyTI015Imwu3zNVNeY6JJI3mfNqzmejsrofg+3sQJBR3pYrnoERAZDUUV53UZGY04nrQOxExRnLk/SaFMRN+GjxUM6o8CFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460756; c=relaxed/simple;
	bh=z8deP5JiCX4tE0osRAabfU/ka6kCpJORJ3z3SrfiQSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MweU74tHDMmHexjMqm6nHxNg51BEuIOEcTct13PeeNKmWVC7HPFcj6p/GKe+9KnUQacuni7Jk9tN12svYO1EUZGJiCVKWeNmGjR39ae7g/2+ur6gNTwhZdIEVuF/1gp4tgw3ul8TjlIZvh0gHAMlg7HpcKxuiJmdezye8WY5uMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxJqzSj7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxJqzSj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713460752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5bV22Y6v5pDARLpQxuhoUtFKqLzg5Cehfkskiq3Udg=;
	b=SxJqzSj7R9u0s2zf1ptS+nOKQ8jRCRjq5Km8Hf6YQNC5bCAt18v7TuPQBwGqA3vUkPMPfO
	3f6pBiJguCc2kARezjcMDDjnocMbo61wnBfyVKwouRumIsK3cMSdllLRp1o/Rhi593kVa3
	L5w0V73RbGMliDoknlDZAc3f6mh/B7Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-JHEj-PsjM1GHumN62O5tMw-1; Thu, 18 Apr 2024 13:19:10 -0400
X-MC-Unique: JHEj-PsjM1GHumN62O5tMw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-434c0b0684fso13565311cf.3
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Apr 2024 10:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460750; x=1714065550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5bV22Y6v5pDARLpQxuhoUtFKqLzg5Cehfkskiq3Udg=;
        b=evVBqT/w+QsWJ4LrcLMSV4QSjxYVXiroPY1OpXUjUq4OqGxTYuPOOnYkNiERba4Nel
         F8e2yAgKmAqim1y/AE0R+p6Bcx2zpq7laONo+oy9+tvlVorOI/OfltRZ/SBbEQrWWbqi
         ballKWSOtXG0goCbaTD6V/5BjyrJCPI1I3nHe4nGeMlTfw25YtO4Jt9uX3AYgH0ReYeY
         8ce94KS8glRWx3IXmXAmvOw/VHLZyUz7VWTm4rtnNPWx4BAUX3YTv4+LQCC2xiT3svXu
         AHYPGBi/QO7wNn8IIhLAmN5vkqGVfdA7C+X8Kq6uiMUWENRDBmAthGbYU5rAzryAfFDI
         VuUw==
X-Forwarded-Encrypted: i=1; AJvYcCVEgkyaP+e9tvNSk2Xe/IeU2S0kHZ1JsaZsbOsiByGeZI7E2ksJqFV4uPKVC8BKL7revz+ksurBYPJ8mFXnt0ObDui4CX/MSd1hT/eIGLQ1
X-Gm-Message-State: AOJu0YxcrLaWNw3N5O+uS3bRdR03Et8f9YfEdKXXT4P/jVs7VXTayghp
	6CGqEMfsFt1SIQ/oxlmj8BLnwbxhbhEMghjkRg8CwAk6lTF+DIm1BDmPJylzvTDRQkwpUYCkJcU
	KcECvyFy3JxBByZ8PyVpUBEtItFKwJmQ+k9nZjUnvQ/C7yb15pJoc19wehZZQhlpa2qIg8geDtD
	4tqmS7K30N8sDGeKrDMNKMG9iUt6I+9QnPv3DcTJPc
X-Received: by 2002:a05:622a:f:b0:436:ba2a:4aef with SMTP id x15-20020a05622a000f00b00436ba2a4aefmr4004836qtw.52.1713460750343;
        Thu, 18 Apr 2024 10:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKngSjSF6iWF1QhKj/ESh69oayLe4joJMZzFJEgkEVk0tUD3zJIsN6uNqpnXh8+kDRMgV0RR3zJNphOH8wO8g=
X-Received: by 2002:a05:622a:f:b0:436:ba2a:4aef with SMTP id
 x15-20020a05622a000f00b00436ba2a4aefmr4004823qtw.52.1713460750106; Thu, 18
 Apr 2024 10:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418131754.58217-3-wander@redhat.com> <9ff84256-c7d2-48e5-b06b-09a993db2c39@web.de>
In-Reply-To: <9ff84256-c7d2-48e5-b06b-09a993db2c39@web.de>
From: Wander Lairson Costa <wander@redhat.com>
Date: Thu, 18 Apr 2024 14:18:59 -0300
Message-ID: <CAAq0SUk7nJ80rrMG+zeVi-XReVJ7sdWTAT9fmi4E+LpYAYa=OA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kunit: avoid memory leak on device register error
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 12:24=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> > If the device register fails, free the allocated memory before
> > returning.
>
> * I suggest to use the word =E2=80=9Cregistration=E2=80=9D (instead of =
=E2=80=9Cregister=E2=80=9D)
>   in the commit message.
>
> * Would you like to add the tag =E2=80=9CFixes=E2=80=9D accordingly?
>
>
> > +++ b/lib/kunit/device.c
> > @@ -131,6 +131,7 @@ static struct kunit_device *kunit_device_register_i=
nternal(struct kunit *test,
> >       err =3D device_register(&kunit_dev->dev);
> >       if (err) {
> >               put_device(&kunit_dev->dev);
> > +             kfree(kunit_dev);
> >               return ERR_PTR(err);
> >       }
>
> Common error handling code can be used instead
> if an additional label would be applied for a corresponding jump target.
>
> How do you think about to increase the application of scope-based resourc=
e management here?
>

I thought about that. But I think the code is simple enough (for now)
to not require an exit label.

> Regards,
> Markus
>

