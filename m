Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A3246BCD
	for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691501; cv=none; b=n+VMOuE1AklucahmBfhlTUIJK/1YJdTNmHY57DnnFABd0ofqLdH5TSvUuF2SeukjTXKig5qQjexXbmBmptNPq5Tfi+nsux0hOsTmSWAZnJnb18OzXapfmyNwSeolaSwGP5YJlepy8NSMRpUqLy4jIx1UFI1O7fnJROF8RxY0/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691501; c=relaxed/simple;
	bh=krRCsWrNfrKCxYOojzIZfOP3DZ0qa5HblAiRJBWE6Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCh99IE0xjI0F0RghSQ3gWOGLJyY9ROO89jxJ9PX7Q3ozsTXzUsDgxh/2aEIRRQTSkUQK7OwvKZz1ZIT/HVbPLHARqvb4g84Ik4Q/uXLkRFiz4uC3RXxQYFF89vMKSBhI/pr/UYoi9eRBeqV/fVTx61lxH6xQzJJFD4W6k63wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jx9eiCXX; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jx9eiCXX"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c3b863b8eso3307480a34.2
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691498; x=1751296298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krRCsWrNfrKCxYOojzIZfOP3DZ0qa5HblAiRJBWE6Rk=;
        b=jx9eiCXX3Vslax2aXpv0mV5A0jU0Ad72jbfxR2Q5ytUgdRI0Ny/3ef9MktkV0RQmKs
         lSB5Qi5WwjZqRM1URaKDpcgfuKi8MAOt64/B7BAk35nw21stwYm/wE66/wr7EjA6Ey1V
         79x1d9ikIViA5E1KQQ6EFy+tYUkzb3FTPGCEae8Cg0sPQdKHVmfoxRsRGTkyE0rZg7vJ
         JQ45wD12/9gMpJh+jeYrqPC7LR6XQ5oQzpRuai6C4QjtGQ4c5JB57x2QxT5Mb72QgF2R
         0S8X+LVBPSamn0JAroZNKE28lH4MUrkNfP4OxNi+7mGwKCftfHQ4QC05rhjUZdfuVhvf
         23tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691498; x=1751296298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krRCsWrNfrKCxYOojzIZfOP3DZ0qa5HblAiRJBWE6Rk=;
        b=atpSJlk9KfeF+Oac20LOs8G+p5GPMJGs4q+1Gy7+Aa+3qA6Ymk91caIEG+S9KyEQF1
         4cDdZ5Jrst6gHiXjT9zkTnCLfC+RybUQMeWUulGAJlnpxtIubdAHbdH9QgOmZuf/LGAm
         P5COhF5HCp1BKj2SLBi+yBaM8Dan9dTXYnYW1Sg1QgUTmKXu/veBhpAw04UbNKDr5lzv
         22U0YEwk5tE9OXePPxQZj5fNxw+t09ZBKzRKFV0j9oRdUKaqcBlSm6ZvGO5IDyRAOP3R
         dKzS1Jr4DqQACUOs1jNp5T859YeHTkmEYEcm5IMUTxPMi/S93NJNHaxXxZeDp1TkmzXg
         rQIA==
X-Forwarded-Encrypted: i=1; AJvYcCWBd7Mj6/MPftHnX8iJDGApgn32KCzWL7v7fBu4cejqfxqwtmzSeF2g+2ioU3g4Ma4RzpmJyGZQPTmhDgoViYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjjsPv4HpXULdb+jh4DMG4BririiClqlOwWaXXY8plAnBw9qW
	BeZE6snb9LOhjKCcAfnS7dNnCmiZa3VeXLcvU8mj8aMhjxNdCy/D2uXaLK4sbaE6seMZvs2zcCe
	TIsXo
X-Gm-Gg: ASbGnctuBdrhPOlHWnh93v0rm8tCgB+qbnMLT+HgKxWP/0IaPkYiFrw7nXIObI48v8d
	XCYV8j2jSSBv/FbGtPI7gTuT/WtA7/7d/LpKpSexkvQihjNPWSurVVsWszQ/evHJc3T6/IFg8NQ
	WofvYzNTYf5vvEf3EeGxuW345CuIKydDwTmZUvR/ahaW+/SAhETXX4nRfAf+Lcm2v+oXzb8ss7Q
	Dg1GNxpEFNYaM7Ly7aglsVjq5GZLM6zeVeqUMCotlHmIUE2Kob2wHwH0pIG3jFaPrnxv6r7gIOt
	DSXnlHOfPA3p5Olps0n4oDnk2p4ZVxshcmn9ND8wHWkUIOr2RXyofY63XG2WGCFeZSLNk+CwCln
	eryKD
X-Google-Smtp-Source: AGHT+IELirG4o2TKMYqFSyVKOGaMUS/Yaj+K5xx64PHXSKKKnC1whBUE4ptLC6neLxCCL6RXUWk6hQ==
X-Received: by 2002:a05:6830:7010:b0:72c:3235:557d with SMTP id 46e09a7af769-73a92069c56mr9889012a34.13.1750691498690;
        Mon, 23 Jun 2025 08:11:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cafee2sm1446021a34.55.2025.06.23.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:11:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:11:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com,
	james.morse@arm.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/resctrl: using guard to simplify lock/unlock code
Message-ID: <d07fe2d9-3548-43fc-b430-2947eee3145b@suswa.mountain>
References: <20250623112540.3581675-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623112540.3581675-1-suhui@nfschina.com>

This seems fine to me, but I don't think anyone is eager to start
reviewing hundreds of guard() conversions unless they're in new code
or part of a bug fix.

regards,
dan carpenter

