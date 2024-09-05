Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CDC19DF99
	for <kernel-janitors@vger.kernel.org>; Thu,  5 Sep 2024 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545348; cv=none; b=rZZSIUA5xSHw/ALaiyv8Q/fWxLM6PfkoFD+tCbDxcGSVE8tzJs8L8ArNWbsdiZZFXZQ1j3MqtEFSYjDQnolGrreffgKXEN+1Ts9iy9k1OaHUB/E+gJsO0eTOxkIHPpAobaTAzOdzndeU0HRlHbJYcGD8hjqJR5yiAYzCDnxjrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545348; c=relaxed/simple;
	bh=hFvMxZCQz/tWSset+2x3kNBjfNOP5shqepNlxBFkZac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faOjlCN4y3vMktpnFZb/2+EiHqi8bvDjLU7AEUjj7zLY5hjq2/LmtKAVQOvP3APOO1Nf2lXr9ftwEtQuXSy+RjcyuWPDSjtrFB7S76M0iXhMhvlB+0ud+aJFmbxmqSxSrct8QQ6sMo/XR97zhXgUfOszdYuh+gEkPR9RdP2FlE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtfVPB/r; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtfVPB/r"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-27806115eafso382957fac.3
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Sep 2024 07:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725545346; x=1726150146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GIQ46mGPoVEaUozNTovEf5oq81WmVNnl7zcm9ZEhzU=;
        b=TtfVPB/reU8FpDvkIHPSZjbpsqVurZ5CSMoyj3j2W7mxVmW4+vezmtYw8TGWWGHQi0
         yAd5ahoE0mqn7Ot+dVzU3LVsIlXKwpKwTL1phCw4MJxPxY9tMDbtBSASd7f94OcrFCqY
         At3JG3HnDAbITsiU4toTX7oU0OpzuUx94HCsoMFeLB7R3XYHkT8zXEM59SMvPILuZ5dc
         ulm5fRXT4ubKjtqFnytH/bPN1P371PlnRkw6+lqnSawK1cRZDXQQYaPQgAw8cef48EXB
         I81+aa2AVTQP2AHWJYciOVjXktZVN4x5oBN8BrV5NFQfPCQ7XFBV5BDSrQh30Pmq+pkS
         L0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545346; x=1726150146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GIQ46mGPoVEaUozNTovEf5oq81WmVNnl7zcm9ZEhzU=;
        b=X1lL1yJe5nPj+Abga7/UPUxKZWyY8jEisqrrbsOJyI5M/I6FJxcos68lRa/WPd3YI2
         2FtwqbjWOrZg2+C1hk0jfTEjjQSTYgTvWr2OCH27BUZFwEPxy0rlaALAnhv3sbJZHpbB
         KW0bUicMbmwPuD5fuP5ZS2SaZVsEKCQ9ccxerYW/BMw+mZNQKTq2O6oiYUWg3gaM/Lnw
         1eqdJb32aPaQ8JyBBDGtsVJ+kTsTclmBMuaDtLcqWRaxKOnZb6p6nLCGU7kOTP9oyR8h
         Wcp8GsUMFF961aiTLM0Bep0ED1EdEt4wOth1dEr9YC7E30TAh48lU6lC6LMMYnqY3v/p
         JEKA==
X-Forwarded-Encrypted: i=1; AJvYcCWoZwv02LcY3xO5AFqPqAnLNaC5m8vunnk0X22sUfEtU9o6LGmHi5Ck15DE93iezUEH1Z3jskSPnWdLT/N2MTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IczJtQuHsSFwfhsVZ4w8DkDs637CCCA4dYf4qPd0eJLqqyoQ
	Eb6fOYidvyg0tEtgONiyrns3lsaeRZrc6flzy2pCDy5Mk1BxN3fg6PhokorLnujvJ8kESX3l7bO
	J6q9VuCe2U5FI3uMUD1ZEcKdJ2b/iO9wtjBZqhg==
X-Google-Smtp-Source: AGHT+IEeD6bM1S0y5bTDpYm6UGEe0nFuVGedJfI98Z9M4R/H0XdQi2pU0eCPaMGAiK6Jh+t3PwlhHpYhET8BikNE/1I=
X-Received: by 2002:a05:6870:724a:b0:270:1498:6a36 with SMTP id
 586e51a60fabf-27790167a0emr26390991fac.29.1725545346287; Thu, 05 Sep 2024
 07:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f8c12aed-b5d1-4522-bf95-622b8569706d@stanley.mountain>
In-Reply-To: <f8c12aed-b5d1-4522-bf95-622b8569706d@stanley.mountain>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Sep 2024 16:08:54 +0200
Message-ID: <CAHUa44H4XHOxn_=TxTUM=S6oqUNL6-kVVU2=jFPZyobzmtbQPg@mail.gmail.com>
Subject: Re: [PATCH next] optee: Fix a NULL vs IS_ERR() check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 3:17=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> The tee_shm_get_va() function never returns NULL, it returns error
> pointers.  Update the check to match.
>
> Fixes: f0c8431568ee ("optee: probe RPMB device using RPMB subsystem")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/tee/optee/rpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index a4b49fd1d46d..ebbbd42b0e3e 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -332,7 +332,7 @@ static void handle_rpc_func_rpmb_probe_next(struct te=
e_context *ctx,
>         }
>         buf =3D tee_shm_get_va(params[1].u.memref.shm,
>                              params[1].u.memref.shm_offs);
> -       if (!buf) {
> +       if (IS_ERR(buf)) {
>                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
>                 return;
>         }
> --
> 2.45.2
>

Good catch.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Ulf, this is a fix for a patch in your next tree so if you could pick
up this patch, please.

Thanks,
Jens
