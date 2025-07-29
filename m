Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC31BDCF
	for <kernel-janitors@vger.kernel.org>; Tue, 29 Jul 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753794754; cv=none; b=RbGqTpYbJU7NA55M/Ln7WWI2l4c4+5jyUrkgybU8VkBnxFzwKVnwvbqOsz8uoZHoHm8eVqLFeA7/DRhe4q+lnAcq+bJOensUoekTTB0WYxqDWUpBzH5Kzbi0NuaPVdfTX20DzemtqmtrQPtE9S1hVSDStou8TPxMNwdyTovQSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753794754; c=relaxed/simple;
	bh=yGktK75e2PayS3m6dLJKhN+QyBnGs9rTpFNh5Uw1tH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1k3Z4Do6/j0RqluDWJl/PzJ0HoGWw0AveFfcpyb8NH1qOv8R8Kpdxg8H4EDgjwWrljOIYjYcEgJ1KWVXC0ynd0fF3TwTH4bQG5zdsgiNutgsqHSz71Zh5lkB/VQ3TFBO9+0sH5pjAOU5Tg8bIjUMEKcUWmQwqEDvvTaMHYrxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XE7qB4jH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XE7qB4jH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753794751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGktK75e2PayS3m6dLJKhN+QyBnGs9rTpFNh5Uw1tH4=;
	b=XE7qB4jHrLlga2CFLQUStx8Gbhy74hlcLXlPpiRfK/5XGr71wuy2LPkibzqeQgnBAkU/HM
	RapGPx77Q9rY1K/BvA7cpoTKqq1gT7+RG+VDceo8sCvTkVto12aTXd5cXlUQ9JQrixibCI
	xS9rswX1mQ9nMLLlTT18nsEDVu4J8Tg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-C8AZxX30PAOYf_pShKcixg-1; Tue, 29 Jul 2025 09:12:29 -0400
X-MC-Unique: C8AZxX30PAOYf_pShKcixg-1
X-Mimecast-MFC-AGG-ID: C8AZxX30PAOYf_pShKcixg_1753794749
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31ff607527so4851788a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Jul 2025 06:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794749; x=1754399549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGktK75e2PayS3m6dLJKhN+QyBnGs9rTpFNh5Uw1tH4=;
        b=I+szezNVuTwbcH1TL9irpA6B1Ny6tEjP2jH+g+WZp+aUySO0mVB7zBi7f1rD6vTTVh
         GEferh/WwtcjAEv7KhGMDhvbfPxlNF2mrdB/tINP1kGpod2VPLyCFJY5EvSYDA8/6Wux
         r5kLSm04MeICwLIVZgOFmi8CRN+20pLRhbMNnPsYxhMQS8yYMmAGYmEi+OC7Lz4Q5TJW
         6iysVA2r6ODLdqXaRodGYOvs9hZqkfl6J5FRLkzN7S0Pqq/EDjDpxpiLS0n5+JAOvtBP
         tFc8ClGCMRXfJBsA8Us0aBt0leArDPO0VEoY4JVVnTfj8++0ejNJ6zmIxbBYlpU5eGyQ
         zOeA==
X-Forwarded-Encrypted: i=1; AJvYcCWrGo62mUtQWTzH5Fx8i/H+GjUBQvSv+HiKP3rjbRsWKDVdhHNol0LFpd/CaQ+N9jn8Ommse48qPbt3pvLLsuw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjy5DHcv4lO5SzZvnWWQY7WF9eLAo9X5ZLWrl3tWqA/gZfEGqY
	iKSAJqggh1TWd73GiQun9aizy1M7o8c5kXCGBVtNKutO+z71vhYhGMSuB95k0xQHsrPTMlHDOjj
	hhtklh+6FYLEIn372THHdB2qgcSdN+EYV3tyPaF1uVWAvsk96BBNo4QfLv9QeH+CgxGvl9X1yD/
	0IVpzUdQi7Kl10TdZUcZLaPsttp7tzwweLle/R8+pHWhRq
X-Gm-Gg: ASbGncsyyCHb2vrWP5c7E8Td+z/rxOTXKGWa8NpgzaEmuLUcCyW7frQbrjnCvJdCrlO
	aw20QL0HfeRr5Rd7hEYbtONP9SmMpoqwKnUEwERLYE5gzIrFeeI0FuzoHvMRrKPcIwprNsSlxWC
	369WDokq957/ifZVrYafo=
X-Received: by 2002:a17:903:320a:b0:23d:d2d2:b511 with SMTP id d9443c01a7336-23fb30cb6c3mr225672315ad.19.1753794748602;
        Tue, 29 Jul 2025 06:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1psn3OcEesGJHe+B3xilmqfbqkCCVe1Iwh6GM5j1+Rv5K7pbahMYXP+auHAPPU4oiuTDereeklBYW5LyOIuI=
X-Received: by 2002:a17:903:320a:b0:23d:d2d2:b511 with SMTP id
 d9443c01a7336-23fb30cb6c3mr225671825ad.19.1753794748111; Tue, 29 Jul 2025
 06:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729113638.1925201-1-colin.i.king@gmail.com>
In-Reply-To: <20250729113638.1925201-1-colin.i.king@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 29 Jul 2025 15:12:16 +0200
X-Gm-Features: Ac12FXzgLBMRVsOJXcgqlJnJHj6Of1bbYEOVyc2J0oa2XadRWV0FlbBU2KJNSYU
Message-ID: <CAHc6FU5eD+ROzxpe1tjP99EthOWKBrd8hWToPj5mPurki2JyZg@mail.gmail.com>
Subject: Re: [PATCH][next] gfs2: Remove space before newline
To: Colin Ian King <colin.i.king@gmail.com>
Cc: gfs2@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 1:37=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
> There is an extraneous space before a newline in a fs_err message.
> Remove it

Thanks.

Andreas

