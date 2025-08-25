Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85523957D
	for <kernel-janitors@vger.kernel.org>; Mon, 25 Aug 2025 05:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101054; cv=none; b=H4uSPC7q5woNcw4yZuwon6KZ6YQ0GJIXUZF7iRc51NM48ygZxHtOuvSf3wwoM9YEI82Qhzu9mQPPOx5MmyrveoCL3JWpvft/So/oIIHZD1sWppOd+FgKqIjSj2z2Gf6PaXdHKDuF91u4auQj998eZXPx3BMVojNv/GwqeVadXJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101054; c=relaxed/simple;
	bh=BAqTAdXs4MjQC8FvQcEMzCUW5UWfMeCMYzz/lFKaXXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teEx+o3KIwLYPUeaqeYE3EgnY4QkhXMlR9HdsvQpUj4qKuGbpYbVF1uobConDDO+2Ue6wY/dmI0Z58y8iSExFDVRqBzu6IU3TsXGKVE3projFsW0Y3NH+BfOZP2gfH/50lcjB/Tw2HW8eKTcVeppU5+czZb1lW83c53hIdHE+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=odtwJzgt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odtwJzgt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so22722735e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 24 Aug 2025 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756101050; x=1756705850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XxtmnzOlVO6p+V95rUDP1WiZ+MmPfDK3rKZ1gsByIZs=;
        b=odtwJzgtkfYyUdh1XKZR1PoDxq1l2mHF2cybZD3VFR/SEh+VSGef8MUacJiDsLtoX7
         iNAjC1YlrMBHl3sbhhPiDW+/5/Sz7Y/+rqeioC/SMKXIpjBbWnQ/4V0HBXhkqprHTrPs
         SN81kd3O3P8S5Bvk2XyLuboyKMqVz+OZnmPkr+QrtFcFFSfz1t+XtiE9w25R0zUehaRO
         MqwgYQXuJ4+6ClQR0irT5wLxAJL4OAHr2bWk6uoM8bW8FSl9XPRTs/hSA15iyfkfOms3
         k+ydEB9pXzCo8SoJxtVR2pBv0avfIB5LuS8v4wOwKwvaz6FxkybZEAJXeK5Er6ouR9z3
         VlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101050; x=1756705850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxtmnzOlVO6p+V95rUDP1WiZ+MmPfDK3rKZ1gsByIZs=;
        b=mbXoLj5PlkMCc4CVkD82fH1aFVD4D9igNfTFv+8Zq00i2Yp6WiIrBze8ecUMAvTOu4
         zy3ZkWAM29mjV2pfl7zHSdWTtTmpJjnFzqwRGtBiAurGmZej/2oabcIMnYoT5sIjYw7A
         4tGgmYE2kCa/57jn1MDzKDZ2BvFsPIRw7drC/UpGDavxWv1reexNEhSgFXYlf9GCFY7S
         sWoaqcibNtqnE2uBVMyGfhzzAxIxhhTYyvJbfya7AKMTNXqZFdJ2H4NPLnaSj8wQEIXJ
         wnVmYt3/Cwh58UiQ8IwgdPaQjliQ6mPUB2oJ1KXPcIPu6s11XVcQm3NpyldfNaIL+y8S
         VrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq39Dks7yU5uZ2HdyJA8+IMmxCUpwhN0Rnv4QkrCErIcovCQpUEeXw8yJoqy1gJuQG9YQP6VawAJZsPVw01OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXUV9NMaet+a01goQShMU1kvFYkmrnBPUz+jB1TyzfO/wJ2mxQ
	5Bt11VNmrLfOzMI/ASFHAr9E8uNhnuOkNV0GFAxI425/xnLVfzCZ1zewM82U7WTGd6Q=
X-Gm-Gg: ASbGncsX0Q2hvJCqp94+/U4Gl5rcQt5hY5OWbYarDlyycTBotct2d7FY8AvIFV/4JZY
	36yDY7SHM7YkcuSKVtyuGHb09Hg+iujkWPxZlQWyRovA77WAsT42tGj07VrIu30FRFMh0Yu5mdn
	GTRLjFrsjWvGkv8UMN14EfufmFN61sg5emOokimDv2U9bzuQ4//ozggvl8BULJG6cZgi5SWGW41
	gA2/MLdLcNlPxeDB4y+nA/pWslM7th8sYo9gh426dmD05BzTZ+XzhTFcTlie26p8khB3O5NIKm/
	PBUmFqknD4oh9ww+t9cZp0tsGnR2GyW47RzE3ALq88N3yB4PvDAPEExqeC3/EGC1/RK6KKFiKSm
	czIEnDsJG146krhoN/SnJvvbyd64=
X-Google-Smtp-Source: AGHT+IGz2aNXINA9AVw27//eFJnmfZs0Q3t84LgC59OwvDU14iWZUpLl1zIrpYWB+eSKSTk8r90CxA==
X-Received: by 2002:a05:600c:154d:b0:459:d780:3602 with SMTP id 5b1f17b1804b1-45b517d4185mr86200605e9.23.1756101050486;
        Sun, 24 Aug 2025 22:50:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b575929a0sm93063515e9.25.2025.08.24.22.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:50:50 -0700 (PDT)
Date: Mon, 25 Aug 2025 08:50:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Douglas Anderson <dianders@chromium.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
Message-ID: <aKv5tkJghj6DZQIB@stanley.mountain>
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
 <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>

On Sun, Aug 24, 2025 at 12:54:41PM -0600, Brigham Campbell wrote:
> On Thu Aug 21, 2025 at 6:30 AM MDT, Dan Carpenter wrote:
> > If the mipi_dsi_dual() macro fails, the error code is stored in
> > dsi_ctx.accum_err.  Propagate that error back to the caller instead
> > of returning success as the current code does.
> >
> > Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Good catch, Dan! Thank you for the patch. I'll try to be mindful of this
> kind of logic error in the future. Please let me know if you have other
> suggestions.
> 

Heh.  This is just static checker stuff.  https://github.com/error27/smatch
Humans are expected to have mechanical attention to detail at the
same level as a computer.  I just try to write the commit message out to
prove that I've looked at the code as well.

regards,
dan carpenter

