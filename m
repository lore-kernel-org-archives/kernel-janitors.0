Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4181474A9
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718040358; cv=none; b=Sa77JCkb/Omu6b2hfpwdNMcmVALaTsTacPW4y4snFhsUUCZaNUN6Aod1AQI6bmo7vGL+H7P1wxzKMp9F8W/Kn+GzBd6TgPps2rU+cX4dj0GIDIy/hrqr40jWYgdO5LWLvrgY5GsoAJvmTcrRZPbAlazjMyaehCOpnozSy2ET/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718040358; c=relaxed/simple;
	bh=3m4/S4G2Yh24KJS9ZtKS2EJOg00cUqAvaAz79rtTSWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiD6wcA0+cnz0x3mngTDKZUilq20lIKqG1APFY6CEK+SVcB+rIJ9nyTyo0r7seIvpRpyYbuycPrUmCMYq+GDkSAMfi4PzGgoGykl+0hi514bKpxVOEVcOb4FC1EmjCAwDLL0QdOZm68kFqMUsy+28T8HA2ocpqjf9ky1sW2+Nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1YrASoQ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1YrASoQ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6c702226b0aso4207291a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jun 2024 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718040356; x=1718645156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=abr2ue7yuPh0+wQBY3PyFrKJ/pZr3cN2Ly9RsxIqGXM=;
        b=t1YrASoQzEV04/Jsy5xWnQ7Wp3OKDgt851PCeUvNzJYb3eh2LbF4zuxDcvrVXngB8C
         S4FtvwsjrDo+qKMfYOnlTjT0S/cDVV1cRuIkHgNwlSe9W6n5kZDqTbUhOB2sppZOGium
         9Z9lL8gqF6Zqo/emMWuG8pAwEBOfH4oQc5TP1HjycaIROg4GuzrWVuLK4yND57QAsjCq
         J1cIGoKc8F8ha5rk13SutILtSVR2MY/2nOloAyZWZnXmANeyGBODlM2JHwZ4H6m55XwA
         1ZYvH47utQfZiJ4imZH91xuEYU3C6rK4VdcQvbt8/J/FW5vCvmrK2bwJ7AhzLjE/D5hx
         MGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718040356; x=1718645156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abr2ue7yuPh0+wQBY3PyFrKJ/pZr3cN2Ly9RsxIqGXM=;
        b=H8Vi9h8/i0kNW+xJiR9xo8jnTJ6Vkc+XPNYFJm2XNdHVR4eh2RL9LU0hRJemjTEUva
         fT+y2ebyjW49tKMl/huynRoVkP7wVFPx9CckClB6KToZJiPdYRKsRpuVTeHTj7I7JycZ
         M2kO2DqylnA5oo7jTxd74l9Yee5oMkoW5vWWLjjUYJzUA60ZzXI5Sy47OVAwbpUELVC6
         NrvPH1L82tOzdXTDMBH5f7UDgw3tQv61rlpx1pJ5qKfYOiFMrDZQ4U1qv2PPPsvmfshA
         EeuHMOImeykaQgkWLj3nu81YMjU8SS/uFQ0UDTzNmq4mNlpSsAlMsZbkgcpahkMyYVCo
         yzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxcR3q2iMEjo+eO23PY07pQ+XF9QE/pFmCEGAIG5+P0zbZhyZY2ObFiD2wZOYf8yDhjZY4msDMqixIETpa/ttA0/lXwoKYYVnEerzY7c/G
X-Gm-Message-State: AOJu0YzWRFOlfZhG/DVNfTCpQ7cmp+b0u/rSQYNBJcpQhShVdcXbAwYn
	TUA3Pfi6OVlzwgRNfTSroZ9CNpDDB9NgrbsMNrKihHPZrQnsgICtlHvfldlZ1Tw=
X-Google-Smtp-Source: AGHT+IGG9+tJMQkgqsvCDc/nEkepy3d2r8n5n6dXzQzqVihO3brF8FWb4ywE8Wcq3W8Wme+D5vSwgg==
X-Received: by 2002:a17:903:230e:b0:1f7:9a7:cd33 with SMTP id d9443c01a7336-1f728792081mr3720315ad.3.1718040355962;
        Mon, 10 Jun 2024 10:25:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9b34:fecc:a6c:e2bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7f7ea0sm86056265ad.270.2024.06.10.10.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 10:25:54 -0700 (PDT)
Date: Mon, 10 Jun 2024 11:25:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rpmsg: char: add missing MODULE_DESCRIPTION() macro
Message-ID: <Zmc3H6PN8WPpgXNN@p14s>
References: <20240604-md-drivers-rpmsg_char-v1-1-675453267fc6@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604-md-drivers-rpmsg_char-v1-1-675453267fc6@quicinc.com>

On Tue, Jun 04, 2024 at 06:53:44PM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index d7a342510902..73b9fa113b34 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -566,4 +566,5 @@ static void rpmsg_chrdev_exit(void)
>  module_exit(rpmsg_chrdev_exit);
>  
>  MODULE_ALIAS("rpmsg:rpmsg_chrdev");
> +MODULE_DESCRIPTION("RPMSG device interface");
>  MODULE_LICENSE("GPL v2");
>

Applied

Thanks,
Mathieu

> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240604-md-drivers-rpmsg_char-02914d244ec9
> 
