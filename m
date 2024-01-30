Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16607F7F8
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Jan 2024 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706629749; cv=none; b=DtUgRUXB981UVQz18oVTkRGeHttRuBknUREN8OTdtIz9qIAVw5fRufan+2kyjLHte/xSRUDBj54ldno+jEgs875yOgyVNy8ct38F39X8sEyUPKA78AHSc52orCF44EvX8j/07zrx53Iub220q8JzlEmYlMe4gv+ZRdVf6uk7gnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706629749; c=relaxed/simple;
	bh=pTA0YMokaA0OHcx03bR1lxoroP4wL9uAc1cyu07K0qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTTd8FFx6ea8U8K0dPXpGiEBqO8lBPPBjquLP32oicznry5lB06vEPhT7T10OVu3LU/dKwOZappW4eMmpdRY5T39z1LhKcEzXzWHn0XAWrxnjx6W/c0uzQSCBwVzsCN3cO31EQBG8t4KSUhYtxKzdB4GNKHtlH5ewiPiCaCBCE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aEC0Ca5e; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aEC0Ca5e"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33ae3cc8a6aso2295588f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jan 2024 07:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706629746; x=1707234546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YilpzfeTkVydeu8rZL1Heb643X/Jk6q1uV/3UL6XRrw=;
        b=aEC0Ca5ewNdtm92avr3pSba35A8/7klAspPfWi07KLSGMa6TjVtE18SnmcacTEMlXz
         ggACP9qk3yuS1iGos21/fQYW3EV1Qblri8ixCiWrWfpy4Kc933+7mfyBOZ3m6UtySEZI
         vGAXMPtawZKdsQW6v95OqMkxDq/7wFNYb2GqiQvzLhr7x3QtgdY8zstVKUBPrWCaW/Bp
         MATMCF1LTctfTQwHHS+1nYYs/3ObnEEJscm1PaPB/VoFC4pXv8344S2VAsx5cXABSLfe
         YGZ6NBVppppGOzaBYC25xOtQk8VhFa50/JksIJoP9W7uwYBkMp1XjA26Y9jl2GBrmprM
         wVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706629746; x=1707234546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YilpzfeTkVydeu8rZL1Heb643X/Jk6q1uV/3UL6XRrw=;
        b=u75pcn+P6Pxxebv99IJlEhjVpV1OIv6+0cKAVKKjZfddo1UMWt6BclVqVPa/VwYMFB
         UhMB7gs7bf98y1hWVzbe28Fjrcbzgj9gpM54z/fGTPU1oDZrUnvl71jBeC0+jYBzcpk5
         3QvZ/Ou/f/ekT3yQoI26tjp56wA/afxvs2NXryVCXjw2ZYfDvtr4eROnLWoUN4efI+qD
         Y0mJNesTIWdHSQ89zAWUbTKRQxA2MqWJQzIFPCQh5WcN4JKAPtpSmtSy2Lt/FrY1TWcG
         yd9DTYK4CPmiYZVkYO3WMM56Ix3IxvAJ3mH0v1TdjlXTdF1vjkCrRm8UOJaMJVB/mJ6K
         WPow==
X-Gm-Message-State: AOJu0Yx9YdLhuSe1+rAcINBaNBsyKoydcZMZZiIswzSRCDS6q8gpBQa0
	9uBzBKN1pUeTX0ad+qzAr7oYq5gTjcm06J9O+EBVvI3fQMXxB1yr3ttfPvZlYS8=
X-Google-Smtp-Source: AGHT+IFcHSOTOqrPAz8LjD4G2eREPrpkyWJ8wUJcJtLmYSq0P709L3wMWpvTQHOdkBEqjyVsfdwaVQ==
X-Received: by 2002:adf:f489:0:b0:33a:e9d9:5e82 with SMTP id l9-20020adff489000000b0033ae9d95e82mr5041773wro.51.1706629745960;
        Tue, 30 Jan 2024 07:49:05 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id ce6-20020a5d5e06000000b0033af3a43e91sm4434425wrb.46.2024.01.30.07.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 07:49:05 -0800 (PST)
Date: Tue, 30 Jan 2024 18:49:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-fpga@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luwei Kang <luwei.kang@intel.com>, Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, LKML <linux-kernel@vger.kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] fpga: dfl: fme: Return directly after a failed
 devm_kasprintf() call in fme_perf_pmu_register()
Message-ID: <b7e2e9d1-5e3e-44b2-a4b7-327d334b776d@moroto.mountain>
References: <d94376b6-12e8-45bb-a9be-4887bb316d35@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d94376b6-12e8-45bb-a9be-4887bb316d35@web.de>

On Sat, Jan 27, 2024 at 03:55:19PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 27 Jan 2024 15:43:42 +0100
> 
> The result from a call of the function “devm_kasprintf” was passed to
> a subsequent function call without checking for a null pointer before
> (according to a memory allocation failure).
> This issue was detected by using the Coccinelle software.
> 
> Thus return directly after a failed devm_kasprintf() call.
> 
> Fixes: 724142f8c42a7 ("fpga: dfl: fme: add performance reporting support")

This basically doesn't affect runtime because perf_pmu_register() checks
for NULL so no need for a Fixes tag.

regards,
dan carpenter

