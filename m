Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA5217ADFA
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902393; cv=none; b=sRzMQQhd2pktBtQKvv6Xsy4z4x9NOxQ0poojjzHuHvews7LHWUPfb3TFc0Q8XPn3KtGMrOh3hqY+ys4t6Sdul2AGWdzMc0vDRdMxWSXjOIhjju8e0OR/ggn7jQ4KMJFb0y51zfsp1t/WKDQRZ2k5YjG0qjKAiqWvz/TGouxiRKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902393; c=relaxed/simple;
	bh=kOEK7GQryMcWJgr6KKlh0hQWqGxmHZGR92xPiRivYtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5MuuOHCJyJI4Pq9Ilt482qp3T1ncYigMwFjNnTzxewRE4cM27oqATzlGpA1ppd59ESiI1fsuk28vIS7zI3hW8d4tPJgj9lUTIv+9N5KGCTsDWvDkP5Xy7INU95LiaDiPRu69lYzeXKmTZgo4qCy7jbjpIiz9NhkzCpSx32n8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kAb857CP; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAb857CP"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5e98bfea0ceso1949729eaf.0
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902390; x=1729507190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z+l7GWnWgpLcuVpHdjQ85yIjogCt0g0I4c7eMWz2MU=;
        b=kAb857CPHO5e44obsF1avCDIgGx55Mwv1Z67rKJew1c+QUickygUZvckfGOH9EvawP
         o6sfJytMUILZXHEPpZl8Vw7lED8ZB3mQMl5ttH09Vu0JW8bBS4aMcv51EyBeaMW6sK2k
         FI8CG7sOwhVPD51GuOqCA9X8p3/7r373E1i/0tS6ZhRDK0lTobcpz3vAPz7saM/5G/V4
         Xx7j6hHNs47PARn0mw4620VHbv1/zsb7TCF3jcEUfw3EnQyJazVqV461zGvKSUlF9jyW
         lkPwFYdiVCWFatdzXlmae9K3KalhSEVUEYYBQ0od8kLlR+aL2GaVb4SjHqUllXFl51Ik
         g2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902390; x=1729507190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z+l7GWnWgpLcuVpHdjQ85yIjogCt0g0I4c7eMWz2MU=;
        b=NSsHj81Z7rf77OeWwuwmSdB3B9US6TR2uxYu/AfiFEm2VcV9qv60Ode4/MNsFiqgbn
         gdYXTnnAeLELT4T8s3lhZkGruP/DvQkhf+R7SOuaBe5IrOKOE6oTZAC0yoJMeuVzZTp1
         nWl+25v8VV1SR/mDcXimZDamcHyNU1QjmvqYyljXfDUiQ4wNn4WqQPDSWIsRfVlHAiKN
         XBrqc6oRjGOirx59bVp54uWwGLDTWetCHVVNINI0MRf2xwp4F6gKF2F2CRIUsZgthbSe
         5U+rn5EfIUWR+l+KRjPR86WadV5wiNGaSzz49OQjKtgBdNzThxXn/PvpeVEZQgfou7p2
         QRIw==
X-Forwarded-Encrypted: i=1; AJvYcCWClskAzmU2XJSnm66XcZQe8sTV0r5R1bqVGIrjD7cbEjwTBO8Yqf1unPtGN8vX4iaVlx+BAoLZEEqe6/XEv0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+ZZCe1Vqvp8bJ8FCbCd8ul3qGjKVXeOTn6BmtZqbyQrnDq9v
	2mryJ2nWAdhHJXUPls22S3d+0GOTJmsafpTowraQ/1nHFlbkeMceIupr9mamxJDIGxq7o+Srr4X
	AZ0nF70Db3i/N9ovdiZYquftuJVdEuTp5LIbGvVWbwHCth3Jl2es=
X-Google-Smtp-Source: AGHT+IFCJaXrhYsjhqQq4FmYbtchaxdNXrreSj8YP3bKkJn5mLvijFOtXxM8CqkX+HeGxe5WBIPMNbN67XYWcHBzWGI=
X-Received: by 2002:a05:6870:7d1a:b0:287:4e4a:a2bd with SMTP id
 586e51a60fabf-2886e0192c2mr7383998fac.29.1728902389793; Mon, 14 Oct 2024
 03:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <df8bfbe2a603c596566a4f967e37d10d208bbc3f.1728507153.git.christophe.jaillet@wanadoo.fr>
 <b1fcc6707ec2b6309d50060fa52ccc2c892afde2.1728507153.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b1fcc6707ec2b6309d50060fa52ccc2c892afde2.1728507153.git.christophe.jaillet@wanadoo.fr>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 14 Oct 2024 12:39:38 +0200
Message-ID: <CAHUa44FFSx+F=ym+cTXCRpiF7it-OXkXVbf_GYW9AYd2_xOe=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] rpmb: Remove some useless locking
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 10:53=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> There is no need for explicit locking when using the ida API, as stated i=
n
> the doc related to ida_alloc_range() / ida_free().
>
> So remove rpmb_mutex.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> See:
> https://elixir.bootlin.com/linux/v6.11.2/source/lib/idr.c#L375
> https://elixir.bootlin.com/linux/v6.11.2/source/lib/idr.c#L484
> ---
>  drivers/misc/rpmb-core.c | 5 -----
>  1 file changed, 5 deletions(-)

I'm picking up this for v6.13.

Thanks,
Jens

>
> diff --git a/drivers/misc/rpmb-core.c b/drivers/misc/rpmb-core.c
> index ad1b5c1a37fa..2d653926cdbb 100644
> --- a/drivers/misc/rpmb-core.c
> +++ b/drivers/misc/rpmb-core.c
> @@ -13,7 +13,6 @@
>  #include <linux/slab.h>
>
>  static DEFINE_IDA(rpmb_ida);
> -static DEFINE_MUTEX(rpmb_mutex);
>
>  /**
>   * rpmb_dev_get() - increase rpmb device ref counter
> @@ -63,9 +62,7 @@ static void rpmb_dev_release(struct device *dev)
>  {
>         struct rpmb_dev *rdev =3D to_rpmb_dev(dev);
>
> -       mutex_lock(&rpmb_mutex);
>         ida_free(&rpmb_ida, rdev->id);
> -       mutex_unlock(&rpmb_mutex);
>         kfree(rdev->descr.dev_id);
>         kfree(rdev);
>  }
> @@ -175,9 +172,7 @@ struct rpmb_dev *rpmb_dev_register(struct device *dev=
,
>                 goto err_free_rdev;
>         }
>
> -       mutex_lock(&rpmb_mutex);
>         ret =3D ida_alloc(&rpmb_ida, GFP_KERNEL);
> -       mutex_unlock(&rpmb_mutex);
>         if (ret < 0)
>                 goto err_free_dev_id;
>         rdev->id =3D ret;
> --
> 2.46.2
>
