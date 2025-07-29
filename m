Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FDA290D9E
	for <kernel-janitors@vger.kernel.org>; Tue, 29 Jul 2025 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790618; cv=none; b=cwrrV2CeHT7SVpw3nclV7oaSfO7T+7F1CKMJNggHvI4DdsTyWHH0OKnRhZGGijeTht8cG8mRDADxFjQmTCh58CuFVDcFhAbPB8Hksc5BJvD6vqAutw2/556SkYANw81QpRA76TMkJ/Ifw80dqRjkn2Agwv3nMls9VjQUZjh2SFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790618; c=relaxed/simple;
	bh=J1KoOQXSk+4GbHwgFooMc4ZA8t2cThHtniQ4Fal6CWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G8VoeIgYN07BQ5pmPMrmjtd2RnifdCYoPZGHenyqrjB9v6QMeSAjvqXtJajnt/5EAT8g9aKYYQtTQHQ+p9b91uau8UKmwuYjJKCElmBjwWXlE0GiTfpHHizepmFohih9O3iwv1to/VrpjV4YVEaR9rY5TUNBj/WqRCSCHIJjXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7M+QfGJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7M+QfGJ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748feca4a61so3349878b3a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Jul 2025 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753790616; x=1754395416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B7woP30IuXinLkeZAd5y8WU4VQtmbhgNj+DpZ4HD1yE=;
        b=i7M+QfGJFwoarMIqD9nvCc/7f4tpdsWnYr0ZleQMWwHV3sV0o0b6omNEhMkMmSQYhF
         zxrPnWENfxxBSkjSzwHysF+anojzOKfIHFRm3AHDKVTCeZzlOvx7XVT0XERf5UNxdQhS
         gaigQK+5I/gHsq6Rp6auMKEIkmKy3jPMRlBLaPJhUsCszuo7f3svy1T/W7sKdX1+q8AB
         RQkb9IgZjYpjXhQdBvROOEjSjZ/T6YA7H09d3+OXwbVSGADccRxh1JIupVO062nl7SKC
         AbmYORpMe5ZwPuDyDzJHQQXPuQHXFVd5dE6hpwPKpt29y9Z7rSwgvpr/6zW/UdyNP5Uh
         yvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790616; x=1754395416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7woP30IuXinLkeZAd5y8WU4VQtmbhgNj+DpZ4HD1yE=;
        b=YnLWEdZpm6Zwpvwk1pG6nhnd2zsUM030YMzqziFaoCCcipUQhH0EmuEcS89UKqjssJ
         cQViv6GmPB79MCQB8XyAt6KOzW2ewiw+Hz51yMspQFAhJ3U8ukddyiy3FsRiXWNDRybA
         JQDmTOUsgJC8z8mWb6WrmhhnBvcVSm+E8Q4IrJxKqN29XJutodJ2EP719mooF7R/Vxgb
         IMPbl3AEU9jFtcY2Vzf5HgsiPkZYg40Zf6F2s+CiUjMNNQWdCDhcrS+KIpSzOMg0NItf
         by6QTVbZQ/rSsCwqy7nGL9Js2x3xivMGlkysv8KEXcrwtl1LBjSn8U6yKevFRL/Cb5P5
         XWOA==
X-Gm-Message-State: AOJu0YydPAoPLGfqFz162ATAGxPFsgNzAkTKjRm5nK8dfxVFfvcPwJ83
	Vv/SkBHxx/VrjJEYrX8eNu4jTjPl8J3nCCe5vtlf393lc9WUozBc4o1GtXfhzdRw
X-Gm-Gg: ASbGncvV963GePKORr/q5z7yWBklmC9RDq68MV1JVTBimSEBUMuv4h09elaoySxqLb0
	v7rukznib/oxJItf90K/0DWAM6iuqQ8KzZoAqGVNdTpSQKHd2GzTX1oUv/WoUMHCUP0TKwKMKub
	5420nAjmD6aVEXocEaSnNgqGz1xqDb4l7A73nRPRDY3mR9ON7SrhIHv+d8qrxerSG4TtTj64+ea
	e8A0OSjhIfVi2ZFNEQGH2RqVeoVSD5RarQEFt2E2RpkopEVVuOtJWRTpssV/AhJOKS9kGemUY/q
	g7PzKSnt/4o8cpo9ybDGJHqqPBYqZgAxwkD03/FlIOyrsBb1VLGCglx2nf0RtAxBmOfeC/EBWC7
	4astCEzO9RfmGihJbf4NBPy9KDiHCnwWK3N0rPb9ElOMcQI48N8bCbPiHoZDtl12SHU+BNs7R
X-Google-Smtp-Source: AGHT+IHH/vA4h687Y28qGkVfUMCrpRO6SQICoelTMBirNYzAPn/bIzXeEVPotUR5uakxZzB7FH8wMg==
X-Received: by 2002:a05:6a00:2488:b0:76a:69c0:506d with SMTP id d2e1a72fcca58-76a69c05203mr439979b3a.6.1753790616184;
        Tue, 29 Jul 2025 05:03:36 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769b53591a2sm1667766b3a.37.2025.07.29.05.03.34
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 05:03:35 -0700 (PDT)
Message-ID: <b7914973-a285-4126-85ee-81c3df75ca7c@gmail.com>
Date: Tue, 29 Jul 2025 17:33:33 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: did people need more suggestions for janitorial work?
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
References: <1834fafd-b392-3b3f-b2eb-85598ae9c748@crashcourse.ca>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <1834fafd-b392-3b3f-b2eb-85598ae9c748@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/27/25 12:24 AM, Robert P. J. Day wrote:
>    i still have some scripts that can generate piles of cleanup work.
>
> rday
>
I am interested, have only started looking at how everything works in 
LKML and your post has been a great starting point.

Thanks,
Ankan Biswas

