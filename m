Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE52F83A02
	for <kernel-janitors@vger.kernel.org>; Wed, 27 Mar 2024 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711539400; cv=none; b=lJviGqQjn/jecAqgOUYRPS2iRgb5ZAh7uCXC+P4w7+QH5WpJMUyegzCqmkbpsQqY+wqdrZJcMq11ftOwIko8l372UxDUKvoYXLJNlZedE7IC643YoPZsuwNeKN9W5xN3wOjfNbOoTgGlIidAljGdZeuFZRu4nR5ZcgppRmwS+50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711539400; c=relaxed/simple;
	bh=OfJ34edQdwR8YfjyjKeXgQdTreuHD9J/AXKmoBorsbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAxiOXN/8Y7jB6iJXCiEpGJCucnN2ZyMTXOolk710w1JuUfwehhcX0loohRPAeBpBmgA3/s57gK37lhK8KbKkpGyQQ5nn9JyCVHp8kK55Qgjpg1o0OvqOtXzb6yZod+YpbB/DXfK9a/K9H+qecUlPpRAuo4i0SXoRYv0ceVJpb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com; spf=pass smtp.mailfrom=kylehuey.com; dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b=P3BFe74e; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b="P3BFe74e"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56c404da0ebso587694a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Mar 2024 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google; t=1711539397; x=1712144197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAkgcXLjhZa6wcaapohBL+DoehmK0FlS2sc4nFrXi/Q=;
        b=P3BFe74eRUuqo5sTR65zvK54vVjQc/z4XiNst1ZkOrwXOH/d6Oez56UInmIqjBoki8
         EqhVsOmqCPI+iQJopZP1b4ffyQ0/T52OoBUcLM7/MRyNz8r54GzpvCTzCYS58LS3gu02
         tKdefV3FRgT7SCbu4v51KmrlkFyC/IuyeLjuz85pp8Gl3RC8XO+UQ3KXPrM7PebztRXY
         sLRV4yNRago/udcW1Rpj0IFYYkueoHjnZHLSYydAaT8ART+ftscgHRg0+Kn4bdP6pSVG
         1+YFXUQjycwa7oslFNvD12RKYp5QU9453M3l5k43Zr1FBMd9XiFknVDEcRlMdQT/Xl2q
         1JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539397; x=1712144197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAkgcXLjhZa6wcaapohBL+DoehmK0FlS2sc4nFrXi/Q=;
        b=Umf3p/Nib9qA03hhR4vtkgGdF7tSyZr9d8/AaL3NTPlJL2s21Yhy7UDtUGiufmAOiv
         Ehecig02ebD6CFOlvSK+qvIK0Tj7OujSYsl0p4dv8FziElK4eTX2UeF5dVxVGE44rHlb
         5zH/4PrZC/w7V5aM7VqsPfYOhXirjMNj01ofGW5lKpdtoWY7etR5YB96tiL10UjQXlRU
         ffYVwIJWnCPrzT40rHcDkoSnKEPbYPu8MkmbxKAlM7DEfBFIpQIsxFgZxxtjpwuOjxVk
         Vb0ZW4iwdt6NrAlcjMT6QAyL5gfoeCCqW43gcTvfunfMBSE9x6q60ST4KxXehYk/fGeu
         lNyA==
X-Forwarded-Encrypted: i=1; AJvYcCUVVwdtE2OYFkiRstevKg1yw7hcp7t17ODNa9JgQekTu6l6Lqw0jD025OAohW/z1FNxHvRWCDAYWvxay8FOu8ejuenakDK1kwus9dbOEIbi
X-Gm-Message-State: AOJu0Yz5gNFq1IgxOhz4I7fcHp/LbfO9wFxnKcbK8PdPATx4awmoJz8v
	dDkCe8yAxr4sAxN/MumBPs6zEdGebRTmxdZU8HkVDXBuqU+62KUZ6s0zI7zvEiLvYteGmgTGr0l
	6nPM0aZsGQCdriSo6ok//K7gqHoYMgPhXRsv7
X-Google-Smtp-Source: AGHT+IEpF6U85JTj59UDS1Rg7aYSWvA10cmUTXBqiIxQe9j9lt2l3bWAwPMTLeu+e99ar/OWuiRuS6HUexJAdVNQfTw=
X-Received: by 2002:a50:8ace:0:b0:56b:9f82:4a40 with SMTP id
 k14-20020a508ace000000b0056b9f824a40mr4142377edk.11.1711539397221; Wed, 27
 Mar 2024 04:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327110649.283925-1-colin.i.king@gmail.com>
In-Reply-To: <20240327110649.283925-1-colin.i.king@gmail.com>
From: Kyle Huey <me@kylehuey.com>
Date: Wed, 27 Mar 2024 07:36:24 -0400
Message-ID: <CAP045ArUu52sfJGptaBMYZobhvLytpWZYpEmYjVY3tzX1fRR4w@mail.gmail.com>
Subject: Re: [PATCH][next] selftests/perf_events: Fix spelling mistake
 "sycnhronize" -> "synchronize"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 7:06=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in an error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  tools/testing/selftests/perf_events/watermark_signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/perf_events/watermark_signal.c b/too=
ls/testing/selftests/perf_events/watermark_signal.c
> index 49dc1e831174..e03fe1b9bba2 100644
> --- a/tools/testing/selftests/perf_events/watermark_signal.c
> +++ b/tools/testing/selftests/perf_events/watermark_signal.c
> @@ -75,7 +75,7 @@ TEST(watermark_signal)
>         if (waitpid(child, &child_status, WSTOPPED) !=3D child ||
>             !(WIFSTOPPED(child_status) && WSTOPSIG(child_status) =3D=3D S=
IGSTOP)) {
>                 fprintf(stderr,
> -                       "failed to sycnhronize with child errno=3D%d stat=
us=3D%x\n",
> +                       "failed to synchronize with child errno=3D%d stat=
us=3D%x\n",
>                         errno,
>                         child_status);
>                 goto cleanup;
> --
> 2.39.2
>

Nice catch.

Acked-by: Kyle Huey <khuey@kylehuey.com>

- Kyle
