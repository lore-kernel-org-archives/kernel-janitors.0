Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E706246BB0
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078852; cv=none; b=PbOdCGD/wSDEFqfoCR32LHnOrMfgqoK40U/DaFgfUB7fi1P78U1v2LH1opqBmiMLp/r+VFSS4yCjexS3MxUxuGel+XoDDruzis2NYhEvOfvtGb6CgxNOZhG1E6Zh8RTx5if9hDJArmHkxHjDL8CiWWKfLJKQWrDReA+K/LwNlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078852; c=relaxed/simple;
	bh=l6KJEbEVM5y7rexEcKSpqScYa9AjmZUzszGRaxbfMbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEQ7DEVPx9YB3FJW3NLvLYCECWH0xOxErNQo2N7Y45KrRZYOwWlNI7k4qx2Upx9g9vTWGVCgbUNaERNL65d7Anaxycqq0zlhoUYjR8efTmWHDoHJ5ESHNFjQoCqfI+tYKSjMEZvm/b4cWpKgCUpiMgzcOVpL6A2dm15AVLmEt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqJu0BFW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqJu0BFW"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so39563295e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 05:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764078847; x=1764683647; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfZmCnQkSgXm6bGG1U92mqMyyCoId2oi/fIXBdd/gDE=;
        b=HqJu0BFWe9MX0qrV+e/NVyrsEUydEMR85WYJ4asEA8FTDuB/EBQD5OECI9VG1MERT2
         km7KIBGNQ8T7smH2Brj7tfpScbljbanTXgoR+BZlnUqBjgkybHAClgPvkHz0GcuIOLcn
         M8OYDvUOkQR3urYeh1DLVmqusMWbsDM32cOeSBN9L/mU3YNyzD70IzT570SFnuO/Sni6
         MX2w1ckDcrb9k/mQDQdzXOtZkgc4mwEF6+VvcxiEih2OLb0oTmlgyKRYKJO4p3/r9G+J
         9PF/V/+tRhGbLl3m0RQVazcKk9Undz4yw9a8RFYtre2VuJoMUvem5pgtbKMMNe4Bpq5z
         yv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078847; x=1764683647;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfZmCnQkSgXm6bGG1U92mqMyyCoId2oi/fIXBdd/gDE=;
        b=W3A7la/7CjWj7VP90vutwqq5H+pMCfyrjVL9RDPezTmemyaJgIpM4AdNOfZu/zCUbM
         UhMLIzBcZ9sbDEisyNoh+y7FOJnHN1htyanICzBOuGXwlm4fLi1uB/kZYMhLzrSz7w+R
         Fl8fMhZ/mig1yxUdWHPg8xMiaOlpEopnHC1SWh3sQ4mmlp4bdq5pCtjysZO8Z1giDn5I
         B6cmb9FD54lExbdsj80FK6UHnxTJQcfdFFwR8kTWhpkGA8hoNK1dYMpUpv6e/AgrgcX8
         o26R3rbWyx+UoOWYJAFILSQkqS9kqN9wlenKRKrn6FUDgRsjXeSgMd4go0p6ccRIpJjZ
         6XJg==
X-Forwarded-Encrypted: i=1; AJvYcCXH4KNffoo9wa//u/7SnObPq0PPXoyNkure0xdUfTeRG8V09VLuTDvRNxHARGG9DYLZfnDRRMIHc5SjlJ87Fjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwON4mDVng5FkpnfZ0ic+7PEbL2Qeh1XuDXwanDRjpaMaxTqmdY
	vifRzyM1yW3pfqwAOdb6AWPYLn9V0P/5Ha4BEsVg7phTe5hH3aAiC5lkHUYn2G5/ens=
X-Gm-Gg: ASbGncuZbt40x0FIb+mStW223J5Hhv+4tIdcYhHz71sBq0Zo7ABaPcwA4eQnFO3HeVh
	b25Kh6haJp7PFsLAOfSe/oJ/+DHPLKX7jVVYNHxajeZxlX8t0ERQCilcz7KXxBMu7qQ5s9b3uRu
	ZzVLS2wtwp/qIxurHAOdn0Wl1pC6YGx3OOzLooMNp3UAJl7qQwNeyPSo2BHXypINmNmNO/tP6rO
	Ax5ycoQ/YOOtn8qqwSmEalXIR/lZAx1Y6aWMwZjE8ORUOKK8aEWFyfTV7z2TMuswd9hrd+OYA3N
	7YEXZ626+CcP8WdVX2vyLtiQfcOQMnVO3dRPdQ4xBwT9I19EKjkrrEz4EejLY3PkTbJ5PdIv8/p
	JD/ABSXkzTPTj7V1Xpa3yCuw9Ai9aSZ+7BxYEnz4lYt2fd738XPNgsU8Fj+IvJ+v52cAT4disir
	xkFnZDd1sfucoEEm4s
X-Google-Smtp-Source: AGHT+IE6Z/i4LBBFZymostPyZofb9RWGBQcEhAavUgAtLmc+CAwBQkdpZHZEouVOs2i7Ai+1mMZV8A==
X-Received: by 2002:a05:600c:3b9c:b0:477:af07:dd22 with SMTP id 5b1f17b1804b1-47904b24243mr26387045e9.28.1764078847095;
        Tue, 25 Nov 2025 05:54:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf22dfc1sm250227535e9.12.2025.11.25.05.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:54:06 -0800 (PST)
Date: Tue, 25 Nov 2025 16:54:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] nvdimm: Prevent integer overflow in
 ramdax_get_config_data()
Message-ID: <aSW0-9cJcTMTynTj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "cmd->in_offset" variable comes from the user via the __nd_ioctl()
function.  The problem is that the "cmd->in_offset + cmd->in_length"
addition could have an integer wrapping issue if cmd->in_offset is close
to UINT_MAX .  The "cmd->in_length" variable has been capped, but the
"cmd->in_offset" variable has not.  Both of these variables are type u32.

Fixes: 43bc0aa19a21 ("nvdimm: allow exposing RAM carveouts as NVDIMM DIMM devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/nvdimm/ramdax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/ramdax.c b/drivers/nvdimm/ramdax.c
index 63cf05791829..faa6f3101972 100644
--- a/drivers/nvdimm/ramdax.c
+++ b/drivers/nvdimm/ramdax.c
@@ -143,7 +143,7 @@ static int ramdax_get_config_data(struct nvdimm *nvdimm, int buf_len,
 		return -EINVAL;
 	if (struct_size(cmd, out_buf, cmd->in_length) > buf_len)
 		return -EINVAL;
-	if (cmd->in_offset + cmd->in_length > LABEL_AREA_SIZE)
+	if (size_add(cmd->in_offset, cmd->in_length) > LABEL_AREA_SIZE)
 		return -EINVAL;
 
 	memcpy(cmd->out_buf, dimm->label_area + cmd->in_offset, cmd->in_length);
-- 
2.51.0

