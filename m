Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABEA25FA29
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Feb 2026 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023165; cv=none; b=svqtnNWSv4to0z8oCH3h4WFxJGf8tpmFS0a6dS9ol2M+81vTdZ7CvBgPpo43A0cEWn7nA8jQCgef2nQ7nekXBgMRk8iyhjnsjv72o+/c11ANn1zc1DlBp7O240b0iuv2EWeQa5qmHu0zcFYaKqFiSueSp6F/q8rC3T/dAnXqJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023165; c=relaxed/simple;
	bh=6t9o5o3RYtewNVytJap8qFxXaSF6/WKX9CqMkO9FB+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHEAHD5/cgRQ+jV3ZNo6gaVcVAgjk+KZofO5QVz7N/7MbwWuq4cJAyQxyIPEEr8ijHaIh1Ffm6AEnz/4k2ZQlnS7IUI4W6NeVy9U+PVKnZx+nZ4gWbUI0oDjv97DlQo6lwttdZPOS6deLSDkJU4RoyFRu2eI8tn0TdxS+9BrcGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VQzUMHAQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQzUMHAQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43284ed32a0so2200441f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Feb 2026 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770023162; x=1770627962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IoxtLp7rtFrLRVILF/bd3sDmgwrITuD4a9HZ33YIXUU=;
        b=VQzUMHAQOzAwjkZLEf5tKejYQ7hCFwcqX9lV70tEl3L+bl3Q9fa5N/xQYWSeXIOjAR
         q13QKT5bFjYocdSGEVia4Jn54HhSG6T8w2M7sHq16vtZMveVIlYywwUlv0jFZG7w5Ogo
         V5P8Y/HBXsZJtUWMJ1Mc1CNc4fmnzNiyPkjyoK75L3WFdf9xcVJZdWneXDhSUdR8Z/Ap
         CUfULaJjqA/2EOfdjWjfDhunj75Q3HG8zlu1nw5ye8mt1BvC8JAlsll4vr7ktdY6PWv+
         slP5qxoPShy+CvquC1p80N8BSPsbSyyyHKqxcIVixztAeojKiU+nSoQ+08tBshkhym5N
         6q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023162; x=1770627962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoxtLp7rtFrLRVILF/bd3sDmgwrITuD4a9HZ33YIXUU=;
        b=YZQmCfdsqCCuJwoLAvfqB3Fy0wCML8yO5B4Pahp9RgBRsduA0evXCYxo3W7ElWWB40
         iEcq1BRU2DsZUGexLNXIave/D7/x7mPp1zQ58CEfRpPBYt+ErvV6mKkR9d6JgV8N91I3
         g6hiW2xH7DCzcit9LDG8hZ2GL+wryKF4a0SgrbtVmHqRfrSslc+u4HjrBDKY0aPBlT6Z
         eVtT8B9za4xLlNbUK3Bn9SM7XgVU9XayrECOSwVgafcuST6bMKlZBgLB8odqxTRmJwT6
         vh8ZX1GjEkuDPIz4EGLOtvx9GjeF8NiRRYH6e3MNKVSuKo2JI9Sa3Rtwq4gsUVkR/Z7r
         TMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx5mc9Uhp84+FxAwR3ak3opJIAj8DE2q6S49PVnsqHMsvyIECQeYqP0PvPOK5O+ui/15H3QUY04aXF4rOL/aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhAzodJdc4DaMVP7qhH3qhUa2kVjcWZnARckLTsKJnfHHjG/hA
	gqivFV0iUwMANf1M9/+OI0A4DaAKP0211jazn4U9YxJ4TtCgtMJIMVRDM4yegbhdN+Jz8aJAuu3
	obuPb
X-Gm-Gg: AZuq6aIRXxzWh0CSJ4VwNpP6l01PzXLmTYAMKX3Rm9FYyNXU8WFHTiOtFxiLoB/g2aM
	yx0DfXGXNgM0QV5JGyIHeVhw/nbCAmj/MjcLx2nUu72XVzEpuNPNd5i0O1GbbkEr3lMHXXzIwG5
	Ik2ezwUMHpq/7jW+eIRopU426oKlF3b/nEsBfhptiMMAVsgR51lKLpWG0Fu3p1dQESwIgwkxb0v
	F4CaFP1406haCTFRBHClFfti9ExdoJtb2jh+O+Zfqu7qPg1vYrYsxvM8uPBxWw1pz7PrM6uveEv
	fhrCGcgve4axJh00acbDKr2jYQUhETo5s7pJ/hVEFhJ7X7QQPFbpOpWfLQ15Ah5w1jsU5Zjqnou
	ZgDLLeSq7i9e+mPTGaOarIOhgXIIp8OmBUQDveXWfIOhdlhtvQTMRrlqXUg4Q+tYXWg0jIIOYu+
	5ZWSN5GejZVy0Ek8Uu
X-Received: by 2002:a05:6000:4026:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-435f3a6f78fmr14230582f8f.7.1770023162426;
        Mon, 02 Feb 2026 01:06:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm43939579f8f.5.2026.02.02.01.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:06:02 -0800 (PST)
Date: Mon, 2 Feb 2026 12:05:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: root <info@ljfogelstrom.se>
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] selftests/filesystems/mount-notify: fix unused result
 compiler warning
Message-ID: <aYBo9xj1A8Jjlmjw@stanley.mountain>
References: <20260201144416.1637814-1-root@ljfogelstrom.se>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201144416.1637814-1-root@ljfogelstrom.se>

On Sun, Feb 01, 2026 at 02:43:17PM +0000, root wrote:
> From: LJ Fogelstrom <info@ljfogelstrom.se>
> 
> Compiling with GCC emits Wwarn-unused-result for these two
> statements, so they are now wrapped in an assert similar to the rest of
> the code.
> 
> (Apologies for sending this twice; I am new and missed to include the
> maintainers the first time)
> 

Don't include this kind of thing in the commit message.

To be honest, I would just ignore the warning.  I think the code looks
worse at the end.

regards,
dan carpenter

