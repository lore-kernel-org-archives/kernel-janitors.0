Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBDE6A342
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 02:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245687; cv=none; b=o6d9zC11jy98UA9UxLb3oaHEPp5zr7qLvYddbqhP9dzn7DuareuZXQhsqFGbAMRhIpxIQZ/ACnmjcrdnhIfgrEdrAuTpHHjSxImF7TsQygC5IQ6eH6eAV1DCAkhdeGkPGh+FuDnkyWdb6kJiZ3/7NhoiUCs1mwTI12MfO7sXQn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245687; c=relaxed/simple;
	bh=wQjkzUNkQvO1QQTmzJdFmOhe3eLsPajk6NuewFDYhho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=me1TYDwfsBByGN8KYr3HLNV77qINsrmYuuBMl5NAON7r7l/wJco1A+KoxJxe7UNsiGlj3P+kqABIsC+Q+KR/J4QvVH+R7FUITBV3EEQPMkfQfMehEqZUIsINKlvPRkWcVjDqOObm/h3IG7XjsMS7VcEtF0/st9apdMgcJzXZWo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f37yKs3d; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f37yKs3d"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso720713e87.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 19:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718245682; x=1718850482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=f37yKs3dt4fnBxljKLCDr4a0BTa5Ia63EuIZlmUwoxsvUYhjYICzT11NIXBEBigtJY
         8h5m5vcYBnpIq4pk9rSB296kWwOpcjwLhIPViqZV+o1oy39dJKeDF48vH9Hwnm41yXZj
         xlhoNxqMToaQHYi9Tf8vvRby/xhWKbGQ6L6BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718245682; x=1718850482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=wyb+LQ5N/fe19SBi9walhnOESU6XBhf7buL9UOFP9VS4tXKC6pPjJ65xzwYwyi1mXN
         d89uS4np8l/SBJHvHpfE1ppU6OgzMox8/EKcKbzglfjAcjoUZpvKpnBX5H8GrCM2jF7a
         XtqF8w+HfFmdDA4c3ghmyA/xL5k1BWfJnQAueTU/5i6Nj4vlJZp0nj2kPM/QI75gVlCl
         t7tIW5JQMYnmbVrAotlyjXYEL9QCl8EzrOH/vQG0Uyd6+JaU0HIfR876un9+n5jvJtCD
         OtuU9MMFG9EB96cx9IB8E/DF6voJxJ4F/L98trc760Ojgj819bAkXNVJVUbkUBsHWsqP
         RdHA==
X-Forwarded-Encrypted: i=1; AJvYcCVnafG1mz2hx3ku58HQsLxj6+xVqH878O4dIvpYC6l6mYm0Q661cDPVa0bhrWFuGtxTwUzUq6OJmP5I/1HrA+hjCvk3AXSC7d6amle3t8kr
X-Gm-Message-State: AOJu0Yz5Q1Rm3WbSGbDUmz+Zr4u4HxjBzjbfWn16AkeL9OhTQcGuuKFF
	KmLLodsdSbWeq5JeMOO+vC9fRv9J9U/Y7CtLbeGPivM53cjQzfa3XqKqkpaUxMAqj44ktTxcZ0D
	Mag==
X-Google-Smtp-Source: AGHT+IEDDPg2ALWf1lidEkeAmk93+mU74FvTGMErMmvesZZ+1ljDxxxStDLc7mrF3buB3vg5IB2W+Q==
X-Received: by 2002:a05:6512:108e:b0:52c:7f12:61d1 with SMTP id 2adb3069b0e04-52c9a3b972dmr2871069e87.1.1718245682536;
        Wed, 12 Jun 2024 19:28:02 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888c2esm50903e87.300.2024.06.12.19.28.01
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 19:28:02 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52962423ed8so658158e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 19:28:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaF6IpicfXjoyO2kU7cce0DebWY2dvF+0jyglSIwULrcRjqic+u8kzAkWvogFgghqAPBLbmDMbwQVhF55vYde4s1CChwF3U6jz6uaf+yyi
X-Received: by 2002:ac2:418a:0:b0:52b:c147:ea38 with SMTP id
 2adb3069b0e04-52c9a405960mr1780155e87.68.1718245681292; Wed, 12 Jun 2024
 19:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com>
In-Reply-To: <20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 13 Jun 2024 11:27:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bdh6Lsje-71_HDK9T141jMNeNh1v400ukUVn1L5WO-kA@mail.gmail.com>
Message-ID: <CAAFQd5Bdh6Lsje-71_HDK9T141jMNeNh1v400ukUVn1L5WO-kA@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Wed, Jun 12, 2024 at 11:46=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
>
> With ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/vi=
deobuf2/videobuf2-dvb.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> While doing these cleanups, in most cases I've taken the descriptions
> directly from code comments, Kconfig descriptions, or git logs, but in
> this case I didn't see a nice concise description so I invented this
> one. Please suggest a replacement if this isn't an appropriate
> description.
> ---
>  drivers/media/common/videobuf2/videobuf2-dvb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dvb.c b/drivers/med=
ia/common/videobuf2/videobuf2-dvb.c
> index 8c15bcd07eef..6f6650183184 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dvb.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dvb.c
> @@ -19,6 +19,7 @@
>  /* ------------------------------------------------------------------ */
>
>  MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
> +MODULE_DESCRIPTION("Simple DVB helper framework for videobuf2");

Thanks for the patch!

Looking at the header at the top of the file:

 * some helper function for simple DVB cards which simply DMA the
 * complete transport stream and let the computer sort everything else
 * (i.e. we are using the software demux, ...).  Also uses vb2
 * to manage DMA buffers.

I think I'd call it "Videobuf2 helpers library for simple DVB cards".
But maybe we could have some DVB expert comment on this. :)

Regardless of whether the description stays or changes, feel free to add

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
