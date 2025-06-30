Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A559223DFD
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317319; cv=none; b=qKYg7O48MRGCtg2vOwnzuzT1oOoOt68VdnjdEApqIm7T21g7DknC8Ht1R3FdRkzdwx8V84ZuYVNLnaMqVLEObv4nq5G+pY/Iy6ah+Gr0YgT4zuO4lNsTpgH6qsFecX4VVIqbfJY/b/CEBQbFXfcTQkZFIVenYZLVC2ffM68r3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317319; c=relaxed/simple;
	bh=owKTpdGWy/BM62JhQaU1xcUh1V2zGtOHCnSLni9e7Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnp3WnQIyIO/ziDxXEo7zxGjCniPrw5SOtBQB+D1Txg0nDrny2FBxRENIu3MFkqV2x2nqZ0+IScpUoODzJnWQkbvTUZH4fkly6f4UR7TSlLIrzUgvXQdVqClZ7yCS5kN+dsXCw4cKuXQfl4rUjQwOmmLauSQuxxr2kOqyvaRGSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOqinX38; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOqinX38"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7382ffcb373so2617011a34.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751317317; x=1751922117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr8kLcrZ02mzOFc6KZwH1AqdkxuW1grOlZ5WPPwFD6Y=;
        b=TOqinX38Lw6zVRNkaHEBX4hqPkmEKh6wa48gsz/oTSO/Tw5R5SR/FnqV8dddMa5JQT
         IHjlK/pS4kkeQKp+kK/q3eacdg/v5N866794EN54yZyeK0Xx4eVcafYWdb1J9lPZTApa
         ES8o/c9HbEDUHSBmPixv+DMFtLirWBS05BMwEfCU8Lq0VRNeHc3QHTPceACwK2zGAKkv
         Dmen8r4sdIZm4oDYdC+nA4uW65fSprRVlaEveO6eyaWbcvGa1m/Oww4RsFV3qIr2Tnm+
         7UR+4RTGlfcexcQNT+uuawcB6g5msdluXEq8tLFxCSqEc18rKDoYpZKHHv2SxkUwLN5a
         qbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751317317; x=1751922117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr8kLcrZ02mzOFc6KZwH1AqdkxuW1grOlZ5WPPwFD6Y=;
        b=p0spaunhLXEdWkrX3RC7lWhBeAU8Cj5xbILQ+d8ZMmrUJBT2f9pBwS1BGksND6y8p4
         hGXDh8J3u7HkUQlxjNo24SpY/IXLJLnGhKmrc7l1skf30ATnEDKcxboJ0CZ65FX3Hf+P
         vZQUV0MPTSYm25o2wgfSDa6kh8VqwWW/TOnm+GBZSa75CqgGuN5UH0tyoRx077F1Y9CM
         0S7olSiR7TeVPjfZWeo/a7GSjaFjUFD4ttjDl87OkeaguwvWfE0z6+Mnd4GNx7B4of3F
         t08gajTV1ZLv2CQdS6UL5CtH0S4A91tiXtkb/ssp68sgH9ly87Q6JR+PlLsycmn5b1DG
         QDXg==
X-Gm-Message-State: AOJu0YxqAPwYx6ZXwcB/DcFFM5oYF+9lLaQRlLfhxpJiRy8bjKrOucNn
	+fWqBoxeEcJP3XiikHHrfVOX0nk4XBJzfs6BYd7ienT4q82ht9zh6FN66XY+i4E9Fw4=
X-Gm-Gg: ASbGncvX9SEM0ZbeX0MME5Dzn5f5lF7hhWaewe+GR7qfUnFgrfDlEL78NSRy806hRmp
	PoJof8xOeP/xRf9rhCCVvREWVpfz9Wm+hiV8wpSOHK0OpaqdOf0wrxNvOVGC66HKJ0NLlRvxWb8
	hxxOqPc+++911ncxgpIYiW6PV3IYMYl+7Xa9/Pohx7/xEwVsHVXcZ0xwqkYCMtvJQtXsVDFlK+1
	uaTH6JzOCzf3pZpmomrYZoMmwJk+m/AlCIRjwXHt+XPdvCh+Wj8Jbmz7LUVoHwCVXFM+/QFXae8
	Zw0fi5lXUP5chinKZ0Qa9M31yHtmWlae1TA3yoEfrFAFT6xVRB6LckFGxpavEfCNdkEh
X-Google-Smtp-Source: AGHT+IEm405H8d92bRIpWIdXichYQ9jzYsxApHl6nPtIawE1DTSaOn4VgBqiYsSvvGzErytd7sZgcw==
X-Received: by 2002:a05:6830:8009:b0:727:3b06:112 with SMTP id 46e09a7af769-73afc61553fmr7086582a34.14.1751317316942;
        Mon, 30 Jun 2025 14:01:56 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0069f4sm1816740a34.19.2025.06.30.14.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:01:56 -0700 (PDT)
Date: Tue, 1 Jul 2025 00:01:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Kernel Janitors List <kernel-janitors@vger.kernel.org>,
	Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: First pass at janitorial kernel cleanup scripts
Message-ID: <f4f8cf3e-cbf3-4835-ba02-f5414f772a89@suswa.mountain>
References: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca>
 <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain>
 <be53fc9d-529f-50c3-a3b1-f3caba54aad9@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be53fc9d-529f-50c3-a3b1-f3caba54aad9@crashcourse.ca>

On Mon, Jun 30, 2025 at 04:43:38PM -0400, Robert P. J. Day wrote:
> > >   - are there header files that are never included anymore?
> >
> > That's a good idea.
> 
>   I have a script that tracks down exactly that sort of thing. I'm
> just cleaning that up now. There seems to still be a fair bit of that.
> As a representative example, there is a header file in the kernel
> source tree:
> 
>   ./sound/soc/amd/include/acp_2_2_enum.h
> 
> Does anything include it? Nope:
> 
>   $ grep -r acp_2_2_enum.h *
>   $
> 
> So my scripts still identify plenty of potential cleanup.

Yeah...  acp_2_2_enum.h was never used.  But AMD is the company I was
thinking about which does some of these things to work around
complications with legal.  There is a probably a reason for the header
file to exist.

I feel like we have to tie this with a commit the removed the last user.

regards,
dan carpenter

