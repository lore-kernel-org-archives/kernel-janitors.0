Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60422B8AB
	for <kernel-janitors@vger.kernel.org>; Thu, 25 Sep 2025 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806929; cv=none; b=dcFcGylnLp5rUl0XaxQFS/wnauKc9cb81matGn3RQxAzDtCvchfuEmMREpSNX/gCzkaPGIaKGd0p0uQx02a4VGJXs79PmLevSsQJ84X6v8NT1x8I3AixqV9+xPTu9AXwjG4fSXZh73ZY55aGebVsscv7LhPmoBWhOjfEx1qUVrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806929; c=relaxed/simple;
	bh=1FiNIcneYN0lx2HvUgcqUBdFJAhxJjJ2x/onBI+Yrs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUuGcOGv7GM2EThvAv+btmi/ghWWfMzQy+OfUQhVIAnovUfCOXoTerwI4ZjPpP524eKYomiJRA1HaqIttnrGuSqbBQD1tfmIHq1zCJ1gI32UPN2hbvVPMpQrPco0jIMzCG+nj3rXhstDrALR/UsHLrzjtKbg81A2Vr5F0WNG4rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KHhaud+s; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KHhaud+s"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso782703f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Sep 2025 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758806926; x=1759411726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp58/Fg9Zw3xoKwG1DXjRBI51T+T1GKwsDLk64qZArA=;
        b=KHhaud+sKfU9GmJ7mcrVLGKUOYK06gbcMRTOgwvCbMmQY6zBc8tsg5EBWu9tvCFTOv
         xkEcmWNS/FsRnqu9zm3Ev0huYQZja+d8dI44wgOkiY4456V75zBwgJiTfkMnKmAJxssl
         RpZnaGEkcY/EIYWC0neFYTEClurx9W3CR3ap1PmZDflZ5muMGvDXZWs0kuET+SqKybRR
         Q/61fU5FBOAngp4U4nQGtE+7Ac+a7HSv9in9LKdTvlUVYgHQRNyr/ZiJqEjuxHfGatsp
         gDrQ+ZUzgFGNnAhl58hMrLGbgn4TXFxMd/gr1rErJ8FHgdkUS6VmiyEuyTFqXgGaQriH
         aaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758806926; x=1759411726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp58/Fg9Zw3xoKwG1DXjRBI51T+T1GKwsDLk64qZArA=;
        b=eNIiUNCaHj+HzYdc1/bsa+Mz7CKSPa1r85BUcomrNorw4tuaxdqWVL2ktH77AGVL4m
         8lzMyl3PhnJ8GJSiUFJ/d7BySLnM5VXjxXFjq30/ltoj0j7mV3EroRJUY14/5ImUlvIi
         ckH1xmyxfmt5bUm86GwmdXBbnwbE6O81jBA38spfGLzjFd1c6ojdO2hFIP/MuRkHdhub
         NLGLnkfScV4B7814rzqraqsA6JdQJaJ7LEw2BynfaLa0SzeJ4/JMbEN1yabutFjIlgwh
         ERLN7KAD5F2Y3gyWTNF+1sgEKkvsR6t7wub4zYvBOlUg2uwXHZA5D5boC3ohayqAD+yb
         7a+g==
X-Forwarded-Encrypted: i=1; AJvYcCWiNzCw+Tv8S4N1dYB3/gz/0ASMzW6CMSfx7XXtaUXrjrh3iEfO4/qjfn55R/qVr+rNk3PT12zywd/i2XiFfbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrBK3WpGGCt1QDOCGoBSSBnAdlCSrJEeC94oygQujbN9wx5LKr
	gpyUbLinubJx2AST/GMnvJLNbsIRjrZH52qoVqMJswru3kFkoa54QPA820QfAbNKSV4=
X-Gm-Gg: ASbGnctze8vsY8scQYNfe0zlg0OO9HUgmMFnFU42dIE4Sr8WgV4LIiXXM1snVUD77dl
	f1UTi891V/lgWjxsOesNIeE32SmK7y3AC808Js5YN3eigo4827QHncrKdKx9KZvjeefCCWBy/tW
	z+6/zRBlHNO59o2tCKLm8TPpdzePE/HGa+ZvsOg+HfS7zZjg8OyCPNTbwqC6ILtqMx9NL0VOv5T
	ZjMgA1chHxxamqTUP6uYAUwd5KZGGaP8sIqZyinQHGN50tQ5nNSI0kQ3qPs3TC6E3st8SGvAYsK
	z0OTr89J0eVvH+a1s67HsIYwWmDL63194sUYJBpD/TANSGfHmAPRbYybWw6vSliyppcG92+BmnH
	7WBxnRsnB3e6pFoGQdoSGDKRcvN7d
X-Google-Smtp-Source: AGHT+IHEfXijaL+23iCR11cBYBG6j0gp/yAlAN7xoxHtuYkzjN8fDbBiJ7bNzYz3ne5Aj8wBn5ePpA==
X-Received: by 2002:a05:6000:2c0c:b0:3ee:1294:4780 with SMTP id ffacd0b85a97d-40e4a05bf15mr2460323f8f.30.1758806925981;
        Thu, 25 Sep 2025 06:28:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc7e2c6b3sm3258932f8f.54.2025.09.25.06.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:28:45 -0700 (PDT)
Date: Thu, 25 Sep 2025 16:28:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Ivan Vecera <ivecera@redhat.com>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] dpll: zl3073x: Fix double free in
 zl3073x_devlink_flash_update()
Message-ID: <aNVDijGWI3ZO2aOw@stanley.mountain>
References: <aNKAvXzRqk_27k7E@stanley.mountain>
 <20250924170057.GQ836419@horms.kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924170057.GQ836419@horms.kernel.org>

On Wed, Sep 24, 2025 at 06:00:57PM +0100, Simon Horman wrote:
> On Tue, Sep 23, 2025 at 02:13:01PM +0300, Dan Carpenter wrote:
> > The zl3073x_devlink_flash_prepare() function calls zl3073x_fw_free()
> > and the caller also calls zl3073x_devlink_flash_update() so it leads
> 
> s/zl3073x_devlink_flash_update/zl3073x_fw_free/ ?
> 

Sigh.  Let me resend.

regards,
dan carpenter

