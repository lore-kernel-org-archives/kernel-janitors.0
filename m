Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E325172BA7
	for <kernel-janitors@vger.kernel.org>; Mon, 25 Mar 2024 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372754; cv=none; b=T10U09UWYCiZii3LCm1Yzq2sG58znHeYQNfkRpRivQPbYiOBc/0bx3LK1l/g3Iy98448DDn2+w5XAO3PqMMhUGSOpSUWeKg8zPNMKmbfX1nsPRphKBGhGHABIlmWoesNgllGqyohTm0U1E7W1J5RtsI0Sf6Bj74CwaLqAG1283c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372754; c=relaxed/simple;
	bh=gAXmZJZ7JPBYyLYvwXEjCgYPbJ+nziJz1EoVZFfYBxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYHmYC6Mv/UnE0ctLA/YIL5ynNyT45cCUj//ugQTzblOjPOyOPIi7u7IH0vmEx2j2AJyFdCvEQi8koMlM1FUeKnjZ78EB6GHxZVa2UqXHKAsD2MPlDilP5RcGIrw0SVzP5EQpdqNZ0Mac4E9hqU0ZfUhyM0CAaAIapo/akkwWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bEDmjmWO; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bEDmjmWO"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60a0599f631so37764027b3.2
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Mar 2024 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711372751; x=1711977551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FRJs/xxex33QkTbsCV8od3MYvkVpVGCKzchYiYGgxF4=;
        b=bEDmjmWOdFzt6qmzyF5yUupxP98K9Zf3Bj3n0pI3jJ7D1ApN4kNu44xnKJ3uI6UqzP
         4iCHOduFs85wWvPc389bDbwu5TsY/hmJ2XmoyIn0/QcMw3tzc8I+zMujUVRBwH5PsRAD
         UHjUAip5pUFiChSfpU+i/3fRedVjOSQCxWCgfjYZj+i7NlvaJFHcdtVDD8iLVeBOhCp0
         ctEB6gcSmb0keG/4TWFivGKAgvbxT+yRFoU694g4jO0CUdJJtgHi2EBb8jo1/JqIdsn1
         WPZvvjwDyS7SWosnesE4l/hoCDMo7KUd24JuyZ/f2PF4SqCkhm2rvBsNI/OgFe8m7nAa
         S3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372751; x=1711977551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRJs/xxex33QkTbsCV8od3MYvkVpVGCKzchYiYGgxF4=;
        b=b4DRrrpBp9benleBFGBJNRkp+8ShkMQZzb7nlzPy5nVZUMtzkyDxAhSzSZCRVTj5fT
         bABR7iA+wP+dJbSusRRRz0phstxx7SmD9B/W1BXwXm99ejABD5PA5bCFzWe/atcqv4GZ
         c/Yz8qJBkA5jlUG0Jzfpg0OnZ7M90jkm0QzZINIRGgEqJMjfRTPMQPZgr7nya8B7j+mQ
         4gGVbRnlLg/f0uYY79jFyTfnbacweivxKGd3FcOqkTD8HaeqdWtZsCJICRf0Zd07osgC
         6zNRQVw3ctGbUoFoIRf4pirWhSYjGV6c1Kc4W3OCAtwmpqby8tPCvz4/4eTcfFBab1y3
         3eEA==
X-Forwarded-Encrypted: i=1; AJvYcCWSEjht4z1Zvj9yQcW3E3CArlcoQgbCPI6nenV/TH5LvWWwDwR6N9J8oyQiVe6yHx5mrRZ0ckAoqxpF66UEWNv2M1G60b+p4X7ad/cKal3y
X-Gm-Message-State: AOJu0YyKnSOLh14u9dUGQQFPndraeDgs0zPLJXRWKzSLz+5nzsayZIlV
	zy+eLerRelKBdwukCxSNKhydxMiWKIjanvWNjgBK+AWxJnvK2pwjNxpqHc9TtXdHAA0A7J4lz8Z
	THsfvI9uZc0Tu6EKmB8inRDgiQ1kF/VO7N9d5Vg==
X-Google-Smtp-Source: AGHT+IG2xBt6Vvh6SED5qGZRekkF3bhfFw7W0QPkk8DRIa7/EdrIKglIsJQC7D4muCETLEynNq4MclW5IGDlO/oijkU=
X-Received: by 2002:a25:8381:0:b0:dcc:ebb4:fdc0 with SMTP id
 t1-20020a258381000000b00dccebb4fdc0mr4315085ybk.65.1711372751176; Mon, 25 Mar
 2024 06:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307145013.2721326-1-usama.anjum@collabora.com>
In-Reply-To: <20240307145013.2721326-1-usama.anjum@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 25 Mar 2024 14:18:34 +0100
Message-ID: <CAPDyKFqE1bEPfye7PSLXALE29XoTT3Y4UyMLDUWorLuKCbSG5w@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: remove unneeded assignment
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, tianshuliang <tianshuliang@hisilicon.com>, 
	Shawn Guo <shawn.guo@linaro.org>, Jiancheng Xue <xuejiancheng@hisilicon.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, kernel@collabora.com, 
	kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 15:49, Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> The err is being set to 0 and replaced every time after this
> assignment. Remove this assignment as it is extraneous.
>
> Fixes: e382ab741252 ("mmc: dw_mmc: add support for hi3798cv200 specific extensions of dw-mshc")

I don't think we need a fixes tag here, so I have dropped it.

> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Applied for next and by amending the commit message prefix to "mmc:
dw_mmc-hi3798cv200", thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-hi3798cv200.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-hi3798cv200.c b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> index 61923a5183693..6099756e59b3c 100644
> --- a/drivers/mmc/host/dw_mmc-hi3798cv200.c
> +++ b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> @@ -87,7 +87,6 @@ static int dw_mci_hi3798cv200_execute_tuning(struct dw_mci_slot *slot,
>                         goto tuning_out;
>
>                 prev_err = err;
> -               err = 0;
>         }
>
>  tuning_out:
> --
> 2.39.2
>
