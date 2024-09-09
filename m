Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B16AB8
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Sep 2024 00:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725841851; cv=none; b=X0ZhLZ+UJjQBfUvGRczZ4PSP3Y3hcq1KQLzpXKZhBcppRYLXobUrm4tZHi1bqDpXU51QAXQTNISVUk2DpiTQrNLfgPX6grLlC7OmfQyYYqX0mNyRTrS7HWS4LyWwOqddtCgpLuv7RbaLOB5SM8UGk4dqZj3ermCXjOT/KjMxmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725841851; c=relaxed/simple;
	bh=wPV8YEoYLGqTx9bO1llFaMyCiCsTU5XfDU4kupMd/c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLkuYWQNr9foGE3EZ83uOkqjs3zkmusZ6Jm8zEW0yebgxniplN9N5jctMHTO9YtVsCpd3TspOuxd/RwkYw4699+VmjYbYrPZe53+dJvHj5+AxaUFILiljwmCw2xq0L+629qt6eir0J0BmnS6G6Sy57s8TTkljQR6xOftv/A9TCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TW78uOL3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TW78uOL3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20546b8e754so261575ad.1
        for <kernel-janitors@vger.kernel.org>; Sun, 08 Sep 2024 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725841848; x=1726446648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJjhNLbpnc53C/tv3mczouRD8+CJs7f+bOzNSZ5DZtA=;
        b=TW78uOL3GeTLI+Hxjui4q3GiWM5unwxfp0CbM7cgFCkzqhf5JVL3rk9eQOTHCF47Y5
         NXEzcMmUX6rfCV38Iv0lVQOeOGFY3CuH/DfT+SaSNS81+r2eTEtsx9+ArPSPduWSJwWC
         SVFumkZzfhudHieEDWSsH4z+uL9+g4Q6JYsav6LylfpBIa/nqtyB+w+n57UG3COrypw+
         jMCSstM5n9bHDMozwIC5suAmmaAHUU+KJ6+HO0sQ43X2eq0KtzULt3D+yr2Ap0HVfPWC
         qi3XnU4GpfluU0Iyk7ANcPNjNhx5+AHH2/rGSY7kz4/l59klmDBMqpguFGSMU9gz27l7
         cK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725841848; x=1726446648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJjhNLbpnc53C/tv3mczouRD8+CJs7f+bOzNSZ5DZtA=;
        b=t5uH2E3pmPVoQT79EUsJhxSzKRf/nlIqSSTGaO2y+3FTf7ufKIWK36gRnot0CqIOR4
         XAVfan+KLy85od1hsjfTxeBAo8B4WWltPnZA19jNrneSmkFonNGRGfTL4gXyHOlub8Wv
         8D5MC2zK+QUeHrthMZxoYsuyMnttGJuG+ACZ3el3+f+MFkiSBApUisbYsBccoDUiZ4TX
         zTZYTtjBmlunNZ8xQ57MzEJfzzofEJ99Odj8dMLyLm6seuuBr6cMXGsFPJpFycZpb8HN
         AbTLniU41/bGCBoocm8Mkum3kN2pBZFwYxbktCPxkaIFxj826hCgmx+mbZ2/L91d8VQc
         hFjA==
X-Forwarded-Encrypted: i=1; AJvYcCWMVOFLBtaN/xTI4pC3f2CmrWfrjE2kBcqo8JjuRCPbwfOvu4G6o2Bg+9WEvCLQlTNremFWwDRrf+glL/Ih8dk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qbUQuOIAXJXZaRPeBR+Ijwzk71v4sq3z/ktue+dRaXyJGKIv
	a7BGFvvBCaMeoVi0vphamwrXBFoYXGFFXwRbpngRRr9h+j3JSQA/CH6tZvkTwoZt42ETIkTK+4v
	tvmfY7BA1qmbvUexlrJ6Om0CiAe9dXfwcac28
X-Google-Smtp-Source: AGHT+IGowZzSEmTKRevgtTKEx/JN1+vLY4SrQ8bcDLX5CnwXX5QhslEZ/rC448FW8Ec5061Ba82Z65wAVG0P2JfReNo=
X-Received: by 2002:a17:902:c401:b0:1eb:3f4f:6f02 with SMTP id
 d9443c01a7336-2070a839333mr3341795ad.12.1725841847501; Sun, 08 Sep 2024
 17:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240907131006.18510-1-algonell@gmail.com>
In-Reply-To: <20240907131006.18510-1-algonell@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 8 Sep 2024 17:30:36 -0700
Message-ID: <CAP-5=fUW1z++JdFHke8X8Ou-grBRK_8rYPgd+CNjVLB9iZ5csA@mail.gmail.com>
Subject: Re: [PATCH] perf tools: Fix a typo
To: Andrew Kreimer <algonell@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 6:10=E2=80=AFAM Andrew Kreimer <algonell@gmail.com> =
wrote:
>
> Fix a typo in comments.
>
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-help.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/builtin-help.c b/tools/perf/builtin-help.c
> index b2a368ae295a..0854d3cd9f6a 100644
> --- a/tools/perf/builtin-help.c
> +++ b/tools/perf/builtin-help.c
> @@ -417,7 +417,7 @@ static void open_html(const char *path)
>  static int show_html_page(const char *perf_cmd)
>  {
>         const char *page =3D cmd_to_page(perf_cmd);
> -       char *page_path; /* it leaks but we exec bellow */
> +       char *page_path; /* it leaks but we exec below */
>
>         if (get_html_page_path(&page_path, page) < 0)
>                 return -1;
> --
> 2.46.0
>
