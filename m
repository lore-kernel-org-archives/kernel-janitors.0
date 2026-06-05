Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E191F3B38AF
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Jun 2026 02:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628304; cv=none; b=nWovbC1TzWz96xL7rbbzVl6o/ewJglJHtamahrhtqoFo87wrP2zAVCHywedm5kBb2Wnz7BPyBpOoy95lE3ENI1IZwn0ehi+4I4HYDVXJ6YWKZALPI4Y6EBaDPRavt4nbnySNAiFmw00t0Sy5lpGeYSYn+Otud0mJbqOW2gGXZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628304; c=relaxed/simple;
	bh=o+/PtSqXAX34dsMuEnsO65jQvtJSlKeuiNIBboPvtkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcobTn8AR8FNwOufH2PFIX7Si9RowfsIR+fk6egFqsIiS2sR0FasQAQYEa8nR89Lnbll/3KCIjvtLtTp2+ezf3Al+0J1lZHLYeb2GgUWI8bu6HrqlSEhCF1qmWx1bkaBa/7kDV3zfUknPFmUduzy9TRm4g8dIxSllELW/I+okE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eua4KSTI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eua4KSTI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539681F00898
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Jun 2026 02:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780628300;
	bh=o4/gtuY4rDjODNkSVcliXzjeCYk36SUwHSb1oQckJyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Eua4KSTIguulYp/inuy0aWnD1493Rhz4OXyVbzXxg1jcN6GAyASf0MuDRM2tgjDol
	 fVjjwVl+Wa6EYxv/Hf1Fv0JzlMvYyjoKyJJ/WXXk5SyMGNsX32naHGKYWhb7DVo7bs
	 tA2oufhi7ahqWfq1sAnOJpbno/IeSKNmqrtMLSD28YZPvOy0odsWwjiuWYkQ/aVV1d
	 uhv7CNfco5BNVg+sp/TINT8IXRGksYViTVFgDROC+/1rs2+7qnmkm44T1edFNSQI4j
	 tLZ9Y3Yq/giWtI8EcZq39Opwi9x72IgZGFjYiP2LuUThPhTnFlywrpHz7OHCufl8Gr
	 5BqUrsWH6sGtg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68c08bfe5afso2583109a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2026 19:58:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QgEm81dkizxPIUWDXTXFEEQIrCdNtMg5UQRMx4tedp4duH61U+iyUSWmEWIk/qmB9YEzMsXM/3lgPe0NnabE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXrAMSdL4KNS7d6Bi6lsrT9GBN2OjhJcwE7tRN2+Nd+3jRvls/
	aluRSBBMhjlR86wLz8btYQBslJVn9jB7OKZ4SebosG4oNtnxEOFmhCyw8zkj6+EH3dzGsEmUyXu
	d34F3kJVeZK95RU22DsHiS4yecvhT0kw=
X-Received: by 2002:a17:907:96a2:b0:bda:8e57:5639 with SMTP id
 a640c23a62f3a-bf370f6abd5mr64198466b.20.1780628299069; Thu, 04 Jun 2026
 19:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
In-Reply-To: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Jun 2026 10:58:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6eFwN-f3UnXxo==Ywt80krR5L_8qFTWriwSpk5sF978A@mail.gmail.com>
X-Gm-Features: AVVi8CdZ5nQcQsP6vzLwlMEtDKpuY1W5PFb2ZlJD6pFiZ_GeiQdNlREzTC0FhBc
Message-ID: <CAAhV-H6eFwN-f3UnXxo==Ywt80krR5L_8qFTWriwSpk5sF978A@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: kernel: proc: More efficient data output in show_cpuinfo()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, 
	=?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Markus,

I suggest squash these pieces to a single patch.

Huacai

On Fri, Jun 5, 2026 at 1:52=E2=80=AFAM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 Jun 2026 19:33:55 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (4):
>   Simplify data output
>   Combine two seq_puts() calls
>   Use seq_putc() calls
>   Delete unnecessary braces
>
>  arch/mips/kernel/proc.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> --
> 2.54.0
>
>
