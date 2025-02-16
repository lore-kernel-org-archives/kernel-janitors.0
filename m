Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAA1F94C
	for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739720424; cv=none; b=tfKBfvdAAtrRCndLEIZoWeIAQDL34DdtWrCDVs2Xop2P+jceJBaQl1/nWJlO12WoVrKnXhWqsbXwel1U62hQcqHG/rGUqeD+FrON/foqsylUFmoSbZA5GbIXxk5gU4gB1RLLkqiEOtnUYyuErFGtJH1eJpYsw+9IkO1w4FgwjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739720424; c=relaxed/simple;
	bh=23BCv9NMPWl0vltH0ImlklKRTezm3xo/cgREjGcw3Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gU4rrFW8qtS0ozhew9Nd3oR5iV2zY8Pb8VU2zsBv/XSSQIaGudLNvgCnJfT+JNIR6A7sReKIm4VWeRuGX9LhMC3Pu71+MHJqrvA6khsWjs+4p8FhZdIItfndmdLNeEmpZFQPzWGXHXn9K7m6AOLxzA3m10Qyoy2mMBc9FgkLRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcZIN8de; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcZIN8de"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab78e6edb99so536443966b.2
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739720420; x=1740325220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtNwStOppjM4/e8u6hy72aYwVIViHgzz5BiaHnWzXhw=;
        b=kcZIN8deoDq2ozpTZLnGdwaTxwyqF7JHJ2t3d20YWjM5VmZtVrPV2qC1hG2JocGAq4
         80ciPgwEOmxZpd6lLUt/wAPj7l11pZu9rBNypA/YFsl8pMJMJxssdbNZ6YkDdkDnfOyr
         JFOhJpVDyl5zLvyJ6bc0mjeGG8eWuuXdOA52GUNntLyF5v/u37mT2pr3PWa7BfZHK+lZ
         F1J+VFxujWgt90gdElSejWr/Xs4hbfyAiYMgqwf7Ceb4VxYsseps8fN3tlWIxOxR1Nfb
         9MVKOAMg4N6yr8BFJC02ZuZ578TXZ9mNMvf6I/3vTQdYhd6J+bcWj1tR5Oqm0WRdLGHg
         oJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739720420; x=1740325220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtNwStOppjM4/e8u6hy72aYwVIViHgzz5BiaHnWzXhw=;
        b=X04FiNJC2L3u73eDbUiu7hw6P4zGg9dvo6Zww7Bw6Q3pGsjoCKxAcRFVa3zHEMWGdz
         27zDa+j8eU6DH6LrSyeYffNkfoMCIKb45VLnOojNBlPFtYvu2Qb6fXdkPm4Ap9RiueEm
         ZVsVpSTNaWZrTd6kdeUHXi7yH1FFGbVuiEuvmKqfL3r+jPyW4VtOYH4HJgCYxCHa16L5
         iEEnYnSTbRxHlW2tZNjl5AsCl2uWECXqjEzpSEQiAm0Nf8sYwT9FN/IvF79qgqysYHcL
         oLOt/rfK36BBDtBzE3K02QgRHEGPzd1QRE0G/n/foJ3zfkQ0t088/UhepNs80k1WhHLt
         +3XQ==
X-Gm-Message-State: AOJu0YyY9t5+P3IWclLjDGsPNHbrznr4MjN8mYn9QUn5ZyEW8idMwzO0
	v8ziGH+rH3F3gzJZ8HlQaTNSqASxVGvOHTzFVW7FOh3BC3nwZxKYOnu6sH59Bc7e/ekrcVzHkdM
	j2k4=
X-Gm-Gg: ASbGncu5ZFRYQYEGkQqPlGpcBMccKVmDTAxw5Esm+Y2bGCnpiS7hupXzidIgSeTU45q
	IViNf1idcrEOPF27WoDX8kA35IiBQgeA7azA+fHdVn+Ylwi7uqaniPAIvLqM2Zgw4y4asbA4OFs
	DqrE90pVDkUbah1SLjiY2CVeAiukNwYs6AVy/vtWznG8lOtdmboKvjXdlEpqbJTlK9/kyasQoua
	TbGixZUWI1rjutcDYYf432VcTYrB8T//b/ytYvAIneu0dU1epAdLCCIFViEDFtUc5sgm7T30m38
	FKLDtZr4H9n0x+wWfi4k
X-Google-Smtp-Source: AGHT+IFb2bc1jCptEc3HT/NhXAOkE5lUlEBFzskYOh90KrSgW4C5FjqoNnmDpRrD5Gxd45LZhzSZBg==
X-Received: by 2002:a17:906:57cc:b0:abb:9a1e:47cb with SMTP id a640c23a62f3a-abb9a1e4826mr90815766b.55.1739720420211;
        Sun, 16 Feb 2025 07:40:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba5339db5bsm718666566b.150.2025.02.16.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:40:19 -0800 (PST)
Date: Sun, 16 Feb 2025 18:40:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Viswanath <viswanathiyyappan@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: Update i2c_msg documentation to clarify write
Message-ID: <e973c9a6-8d4d-411f-9d05-f5e8abc23575@stanley.mountain>
References: <20250215085817.2455-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215085817.2455-1-viswanathiyyappan@gmail.com>

On Sat, Feb 15, 2025 at 08:58:16AM +0000, Viswanath wrote:
> Update I2C_M_RD Documentation to clarify that not setting it
> signals a i2c_write

Period on the end of the sentence.

> 
> Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>

Hi, there isn't a kernel-janitors tree.  This has to be sent to:

$ ./scripts/get_maintainer.pl -f include/uapi/linux/i2c.h
Wolfram Sang <wsa+renesas@sang-engineering.com> (maintainer:I2C SUBSYSTEM)
linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)

regards,
dan carpenter

