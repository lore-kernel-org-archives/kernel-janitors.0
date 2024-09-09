Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B481AC8BF
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Sep 2024 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725877507; cv=none; b=XZSIxdOI7X6IbHRJtVAMs8WT73QSABrrH7DnMrJVmE+CTWJbzUu7V6TqeMgB368IzChOwV8UcIdNYD4MSeeYqjxZNYe6xzw1Nwkuv3niVR178tWGD/DAoA4MQ/ITRj5z67/1R5YO6qgw0axGiolxQ0Qd94My4u1GyL8M8H5hXT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725877507; c=relaxed/simple;
	bh=igWYc2HLTlHgxbHeBp+GlEfh+jAfbhcDCLq3lozYnok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5hZP+hD8GIf/MPX0TYzoNjcQFWvWb45E9aHcPVecEggzfmLYd/UpvL3bbPytg/JOyoHG0keumidpH54KK97FjoilmaW+YU0H/IwqnEHzWGsru4zVslt2rdi2fNg8DReZ+J8baivNMDVi60JMJih9QLh3RGbdBJjyYalZhdhPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OypH+DJN; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OypH+DJN"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e1a80979028so4156286276.1
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Sep 2024 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725877505; x=1726482305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g45hI+dbrFl5zHoBA8y+ci0W/+L8ASesTKBmhCZ596o=;
        b=OypH+DJN7iibmaapq+CHuoX/GP+h8ScuNv9tksQ3w7N1WcnflZ44COjGxxLe/k4z/7
         LqYb3jwKikCznDGySu36BHDI5Kn5jATJ6fCfQigHjmeaK1/vrXPHdEjAAcRBS4ZwNwHK
         v5H9bWtCJNc3YuSi2JN/exJ0CtGi1CLPBgIDYgw6as/AwGe/rcBxh9EveAbkLsOO8YHS
         8xNUNhpzuaCSguD8GgDbaDm7/dWBk9t3NrQA1LXtdFVKXMlcH/mOtveT/VZZyL9UTrc0
         Ijo26T2oWvv9y/zOXP+4ZtdpduoDmZlbj8+ae4BXVzlPjrPqYqSZaXWR5wwnpHwJrvVg
         WjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877505; x=1726482305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g45hI+dbrFl5zHoBA8y+ci0W/+L8ASesTKBmhCZ596o=;
        b=vMICXw9ScqNRh8w0toxloM3gUCViHw9RcO2IUVlqst003L6yY5TKSvV/ubpJ2BbcP3
         C4lJp8IZF9+AWtF+Q2HVlod6tB3v6m5ujs7QXsMKiN+bW5tqmbLBJYAOUCztQc5V1P3b
         LtK7hzbcz+Hxu6tjhTuCNTV0zTmFfJZg63OhMs8qbq7CtGPVPJBc3ZkGnD5V50HuS2xy
         kw6aDFAOO2dKmEFiowAzYh8sR15Jbqk5uvRu6uyYCxJ44ba7O67dLupUPGRnPzGOX5JS
         /nrdT/3eLrZ3xknuXlFCTxAFIny0HyI2pSVVPCF8XVOKpLJl3D04rpyzZsoLGtfjWq5o
         SuuA==
X-Forwarded-Encrypted: i=1; AJvYcCVd5/oyF6F/sKfSKYaVtv9Pp/4IBMHFKpyIZb52DRvUu40qBfCGLmS3/5SAyH9kWiVKcu/q62HjIJmdJ5rdj8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjzn1NtrgC7BTkeYFdyXcgLr8SB1TgzDM9nZRMwBikUoCVfiN1
	A2275b1nIcfiNVNEd1nwD+kE083aRSheSSVUWHZOH4IpNCwgJFdeiAaEzgSBSUq0yF5ASbQNQpU
	RnGGjlT+/CCPuVC5AjMMQWTlJwdxeL4BDXXUq9g==
X-Google-Smtp-Source: AGHT+IFDQSlZUFFqwjtBGFubuT/aNajcR0fBHSdSHs9NmXKaik+0yq5I6jj/Abm0bIMeVTTkEEVdl1mf2/pkFTxLiWY=
X-Received: by 2002:a05:6902:2188:b0:e1a:3dc9:c422 with SMTP id
 3f1490d57ef6-e1d348829edmr9561915276.19.1725877505183; Mon, 09 Sep 2024
 03:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f8c12aed-b5d1-4522-bf95-622b8569706d@stanley.mountain> <CAHUa44H4XHOxn_=TxTUM=S6oqUNL6-kVVU2=jFPZyobzmtbQPg@mail.gmail.com>
In-Reply-To: <CAHUa44H4XHOxn_=TxTUM=S6oqUNL6-kVVU2=jFPZyobzmtbQPg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Sep 2024 12:24:29 +0200
Message-ID: <CAPDyKFoe+_m8VLWFdB_jgv915WcyLbjkFJq_Regb1qXwQaVchQ@mail.gmail.com>
Subject: Re: [PATCH next] optee: Fix a NULL vs IS_ERR() check
To: Jens Wiklander <jens.wiklander@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Sept 2024 at 16:09, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Thu, Sep 5, 2024 at 3:17=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> >
> > The tee_shm_get_va() function never returns NULL, it returns error
> > pointers.  Update the check to match.
> >
> > Fixes: f0c8431568ee ("optee: probe RPMB device using RPMB subsystem")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/tee/optee/rpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > index a4b49fd1d46d..ebbbd42b0e3e 100644
> > --- a/drivers/tee/optee/rpc.c
> > +++ b/drivers/tee/optee/rpc.c
> > @@ -332,7 +332,7 @@ static void handle_rpc_func_rpmb_probe_next(struct =
tee_context *ctx,
> >         }
> >         buf =3D tee_shm_get_va(params[1].u.memref.shm,
> >                              params[1].u.memref.shm_offs);
> > -       if (!buf) {
> > +       if (IS_ERR(buf)) {
> >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> >                 return;
> >         }
> > --
> > 2.45.2
> >
>
> Good catch.
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> Ulf, this is a fix for a patch in your next tree so if you could pick
> up this patch, please.
>
> Thanks,
> Jens

Patch applied to the next branch to my mmc tree, thanks!

Kind regards
Uffe
