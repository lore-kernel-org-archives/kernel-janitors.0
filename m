Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8971D5ACE
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312115; cv=none; b=U4TSnKZVkrpfRn7cNbc81Xa/U1L59BTtmou9FqoRx2D8M4EtZF7PDtRyxSCMHDZMKKhNN1dVv3EM4SXfdGj2D+/8tSrZBEwcp0/h6CVnuFPhE5Z8ix1hxU/dPUWmzQsUPOkOZ20Kw6xTHPiI53Vv+WnM80cY0n4xMB7XfN5bFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312115; c=relaxed/simple;
	bh=qXtzQduWyG1nnENxyFhaOaAmJ0Qdb9v1mRc0A8dmTZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ry1H7PVXTWmyAe/BCIjg8PCMTD2j+grZSe4dbNQM2KasJQT5fetTkTQm/AlxZ48JXTMEG0WSgXD3djzz8LzcmdvGrU62YKS7BjX+XLXTSI4aeR+R90t31QwEwvNTw5JHCHhUtaIRecW0/qniAR5XaLJwIwUORv8546fdbHKDipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ni09lOP9; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ni09lOP9"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2ea58f008e9so2125563fac.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312112; x=1751916912; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXsvGPzWyN5t9Z1gnvLwhC+mL0nu2lbnJlTwsulGJGU=;
        b=ni09lOP9WqOG72I7EUutge3hqeAKr/ONT9wPjgPqDuFihxEcrVV+ByqoR6m8qgrFnY
         mj6cEzq8EAmtUz5Sf0N8VaS0rbAHAdyJnnHZXS7bkzv4Gt52+9ll3PAiVJrwSdLX4/EU
         uKvcpIE4HT2BKhfKehD9Xr6AaKxWaHwwaukJ+1Y6PeaFY7pbS6SMNM3k6plh1ljRD5/+
         C0DgUXTb2f+229rNesHsfiylKNgKEtbrV4P1/KMeIzSYWioYlMgcMh0WqxdxpDvYlX3F
         iMITN5o3dQPclBAssLJgywiRTAQJt6j9h+JnN/yd/C3XZfU05+xEDEUCb07eKPUuIx7+
         NjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312112; x=1751916912;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXsvGPzWyN5t9Z1gnvLwhC+mL0nu2lbnJlTwsulGJGU=;
        b=A1pRzlFsPTbprJ6OwD0ya2WLoU3/uDQML3vjDHjwMvFxxGIzGet3YhA/rkU/rxQeGq
         tGtu56hNOsUsDLyKVuE9KOKCBrOYNwwozJt7vQW8qUzJbeAoKmL3oM9cN6uq6kdhFlGi
         Ynbst3ruMLTB6quvgbpVi5lGfv3GOX7XZmAI8vzFTsdMdwbgmtSBPOW3FXfd0VYMqVed
         kOfsdA2SCho3Z8J7lrE5Iwv9NkyWCZ6B06/ePmYpjH5h+/biFYQol9CZTuk8WEjX52Gu
         v/ufvtHXFIFLwMyN/Jc+Y7T/ChLlg0ijC1dBVNtQpB2FXYZQBRI9xML9ufh9U0oFMEpb
         PSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMzt2M77Zq2KQrahGxkIpGPv9ofsoP+57V/Y27MpnfmpXGrlTBedUmcRBL1gT6uhnR6zPJACqSIMUef2gv7pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmfXwBJhvOefoF7D1grggLRPlOumBEq7uIs5BEGvscl0FptRb
	yfgF3YJ0Hy/esWKpY7fDYNdI8uTp/erOcvyq8BZWADY8AqFrpZJwOuB1ECLg1e0zV3A=
X-Gm-Gg: ASbGnctHI5ffRUb3p5lL0go6cKInPeHhP9bW4BoFM+Cx8gaIG1s6K6UjM7pdH/PIoiY
	bHIqdXw6z1hr+sVdJzAJQNCL/KPx2FEUPhya3e1rIww9vvXaDCJB3qi73vXeHFTitk2tAPGJlVH
	KjREImECMJHzvN9Wav3WUzfMCgjHUMAXCg9hJqUutArxZEEr9r2l/9mikhJfXHTeJkbJc6SOrf1
	049GJJwrnzmaVU5jhOVdDkeNMlk4q8ZQKUxHHmMDinXCdp648BedQMTM/o+a3dd/BEiiO5oXQmu
	nKsgLx5wOr/Nz5ZePIJ0rFiGN00aNPDf1mIYmRF2aeu0Uag1ot7Be6hkUxfiT4+Dakuw
X-Google-Smtp-Source: AGHT+IHBfKAmf1lqnS2UU9I7hvaUGYYEqpqLvNDpx99U9Z8tqVzOU3X1JHzaOOJJorbDRYRHSHPO0A==
X-Received: by 2002:a05:6870:f721:b0:2c3:1651:ca78 with SMTP id 586e51a60fabf-2efed4b5be6mr11398659fac.14.1751312111789;
        Mon, 30 Jun 2025 12:35:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd50b1b2fsm2876906fac.32.2025.06.30.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:35:11 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:35:09 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This default path could probably can't be reached but Smatch can't
verify it so it complains that "arg" isn't initialized on this path.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I didn't add a Fixes tag because this likely isn't a real bug.  Plus this
code is very new so it doesn't need to be backported anyway.

Also checkpatch complains:

	WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

But I left it that way so it's consistent with the other return in
the function.  Maybe we should change both?

 drivers/pinctrl/pinctrl-rp1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index d300f28c52cd..f9cc6b28994c 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1524,6 +1524,8 @@ static int rp1_pinconf_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		case RP1_PAD_DRIVE_12MA:
 			arg = 12;
 			break;
+		default:
+			return -ENOTSUPP;
 		}
 		break;
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.47.2

