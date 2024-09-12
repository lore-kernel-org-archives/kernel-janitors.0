Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A6210FB
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152754; cv=none; b=i1WSYAIzoyDFWOJ3DREmvoL9PMemh8ULxtEITQIlVRvnqXhP1T7/k1eheIZkyEfo0IFEcpSoO5gvtVxJuCOv6XSgPMn8b2fdA4b+pWxvI+apOkjqAr4S4Juh1qqe8EXMVIQmrw2HMt3iTJ+iEKQOqR9rh5pDWb92+lFHURAv5Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152754; c=relaxed/simple;
	bh=5L3XjKyZGaCGCMFTycvEKhMmfORP1Kz/ZknLYi1DA68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tH27ld5avcp+Mw1eXHN+nPSUfeeb5TYjXHOJCghKVgXXAjE3zjmLXjW3ASbDLbPW6k5t4OlPJBiIhDXFTyrgd4qTSRhpMvUl4OAZ/LpcCINh3X/4djf+Zrzr76Plr6F4PmsaV1JdvE6vxBlxRzVeyV/tjeuTP+/U0PNt9oaMwQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUf5fSA7; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUf5fSA7"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f77fe7ccc4so13351121fa.2
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726152752; x=1726757552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+ATcCXBiLqkkadSQyOJBHhfQxxwHzkaV8GIwKqvbrs=;
        b=bUf5fSA7rV5IMWPLniTdJT9UJDgjSL94hfVQcHR0ujuU9eU4xuhTBN+AdA6LIGxnBk
         lE6/OxjRLNO0FebMOXLqDxNQS4ii2r2bPaHpwtymy9sA3wIUKlfP2DGjUckX8JKk3QPi
         48dqThT3mPhIO4eaxNRTEyqExSxolR2qTKy/LpdO96RXSadI6fWkacxCfcEEz9LWrCfO
         amR7/BUV66Wufh60neXpupsenoI88dVBtYM/JhkOo6vOW1aGLpGY+fw3kQ8djpJWEg2f
         X62Q74pHV46andl/kwvS3TPWCH54gW0oHf4soqS3Io/xcZ6MylDUdZ67kIatC/iuTx6g
         KEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152752; x=1726757552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+ATcCXBiLqkkadSQyOJBHhfQxxwHzkaV8GIwKqvbrs=;
        b=xDE0TS4Vdlyvhc4xXWTuRF5M9lynWcKk6FCkN3exIiJiIJ26MFoj0Yr+vP2p1WhQWo
         IvuYKX7NpSbEhgVaYgVmXEdF5RyGLCxYMmX+r9Piakf+ArGSkDaKKQLomivuC5cH8iyQ
         ETyKTm1YtrQTVfN5QkAZBDRP/hrc7GyLDkjOXhqBMcwiKVin/+UrBYwtjb/owS31ePn1
         Pelcj4MtGasc+kIvJOiXqDaW76yl7Qvkg8RPW8+RqtyDtvN8dp4gQOL9gFrb98anPNXn
         Ync8G28WvED3wc/FlbSKs2IWYO3A4IbblTxdKO2c1Xxb1Acp14h4h2NGoPof6fjd8tg1
         VFlg==
X-Forwarded-Encrypted: i=1; AJvYcCV90zxvXtjREKUK4xgwvEOHCy/eNqIET4d63rVXTgt9UzAj9UZYuaXM/C6haOrgbD7xSLbRJlgnEdIy0pkAH5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwr/XRc0VzDvkMMlz10GRfJ6h7pVADPbCzb/oKt7HDurcJwU30
	wSFotv+U1zzx1DmMIMYTubvaLKXjWq8QdqslUUrYcAC1hOPNKJxEd75+pUUtLd4=
X-Google-Smtp-Source: AGHT+IFscth7W2wIMjxwp6qUxm+Laav01ta16an3zwFZlQ+VWEWM+4Xv25f74tx1msWeY+s5nqGk1w==
X-Received: by 2002:a2e:a7c1:0:b0:2f7:543a:3b1a with SMTP id 38308e7fff4ca-2f787d9e337mr20696161fa.7.1726152751355;
        Thu, 12 Sep 2024 07:52:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd5245dsm6705327a12.52.2024.09.12.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:52:30 -0700 (PDT)
Date: Thu, 12 Sep 2024 17:52:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: prevent some integer overflow issues
Message-ID: <b1158552-d899-49e5-9c4f-bf6a5b80c163@stanley.mountain>
References: <0f03d569-9804-4617-a806-f0e5c32399fb@stanley.mountain>
 <87v7z1yyok.wl-tiwai@suse.de>
 <20c99f50-948e-4076-ba28-9640c3cd982d@stanley.mountain>
 <72907305-eddc-4fb4-9c74-7e1d2750f4b9@stanley.mountain>
 <87r09pynn5.wl-tiwai@suse.de>
 <e364e109-5dac-4a24-b179-af0ee5659990@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e364e109-5dac-4a24-b179-af0ee5659990@stanley.mountain>

Actually there is a check in snd_ctl_new() which means that although these
integer overflows do happen, we eventually return -ENOMEM and the whole
thing is harmless.

	if (count == 0 || count > MAX_CONTROL_COUNT)

regards,
dan carpenter

