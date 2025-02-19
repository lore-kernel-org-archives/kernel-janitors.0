Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECB14A91
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Feb 2025 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981103; cv=none; b=m0dEpJIJL+XE4cY0JNKhja5Ww9Bn7y+lVwye7n66bDUgEiFwgd2zoVeDGTx+FcrW5MTJY3bLH0caTET7pcZbHSKqI+yPkdVsfpufXqQLnqZ4FbOLz+xXRO3UldIDw7a/XDx0ozO3Wd+3dY5kXNl7+w9woBlIKhkx9ttV+1mx05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981103; c=relaxed/simple;
	bh=OiOSh7apz2kEsevABDPqv1dC0auMRoIYy9Zyi7ArObY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpwAyx5vmqT46p3h8ZjfPfNuw7CBvvXgQwYoBBwJEWBsWhrG+8MNCtEWClYze9Kibk729PqevVHhOir+Pk3PFzoO29n9ka5wtiEHEvk+sY62xtPLL15vx2x6yed8BfTeVkJ2onTvvgNOmLOF7IPMzW7OyvvM/8/6SuBMZqI/q+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSkIiARg; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSkIiARg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e05717755bso5355176a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Feb 2025 08:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739981100; x=1740585900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ljkXhqkhG6hd6NRSsz5fArUZWBwAzxurIP4uHPf/TMY=;
        b=pSkIiARg9ehMQbQZvMhCjBd8LbOHtgBn0IU8YKnrLL0SaKgx7kyFpTR52kH+FWcg7X
         r3EAIIa+BQ9VPwf2KeGBel/2hVlaJZ883AbEerjSIB0TT45ep2+9/2x1KSsFHSp9j+Ej
         CqVE0PeuePfa0UZ8kdJwA0UcyPZ7YJJm/6BiTyBR+AK9217mTb1i3KcuTi6bZ238v38Y
         Fh0YPHxzsfrGedmZsBxyOA7G40gew1oO1YVh2pFEJtOhHlSC0UuLpoD9LoVDsLYzq81b
         5DnRpwnwemUP55x5bwP1u92AAHXRNFVEYDU9+HNnPkIuuQWBkV5Z3VNoVLLRGyYVNIPr
         7roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981100; x=1740585900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljkXhqkhG6hd6NRSsz5fArUZWBwAzxurIP4uHPf/TMY=;
        b=UhZUG31wzUL3A8xUD+wwbVHs4xV4VvNZAIobZggDB11L2uWqWw1MJ1ZpQ+jdruTIOX
         KX1YhmVznN8uvuNYr4cP79CL7Q3f+lEfegjH8AHxrKdWN7X3s/vniE4gC+82TKXkvpYn
         H4Ez587YKhc0iryY1kO7Anp3Ku/G4tK4sp/J4zR1xtnqBKB4eM+MP13xetDfixdRPHrs
         bsGqt39dd45bQmhvQE6IDTCA2wcPR0th2hzRus5cQMjVU2zV6eaUsJO0jhp7pZI7sisw
         JJA77By+tl99PS6fEsF0cvvfyuZIgGnj4yybeBySWCHCQAe7RtARmgODRuzW0TjXxGDd
         ibRw==
X-Forwarded-Encrypted: i=1; AJvYcCWOimTZS92bqslRSnE0el8vEmi47LJ2VQ1z7tcZLnJtDCxF4PNWlZaDiy2GavoAoIMAnsXkusmFZLkhAPp7/GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZTaOylr0iLYAwARWFCn0k8Y9c0WkFNkhQJbuAwM0YJ16PXKJ
	LWF8G0pjy4dU3XyUWaxRITZ4QTi/reQO2zy/FDXbzDqwkNP1p/05mr2NghCd5Tc=
X-Gm-Gg: ASbGncsfC3rUTLgLQxuf1qYQqW0VR18f8dW/D/5OAuXTIlj0O7xQurDGvPrJNBlOj+b
	hb+JRYpSEQ8CA09ZGhkPosRECsnS7WYrPDLO5+Ti0VIYNG0fXzmLT1HmSQyd8Ezuo+AR+4KLS9i
	X1aQRY7iI7XCDuMa/LG2sz7JBXpwKKuwmZDjiKzR0n7d6aaUjxEwc4iMS6bqfzf7aqI3W21d18k
	7DPQMVIVwIJMzYbozlQibytcmuOE6av4tXqukrqm3hmyO/2O0ISjdT2CcLcP8ZgxsIJZuu3VEMK
	JJ/JuUg5FtHvWivyet8+
X-Google-Smtp-Source: AGHT+IGIOphoxeNaBbPBBYiv7n3xtBHBqQ7mynIC16IzmDF75ejyL2+ZcOWGMA4f93tnbTIyUvSjSw==
X-Received: by 2002:a05:6402:234f:b0:5dc:72e1:63ee with SMTP id 4fb4d7f45d1cf-5e03605b765mr20641327a12.6.1739981099630;
        Wed, 19 Feb 2025 08:04:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece287d3fsm10511628a12.72.2025.02.19.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:04:59 -0800 (PST)
Date: Wed, 19 Feb 2025 19:04:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jim Qu <Jim.Qu@amd.com>, Lukas Wunner <lukas@wunner.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
Message-ID: <f608a3b5-320a-4194-bd03-cf08be04c317@stanley.mountain>
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
 <87zfiim09n.fsf@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfiim09n.fsf@intel.com>

On Wed, Feb 19, 2025 at 05:17:56PM +0200, Jani Nikula wrote:
> On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > The "id" variable is an enum and in this context it's treated as an
> > unsigned int so the error handling can never trigger.
> 
> When would that be true with GCC?

The C standard give compilers a lot of flexibility with regards to enums.

But in terms of GCC/Clang then enums default to unsigned int, if you
declare one as negative then they become signed int.  If they don't fit
in int, then they become u64 etc.

enum u32_values {
	zero,
};

enum s32_values {
	minus_one = -1,
	zero,
};

enum u64_values {
	big = 0xfffffffffUL;
};

regards,
dan carpenter

