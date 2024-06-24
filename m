Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC9F12EBD7
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719217293; cv=none; b=IiIuFsuPpOv5mBTmZo7VlxvUFCZHflhzbFr/CbywzDmPKcAC33NeQDIedKz2w2BGgkSHDmtCSetRzc3TWZdRDBczsSFAylMZklzl59thFDAUcoOVkS0dp5YHfJaoEHgs77/dQ22EfS/2cw/IkIDbt3AZJRu/A8msnPvElYzbwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719217293; c=relaxed/simple;
	bh=d/7onzK25APsdWR1y2MGqqkPA2ZJXUYc1Kpw8PGQE+I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D2mTMWRM4wlReD+NkKSJG+ZST0mIiFxBPoVJB2ekZVdt4vC1FcgPb1iXZMBt7lhdthiAWHg1h184Z6NHjyZiEoEJGMQfCb7+KldYpdSHpRZCnLaekS0ER+3t68dXCX7LzCEsGfHi6In3hRb03zstfvct61yhDluyb4y74dYn0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFbG7hMz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFbG7hMz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so45805081fa.3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719217289; x=1719822089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7NcOeCTe6QbjgqW/a6BuGeeL6JmiMXVqSTnEvXy5Q0=;
        b=xFbG7hMzFvklonsMJLpHVl8PL/XcAez/tPNl9J5u590KkmL/gldm+tcunPPe0S6qIM
         7vjEGxQstJmRKKuRBQQoXHvFo8eslZOvRTYB7TRY0T+krq4SwUE+GPZA1ZEOXzVNAwaY
         JfQc/7ui3bEZMfCrGDgN8ADjWeFuIk0BezkINKojlEyi9Ic64DRi6/tuN0eJZpe2tSPC
         7bLkw2Vrl/EhcOU3EoR00ntQpOKlcP6IcLcE1GXkuqV2gmPGRZX0HOknlQIKznR5SofH
         1CR925gJORakaUhjLr1+0sAubpeq9rKmYHVT7vNmVv9UYfqFPDlambPFKta1+d/xhEnn
         Ze1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217289; x=1719822089;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7NcOeCTe6QbjgqW/a6BuGeeL6JmiMXVqSTnEvXy5Q0=;
        b=hOYDoZ1T09Vir3w7vtHPpJq1302OEY53omS0QYn/uKeVj/ysHlIurnL4YB+sA3pC8e
         oejBMgKBGnfgez97OLgUdMkgLXF2uZjSL4ynbtVno8UBzdShWdMNtTGu5NQPzPSKf4H0
         YsyL2xbtEHcY0WvWlAbPDZqeRGmxGrf+wsqWZMCkncMaogw7OvHzLwjPdLNUcyNkY7Lw
         DpC689jwbH1wxkIFndJBb0+/s+tvFlbB376n27tN3MnJFqJ0RSc5uGLV+b9/H2CcOf7m
         GpUYWUDascm2yXUVNfIAXht9VC7g1hBqVbmX5Jn/lypN1DvWjHNxeUTSYnuIvPiiLYZO
         cHdw==
X-Forwarded-Encrypted: i=1; AJvYcCX4/Ty4dhcNSAV9wMcEFYkTe1xKWb5yCbASaHJrzbgb1aZUdsdfN/martMQnq2AP66n2Y1N0tHgrpwZZOd3aGazVBdLLHq9jQL0zX3d7Bd8
X-Gm-Message-State: AOJu0Yz7aHpra5oKlA2p9ypn689urrOAkYq8KgH9hGN07JsthimLydpE
	IoID1LOm7Mx/f4dC5LDzes6c3nYciqceTXKiArgMxdaju31xDluZ9ucTFaW0zhk=
X-Google-Smtp-Source: AGHT+IGNlOezhcfigWHR887LWxcT/h/hglmHb1ED9g6uw0MBIQ2/Hju9mHH0wEbb+SX8JpBxqzajXg==
X-Received: by 2002:ac2:4838:0:b0:52b:79d6:5c28 with SMTP id 2adb3069b0e04-52ce185f6f8mr1966516e87.52.1719217288265;
        Mon, 24 Jun 2024 01:21:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910fd4sm124758095e9.30.2024.06.24.01.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:21:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
References: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
Subject: Re: [PATCH] firmware: meson_sm: add missing MODULE_DESCRIPTION()
 macro
Message-Id: <171921728754.3499470.13684580570905229720.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 10:21:27 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Hi,

On Thu, 13 Jun 2024 14:18:48 -0700, Jeff Johnson wrote:
> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/meson/meson_sm.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/drivers)

[1/1] firmware: meson_sm: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/amlogic/c/5375986e16207e573c0493009d25b0c01f44e01d

These changes has been applied on the intermediate git tree [1].

The v6.11/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

