Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344D12F52
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712905896; cv=none; b=quvfQnE5uTsPYUE3JI+VMlk01q6z2V+F1jDeZiroIAXcwpnPFZtsq21tJzeFCgzTWUgAeVKJGJRYkTsjIIxRZ9zYhzx32lMKy7Cm1eh+KNkX0VTq1JTA9AwaBP567tWw0s+2K0ijcdkq9L5WRVMmCMPE2U6JmN4IB4NDrppX/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712905896; c=relaxed/simple;
	bh=V9ySPHFHra331Yt/URq8+X+I4ysMrTRGrhBFu5T7R4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mJyaS/8FD/K2zzABKCXcqwAdVS9K2UkiUa3fAovC2/XRGkU1v8DrzfDPd26OJajANaqXEi4TwMxkNNOhCa5cJD6gEVldGpcgZIcrB4Fi6oqOav8K3wPUAkjelWMJdL6eX22+RdnjQF7wclxMrQ9Vmd0+ZC3UBDKQPcGuSAyyKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NtfY6v6C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NtfY6v6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712905893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9ySPHFHra331Yt/URq8+X+I4ysMrTRGrhBFu5T7R4g=;
	b=NtfY6v6CSr779YYmjUMVkz1h47Bds4bL2MEksRAlvZhncEtGhPOvKOrkhvxC92qvuzAykD
	B3PyFLQYlOqjldkxpeD6rre2NfhIxW6/00T6+DvwQ6SNmDv6J/dqxxOcEXwHJKJg+wfjYS
	PhW78tutTntU89SdWv9ynkdl5ew1iwA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-Hjo-KHqmMiWJFnLnsVYtTA-1; Fri, 12 Apr 2024 03:11:31 -0400
X-MC-Unique: Hjo-KHqmMiWJFnLnsVYtTA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2a5066ddd4cso590698a91.0
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 00:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712905891; x=1713510691;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9ySPHFHra331Yt/URq8+X+I4ysMrTRGrhBFu5T7R4g=;
        b=fHsnW9UlMQMZ4gdFYl11WtWIuRseEAQUF8I1Am0Pw6gnPZIHCY5vMMYQCRPTKTVHdv
         yVBOwKvZvPyw5tBDz7aqbrkuzwGxef3wKKYibxV9k76gnPcbTEU0pANXJznD0KipkwBK
         ckkqEAxVbce/gZ8dxz9fqPH6OfO7ZszlJMsyFdK79Gic6WaGhF3w3zalTXczaGzUz61o
         FNB8buJeRGdDKxnRMGDxoTEB5fdnnurd9kqaQeWQMNGSyf297HoN/wvv5oVlnfKVPdOM
         zhX+6zobm1sEgFSnnpxW442FB5faguP9A5Q6xEErtdYmVR9QeuSP20Qa4Ft8MVM4OPiu
         8uTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBIlGQjHzendAmtGd+yH9hmkY0XxYsdHMkct4GZ/6BDmMk5FUoDOXDR4iw6YIhBT4o7eG8sWiY872z5esjwbRbpCDHgMkitqKd5zfUK+Mv
X-Gm-Message-State: AOJu0YwDEmNfsA06mvlvNGs3vDcB0Xk2Ie6b/Wb1xtsoXKXVVVd7lJrf
	TdtfSObubMMWMl1LBWkxayRQ+Yn7d/KoKloZBi4091d6wKPFia/W3wpuPCVrQcVR1Xvd3+gK4S7
	L2Gi5CU97R8hUu6S8JIUgh6yTiTRrbOx1bWKHGFsT5+F5Nzryc24IALWzeo4gTW8ZOnnKHxH5Ly
	O1LCec7wByOQLD/Unr551Ae/R6kVHLvKOfGv0w5PmL
X-Received: by 2002:a17:90b:19d0:b0:2a2:2b53:892e with SMTP id nm16-20020a17090b19d000b002a22b53892emr1531771pjb.32.1712905890786;
        Fri, 12 Apr 2024 00:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhB8Fe6/Taq6ZeJsX79391aj4U5l0Wu4b9n+gMtxFfFf7avWd+jelzxqFd1vgXfo/L+4G6ZPyVKQslNCiOcoU=
X-Received: by 2002:a17:90b:19d0:b0:2a2:2b53:892e with SMTP id
 nm16-20020a17090b19d000b002a22b53892emr1531760pjb.32.1712905890476; Fri, 12
 Apr 2024 00:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
 <whpjtk2nmbft4dqndhealztzxh5du4uemqmmizguwvhmfa2htm@qcklwqf7j4d4> <xn4dyzwe4quhrpiqrvdikx4f46eucw25kmwfevcyt3s2mvggjl@enzbluravbt6>
In-Reply-To: <xn4dyzwe4quhrpiqrvdikx4f46eucw25kmwfevcyt3s2mvggjl@enzbluravbt6>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Fri, 12 Apr 2024 09:11:19 +0200
Message-ID: <CAOc5a3Mi1_oAOrA9t-2=0TVbs9Xr_HPBr_O+L7FgyAiRdf8sPg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Lukas Bulwahn <lbulwahn@redhat.com>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 8:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > -F: Documentation/devicetree/bindings/i2c/i2c-pnx.txt
> > > +F: Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
> >
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> >
> > I guess this should go through the arm folks?
>
> Could be argued, but I guess it is easier if you take it (because the
> conversion patch also went through your tree). Just 2 cents...
>

... and I am creating my patches against some recent linux-next tag.
So, the commit could really only be in your tree and the arm folks
would not apply it because the referred commit is not in their tree
yet (until the next merge window closes and they reopen a new branch).
So, as Wolfram suggested: please take my patch in your tree on top of
the referred commit.

Lukas

