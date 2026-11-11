Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404768;
	b=BA+JGL3dyuaBg0oPiYiw4aS7/FTF2mBlKe8fDd62071r/nVDfZI2kI4wqEwbU52w2sFK
	 y9Wzr2mI6cHVwDYqOVdMnU8KOmg62OShOcQr5cn509AZbuX1V0dmwM4LtsRhufBaLjdDs
	 +M+19OspSO069cDL8Es1Z3aeum4r9//Ud/+dYi0Hw3HUs00XvsLYdrhB/rQ/RmT0QvNUJ
	 3ygiiPxU+NYnZqGTEeyExDwZ1Ryml+vKDvzDH1dpVGFLAPGzg3xJdUv08Gd/zW3VN07Az
	 uWEwZhM729+KENLRCbqA40PWKRoZS291DNb3aGONYEmp7ITRVM5HB9hPaP2LzfOIV/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404768;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gU5SfropLbeuhhZVQHKyKXg+TDGqXO/o10GMjJa5hHQ=;
	b=isqYzrEZ6EOV7KlQzBTnqofrzgverAckzpkOI09Psdzt8oYXWBVfnSOQGbE6beKY34TI
	 Rs2C/+STWcFaaPPVqAtJtIABKdeCsSXUW6WodVEedvPJ0Ior3Da1kRfP67o6oef0bUWEK
	 azCdGiafuAg9lAwXdCiB2sDpYvNAcyyiehQNtoK5CMe2rehrNuQRPMHBApR3jnKPFauo2
	 xyD9qdL7LtD6Je/BeGdPTWh88/+x6dGFufg0G1/jA4ppqn88WK8Vj8GK+GwCrXOXwxZdX
	 CvJb/Rv3KOjKAYJEOxc/i0kfkeplAxUWLEXiteJHX1wXdcjftJlKkiEMNOkaZvvfKPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88FF606A327
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 13:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so2409874f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 05:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404766; x=1795009566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gU5SfropLbeuhhZVQHKyKXg+TDGqXO/o10GMjJa5hHQ=;
        b=KMwdOIexLQRw2YCQFkRQ9qhbSdEkTKY9P2iBgVJsJ/iMEj0wNXPqjuHEwxwbkAzEp5
         bqqm8nF3FC1X1LVzdwnOJXye3DvZtaCgZP8L/qdWBdWP/djQrSiYRYXvP79P4rrM4fY8
         Cv9dUw0Y1ry0fY3KaTo3w8E4xpr6UgHR+Ae+1EboKD/jOgFe1HL3shIIrwTOwuoMbqBN
         dUUY06+CFFhEYuzSZSRb6TroQefQhdb6XspXb/gmaZmH0AJQfEIDF8IcwwQbfM6pNC+V
         B2jVPiL06hb9fd++G4yhes/UK4hocbj4JZSPMOB56aONR0lNevWVK9899Dm1tYWyKP3u
         r8JQ==
X-Forwarded-Encrypted: i=1; AL+hErEUuqN8kVKlkQLkb09k8v8ax11XeTZa4YCZcfBLYWEbo043HlH79qttJBIjjsQDv5JGLx2HxxUH8vUReiNk5I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tDu3rGwisTY81hcvjEFVRR1HAHeXFyOuH0LvsG55VFjJoOEMh
	9Pm+zEuWOjR2RBzFJ7JFNM3dUgVGaN7fEdU8guiByzNjAHg/3JFVJo4f
X-Gm-Gg: AYBFou3F85XTmrNrQI6Cm6Grzx4kC2ujD7tznCb1Pn2CmCmUM4eoIVMbbDLqoDzJZ1H
	4jC5cxyXsS761x43FEsLNnrcia5jxzVNsnI614zTz2pVjWD2CgkPSDFwqVfzFxwYPFoRrEFX/9g
	d4BzDPnnRuEk/Qm5612tWys7NzjTZiA0FEDgq4tIyAtKugy+x/XTbrUuIGYudkInk6Ynudj0KUQ
	W/o8IZBLS4/UAq3dv1wE5vrapvGI12ovRj9P+3uUJZie2NH3/ommcb+YaQTvFPnIHqQefurjMm8
	m0jC6EEpBiyoCdFYxXkcvflXtAxT5K/p/hdzHBaTmatIk0gSIHvmJmNYGwOQSVRRgbc+GuSkkdm
	fgsCFDXqfkKAgHfDSmOHTPwm9ghGepLKTzFgefpsbfblqsSB9eWZA1ePENI4xkjUsBiQ285phfj
	3sPKIJPZNrRik8muibJEa4pX64pObPln2a2HOnldriXBFg0+h/Bl5zWOiwnLauS9kO9kDVi3mVg
	wk81HqTiWdvJkAHQ83k191iNIbub5X5OVE1RIyM8mwA99KJlM4Z3Kdhrso6zIeKYSzLrzH1Mnpl
	4wTE2EbmZJU+Rw4DEWOuoehqAaWe4iwrJ2wDXwGgs1YDygBObwx7q52xc4ECb0VKBVfwJZb8d4C
	Yu8IYKeJLjh70ic3OZG11AgU2jCOSKDvhGBB/u2K7h2y3QmDiqjwv89iRQE4R
X-Received: by 2002:a05:6000:3107:b0:48d:f3f8:f910 with SMTP id ffacd0b85a97d-499c96002fcmr5471214f8f.34.1794404765741;
        Wed, 11 Nov 2026 05:46:05 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm11189059f8f.46.2026.11.11.05.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:46:05 -0800 (PST)
Date: Wed, 11 Nov 2026 16:45:57 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm/vc4: release firmware on error paths in
 vc4_hvs_bind()
Message-ID: <avRxlbgy9mtT1rR6@stanley.mountain>
References: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
 <20261111131528.316472-1-tomasz.unger@yahoo.pl>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111131528.316472-1-tomasz.unger@yahoo.pl>

On Wed, Nov 11, 2026 at 02:15:28PM +0100, Tomasz Unger wrote:
> So without the patch every failed bind leaks one reference, and with the
> patch the reference is dropped.
> 
> Tested-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> One note about the Fixes tag: 2fa4ef5fb943 only moved this code around.
> As far as I can tell, the rpi_firmware_get() before devm_clk_get()
> without a put on the error path was introduced by commit 2a001ca00ad5
> ("drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code"), which went
> into v6.2.

Huh.  Wow.  Thanks.  I'll resend the patch with the correct Fixes tag.

regards,
dan carpenter

