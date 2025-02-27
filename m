Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860F42C6A3
	for <kernel-janitors@vger.kernel.org>; Thu, 27 Feb 2025 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650286; cv=none; b=gT5OBxz+1ro6VoPlfz6r5ukGruPqLYK1vzV72xht2AlSpgB06jWTYEy2C0r1kt9GXXFdUb8rqFSU2dH1AFBY2845HFcpKfzR5638Y47bYiVk1IRePYD1dS8/QzHaKYI3VoLNRl1NASCqQbG07N3zgMlu5f+jo3m2qVPJ/YVP0pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650286; c=relaxed/simple;
	bh=Ge9fC7VXeXg5eotJVyxxvzY/sVzVFFuENY6NvoL9RQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9fX5EE5GyoAdXsyuecbua2V9tr3a9aFY8km4TqDeDJpQOFlsJEh+s2iVejvysknBtFp70zOW9rBZtnR5dQHkBTeJKdq7bDy7eTKqbTKYFV4lC0z9ex5iHmophCxWdIKYmc+oJiaijaNGcLPCK1RedRpxN5kO9K4xwJvuXiwhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aD/y+JHs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aD/y+JHs"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f378498c9so678240f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Feb 2025 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740650283; x=1741255083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=luyiuzmIQ5J/UP1GJ3bUu38sxNpe1CL8R9HpytNsO4A=;
        b=aD/y+JHszvXIiJEDTAyEKVx0eJc5jY8kpVmSx3dgLfD/s7TVozmasXOB3wQh6OhDFl
         SkIDkAgBd2x9gNi/RgXd15USWU4oK/5SNSrSQ+VxrwTfYFI7FnEGYgHywmJSKE+HLP1D
         alvuFN+6N7445PvFRLkJc/4rgV7iVFi19WLlV0Kcf2YImWVrRZvZDH4CTftPtjJ/fYAP
         xoetbqfb86N/AIlJ+DNCJl1Iuo9r70IwEOixAro2AA5QEdIxcAXlBkIDCOMiJnIKSxCa
         gBQQpEm+cCkMA4dY6jEEK1AnNdkGXEE47UGgNGdvyE4bl91vZfoRZP8wc/pZUfNf+Tel
         FIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650283; x=1741255083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luyiuzmIQ5J/UP1GJ3bUu38sxNpe1CL8R9HpytNsO4A=;
        b=G5jEev+ot3WIFRpt18ZSWt3E/JER2h0/Jjm9r58Hw/cHHSNmq6zcDkKeKtKC0zCxOG
         /MYdyuIobISXCWDOvL2g5pd1Neq5sRrKZMJdZZD/+0Hyd8ZxlsRGyB4WfIwO3jRCydwg
         nhDWNARjjBzjLgtcuwiV8APJHGNsseluDDSKH1gBfIY3AGzZpwIf654S5fOCAncXKsZp
         G0BGXZEu+WUlLLzg2FWYrb1xzpw96aoAbzy6FYYuMvUDoZK015chFy1cit7fKOIjlKdV
         yxocA05zmnHpQ/dV/c8786ZW+NBmD66qpmGWxiKKCiTPRCkUn0JvwV0C6QuP+WrRZ1DM
         /LbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7B30IM9fNOCOdfnsCa0Sw7Ehwzk6GjVJLjyvgmG953HtFWy7LZBB+2scojt+klv8ga704a0vl4jSGK5dFWug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRnq17x2YQMuG55uzcIpK7nTQDsqgIlwAcCVi6Nps2EYm9y9b
	O5UeNTGx/RPr3bkXQagD56+VfdU0bFe0CeuBwu/OS1WloD0C0wVR1iNqqA9ylDY=
X-Gm-Gg: ASbGnctzFTWWi+nqAqVmeGrwXJ7lpdLboPPa+a2mHwb6GIBD+NZgUX3NqgCvVOX9h21
	U2qLUOdf53G5s79nPFvWat3aNd8CaHshLhE5xm8ucWcSFyhLW4fmkVrA0ymuVkbouD6/tByh1Yj
	bGlsczIctkrD5XsKmr2bxIIrUMUQ9dHU/JsdDmY4ySFl4isfxClv6xcFJaFKQB8XbhNxS0CGk6Q
	PIbZXS3oWy8pRfzAQZ6ifVxiyIDOHtM1jMmRSq65/oVywLVMWjWnhMzSU7fTR1fucIX0Z+I2D9U
	xfH9zEwYtpadVip60KQ3BYl4TJ/oos0=
X-Google-Smtp-Source: AGHT+IFKHbXxbAc2/iGdRn9hXwR8RAtENLAY1c57Ue5l0MtullYL2bqOmgHNPsi1xz1ARqmNqCIOxw==
X-Received: by 2002:a05:6000:18ad:b0:38f:32ab:d4f4 with SMTP id ffacd0b85a97d-390cc5f58admr10673661f8f.4.1740650282838;
        Thu, 27 Feb 2025 01:58:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c6ee70fsm95121066b.116.2025.02.27.01.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:58:02 -0800 (PST)
Date: Thu, 27 Feb 2025 12:57:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] scripts/sorttable: Fix resource leak on file
 pointer fp
Message-ID: <a7857c72-89ec-406b-8d66-d9e95657a6e0@stanley.mountain>
References: <20250226224934.594983-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226224934.594983-1-colin.i.king@gmail.com>

On Wed, Feb 26, 2025 at 10:49:34PM +0000, Colin Ian King wrote:
> There is a resource leak on fp on an error return path in function
> parse_symbols that causes a resource leak. Fix this by adding in
> the missing fclose.
> 
> Fixes: ef378c3b8233 ("scripts/sorttable: Zero out weak functions in mcount_loc table")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

This is in scripts/ so it doesn't really matter.  We're going to exit
and release everything immediately either way.

regards,
dan carpenter

