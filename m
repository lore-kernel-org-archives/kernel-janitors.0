Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF692DE713
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Jul 2025 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489182; cv=none; b=cSDX4Uk87DFt/L462PPuzY1heZyVPVPccV8+/ux1/B+Gv2B1kZHu7Wqy1pRhPOkuoqqW+f+jYUYthqN/IwuiBGUEsjSsMldvQhxRz0TMFEn6ZWFvO5kohmUApe3K1pr1Y9uS1YdVNcGrRLbdz4q6I2lSw0Gkvl1wU2iQYg8A8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489182; c=relaxed/simple;
	bh=WaIoC/cmL3fc2/WgZpcj8nUZ9QVWaT0s0kkvi8W/K2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT8/WgztGWghcNtxg1JNohyTEz18e5Uyvxl8AtSWzBqvu5iXS6ffigq5mswwIXMx4zutmWdBiYVeyMEbKH9W5QYXt4JdzDHhJt9pfdAOh5MTUj9qUYEmiRrzuy8CABi1GFuaESElDtjrCnYKO1h8NR4plqnvO0RmcxyFWZhtQ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD5QnWQM; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD5QnWQM"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c09f8369cso2302649a34.3
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Jul 2025 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751489178; x=1752093978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IANwCbS5WcyJYZGFa+iX+ErGXsiLmH3eodAmALuUfzs=;
        b=YD5QnWQM0S7AwMLvfO8PGdkLRCghXRMhXJZe6U58E9D3AiLwwqHoXkCAby265Q+qcs
         qbEpWIR5hk+y2LY3oQE26IC8CzF/j8ErHR1EER8kBWUhO6PU1z5uQoZ1SYfcE3Dideeu
         RRc1OFZ4+MQsbWnKWoJKelD/SJZSUyNUqi0v52bVolw6Fdot5JrBy3TSveciWRG4cvg3
         k/d3wCfuOoQKSWlKUwCe158aKGz+QEYfLXF4sIR8Jf+Empm0C7VbkURd2bqbb1on7tmB
         0wFgs3PrG198rHGSgO6uUTwcxmHPxYVDSuk6ai3V3ID8uv38p0B4759PDo4LBicBnJQX
         +sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751489178; x=1752093978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IANwCbS5WcyJYZGFa+iX+ErGXsiLmH3eodAmALuUfzs=;
        b=J1ujODuuWiwaSkQ4V+CG2B5+eoiqNukBFl06/Q9tNyVPI3OwsF+46CI/xK/udvqNLt
         hXbSMkf2Prid1FMHb8RpPSq1EUPXVbPe4o5qun+3npqWm3hcy7cTR26+e77zkIdzchQA
         SqyRndlv+2KabkUS6tHAO3+Pz51Vlfa3Z0L5JDXQVRzGQ7SN+Jnqi7hBsurJ/SESho/+
         DIX9fnUH7uCYmRBCLasnpO9j427oie4WlzgpAJw0TcbCuPgMX7kKG2lfriPKIS3D5V4R
         Z9Rj6k0jpNPNOFpk/HyC4yFdGuPhxW1PlYxaTrbvsW78XiMfcBv0+WgEEaQKW7Kkgbh6
         bMKw==
X-Gm-Message-State: AOJu0Yw7ECMjz3fmeGZ2Mpr+hAxgWZZ/Ifr26ZlZ6t5dbnsevGjE++HN
	wSTE5Bd3q43AC97PYVq/9QE1WMukADDQUTUpgUa1rcO/6mkfD7/Fe9Diwq21qT++m7A=
X-Gm-Gg: ASbGncsQqkTg0R/9e7wvDHZH/tWe5bu7fLL+I2AiQ0ev1LCvRQhK662wY8WEdG4fxS7
	XhKMkHqQnrGNd5YwEEbeCtTZrNPjq2whKmQi6ej0R/+IFB2VPExSaHnSAzygmINLhvtCpV7siXo
	I5UadVr61U8VjuKAZCE9M9UXmqh5Mm2mCHODd+V8CerZ44vIsutALYkxHs9YPk3ChG5Jb5nABbG
	fICZIhZ5kSef9MS4SjcQJkeg3HhWf1gdoUS0yybWryufKraskuLpUIiJPvJMF0CLIECsedB3hH2
	um8aCQinVS0yrp3n0J9Irul6FpesBL9QbFjuP/4cInFx91pgqFIT7fU1yJ5KNDlalyo3SQ==
X-Google-Smtp-Source: AGHT+IEbrcMCM3tvq4k2Faf1Bs6BXZSGdn5BDm5Pu7Xn5h0fTJO9mS5i7nInX9kErBgVszq/fpxXLg==
X-Received: by 2002:a05:6830:3c07:b0:72b:992b:e41 with SMTP id 46e09a7af769-73b4cdf12d7mr2932682a34.23.1751489178577;
        Wed, 02 Jul 2025 13:46:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:7056:ddb5:3445:864f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e3239sm2636562a34.42.2025.07.02.13.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:46:17 -0700 (PDT)
Date: Wed, 2 Jul 2025 23:46:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruben Wauters <rubenru09@aol.com>
Cc: kernel-janitors@vger.kernel.org,
	"Robert P.J. Day" <rpjday@crashcourse.ca>
Subject: Re: Kernel Janitor resources/organisation
Message-ID: <3d8118de-56b0-4e95-8e51-8722e9bb6b02@suswa.mountain>
References: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel.ref@aol.com>
 <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>
 <dafce66b-8ea3-4f68-b8f9-6016334aa318@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dafce66b-8ea3-4f68-b8f9-6016334aa318@suswa.mountain>

Here is another idea.  Add __counted_by() annotations everywhere we
possibly can.

regards,
dan carpenter

