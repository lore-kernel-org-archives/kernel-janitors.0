Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1F14F86
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clreFg0c"
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945EBD43
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 04:16:57 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a82c2eb50cso23246517b3.2
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Nov 2023 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699010216; x=1699615016; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9eA8efKOPXzUzYKsuUX5NbXDmCYD0utTiCrivhgq71I=;
        b=clreFg0cxUHkmLnUkW1GWW/RDuUk/AJ88WfNAMQOakldVXHuvub6iO0D9EdpEjvQtB
         qxjxn0XKCBzoA/Kb3DXotsZy4S8gHo3mmpX8YiF7MK5IGMUgZO5IIgW2r6ZClqlFqaE0
         jwJuxYXZOHhCRwjiH1h8jQxZsK4m3pL5ZiQAn/RaS+l59bBosyO2B8txdd626wo0DWOW
         yvQGPQoqhT0E8Ys2snUl4W38hUd1ruJiuI4mLtNzvxXQ/Yo9wfy7TY1TGcTj2XhVMMIZ
         FGJODgBGbtztT4TujvO0RhxI9n+omro05/roxWK2QM0MfCN7hTipmneKtqigDKvO2geM
         l5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699010216; x=1699615016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eA8efKOPXzUzYKsuUX5NbXDmCYD0utTiCrivhgq71I=;
        b=K1tEtEuFkE/Y7XpSL7c4zSTsKKfCnxQIfJWxRWX5WibqAhQ856zJT/GtGts9TXMsOW
         Reh73o8iwLGdaPIf0cf9CpxK06ADt3Z90kXXyRQEuCoCQXVrzIkVS5kp5aMqkNs13zVt
         whM7rG523pNAdpiJxvv7X4HLB+jK4KlKTZwjug8SORpXSrn1NfU1uDwDofH6RVjLpnsc
         E5SaQ364h2mR75bhOwyvuQWBjCA13vzOkrrsc5JfMSDvYosXwP0p9FMAoPCNNeiK8Bx9
         y8WNw0aVZFrlM0q9lXor1OVQxmKt6XsaatSoLEOlO8Qj+g4qYNhKqtd7bCwYw49P4QWz
         9csQ==
X-Gm-Message-State: AOJu0YwaRd5jC8aJUMJpAGU1ODDQ5YinAFo0VXy9zq3vfnZtcXcVKMxG
	aU539qlNt7qnWTxbSaLUlBhP0i5ljnNU2baaaykzq0CwL6cXyCuZ
X-Google-Smtp-Source: AGHT+IGFr/4fnxq3hTHWQYUSTvNr3iWFzoC5V9kIq8qHxBgrMwioqwRQgDyzjZNIOBCQDjh83t+jl6o/P71DDEgT8Io=
X-Received: by 2002:a81:7c03:0:b0:59f:535b:52a7 with SMTP id
 x3-20020a817c03000000b0059f535b52a7mr2128058ywc.48.1699010216748; Fri, 03 Nov
 2023 04:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0769d30c-ad80-421b-bf5d-7d6f5d85604e@moroto.mountain>
In-Reply-To: <0769d30c-ad80-421b-bf5d-7d6f5d85604e@moroto.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 Nov 2023 12:16:20 +0100
Message-ID: <CAPDyKFoYUtQzMCPKhEHrzxAA5_zk8KiwR-Knj30X+9FebdxW5A@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix an error code
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tony Olech <tony.olech@elandigitalsystems.com>, Deren Wu <deren.wu@mediatek.com>, 
	Bo Liu <liubo03@inspur.com>, Justin Stitt <justinstitt@google.com>, 
	Yang Yingliang <yangyingliang@huawei.com>, Chris Ball <cjb@laptop.org>, linux-mmc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Nov 2023 at 08:51, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> This error path should return -EINVAL instead of success.
>
> Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/vub300.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
> index de3f443f5fdc..fd67c0682b38 100644
> --- a/drivers/mmc/host/vub300.c
> +++ b/drivers/mmc/host/vub300.c
> @@ -2309,6 +2309,7 @@ static int vub300_probe(struct usb_interface *interface,
>                 vub300->read_only =
>                         (0x0010 & vub300->system_port_status.port_flags) ? 1 : 0;
>         } else {
> +               retval = -EINVAL;
>                 goto error5;
>         }
>         usb_set_intfdata(interface, vub300);
> --
> 2.42.0
>
