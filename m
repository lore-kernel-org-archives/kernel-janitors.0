Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279812AD13
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766128691; cv=none; b=mUz8tCP6UDoeNL2+1//RGxx1iLGaUZpSCxIKswbgrqHr20DbrRtCm7GqqLnw9DPVNqlhQtc2iHBpdVWRIE9hi9uOwkoEv5ot8D2kGkWyxz8eHtDa1+EpvUsuTPE9ektRvh6MQsSpwcqGp4BPHg7ysVGDugSxWnpZ0CLfwcH4lMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766128691; c=relaxed/simple;
	bh=5/RImDALJ/bJnj1aFQj7+EQfhe0IUVas2d8D9eXi3Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRl/xJ5LdUy0dLqasuBRkXbZuD54uPbyDsMIi4hH21DjwoCI0D4Q9UqLC2F5aS0gyL+YQ5ij+RxO3O9vPFBEkdPmg8ujkn4YpQOLcUfeqm6f5iVE/Hst3Tt7gtJSdj/Qf2EvUvlRo+wrvdvfSE+PZ6XHYItSqQqKBuEFIlWiMMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dErF45BK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dErF45BK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so1176269f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Dec 2025 23:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766128686; x=1766733486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGi0+4XwarEQLJCKZ/PM5SfQts1Wwz+1Rb9EcnA7f2A=;
        b=dErF45BKBATpShpUwpgRwfIkPqtagKQLyJ6sK1PUfU7LFssbG9VkWA8Hm8QzA5tzT1
         g2b+9J96EN74YZToI/0sGl/yiFmQq6bRjI7AMjZkdCPlniCLfu7kG3GsWCImdrou7Ajo
         Wau/Zz/Zj+4Sclpz3xnKy9f7ctl5SFec2ysAf1t6qlHlHF2gly4nFlMNl/J2IBNGd8nu
         5LnY+EvLh8ZlSRTmj+/Whmt8gEgF7dEfcsnuWK8Shp6agCW2SIiu797Em19Te34ZSffx
         raPPBOF2AoPvU60+iwziBIpGwF0tr4OVA3QDSN9tyacxfVKM0M7sCKbrZs2PHe5gyEl3
         a/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766128686; x=1766733486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGi0+4XwarEQLJCKZ/PM5SfQts1Wwz+1Rb9EcnA7f2A=;
        b=v1LTRYQ9rakztiXZNOLvonZC41x7lXPc8ef4XNr9pN4gh07oLy+uW042mpJNeZ7Mbd
         iOi4nehtm1uWYJWCLlcdVGrAR9diFPcom0ZCtRQLw4/IV0g9NoClVP2hQ5lTZjKMT9Ha
         WLxwgLt1lEZm2BHr/GSzldvKlOBQPMnEpSHxak8ThEgJ+P3DNJaZ2dCDtrkpEw/MoRXu
         VmCO+r15xEb3Qm7HrRvU29dlK3QFccQMCBBkZoXYtKlhUXJP/ImtGt5YtvPnCrf2HElP
         eekZt2LI96SwR4SeHkmREMUa5pVA5sbY6nXwIJQ+nJKbDRE2olopyduaPSUa7348p/Ol
         9Gog==
X-Forwarded-Encrypted: i=1; AJvYcCXiccI2k8KIAeb/MYN7m7xRmCqYPwD0cO2m+u9yWJYDO/W0/TWds20gwch3YeV4v2DMyE2CdjTr2YkUV5dXn/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT98yvmn3tmnrAGFUj9Y7LjSOKYHlqrCkD3BrgrAjpbzBYEjCr
	eruIz33waeDmtN34ee/EUtzaDsV8+4BWksQku99USzEIsbkN1TtMJ9QDEhQRR9yub70=
X-Gm-Gg: AY/fxX6w6Y4kJZAMOY9rGFtHHvVKa+aUNfa0PLUUb9cW0uQGJ3asXvkr2ygCR6yoTQM
	Qw/VgIQ0eoJ7BStaw88PIwnX+G/bhqNufMEcpPIBDCtbUNuBFB7N7Wi7iyjHi89nQaTm3fi1/DB
	+Zh0JhwdhaehBxzw19VE1Y3hZENug9sluLv1b7PrmiybVP4aiybaye/b+2yFFR5IxZ91tA+cxRo
	9WV1POhCcFmWQVyiuP390kp899k5tkJ65KgVj/gGADOwyiWiei8zA+W2ctoVrV0JYLhLgPWKhgd
	iFlEi5NUZ9gFlp2+8HNlmVP2lIyAUf+45u+1mhbany7zG+1RnjuxmUYd1QvL+rSSa5ljz3OIDPM
	8nx0jvNvR4yNksDXCZAvTarnz8jjAZHEBqj3vgWF/xVWIVBKXdT6bDf7esi9/XFCH8v2GSiFz69
	rmNn4A5Kk8O9SfkXmD
X-Google-Smtp-Source: AGHT+IEPtSP5+uO01zb0W8AboVxHyk9kN/vEkm/zI5MrHcwM8lX/OZgS/xyLBiTOscvkxfHoz2ZkNQ==
X-Received: by 2002:a5d:5847:0:b0:430:fbad:687a with SMTP id ffacd0b85a97d-4324e4c0d28mr1833506f8f.13.1766128686294;
        Thu, 18 Dec 2025 23:18:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm3352767f8f.7.2025.12.18.23.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:18:05 -0800 (PST)
Date: Fri, 19 Dec 2025 10:18:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <aUT8KrV36wF8ITIK@stanley.mountain>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
 <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 10:54:03AM +0530, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 12/18/2025 1:14 PM, Dan Carpenter wrote:
> > Destroy the rhash_tbl before returning the error code.
> > 
> > Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> nit: The next branch in ath is actually ath-next.

I'm working with over 400 different branches, right?  I can't keep track
of them all so I just put "next" if it's in linux-next and leave it
blanke if it's in Linus's tree.  It's automated.

regards,
dan carpenter
