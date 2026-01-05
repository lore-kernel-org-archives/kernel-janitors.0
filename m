Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6917A303
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Jan 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609527; cv=none; b=h6P/2745/hosEYZjgTG/WoJ2rEkCRqsz08G7LBekiVpaP1uQoeGa4N5UMB/zW7Lo9EAR6aqYSGS0Nt5lOinMlILza656z/XDD57UlXHVg2KBCEN3cqZtgMedZI0wiZ7jTv/QqPV+8LsaBfwObEskvgXxD1gwYCSylhZ0G+A4y5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609527; c=relaxed/simple;
	bh=KXLosAKj9WTZoqxb3cLCJTfmO0KCMCIscavgasNNB2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ad5k9Dv2CzplUSJTpb6Dz1EyfB/4bykZaPPOVH5XitUNgc2rfGn7h17vsRyP26XfGjEwoZP1c1j/tYp/Yagbb7MGqXmIKGd3XCR2rWuUBpIgvuXYFPr18rT150zNFe2GN5XO/N5eN/C0tTWwy7C3RIPF/Ok7W1E8tjgiayGzJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4o7QKkF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4o7QKkF"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6505d3b84bcso382357a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Jan 2026 02:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767609524; x=1768214324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpr1WOrht6j6ORsQatZtyLhRtfXLJi3Q8MSwGacBmmE=;
        b=K4o7QKkF2n+IltFxHs/Igei/OZdyzJd+RxjP1/ZcwxRRc7ajKfBpIdpSngsqCXnUjG
         eAhyMnAC83I7fITmmjSdaefI8Q2M6EAY25O+uw4r+ARAAasrxoOKjk/r9gHkSwCG0Tes
         GyrW4z5Y53O8y7N3DEmazmaBdft7rrvbyASnnTNUXEDtaF3T50gLTveajIgcyqRjO9Y8
         GcRzkxpf/ZvQ6+s4TXU898V8hUBcv/JDSNCa7dYESRfBvVOCEeiC5K0GoN9VaELnr8Kt
         8jcx9xTboygibhXs3riIbma4aGpLVUjfz6otTcxRNRigGsaszeOb7pt8zUzjeUJr4BHd
         xGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767609524; x=1768214324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpr1WOrht6j6ORsQatZtyLhRtfXLJi3Q8MSwGacBmmE=;
        b=B97SjmYQd1qa8dYm3PjA+uJHLv/wx+Io97BlLNhD4vto+LRnDMKPK3WMLAUTdDP93A
         jpgjyMLUjvSXXD4TifqOOZjvfk8DnWtGUcWXQZ1TVO4ymGSYdd0/DRyFdhJxYk7V8Euk
         fhiRq4DhkBT++oECp2YduW6X0JrSWuCUBdxORCYYFHMLb0uJ6nISPkK0oYdSAVUpmTIt
         B1GO+tP/0rvAi27Ymz22snhd5kqC0kRdFHS+OAAYv5DGQsDn16uGVQgqWwk0HocraCtS
         EJ1eOZZMZnndPl+1DYzyM0QbYCvvb9SUp07659+9fyQjkLZOLlBr4Hmo8VBVa1YiaeKH
         kacQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLjggsVR1ZeQhA+7So0LZZCBNwYPwOcfHyu5LN6YOcjsEdCPvL0yR/qVgGp5+ynkqSBCFw//SiVZx/QYcx1xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjp1N7TGqCEX145eklz2UgBMxWSNfgMku5Z5sIYP+O6rCdKmxD
	mO5aobgDElPZIZkYlX6Q1b6fGCp+abw165DgF9m8f/ijuIrBryrWJik71X3LCEFb/7iFIn9Na8/
	igFCDNlcwpUI4XaNVo13pu+WcNED7gfLapNgs
X-Gm-Gg: AY/fxX7On9ipa7MaeSawSYB25Md7gURIEaUTIjnVc/jqxXvZfjwj7GJ6xAZvXR2nJA0
	Ay6JtGtaW1i3ceCesh56CsJ9qmo5Gcey5rMScBZywKBJsfQmAiasNBKbe4ffT+bg+g+YFiIZCMA
	TyvJb0n+DggTQa3TSdYC4Zxn1lWiqdiYH+w11e/NrcuRwhu8mV6vfFyg7a+8PycZdtKyrXGjXMe
	NUo85cqpD18H6nbr5yoIm3/l2lFeOw9qXFShjLjrCewDMiaguo1afogaUGoDMEREEN7k0Sc
X-Google-Smtp-Source: AGHT+IHve9mtUuYnBvwRtwl+XG1rrtZF7lTbS5cmb10zuaOisWC6Q5wRw7gN87SXZ2xj5LiVrwPD92wuBLz5gGcL/fA=
X-Received: by 2002:a05:6402:51c9:b0:649:b200:afe9 with SMTP id
 4fb4d7f45d1cf-64b8edd8b54mr44168355a12.27.1767609524051; Mon, 05 Jan 2026
 02:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228063440.2623595-1-safinaskar@gmail.com> <20251228063440.2623595-2-safinaskar@gmail.com>
In-Reply-To: <20251228063440.2623595-2-safinaskar@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 5 Jan 2026 11:38:32 +0100
X-Gm-Features: AQt7F2oW0pJ6x8V2KE_T8rhdE4-ywJ_uvZca_rX5x6NdgmoMtVTx5Rb8XUCp2AM
Message-ID: <CA+=Fv5Ra7fFTd2wA77iM_6X7NooApfoMJX5z1j60cXex_uxm7w@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha: trivial: remove ^L chars
To: Askar Safin <safinaskar@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 7:35=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.
> I'm attempting to write my own tool for parsing kernel code.
> And these characters complicate this without giving any benefits.
>
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>  arch/alpha/kernel/core_cia.c      |  6 ++---
>  arch/alpha/kernel/core_irongate.c |  2 +-
>  arch/alpha/kernel/core_marvel.c   | 18 +++++++--------
>  arch/alpha/kernel/core_mcpcia.c   |  4 ++--
>  arch/alpha/kernel/core_polaris.c  |  2 +-
>  arch/alpha/kernel/core_t2.c       |  2 +-
>  arch/alpha/kernel/core_titan.c    | 10 ++++----
>  arch/alpha/kernel/core_tsunami.c  |  4 ++--
>  arch/alpha/kernel/err_common.c    |  4 ++--
>  arch/alpha/kernel/err_titan.c     |  2 +-
>  arch/alpha/kernel/pci_iommu.c     |  4 ++--
>  arch/alpha/kernel/smc37c669.c     | 38 +++++++++++++++----------------
>  arch/alpha/kernel/sys_marvel.c    |  4 ++--
>  arch/alpha/kernel/sys_titan.c     |  8 +++----
>  arch/alpha/kernel/time.c          | 10 ++++----
>  15 files changed, 59 insertions(+), 59 deletions(-)
>

Nice cleanup work.

For a v2, please consider adjusting the commit message rationale away from
personal tooling and towards general readability and editor/tool compatibil=
ity.
Otherwise this looks fine to me.

Magnus
