Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED61944D
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kUc4CRwP"
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C978298
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:36:34 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53fc7c67a41so11910551a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698683792; x=1699288592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xavDmDYDKGApF37pHfgaeVpvo2fMN9hqfhiSorYJU94=;
        b=kUc4CRwPR2GBlOsecyBr+QjtRkefpigXdSs3oescTtah+xV2mj0aeHdltzbKKdtk1I
         ckq/n1Kxhrn0RZ9nClR8bmqFpzRp3nykn1LSizHTlnrjz3LIo5ufMWld1nTBPtCGVzDH
         GI+7nUrEGOjq7VFMyGVXKafaRgRot67+fjB3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683792; x=1699288592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xavDmDYDKGApF37pHfgaeVpvo2fMN9hqfhiSorYJU94=;
        b=l1x3YV5MO0p4WnNwB8qvAivyWcNVe7aUNW2pcgJXiSjRp2ZT6piHB6QzoCShD5Kj5d
         qmLRPaIMX6hVUzn2KFXJMib9hNQz8UHg3HVu03yJwH76UG1HKNWY4MOhi8bHB5vL4qlB
         6MwdvH0xhUN9num6cKM0mHUbTk+wmTI2CgpEqJEjgVNv2lox9wTKGr3wsmHLIyulvPBm
         ptSfnlcmog4CI9wbYCPOtWTTee0NfnEOdsUG5ygSDqYP+lCQB9ZmgC/XwbTFJyZ7a8lr
         1K3titVT3SGZEn1SNNNXFGbVqRNBSW4hORDdiFLkYtKopMRifbiHM2CDalUV3AnAql5E
         fk/A==
X-Gm-Message-State: AOJu0YzBjdVvRRavETJ/u2prrh9Ri8/yjMHge5ctSxIrBppyp1vFUxjT
	qfGurtiffN/aL4TzR/4IheaFWmfZDtRoOcB0gdGmEPQw
X-Google-Smtp-Source: AGHT+IGzu/fTZYlAY24Mset9xkdpenfBQr/ROnR+4Rluhcq5WCR6apHIMNclvTU3TTesZvFf7WICQw==
X-Received: by 2002:aa7:dcda:0:b0:530:8942:e830 with SMTP id w26-20020aa7dcda000000b005308942e830mr167122edu.2.1698683792137;
        Mon, 30 Oct 2023 09:36:32 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id c1-20020aa7df01000000b0053dff5568acsm6317466edy.58.2023.10.30.09.36.31
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 09:36:31 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4078fe6a063so116865e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:36:31 -0700 (PDT)
X-Received: by 2002:a05:600c:1d17:b0:400:c6de:6a20 with SMTP id
 l23-20020a05600c1d1700b00400c6de6a20mr133775wms.3.1698683791371; Mon, 30 Oct
 2023 09:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0b1790ca91b71e3362a6a4c2863bc5787b4d60c9.1698501284.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <0b1790ca91b71e3362a6a4c2863bc5787b4d60c9.1698501284.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Oct 2023 09:36:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSh7wKN7Yp-3wWiDgX4E3isQ8uh0LCzTmd1v9Cg9j+nQ@mail.gmail.com>
Message-ID: <CAD=FV=WSh7wKN7Yp-3wWiDgX4E3isQ8uh0LCzTmd1v9Cg9j+nQ@mail.gmail.com>
Subject: Re: [PATCH] kdb: Fix a potential buffer overflow in kdb_local()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Martin Hicks <mort@sgi.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 28, 2023 at 6:55=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> When appending "[defcmd]" to 'kdb_prompt_str', the size of the string
> already in the buffer should be taken into account.
>
> Switch from strncat() to strlcat() which does the correct test to avoid
> such an overflow.
>
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 438b868cbfa9..e5f0bf0f45d1 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1350,7 +1350,7 @@ static int kdb_local(kdb_reason_t reason, int error=
, struct pt_regs *regs,
>                 snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
>                          raw_smp_processor_id());
>                 if (defcmd_in_progress)
> -                       strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
> +                       strlcat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);

Some of this code is a bit hard to follow, but I think it's better to
simply delete the whole "strncat". Specifically, as of commit
a37372f6c3c0 ("kdb: Prevent kernel oops with kdb_defcmd") it's clear
that "defcmd" can't actually be run to define new commands
interactively. It's also clear to me that "defcmd_in_progress" is only
set when defining new commands.

The prompt being constructed here is a prompt that's printed to the
end user when working interactively. That means the "if
(defcmd_in_progress)" should never be true and it can be deleted as
dead code.

-Doug
