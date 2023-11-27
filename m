Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nxQc9QJD"
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8A0D6
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 07:25:38 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54b545ec229so1731460a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 07:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701098736; x=1701703536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFaRky8SH2nzDL09jU7hfFgInTA8lMAJYDsp98sTKqc=;
        b=nxQc9QJDNPT1ncUZNV/OPQmXCbjxi4E86Kf4QN8plo9rKoz9NUEZW3gAMOxv4lmST0
         szq9i9y1BrXLaDJHTSHE7xwQ+sd2C87snINveLPgOCddACHH0XuWH+OQB6wVDK0K+hEG
         522uUgmmlJVvCNC1NOVqP6eH7oL6j/4EUuy+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701098736; x=1701703536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFaRky8SH2nzDL09jU7hfFgInTA8lMAJYDsp98sTKqc=;
        b=JKqoZ+kyVuXDaynfEnHpVJEOCnj22/EgHuCpbphwQHTCkLKbrABYtBEwK0p5OHh6b6
         ZoDuWWCGmU98aXRKrFCCDQhw2qye+3xs14B1K7ZrbhiAQMLI88AUaKRPGUtlHt1WZ8l0
         Ry2qPJvM7jxcNJjvdHVrSn3U3LxH26h3vEIINlDZKVvjLZL/EP9Sh0X0FgKPlS+eifL4
         57uAzu89s6IasQ3qhHYUB9ZE2TuajAm+VMIPBBJZj6m6T0Ios9/2HBRceeFv7s2DnNAN
         7QcryAEQSTW2n0zMn0+wwHjWWExHxIm6z92wCUO6fUUHIpJ4HcjUxMrD4PfOdsWT1KmM
         kJ9w==
X-Gm-Message-State: AOJu0YwP3idM8YlgD3UpsFKhdGBcHsP/Ty5VslJgqXg8hEQLkTgOCX40
	ACdQh/nHXkXq7UUlwvhz4gGv8Q1MkaQGlQUB9C8ndw==
X-Google-Smtp-Source: AGHT+IHDB1MI44LNfNrYRpvhJiIDsGFIZyp1wWpc3H8ZpWm0elkBAd2FZVhh5xW51MsF5Ey20sVxcw==
X-Received: by 2002:a50:cdd6:0:b0:531:1241:3e98 with SMTP id h22-20020a50cdd6000000b0053112413e98mr8498553edj.9.1701098736473;
        Mon, 27 Nov 2023 07:25:36 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id ec1-20020a0564020d4100b0054b9721ccf4sm121373edb.70.2023.11.27.07.25.35
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 07:25:35 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40b422a274dso75505e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 07:25:35 -0800 (PST)
X-Received: by 2002:a05:600c:3c83:b0:3f4:fb7:48d4 with SMTP id
 bg3-20020a05600c3c8300b003f40fb748d4mr587134wmb.3.1701098735390; Mon, 27 Nov
 2023 07:25:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dfb1a9a26d7f974371ff1d3e29eba80ef075d465.1700913863.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <dfb1a9a26d7f974371ff1d3e29eba80ef075d465.1700913863.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Nov 2023 07:25:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ui9bpzkn1EP9VCWGkk5+Q2E9D7QHxPy=2x9avMuNqARg@mail.gmail.com>
Message-ID: <CAD=FV=Ui9bpzkn1EP9VCWGkk5+Q2E9D7QHxPy=2x9avMuNqARg@mail.gmail.com>
Subject: Re: [PATCH v2] kdb: Fix a potential buffer overflow in kdb_local()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Martin Hicks <mort@sgi.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 25, 2023 at 4:05=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> When appending "[defcmd]" to 'kdb_prompt_str', the size of the string
> already in the buffer should be taken into account.
>
> An option could be to switch from strncat() to strlcat() which does the
> correct test to avoid such an overflow.
>
> However, this actually looks as dead code, because 'defcmd_in_progress'
> can't be true here.
> See a more detailed explanation at [1].
>
> [1]: https://lore.kernel.org/all/CAD=3DFV=3DWSh7wKN7Yp-3wWiDgX4E3isQ8uh0L=
CzTmd1v9Cg9j+nQ@mail.gmail.com/
>
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>    - Delete the strncat() call   [Doug Anderson]
>
> v1: https://lore.kernel.org/all/0b1790ca91b71e3362a6a4c2863bc5787b4d60c9.=
1698501284.git.christophe.jaillet@wanadoo.fr/
> ---
>  kernel/debug/kdb/kdb_main.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
