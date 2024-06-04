Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBE61459F6
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Jun 2024 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512382; cv=none; b=QDl4FcnDF6d0MqHtgdWq0SJpEPaL0+KN2n6CpMC56hwi5ptnv/1+ch7SOjrjF00+M76fRefqn4hdvcF0qeJqn4VZIS2dEme9OXZpjg16pLK5S/nYrQZ7G+SyFuqvj5T+pzw3IgqIUGzuyGxLY2ntyQb5psmd/h864KqQLoYTM+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512382; c=relaxed/simple;
	bh=6p0sp9pgFRo1PqbzlDQMsuyY3COLLatNjO1bz6AsYto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccsnZFVrnjpoZvZZjAUs/43IVB+mORxzHNvOjjshcTmxi0V1zl1j0yp+KPRXfbaiHIHgOnZ9IvrhyGDaQ20ZtWwwHHA7OubrbqZDf8m0aqThQBMEgoWoWlrEnRZKV/BChnRx+6OuO4q2+6zlq/TVMgKBWtkkbwbgNgZI38EYSiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnFEoM76; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnFEoM76"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ea9386cde0so57016031fa.2
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jun 2024 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717512379; x=1718117179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3fWM9RazXmkrrcf7cVm+FJhwHBnlPawdSsHuisHuA/0=;
        b=OnFEoM76/ZmXM8SuDUkkn8piPsXCy6og/EPQ+XgUV/6rDrspml4LShHfeNgjpv3hZC
         eBihZQ2fF8SMMtn+pbUgIEEol9MjCcXgjH8t7PBMfbULNxpStHDFGTk3f3BQ3odF69Pj
         ICMlhrGHOXlgTz1Zq+Wa3QJkOnIUDWOZ0VSxmeR3gA5sDnYamnupNTXnZYZ0p8xB2W6L
         H+mS1xaoLfm5SySt4ieCresd14e0k/CeA8WCCs/wj8qGw8+Ld14HjEx0z53Ajy+07ANd
         /YWJkepUN0jQnNgof/YyxMtiHJ2X8tFL24bZnhUVRhZP3vCVMT+slqdAKAHUhhpJY1by
         zyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717512379; x=1718117179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fWM9RazXmkrrcf7cVm+FJhwHBnlPawdSsHuisHuA/0=;
        b=ahxq/EpZbN0IibqxAB+hsqqTLamh0NZVH3n5ARIfI8NBiGgCWrSkt0uk5WeJHv2mhs
         KauWoMVl6u8o6gJQAAT3SgpywZT3ELIrFr9NNRbv3IAahTQD2Q5JjmdfrwyoGaJM0Umo
         eOFhLNkcq8qj9m68dha7DcxRzjQiHMM2SFeWknAS+ZWAYsXJWuYxdEkgleafuPhwGv7z
         Jcdua1g8/o2GBl+R3Rj195rkFd/OSKogJ+tJIzfBD2+uhXMDxLULxA/5YXKSYNlP1FZc
         lBSdlcJn5CogLFSle+emOb8aZyg3nkkzGPs62oLEsQFdSsGhUtiKcSu+A4IyUgQGLXT2
         SKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX373TuaPY1XgVIFQXx5HcmciiSLuxhmUIJ9EkHoOj4ji8eD/zAPQWC6iPtHxKSxvBRHoecezMsKHUe6M3i52iOlJrxwv/Ef23pjmcVzOKb
X-Gm-Message-State: AOJu0Yz7fBbnn6nWvrkTbFfEzS5baF9Cn42lO8I0Dr63O0BM/tHIHO30
	xZHkKdhl4HLu7Q9mm4EAW0vJNbvJMHoY8jzaXa2BlLLCnSrPCSns7CYzkenAXKFlOqi35Hcbxe6
	J
X-Google-Smtp-Source: AGHT+IERd+pOKeaU4WAUxdb915FWhHyou0aFSqNLEgCX/8v3BAB2Hl1Vqes5cCRKx30uO5efQiei6w==
X-Received: by 2002:a2e:6804:0:b0:2e9:81f2:ce03 with SMTP id 38308e7fff4ca-2ea950f70c0mr70279431fa.20.1717512379323;
        Tue, 04 Jun 2024 07:46:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be4df2sm7465219a12.47.2024.06.04.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 07:46:18 -0700 (PDT)
Date: Tue, 4 Jun 2024 17:46:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] ASoC: qcom: add missing MODULE_DESCRIPTION() macro
Message-ID: <7a0cde5c-db6f-4de1-9dc2-aa2c21fd0210@moroto.mountain>
References: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
 <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>

On Tue, Jun 04, 2024 at 12:56:09PM +0100, Mark Brown wrote:
> On Mon, Jun 03, 2024 at 05:16:07PM -0700, Jeff Johnson wrote:
> > make allmodconfig && make W=1 C=1 reports:
> > WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-sdw.o
> 
> Is anyone getting any value from these MODULE_DESCRIPTION()s?  This all
> just seems like a huge amount of noise and I'm having trouble thinking
> of a use case.

The missing MODULE_DESCRIPTION() warnings are very annoying.  We
recently missed a link error issue because the warning was drowned out
in MODULE_DESCRIPTION() warnings.
https://lore.kernel.org/all/202405182038.ncf1mL7Z-lkp@intel.com/

regards,
dan carpenter
