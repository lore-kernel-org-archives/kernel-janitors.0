Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676F1E8338
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986054; cv=none; b=i2JBtu2K8hU6OYkNo8oq7I1jAktEEQAu3KVfTU4jvugLpiNDZFsUCh/Rb845VEF+O61caBEJsJzWompHY6HS1mg9jM1d4hVyovUjKN3pdogcA5RCCAZdQ45TesHGwHJRZbYjmJb9m4X2Q6KPGGNjO1wEm3uOOPu6hzaQI/fgStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986054; c=relaxed/simple;
	bh=Hln+g5OCHrAMOq/+1aDVAlOsgByEM+bWM9zySDltuR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHYtVqA2LgE+n98yhdCz4a6qsOjVvQnaagXueQcIqqfsYbDHFydHgyPGrUWlpgM5E3/dMvyEV/mi7dF9IG4l2SFK9RxFvlFdsMKXy0c+Q8t/F8f+GUSr3hkrYS4ZsrvRgPLq9Qz8EWruCJgFAbEDhmueaMo10mhGpnYnosf9rqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lo5jZC3i; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lo5jZC3i"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so6541233a12.3
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Mar 2025 23:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740986050; x=1741590850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
        b=lo5jZC3iAcg9TiASEN+02v8tjNCnIVO65YHcjQRfQveoHu178Vz4pycEF2VX+IMf1N
         qVjKOMdtBeG1S5LjTzJrESdeRo8xG0RwJnTyUMV5NV3DfAMSh3hUdACUGlxF7uuqzvuV
         q1Mtm38cTmfNA3U0vbvUKUONHRBoOI+RDB4J73PWf+7ikbFfIAZVliX3S3ZJh/uBpSfQ
         csU6x/97ZIR9KzXPZ6JMwqWZjeT8NFz6VqvWxH2fplDnXAOIEVAtR3CtiAiscZUsdZ9n
         zwSBDpFAFoxZ3XJYliPKS/+AjC0Fs1eROjFVnqa1BAmBdok7E+48ekfPKMlPham2XFXA
         aRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986050; x=1741590850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
        b=qUtP5G2a6alz0/LXwTLpLw+5OfoQq8SZrADGDQtmPv0hjgF5iJSOdncEZygLvweeKg
         pj0FcUIPEw7ibLbTtZ3fEilSZgeoWdAgNeFeCc2KoP6kmKQaRl7fICKPlfF7U5Icgpfv
         d/Q1nZbQoFxRBeq8KeZWlqke/b23KmAnJABa37vxL3211rueK3jktPXRLtG5pvgtnZdh
         8Kk2kg7SZmvDhOG9ANGGfdBogW6njh0opQP4W27g0rRWesRIGz2bJcvNKIBeo/sz0IhB
         oimg3lJEPOu1mJifyMCK7IpYdR6IiNphkWvHGh5eiOTOUFQzApr/oM7sWxUkDPA5bwVx
         XIFw==
X-Forwarded-Encrypted: i=1; AJvYcCVNzXwrvTkIeozh/LvnUF0IAwgSdZUkKZUhOB0HrrHKUGZQKT0i+fiSqY+0ptvZKGxqVwyj8J/ig76EJctZ6dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlw4ufKlCjH2i621To0j6LunRWrGCncuhGhM9S8HJ+94FJDuFe
	FXrOJdTqTCbbQH+s/MK/SCTQ2gou/bvASXMCQSYduAl4ApVtSueXBX/S3GPzfic=
X-Gm-Gg: ASbGncuY+3MIBtgG8bk7ItqRBXBpEKjq91WcKUH6HDJgJvwJSFv8/Ud4R70ZEkTf5ar
	e51scRpt1SxJMdVgP7edu2Q7+G9bMnMTzDyTDjrnNiWYy14AHdObQqvBjeUX9jyNuEmn8yvmanN
	YGdVfgxn9WuTSOZEXMYtupPJpF8QGoDMHUA32ypUIePhZ5038/DzbOTOBPr6dj40lF2Xruv/2sw
	YE0nSqim+We1Xc3Xax6mXrmM3ncxTPepMaImDl9iDt9EPYrbHhQudhOMSKvwwx5yqaoY+UDkA2j
	pEP7HEKvkoaDgmV4WIkL//yEbLJe3elF3gjBYBfVSrXb0mmlDA==
X-Google-Smtp-Source: AGHT+IEny668UimPZ3R6dx4axvviTs297S1IJ5VK/kkx2SxfpDGI4c5Rl/7By42IdqNYV74cMm4sFA==
X-Received: by 2002:a17:907:980e:b0:ab7:b250:aaa with SMTP id a640c23a62f3a-abf2682f996mr1554838466b.54.1740986050266;
        Sun, 02 Mar 2025 23:14:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac1dd6fd870sm60633966b.70.2025.03.02.23.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:14:09 -0800 (PST)
Date: Mon, 3 Mar 2025 10:14:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Archit Taneja <architt@codeaurora.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>

On Mon, Mar 03, 2025 at 01:01:40AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 11 Apr 2023 18:24:24 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> > 
> > Thus avoid the risk for undefined behaviour by removing extra
> > initialisations for the variable “c” (also because it was already
> > reassigned with the same value behind this pointer check).

There is no undefined behavior here.

> > 
> > This issue was detected by using the Coccinelle software.
> 
> Please don't send resends and/or new iterations in response to your
> previous patchsets. Otherwise they have a pretty high chance to be
> ignored by the maintainers. Use a fresh git-send-email command to send
> new patchset.
> 
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

Remove the Fixes tag.  This patch is fine as a clean up.

> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

regards,
dan carpenter

