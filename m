Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDE61F4736
	for <kernel-janitors@vger.kernel.org>; Mon, 21 Oct 2024 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513071; cv=none; b=ojtI1J+9tmsD5GOXh3pb59D8PPy81/rp8uPsNlKnW2MKkxMGXHWaBnJTgXidtHADMJNmjRBJ/ir+H57LQV1H55+bM/dA+chvuzmtmHHLKHs7gtqyL3Dqrp3NDlZg2Rp2MMrzHcJdFGbbFhFcKN9gKQYQgHZqXbpSildgxkF7Bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513071; c=relaxed/simple;
	bh=9JaJDa5MyPviy31aGKVHAgL1SbZdM09T8uuMJO3H9dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjNeFcmj8us7XRVQANSwPxUBy23AqMOU9sNLA069YSBvwlKD4SsOPIGg6+u7b08aL80nCVAmKrL8ZuwUWb9YLhppIZlU012IHOSIr7BTv6CkHVNUCPFPOjPPanfx1CsoCaijNFN2k6ItDp1oTUly+lXT5Lp8G4n3LrSUqcGaRjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yjT/4fsW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yjT/4fsW"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f58c68c5so6462577e87.3
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Oct 2024 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513067; x=1730117867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/lwrPsOwBrb5oh/mkFzBAjwdyTSBus1TJM49Q2CS5Q=;
        b=yjT/4fsWV0T8jG4y4jk0A7OJd56cffPXz9tUL/vh0Qv6KIp15GEWEyNGiXqHzaUV6y
         7TmbQw703KTTpUoPTIsztOh7dTXZLdupQJnG0wURc7HEmu0oK9CIaLFAkakrJLv0GX5X
         wuvdEZKrLijsS17WNIrstbCWvgaxiaRQ1XX91/3BIlGG7BGDq7LS1XEWBv2TrOlpYqLX
         0HDL16hIurbTO3zISqVwFNrcWKbMUF1z/UnxoFDSH3HwT3o/l3NSTKz0+k5Bmps8PcOu
         q7hDK9OXsqjG/mUfJinNr97t5+sNR1pN1rfB57uDHQhenUmS8sZ4X5CwQu0enPlN8/o2
         X3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513067; x=1730117867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/lwrPsOwBrb5oh/mkFzBAjwdyTSBus1TJM49Q2CS5Q=;
        b=BDVLLPbgf69c4AowLKo5+W9PBYeFwDzbC3IBKuokoRH4pICHSTBg15wesc5ddFVHug
         3IRbN7yAMUDPs5y6pG1glvzfk384/T634BR+tibM1YjkjdY8NRFNpxtTDzZR7ljqHfka
         PJgKsSDgXO2o/vIWQvDcq7NY6ZMxRygI7SpWtGU2ueunb9O+Lhah11/sMp7nbyn1YVvX
         DSSeUFBwKHyG/sm7NYDzr46tLnMQarqf1o+n2nxLJADvcZsIb9jYyVOfS2jBPkd0P3pZ
         noLEeU5bY3+VNXbQyadkZhtajbJOeWXWVMeD/kW2clFCyZH1UwKw38w5GK+bV9mdbpyf
         vJyA==
X-Gm-Message-State: AOJu0YymaV62XCDy3lNJLh3zsSfgNRAO/KOuVYurvO4kneGJIWueAS5Z
	1MYiuXzkryng/CcAn53y6Eh/0NH1bFf1EQH5n/Yp1Q00WYQczdAraUzCMmtSBnc=
X-Google-Smtp-Source: AGHT+IEP6mcffhGZSX7EvL34NQS3DEgeiHeuK3RZgNWRLKAjBPSyrv8ab7zBjb68JmV7/I2QOU28cg==
X-Received: by 2002:a05:6512:b11:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53a154da8c4mr8581550e87.57.1729513067076;
        Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm8998: make const arrays ratio_list and band_list static
Date: Mon, 21 Oct 2024 15:17:37 +0300
Message-Id: <172950935861.2053501.4420742606956398087.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240912151037.592477-1-colin.i.king@gmail.com>
References: <20240912151037.592477-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Sep 2024 16:10:37 +0100, Colin Ian King wrote:
> Don't populate the const read-only arrays ratio_list and band_list on the
> stack at run time, instead make them static.
> 
> 

Applied, thanks!

[1/1] drm/msm8998: make const arrays ratio_list and band_list static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71f40d32fa4b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
