Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC87828134C
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Sep 2025 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001437; cv=none; b=omUeZRWCYCo0+e2XgIUrufza5uAuFiayvtvBLC1xTtOlGytqtg5YkwlA2bAEU26ptCqtEm42PqwbmAoPns+bLTZNxWpnguTexgL3Qe0O8ZkZtEdQoXMPF1o+/G6H5RF8sSD9ocl0Jx36TdQ7GMj2jYwK5FZIClhLoCYH41v0t5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001437; c=relaxed/simple;
	bh=5bwgftlti0OnS19E8s5I3qUBUN5cb0H7I5hTJs1jaEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlEx96AQHsJHvp5WBMcFs3Z96iLW9wqu1K0uUVd7Sm4wSmN1yKsW0QCLBT9KDfIFq6qwqv0ogAef0bvCHU7sfIDVu8Hww3rQ+8Z30uokFNN2ih5wRk5FQLEhRngAi74JK8s1vKkcHjPQFmpoC7/AdR9HqeSSduoyQgrPvHDPyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wlu9umTu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wlu9umTu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24b2d018f92so203235ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Sep 2025 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757001435; x=1757606235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knBUAJ9UaN+FZLHj0gx+L4m7BuumlipWhHmFcevIGIQ=;
        b=wlu9umTujnJHZeYWpfX93lNgSOkFLhU4c/fWbrf+hzKIES8J2DN9jQ5vAyAjUrqUtX
         CjzT9pEIHd/3SPKzuH+gS9UYJxRBwzSoXWs9PuZbTniH/c08yk28M28OoXYx4FYzUbwN
         o0uR7FYWRTo1hqQvAH2x58rYpuzADKA99YzlxvGy4j/c1kOb+uBTkU0/8LR+N50SWSsy
         2KfsAqo6H93bFxFC9Ge1rYRMW4dbFv8hgmWuJXpnVMBmA2YgfaNYBYKmJbEJ1+QOJsdf
         FxDAx5ywNmdXI4tLdcEgaXFSTFEWd92maIEoTY27CoIWgHV91oXvzuX+9ldOIuK/qaHp
         L+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001435; x=1757606235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knBUAJ9UaN+FZLHj0gx+L4m7BuumlipWhHmFcevIGIQ=;
        b=BI+tqu8n/XLC2bqzYNMfvyPhMH8tjdy+BCNHH2ZovweEMxYlGjXTk0z71mfGb9Rt4U
         WuYk4cr43mXxpeKiwlSbIjWlWDXRa1S6/fLNZAFknw6lJo6KQqaFm5o5q6KlpBNGYOrl
         VlWoysz+SzADtSOMKTmPT+rNFKf7ZEmw6yD5770TAnho9nPjhoykQhnXs/DBYlDEvoO3
         yrY5i4MW51uOZ+wV2PO6vMeApCKCVTrhjD8/MoX7GQELvgrqsJACdgHaRt0RylGuyELj
         Hb4PDqvaZr4vCuP0TawWVKkNVJLJqwFZnJ2NGJDrpIPCDqQUF2Sk/9qSsZ4PwulrSyZA
         sHXA==
X-Forwarded-Encrypted: i=1; AJvYcCWXxuLm/ZgN5kyeoD7VGhUJdL4cY5fDccRj7UEqPOuZlznc6Nee5sVmrqt55FsHmke+NLF8wR67iVSGE5yd4M8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+n/bTZqNniQ+xInEAxYFclovfRjV3dbESZEv7u4uPgruEP74W
	Wtd0gAHXG8IYUu+0XisExojQNojn2lCIeU/h/H3Za79zJ2RP/go4TjMfUuOM2TFptjeS0L8+Qan
	VwnUYvgUK6Al1E9HcmrWyRCOb7BMTD56aok+1ITQa
X-Gm-Gg: ASbGncsYtNQF9etbKpUKfn2v4Z5JuKaXYEW+R6tMi8zkevWM5EGIelusoaO+TPAaLFr
	jobXGzeQQvaCpDNhRPVNYmYBdUBwzLaXaaMcSsz8GhXTaizMcHFVj7daBaT8LI0Q+Watl9s9kM7
	VUKVRalMysVDzNjl2mLXRecfVu5BW1lkie2yEnCQq856vr9YSmlWyIw2XTtQ+CL8QVe2Ou0riU9
	an/97gfkGt7RZzyeaW3AH7Upf534j6ONHCARd9LxgbLnYnVOkg9WdQ=
X-Google-Smtp-Source: AGHT+IFruwuAGBkh7rKP7RWIUwTJnAWvhVe1xHsgspTlHo9U/RM8g1S8GgdHNUpcy8Rksev/Q7nZoVg7U084PMlX+h0=
X-Received: by 2002:a17:902:e88c:b0:249:10e8:c866 with SMTP id
 d9443c01a7336-24ccccc4984mr3559105ad.11.1757001434759; Thu, 04 Sep 2025
 08:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904090904.2782814-1-colin.i.king@gmail.com>
In-Reply-To: <20250904090904.2782814-1-colin.i.king@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 4 Sep 2025 08:57:03 -0700
X-Gm-Features: Ac12FXwis0ieQjvaJDpAAZ-N5VUsQcVYBE46x0ADT7btZd7ypFajhQSQ5YJpnbk
Message-ID: <CAP-5=fVZ-mQTRzA2qkW2NjB_W_AvNJJ7mNJj5cBh1jJX7X8Btw@mail.gmail.com>
Subject: Re: [PATCH][next] perf python: Fix spelling mistake "metics" -> "metrics"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 2:09=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There is a spelling mistake in a Python doc string. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks Colin you are a star!

Reviewed-by: Ian Rogers <irogers@google.com>
Fixes: d0550be70f7a ("perf python: Add parse_metrics function")

Ian

> ---
>  tools/perf/util/python.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> index 47178404802f..779fe1280a56 100644
> --- a/tools/perf/util/python.c
> +++ b/tools/perf/util/python.c
> @@ -2187,7 +2187,7 @@ static PyMethodDef perf__methods[] =3D {
>                 .ml_meth  =3D (PyCFunction) pyrf__parse_metrics,
>                 .ml_flags =3D METH_VARARGS,
>                 .ml_doc   =3D PyDoc_STR(
> -                       "Parse a string of metics or metric groups and re=
turn an evlist.")
> +                       "Parse a string of metrics or metric groups and r=
eturn an evlist.")
>         },
>         {
>                 .ml_name  =3D "pmus",
> --
> 2.51.0
>
