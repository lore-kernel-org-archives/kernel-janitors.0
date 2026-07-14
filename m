Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882C3412C0A
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050811; cv=none; b=TXZq+Iln3tBKmqiQa8z6MUpnsVbX+cQ9cbYpHdHBMNOywtCeVPkKmeCF+0I/+oVxF3To7uME5AAX0iVq/prrX6KSC8UtXIfx4mf/qwPI55UBAjv04weXsCV2zxl57zahwd3zoLmC51ir0+4/m0yTZ2Ux98OCIyJBCjvDRQa2Z6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050811; c=relaxed/simple;
	bh=ntE5gUyeHfvczYgBZlJCp5YQfZPMH3wMiXFtAFptok8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7hOOozjHcb2iVUUNOPxwL8YroKt85qTjyKftzlWn6he35i4A7WQnAcwNrHoQVPae5DqGTIW1DIlyhHgWivT/S22BNwb4Lt0Erc8fl6pOya1ajC1eplRm9UzppHpOV/KADU1/LWX5VXtK4XZwSo3EBB/qM1JExJyl4m3QmSGutA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jJaUarn+; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jJaUarn+"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6a1888969ddso2629337eaf.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784050805; x=1784655605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJbEasVmJvkTSljHdln3El2Qwe5hfdOfzDuw4LFkn68=;
        b=jJaUarn+1Emy2OVh6Cz9V0eNyxlDKCgyNcjqQ5rZLU1uiQeBokwJ0EhCIGM6/MeRnj
         Quyf6rtUfaCvI09ODZV/sNUZBVqz/UMnfeh/FfJ87C61hWvNwa7A5hGiQoqHZKyQOQmt
         GguC//2BkOpYgYE0uNUtnbtyEQ2yVwHro37PMayp4XLhqFIgzcIpZrD6X9g8gK+VDHhP
         /SivnoxQbqlG/IrC308qZ685FQv73OnpDjSv/gkClJcKKy+0rHl6rvJakFQ4n/+7jdNz
         5w9J7l2xgYGSrl4aq282fve/3/Pn7HMo5OxOGzK7kt7mSB6PzL8Ax8ckSaSCs/A+PXAw
         7dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784050805; x=1784655605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJbEasVmJvkTSljHdln3El2Qwe5hfdOfzDuw4LFkn68=;
        b=poNso3bsVt2PfYajSRswFjt9rbn33CP6qvMVc0TOsKUkdYImxpooLiPWbrie/L51FO
         NbvG3enREWAItjlT/E+Dl8fBZcfpshI5eUxpFHfLRYA9F9qL+atb51nJ74H3tE/zHHhG
         IPVp8hF+gNaueL2AFdN3kiyy2ApnvSbvJB/uD1J5sVArP8j4tQGrEjDCeqpBsOTNZV4E
         xd5xbV1V4MRGKMxpa+NkXxJvyf3kmWF4MT4fF7XtGv09kzXhu6jnA6Gs01M47PLCuQ0m
         D5HNxgF70pakgcIstioJ43k4n8XqqYfQ8fFtQ+Kjx1+yQcMt3M0/K+eYMZByp3xkN0rT
         8FWw==
X-Gm-Message-State: AOJu0YzlczzssfJgQ6MOCEoKA40fASY8dU1z2pdu2U1J0seKsmYiWc3r
	AZGMiiNFJr6nV9ewZXDb6LHgN7iVfAoYCyV3c0DZRYHVLZdAUWIqFwxUVi/8U2sJ8vU=
X-Gm-Gg: AfdE7cntsXqDY2GzfdHLr0qr+FBxxJNxPvOoeENbEkls9f0pHrG1UXEJMX38xWpp1+t
	aKZ7l8LT5XGH0vd1HuG1CImThKXZHgN9ipopkgRuGME7BMsKPvAEanYHLRgQ0Qr5QwcIS8HiwRG
	OSPlmIntNLuP7QjMKsZEgw1Htpv7riAWu6YD1P92ydcbwKuFNxsXiTPoVL+Rh+P6OMHtT+yQP2w
	p9AOJqvnN1oHGkgVZdyTiZ5F/062YLaRye1P6HG55QWU5PU5NakeiTPsL0y29VnPixBMAbK+VLg
	UPBu9mQ3R25WlOplJtKX4ZCDrwbsTj5KK2jtlxw9ZUPqztXOzNpjLcjaluQMmdPauNdCmaWwpPP
	CgMj2f+E7lTh44VK7BV52HENUg2zK8x+e7yVuyjN3KNjgDdrNCo/e2z9/cRkk5y85OugOhXMv92
	9rKfVLjr2uJv9x/ItfaSQA7QAsXdgE71KfRyi3SPFLdjGpVno+D5KLKEVSu21tBRE=
X-Received: by 2002:a05:6820:4c06:b0:6a3:94bc:bdb9 with SMTP id 006d021491bc7-6a3cbae1787mr1784927eaf.25.1784050805328;
        Tue, 14 Jul 2026 10:40:05 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:280e:69fd:7612:d5a9? ([2600:8803:e7e4:500:280e:69fd:7612:d5a9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a37b58f98csm11584189eaf.13.2026.07.14.10.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 10:40:04 -0700 (PDT)
Message-ID: <ded514f8-63d7-4cc2-9d40-a2f11a6a231d@baylibre.com>
Date: Tue, 14 Jul 2026 12:40:04 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] iio: adc: make read-only const array config static
To: Colin Ian King <colin.i.king@gmail.com>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714165012.184651-1-colin.i.king@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260714165012.184651-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/26 11:50 AM, Colin Ian King wrote:
> Don't populate the read-only const array config on the stack at run
> time, instead make it static.
> 
Subject line should have `88pm886-gpadc` in it. Can leave out
`config` to keep it shorter.

iio: adc: 88pm886-gpadc: make read-only const array static

