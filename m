Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5782571A0;
	Fri,  6 Feb 2026 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387290; cv=none; b=dZBbBw2hK3TROOTQHm/M4Ps+12LjdlPOI3dUm2obPh5fNFOWkxpuAWks1b5mTOEZtuiGUfQsxoBelRZX7IKz2UgH+XJalPXc6ugpHmOs60uivsbuWIs6XpGFPCtrQCshsVDykO5OiM+x7QRtiejQ+1x3gbPRUgOl24e2vAe1UGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387290; c=relaxed/simple;
	bh=Oea2q1mbzc6eBGZdMkgIL72V9UkqPZtZ/43x3BnRTNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EOI061jMGnz/x1UhLtvzu7hZWiPbgir/niOJEFgi9hr4ZN21JezJQWc7WEzPnCT33fD0Zj9bSphEp5OQAqmc10uCSo5uF88FIrJczIA9mrcsOKQ/1Yx8PBrv1M6zINPoCTpfprRfca9fA1yMiVTuTX9+fsRH9l5PIaZwZEoEfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfTu/DN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfTu/DN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9906C116C6;
	Fri,  6 Feb 2026 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387289;
	bh=Oea2q1mbzc6eBGZdMkgIL72V9UkqPZtZ/43x3BnRTNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bfTu/DN5eHwpzxiYSmOGCegoCwGzy+xMv1bX4FyFwWn8fl/8Gu3HWLremBZ94qNM4
	 E8Ldf4SIHUR4m10GIyuHJVG2Dlwc/7Z7gHGLSFBVWsxClUFwudDk7iFC+s3TMKYQvU
	 CDT+oMQqsgbMBwONol8a4mjTmYmmUya45le9xFYzoWx1ypATrp/CHaS0p75my73uxw
	 j0G5yRYOUU8EaC5a7LQIIh7dt+IitFQB+iSaEsHcCMP9ANi/XiEDmGBMdt4Dh4bStB
	 hBWY6nAV18xuOqFsdVjz7YbYtao3lcrL8uEng0Nf8+RGn7ypXkRGRYEJ+Gik9s4Rsi
	 Fy9jEpOa+RHNA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,  Tudor
 Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
In-Reply-To: <aYXu7uqMQdZRMmQF@stanley.mountain> (Dan Carpenter's message of
	"Fri, 6 Feb 2026 16:38:54 +0300")
References: <aYXu7uqMQdZRMmQF@stanley.mountain>
Date: Fri, 06 Feb 2026 15:14:46 +0100
Message-ID: <2vxzy0l6x8kp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Feb 06 2026, Dan Carpenter wrote:

> This was converted to a _scoped() loop but this of_node_put() was
> accidentally left behind which is a double free.
>
> Fixes: aa8cb72c2018 ("mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Miquel, since you took the original patch through the NAND tree, can you
please take this one too?

[...]

-- 
Regards,
Pratyush Yadav
