Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4859A28DF20
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297413; cv=none; b=Ra/XHae+cSp7L+TfWcmw1x5uATBsGFSBQZ5+Cm4n4O+lp8tTbXEFXYa4laGDnymD0hcl+Wcgr1LIB1xPtMqjFmMlW2uP6IpxhYfeHiqtn7RoNcNjohb+Wx6RZ06u0JsRux4XN1uoq7mft8+Efiu3fLgO+dXKplfOZwCUDnoqbM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297413; c=relaxed/simple;
	bh=BllDOR4O1NYlxxDEccGjhAe0ikj+1xUpBu6bzDAPMFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTeVax3Ef7Y8f5TLxn2QgnUe02gskKYdbqJY8+v4FC/O1tmxYJ9L+M40FVvrhJX6BYHY7/4oD21Q6q/sq99SGRvis9EHZPJmyv9Px7c7/8w3iUoGGvgmqKxW7lGFrfyV6U6AXCSgdbc5U9EEA40Q+zbfqTUrgYFWf0uC+EKENWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qhW26vG/; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qhW26vG/"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so528945ab.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297410; x=1751902210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6opsNc2co1b9mTJ74/l+IUJLN4M52h5MNn2ClhbIZEs=;
        b=qhW26vG/Mr7tzUf/NC4FY+VqQ4ywMFyFt0L9pd3tpIz+Wyvw8wh7MyBxFsFVFXslZ5
         Qv8rrnrBMC1B6dwdOnhmJ9Pc9FcuZcCBqzj3mdWwtvSFy6WD5E/v9j0/xLQMT3FFIPMh
         kA6G51xet84pjsUU13J/+Vi1kgHgevaiKpj7WB/+7T6vFYnmSxbywV+nNMOFrM81K+7O
         P/EycJVficsau8uHoDc/dXUXaF02wDdElZS8aUP0/hdg9K4mAL1qe0iu3Lkiwzf68xQM
         67EctCmIE0NBobjSr0kP02GZNe6sxMUGubDygdAL9YKgL4uXo3Umm7Hf0CGSlfpxsydE
         ig/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297410; x=1751902210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6opsNc2co1b9mTJ74/l+IUJLN4M52h5MNn2ClhbIZEs=;
        b=CekgixXIIHaYMdxXpaeLqaaGmsL0uod8l57OpL0r6S1jSDIlXtmiwjX+9MVf8Pysdw
         O9nNhurBjnv2uM3CRrD8D0+BkEtKY9FkfaYMf5DMbU6b3wfxh/0KutX1RmlURN2+ACeb
         viomjEPV/sy3JtezZKfz0fK+odZIutluZVnXUvWHlgPb/HlKfmwl9TiB+tVYwmN17Ncv
         xmIrO8vyBnt28OFzZwlXJFsAe/XBl5DTizkYE8ean9ZJnfn6U1YFt2/Epd+oC4lwYSqP
         otxikaBZhz9cK6xF/9l5U/q3irbVKuEKiLPfxfMsTDimJ047nQMe+HOUy7Nxz2Duymm3
         FAGA==
X-Forwarded-Encrypted: i=1; AJvYcCV1lWWTX8Sg1ozYhaufVwyM6y4sbzU5dI2JzsIOWBG3ofkmu5gMPz4atoLq62MkV04jAXO9Be5Wc79uneLrBVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBmcr9my9SDTWEoYrGBHhLMyYDu9s7YjIARNZxlaivapmNVql
	1fd6pHE9Ot4OKy406xNx4aunADW+R+eqnjsnMXZ47tCA7rbZufnUiqKV7ExtcxEnMZL6UZnzKn7
	PZs6FkGBbeeCSniMwZGRyFckZYz7Xvj2zduLBCfeSi8dwH+K+msgw0O8klsE=
X-Gm-Gg: ASbGnctADvL3k4OrozgKTM5H+n20beAU+mVoZAOnUv3/k0Zb76d8N9a5qjYB1oddohS
	uigJH+QGVw9oU1u3QS0f+7cDHGpTGh1Y0gq51Tlbbz9bdGVBxL+5DGTsJuT++sr3e8cnmVCmujO
	ZkD2UM4f2LaDgw6KwnvlxRpDhwdfTFUHnIRYjAFKlTFuHMMuaUH/iaHRJ2Bw95pJ0Ice8rukM=
X-Google-Smtp-Source: AGHT+IGQGjMzPYqvHrrPwqf1QhnlH7tNKERMIu8sSHe9FrHU+qXbliarAAJ+DGV9IkdSguiOBWpYvS4klFTzpBc++hg=
X-Received: by 2002:a05:6e02:11:b0:3dd:b59b:8da5 with SMTP id
 e9e14a558f8ab-3df55381c7amr8194555ab.0.1751297410001; Mon, 30 Jun 2025
 08:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630125128.562895-1-colin.i.king@gmail.com>
In-Reply-To: <20250630125128.562895-1-colin.i.king@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:29:57 -0700
X-Gm-Features: Ac12FXwzUlNEDX7sNWl994RL2RjvyOQSm7Gp0RQD_NgRL6DsWH9nOxgzUZLtCTU
Message-ID: <CAP-5=fXUjBE318VhCkS8qrTTuho33T6kLP_SGXNt13QQZLzuiw@mail.gmail.com>
Subject: Re: [PATCH][next] perf drm_pmu: Fix spelling mistake "bufers" -> "buffers"
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

On Mon, Jun 30, 2025 at 5:51=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are spelling mistakes in some literal strings. Fix these.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks Colin!

Fixes: 28917cb17f9d ("perf drm_pmu: Add a tool like PMU to expose DRM
information")

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/drm_pmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/util/drm_pmu.c b/tools/perf/util/drm_pmu.c
> index 17385a10005b..988890f37ba7 100644
> --- a/tools/perf/util/drm_pmu.c
> +++ b/tools/perf/util/drm_pmu.c
> @@ -210,17 +210,17 @@ static int read_drm_pmus_cb(void *args, int fdinfo_=
dir_fd, const char *fd_name)
>                 }
>                 if (starts_with(line, "drm-purgeable-")) {
>                         add_event(&events, &num_events, line, DRM_PMU_UNI=
T_BYTES,
> -                                 "Size of resident and purgeable memory =
bufers");
> +                                 "Size of resident and purgeable memory =
buffers");
>                         continue;
>                 }
>                 if (starts_with(line, "drm-resident-")) {
>                         add_event(&events, &num_events, line, DRM_PMU_UNI=
T_BYTES,
> -                                 "Size of resident memory bufers");
> +                                 "Size of resident memory buffers");
>                         continue;
>                 }
>                 if (starts_with(line, "drm-shared-")) {
>                         add_event(&events, &num_events, line, DRM_PMU_UNI=
T_BYTES,
> -                                 "Size of shared memory bufers");
> +                                 "Size of shared memory buffers");
>                         continue;
>                 }
>                 if (starts_with(line, "drm-total-cycles-")) {
> --
> 2.50.0
>
