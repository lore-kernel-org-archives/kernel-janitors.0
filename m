Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3237813AA2B
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Oct 2024 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729627698; cv=none; b=ZIRsA3hbG1qSD3j1ue+A3MQNw6aduV1HU5GlThGV2vK1sfYDFxaVv6L8j7YTKzv2B7El77PI7YLgJNolLVpSseUdSaNGyVFbNIvYz0SUXrDoBDOZOTfQjqDZfRyCVRJXvpomeDCaq9+gjfVh2YPCG/FLvJEicpz0pQWDxD5D6Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729627698; c=relaxed/simple;
	bh=BSsoiP4jGbk9AKDVqVOd33LE4d93RqdQDJSGQp5Kzf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kiuU+seJHih561WJFWDBE0npoq2qmEPhXeSf9ovhYVDnGLf1mEhrF/Pr9zcIyAyFtXjkYWUri3EkaKfIbXcV1RtWPD9Uks8bxrEGEsmo/mNwmQChovf8RxwAtTW2NMuaxC6TGhDJvNUjYCZQNeS6RJAJNmIjUEOLzRJP//yr3xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HhnNCSDi; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HhnNCSDi"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2887abeefbdso3100634fac.0
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Oct 2024 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729627695; x=1730232495; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKDnl7wKJvDkeBeWUqma/+8SHGVxxBCShhMLzaahqkY=;
        b=HhnNCSDiAWagPbY2MKJxWgEuGvXXB8gq4NO5miGmJydS1/DZlUa8BFd6jiVaCP20zc
         FMd4WaN44GPQsr+3B+kzYhY6LMVJ2AWAsOsnMKJUEVAYqIsgTAvYeiVG9ABrSfqEqwzi
         9x99ryM7lPHNVEnIv2eoe/sahfhuRbDGx4JBqd69FMBJCjyPTf+hOSCINoXS+1midykl
         wrwpjki6yBQKtRSB7qaFDQgMH9wn9wgvHjKVl9lbll9nhY+xSF2bAYne7a2GSPte3VUR
         cIi2aT7P8Q9jhSLodJl5I4UJucM4bAQiIcZDeWFV62GC243Ld7fFDMoFVUIVAiKocK22
         sMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729627695; x=1730232495;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKDnl7wKJvDkeBeWUqma/+8SHGVxxBCShhMLzaahqkY=;
        b=bfuWeABJjHoQw9MhN4ACQO/XXFd3x8psOKsgT9MdX3V4ee/iSnamdIqm9SG6CxYcr/
         6mm+c/KoJMaZOh5fEH1HYyxMpD+TvMnsSHEaxn0z6jFRhvOOkwnUOki0mZZSzjOQGfCM
         1Vg6awekOdGR1IS7IemMIug9ClKDc2TkpEVZZ3jHR2p5eCGjGvisfpRBpp++LmjwpVz/
         UuErqhCpvNb3jLKEbD89mB+AXrrR27ZaOecquJZxu9FF0jlj/amNjBW5J2LYlo/PHD5Y
         P3jbtPnd7LNHegnLgtFvyflUPvt3jNG57KCBwRJU1nteTAQwxx6HW5IbnUDKxCTgzRug
         IiCw==
X-Forwarded-Encrypted: i=1; AJvYcCXaiJNF/wtvabHG/IAPyTSj9P/C835Zd2isUZWWvsRIlcE36etBkZrxpOiI+MJUrt+reEMAmdD9LKwlNobyOVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQWYk/j4N7CCjj90AeSc9tqbV7MEg+IlmxcLOz3HDYkkioGAaL
	SG/3IMrib7A1b2cvL29HsSHS9WLG8333DI2xsWVXeuTBtV/saQ1GHyJUryzLGVQ=
X-Google-Smtp-Source: AGHT+IGrMpyj2ZITk+VVk3SSfXrARFJXCsgS7Lt+ivjrH7hMCKpqWqljJ8FddgEDhbT/k+C50LCeMA==
X-Received: by 2002:a05:6870:a346:b0:287:29a0:cfe4 with SMTP id 586e51a60fabf-28ccb5d7929mr521152fac.32.1729627695309;
        Tue, 22 Oct 2024 13:08:15 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a710a7sm315154785a.106.2024.10.22.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:08:14 -0700 (PDT)
Date: Tue, 22 Oct 2024 16:08:13 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Colin Ian King <colin.i.king@gmail.com>
cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
    linux-mediatek@lists.infradead.org
Subject: Re: [PATCH][next] thermal/drivers/mediatek/lvts_thermal: make
 read-only arrays static const
In-Reply-To: <20241022184622.1296044-1-colin.i.king@gmail.com>
Message-ID: <rq710p19-nq43-p91r-56o4-p75468q5psp4@onlyvoer.pbz>
References: <20241022184622.1296044-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Oct 2024, Colin Ian King wrote:

> Don't populate the read-only arrays on the stack at run time, instead
> make them static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1997e91bb3be..ce223bab6b55 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -329,7 +329,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>  
>  static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
>  {
> -	u32 masks[] = {
> +	static const u32 masks[] = {
>  		LVTS_MONINT_OFFSET_SENSOR0,
>  		LVTS_MONINT_OFFSET_SENSOR1,
>  		LVTS_MONINT_OFFSET_SENSOR2,
> @@ -424,7 +424,7 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
>  {
>  	irqreturn_t iret = IRQ_NONE;
>  	u32 value;
> -	u32 masks[] = {
> +	static const u32 masks[] = {
>  		LVTS_INT_SENSOR0,
>  		LVTS_INT_SENSOR1,
>  		LVTS_INT_SENSOR2,
> -- 
> 2.39.5
> 
> 
