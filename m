Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B3814F9E1
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 06:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723445549; cv=none; b=ePYe1+qudLo+K2uTyt2v7TIbzDwzP/F9eEPjybyGPAc0iWbahSc28ZvvFN+L59lwUPfJ6cO307+/2uYrO+f+gv2T2DW6mMGSO+nBoUEQD/NqGRHgLW7JUStzYofixEJwz+cxQ41RGx11rCTCBWZ/7/Vno37YQtziwGPWmr198nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723445549; c=relaxed/simple;
	bh=pSAXbYgoPyhOzoWZQq1jxIxbA5US0Ij9CvyBq+u9Tk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtufKDC0b87O/8ESZPrKE8zTWyjzDcnxSlIorTZ5rpsOi2OAWpJSY8qtHcQ9/JPcJlIOTTO5zhY8IrL/cfKV31vEKhpNuBmmMJynLYybV52SEDc5ITD6ttRvIQxmsO97QXyRkUhMrjlapDSCXyGkVbfd/Pr0HPme6tmDkcUaUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLIaLthJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLIaLthJ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f0277daa5so5426350e87.0
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Aug 2024 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723445546; x=1724050346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYvutISkLRUGH6JLFpRcjOxTE3aMRs9JKjHJPpsTDJM=;
        b=lLIaLthJpbEBlDNDTy7Ag0xmsPD3sgBIAk9GlZLqO0Y8rKw0EfW2WdtouMaOh03Ljc
         dR/FYCw1qBJKoPn7ptw5UKusWtoX+O4mVCk89iq+lICTeBUpuaYf+4rzD9EJhSoIZbh1
         83j2FdroZRHvUumXX4WYwsEJu4aD0ePCUbzyTnjT1ql/jtdcwBx63nd82jM0ead3KcLh
         J6g7wJk2keAbPVaWNSuww4EqxN68XPRXIjBCoRyaSSlS+MN00sb8WZ+RiaXvwoPEfcfQ
         fN3PvxfHOKEBCuLugaqgSP4Duy97pmpsGVhppKF5MaI+F0VeFYlHQdXptVZlRHecsJjr
         Fubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723445546; x=1724050346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYvutISkLRUGH6JLFpRcjOxTE3aMRs9JKjHJPpsTDJM=;
        b=GfrwjhLuj4DdTYfmNR3On7wYHnJkjKkyrLeLK1VqHMYf0ty34KEq7bODOK7nJ9uYTK
         2xL/qSz4yjeoVhRKtSxmQyHkYfKJohjI+zIP0pmd1+Tq6lnOo6uBIWYdY00Vw8TwoPEV
         QAe6YHgr97ghpN5JVdKhKvXBDbNRZveLRgjDEW1Zjk9X44fVYCWXZQXJc9How64oF3md
         0Fij7gEggGv2nL5fj1JOFi/b+Cf/YnX8L6wxvz2eqGvrCOUAXACPirwWJ2abRAcWisMV
         ksqDPMf4ZdNXeO0YA0yB8LRP5NU/Z7sbT/5+9vHn97+EkqwJnVAhiO20bTJqL9/1OHXQ
         OkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKToApbO2d+TWumlSx9/oswdlxonFV//SG+zK9z9gwoglzh6VMCVMOY0zvV6eRhPOqk2zA5jDwuxWeUSiJL8TXosbn/91qpd8Z25qPAL/1
X-Gm-Message-State: AOJu0YxrpRqCUDpah8Qb2VWjaMAzDcMogkKo8bnl6AQms8GzO6LU/A8F
	LpnMTp/aWykO14Rn67g0ePWIL9jp8pWPtIJTk9VPoi1UgaAP3j9RrB6WJ9/ZuvI=
X-Google-Smtp-Source: AGHT+IEhleIQEZN/9JGTRhxG1EPnf++IP7O/xu5A3Y0gWPhqCZnhmQaXR3vNN1OTOTN5uX1Y1o4fGQ==
X-Received: by 2002:a05:6512:b02:b0:52c:adc4:137c with SMTP id 2adb3069b0e04-530ee984de9mr5848753e87.20.1723445545776;
        Sun, 11 Aug 2024 23:52:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a602220sm2012351a12.82.2024.08.11.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 23:52:25 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:52:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/ast: astdp: fix loop timeout check
Message-ID: <989ba8b4-19b4-4053-bb00-ccced42a8829@stanley.mountain>
References: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>

On Mon, Aug 12, 2024 at 09:42:53AM +0300, Dan Carpenter wrote:
> This code has an issue because it loops until "i" is set to UINT_MAX but
> the test for failure assumes that "i" is set to zero.  The result is that
> it will only print an error message if we succeed on the very last try.
> Reformat the loop to count forwards instead of backwards.
> 
> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: In version one, I introduced a bug where it would msleep(100) after failure
>     and that is a pointless thing to do.  Also change the loop to a for loop.

I mean this version also sleeps on the last failed iteration but at least there
isn't always true if statement to try prevent optimize away the last sleep.
I'm okay with a sleep on the slow path but not with pointless if statements. ;)

regards,
dan carpenter

