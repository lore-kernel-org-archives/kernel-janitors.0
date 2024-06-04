Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C001411CA
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Jun 2024 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487093; cv=none; b=MCMV43a0nynEc7onbJVPK7aXULey7WDL06cCiw88iTLk07FOX2I6uQTlt8ns/DrrQ779kdFj63SL6cKNSz3aFwu3PnEysXD3PGY1PnqVM4B/oSN8HrMN4Sus6FxFld+IE4+XZVlp5diO9TdptAh/bMY9VUE3Lb3RkgflUQkIG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487093; c=relaxed/simple;
	bh=K3JztJJNDmxWgE8NZyb5e/BN4rv4y/pr6l7o7i2SxDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqK5LNoRampZVOLRoXJo9N8h73jnTeTNndxgVrQH/RGq1D3kX863My/LQNSBOvCSk9CAstjJfaGfQKqFPHJF882YFfTEZ9PtK3Q+ZIJjNmbeI9FpTb6UPwn8F29dP5puxcjtiNOQADrMEUtoh8hNelXFDixPEjuCNM2S4JxcVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/AQN3J0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/AQN3J0"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so10217381fa.0
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jun 2024 00:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717487090; x=1718091890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UcYWYntWAO2W3LAxMAaPVJr5Ylhpz9Mj9naAFGZsCvE=;
        b=q/AQN3J0lmuofO9t1KTBuJoY1vEKpZE7l6GNwd723NtJYXiYKedPfNx4wmd7W22vfl
         ++2GCQviMLJeO/o73zfTQkvhZsZYDUFuhDCxbmzVaCIfFg5LJJxLvQzwvKl3sQqYvB9m
         nD0m9IsQkxkY5s2Xlg/YDt4m2g5FgRh+BS9gjVl3jyDu1Ubxv/ADnJ7TC3YJxRiTCVvQ
         OZ4XMrDYVZL320PQJrZ2N59PRFbxQcvEi2qFH2dJb3dvcim5+oi5vTLUS5Qp/FztIhbV
         CYqHRBB88MZ+tuXCh9/LyoRiaY5EXvVkd5nA3y/ugrvwtt2y1R0MVutC4pQtbtI+jHG+
         Ug/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487090; x=1718091890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcYWYntWAO2W3LAxMAaPVJr5Ylhpz9Mj9naAFGZsCvE=;
        b=OxBno+1k3t+Ambt7Xb+7iyrvq8pfxJSD6fugu8yAAHZVAEu4/vNMb8nsI49GdaoUX9
         QvPXc0aVi/sSRTm3kL81vCw76UvUARKxy+F19A1s8+DjKheV7PlWVcyq4k8jscqmx/x8
         EGwsI85A/Rb+9dwVokIPRSfNbcVEBWXmqhvChXuydm7rvykWpXGTMyK9JMc6/tZprHTe
         rj70aDrNXgia4GaTnjy7l68VJNvSs0wYKN6tpylH7+sQYJ8S+H5+BvEzze/rwyU1a+SF
         0ssUso9blFQBfEmwO/chuVt2sHiqQuxjG4hfazg9YvhmGxzw27LdR+DSEqKJxpDWUsjZ
         FPvw==
X-Forwarded-Encrypted: i=1; AJvYcCXPmiWuEOP1D6rJNb+9gT1Q4TLipygWdUpJjzqGCjuONCHayerIWvuXq8iWnGwa5LBVvmOOMFoTZcaYiziH/G9Atvb0sm029ZRHiKCnY+7w
X-Gm-Message-State: AOJu0YzvnossESeSMcFN+DJAoLNZcD6tzopvYThswUhzKCc3ELHe4kBt
	YxyHfVX/KUyTbs6Rw5fT1QUvzNMFiB3GgMAfcgIEQqQwfzUuaWrECANEYaiJjHo=
X-Google-Smtp-Source: AGHT+IHqZb9LYTpAH7wKglm6YhvwHz6YjOAKROkXHiyd6z8lsMM1DOFC6a++Wkm2gmrWAq+7DRwBww==
X-Received: by 2002:a2e:9d12:0:b0:2ea:7cca:31aa with SMTP id 38308e7fff4ca-2ea950e64ebmr74116151fa.16.1717487089638;
        Tue, 04 Jun 2024 00:44:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d5f0sm14300931fa.21.2024.06.04.00.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:44:49 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:44:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] soc: qcom: spm: add missing MODULE_DESCRIPTION()
Message-ID: <wuozxhrtce5udbn5aqxb65e5ox6hqs7tncb6biutqoetlhtouj@rew5b25dc2tg>
References: <20240603-md-soc-qcom-spm-v1-1-617730f08d22@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603-md-soc-qcom-spm-v1-1-617730f08d22@quicinc.com>

On Mon, Jun 03, 2024 at 05:09:34PM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 warns:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
> 
> Add the missing MODULE_DESCRIPTION(), using the same description as
> the underlying QCOM_SPM Kconfig item.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/soc/qcom/spm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
