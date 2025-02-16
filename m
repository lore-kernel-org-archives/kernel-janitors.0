Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554D19047A
	for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739720589; cv=none; b=kEHueb0gpoEY0qSbrraRXQgtiQGiuw2Bkp1HDYUmM+JdXqL9u/u+K2ektWCdGMyVhc7fiGT2GXXA5sFRWNmUMvEHvzXahuzDftcWUjCBuaNT2F51bSPskEwRRo1GFGMaIlz4CtW2g32pRdnb7scO4pzjliZMj9wpK20hXAT/vyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739720589; c=relaxed/simple;
	bh=kd9a7kr48+YGq10c6UpGntuWh+WznF1BkaOnLQM2584=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRxCrtHoI3Tx5HEoc8fzJG7SfI+2R/MEz9fQv5pgWaumOm058zm7FrolXWrN4/BEGU5Pyvvu0oElJbVkyI8V8oRa8V7eAIk/gzn/+qgMISf5siVYhwxG/w2L1N0kDDcHjwMuqsQUWPzaJ2c9fzfxNyEVbylLRYb5yZ86+gT5D4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=De1oBBD8; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="De1oBBD8"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so6882653a12.1
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 07:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739720586; x=1740325386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kd9a7kr48+YGq10c6UpGntuWh+WznF1BkaOnLQM2584=;
        b=De1oBBD8I1DDMB5+ACSJgwBHVHG23i3Tmj5AxWv8lW2ZcIKjkwaBu7uG9sGwSMd4CF
         U1P7804AhNONu3A9d6fG0ARdpNc9shcG11Ej3ff8qfpMOzrWxncerRRZvIMIEj4ovILs
         6KiOTb+tVG1rk/up35AvUdJi6JX6+7HdE148RknWJAaR63fU5JBdVeWeAkIUhZQ+5IFJ
         snbs8u95e81JR1zGnVWMs3vAeh4OLg+vqbWqsPnbfis/3ZAxI3Usc4yW5A8CLTja4W6s
         Ora0y1zBlgp33dz/xWsNxZmrTuH3EHvtRad+V5zPdsuItN6HpiGrslQBKwi5fcQGNLk+
         xmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739720586; x=1740325386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd9a7kr48+YGq10c6UpGntuWh+WznF1BkaOnLQM2584=;
        b=TIylGRKJx1tdAnpQ1XAH/NdIh07xPlCEsF2NGgbCakZJXX1bzRa2rLDUm8aaTgKTwx
         JMISSCkQ7XKPOlg/F9bgPeCZqulWKNu5r22lQvOkgoStPv/211vYkEtvIKm3QFWNjm6T
         OXppVSx6IAeawlJoSYlU0Lgdb7fb1GylV97xt7kzIjR7k1wMRm9uaByrzwxmjLb0R21C
         aTi/G3zgSEHzUqGnkXVTsMBNmJVLokJPG9wXELyGZA0S5l390vQZzRbBjGTf5mOdNUGN
         6N8Go7+Q50qNw1gMWxHTm7VuAeoEBVn7HPR8pdhdh14zd4SQROSZmS2I4HGrSj7c+cK3
         MdZQ==
X-Gm-Message-State: AOJu0YxewxJ5Ffil9NAJkXyNH1+vSHKbwDTQQQpWOZR6QJfrnmjNxNJ8
	WtrE8BcKYWvna8y4gtNeonvW424tiDO34BpLmlsL14n7B1SzgMBVrRhCbP8knkY=
X-Gm-Gg: ASbGncuBxKdivUw/j7sGYxsDevG32RDtNmMTZVkIZdjtoiKjXC4i0FUNzDgYEUTdQY8
	8TWSKRX4vitFcxkAPdddssfUhY/sZRwzame1rG/F1uK232jZX40pHnXAPpcmMfj/Ocpk8c+OwZw
	PPt0u62X1aN2RleaitCv57mcmUqiVkv4i6KTacXsxDzVLtiO9FFXCqZ+0KvyG3n+psZYVJF0urj
	MAPhi2dKOSux4WkyY4aZz8VHON+PIHwfyQl9zQEOKWCDiZhLt7XOdeD5hVn0aGJEyFMMR+5BFYF
	2IlVkcjQfWt+GiUPh2ET
X-Google-Smtp-Source: AGHT+IGlAMhZ2qZ5UIZdIUZsQCwjPenASR9HF9JuCl/PKwhQPtxHIKuVnHf/CEEIx9BtMsp1i+LbzQ==
X-Received: by 2002:a05:6402:4609:b0:5dc:d913:f87f with SMTP id 4fb4d7f45d1cf-5e036048681mr5652168a12.4.1739720585968;
        Sun, 16 Feb 2025 07:43:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece2721d9sm6120617a12.56.2025.02.16.07.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:43:05 -0800 (PST)
Date: Sun, 16 Feb 2025 18:43:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Viswanath <viswanathiyyappan@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: Fix grammatical errors in i2c_msg documentation
Message-ID: <5034bf7a-e415-478d-912f-5442bdb28143@stanley.mountain>
References: <20250215085817.2455-1-viswanathiyyappan@gmail.com>
 <20250215085817.2455-2-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215085817.2455-2-viswanathiyyappan@gmail.com>

On Sat, Feb 15, 2025 at 08:58:17AM +0000, Viswanath wrote:
> Fix the following grammar mistakes:
> Makes only sense in -> Makes sense only in
> may have changed those standard protocol behaviors ->
> may alter the expected behavior

I like changing "have changed those" to "alter the" but I don't think
changing "standard" to "expected" is correct.

> No functional changes.

No need to say this because it's obvious.

regards,
dan carpenter

