Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05D192D68
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779688; cv=none; b=Z+7M2rIaqurcYUnGoH1lU1CqaoP2Brgsrb9OFla1KRdvtq2b3QkP/jFB76+QTTsoSISZCAGWXFZWY/1NOHLJm8O/TCMSiI9A+J57BOYQ+DaVhrUTY2LNLC0K7z2V9bLCHylMQrzjUgWfoA11EypBWXs6qHLa5OkMH+T+eXuDoS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779688; c=relaxed/simple;
	bh=2ikSgfGf1exOnsFu88z+5kxpMPTxBzklFFNfq0MBXfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nq407V6vLRsfRQfOqDbbW78OpKXlWPpSO1/5MA4eIanQkckcGghPqR3+3UkoiwsIX2z71FNp5neA7PObhG17f6asae9KQ5I+kqXQCGNYONUKgxuA5sziXoQ+NHDSFuKd9Ep5yyNwb10/TfagWnf21v1p+k3+4sOjcgtyzYH+dis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcb+1zgw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcb+1zgw"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ded368fcd9so5034900a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 00:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739779684; x=1740384484; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziFzV0Y9ZdSXReLGJPFeArO5FCiM55hkxr4sd1Sn0do=;
        b=fcb+1zgwh2mXX1AMSgeEnNFcHK5Mf2w1i1Zi0KaTTmM6YjVrBKmIqVF1Dc2OFwd0w4
         OkysB3CFui06AqR3Sk+//iriDKsbGWA5+75okgn7Pd/y6gB1a9c65uhxsQf9QVEjQj+p
         pYLpvTcmk8+JfzbiK74fRLqJ+doBD4LlaNhbaHaFIia4IlSWlkGDVoiIzp9BcKj2lMnB
         mPxFgDXsCMZyRh8pPEGOt6Nsz+oKrLcQJ6DIWl9twHMwuUVTsb90XG4GE0IRFXiGjFbd
         GcBaWkPvfwK2bOl4XTIzLeDeWBe5ijlYbDz/5ajO58lVXKFXPdg+Vdh9BcuDKk3Og786
         gJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739779684; x=1740384484;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziFzV0Y9ZdSXReLGJPFeArO5FCiM55hkxr4sd1Sn0do=;
        b=lzVoONjrDYJM3gvpbLHo2+LHw5qVaVWOD1VZRkgbo5l98Kk4ce20oKxViczwAm0esI
         1eRjCw/iky90sd2bIjQKuJXXJKKWydv4R0yOvln7xrfhKGd3M/drIRO+C9RUNSsc/dWm
         ieNxzR1c+/pDWPllSol2vTJvqdz6ZusUgEZMQch7nY+CUbvaxIgJwxQTj55NCLloIBlz
         ZgjSkV+Ozd3YrLD8q+WslL76n8LvrbgZVhA1KlAiE1HNGOBrzWHZ/V0s+Ez0F/Y2EILy
         MVRC4Q6fLwtlgzOlGg2k9AcjSBf5yvekyIlObefh3x0MxzgsIl4T41Lrbl1kkJJ5TmlH
         2zsA==
X-Forwarded-Encrypted: i=1; AJvYcCUM3qTdAzhLie2RjSyQrBobzDdGQngu26hUebilHJBnnb9StCDLMhXFKlFtRE0Q4uzMxQCEF1FG5aE03Ob1EvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKhuttdlnekSb8++xqUcbLUeUPDIvv5VL+Jcpax4k0mizF8YL
	4v67fBXHEj8x34otnQmuUfg5mY6qdHSXm8JjJV165GWMyHIYoSSkEGOV4urfDuE=
X-Gm-Gg: ASbGncs2UHW4O4lcES+E0VrHIpdwoAj14hf31GMAD1qSeHcD3PyY5ukkWfUQCuYV1z6
	99v+FQjESZZ+Nu7A/2gDBCaEUJaST7hbddgQzxuoMpLMc13+S6vMcbBxNCB2fVCrl02R6F22K14
	FoFdYYkHWU+2m1fkzFG+WBO9O1VKKW1LRVHtpsc5icIz5VpAdBrsDe9LjHBxSXrNordtHBxt31Q
	Bq6KGXqDvhqM/JdfpGDkz15wUrsA5anwUJLY8bdN2lencfPGscZypEkoCRRXp94vWztoZt42o5V
	QfMKCV8zJJk28fyLHwjj
X-Google-Smtp-Source: AGHT+IFBXYQnvhbaTs+R1+H9kU9Himyc237EX2vSSmBY82Bm6sjx/eueayJNYvLdiOzneYVu+KD0DQ==
X-Received: by 2002:a05:6402:348d:b0:5dc:882f:74b7 with SMTP id 4fb4d7f45d1cf-5e0361747fbmr10164192a12.30.1739779684400;
        Mon, 17 Feb 2025 00:08:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece287cebsm6843141a12.74.2025.02.17.00.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:08:04 -0800 (PST)
Date: Mon, 17 Feb 2025 11:08:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: iris: fix error code in iris_load_fw_to_memory()
Message-ID: <a1d9e082-a4d5-4440-996f-7ee7e850de60@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if memremap() fails.  Don't return success.

Fixes: d19b163356b8 ("media: iris: implement video firmware load/unload")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 7c493b4a75db..f1b5cd56db32 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -53,8 +53,10 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt)
+	if (!mem_virt) {
+		ret = -ENOMEM;
 		goto err_release_fw;
+	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
 			    pas_id, mem_virt, mem_phys, res_size, NULL);
-- 
2.47.2

