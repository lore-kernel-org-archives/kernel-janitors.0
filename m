Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7271B8E86
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724959393; cv=none; b=WuBVoPoFxeoqBkkrSciKgJnUh2JxJrDmDZubrgnDG0EIH9BRqjplnruVOEzDtIgHWQAutp2mEJRbgczirMIvsy3Q6l8Bf/y2Kkpi9EHhYMtZMrL6Iw62ChCMET2nGsmmgeDHEq3JHeHF7orQ04RIyzm8TW9/93Z82UaHDRcrbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724959393; c=relaxed/simple;
	bh=ukuhjIxgkFrw5P/9mVNrV8Qq3LbAA9wjABoHcIrvHsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nF3bcDEGCOLmIEJzqNfOUFLW7SUx5KXtWDA2VdHfdFugj5qwrN4VOZ7oMvaC3bGB7/W6w28dHoBiDQhUgK4VFQ5vGbKqILkONZenNsnDOtOboRFwW4g7Y5S0zhzxgxvj71yME9XXjcHmjYtIgwrQKqF50XUBI2fCS3d6JE8IslE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DekIvRRD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DekIvRRD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so8779895e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724959390; x=1725564190; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kb+/gPdGEJGskPrMhsAh3708IPHwwoKYQn4i2knABsE=;
        b=DekIvRRDqYfQ0XWYv6AoaSdL8i6r+m1JNTFzWQO+w8mtH541fO1S2AhWvLhoQXnNkO
         hs/hOsghtggXyGQZrVHwOEcSI/iJSQqpQOBSKU2AofBl3dC94ebXKsRIesJpuDF1IQoj
         aLdlqjv6lOaCE3qL/AX45ILOvYDTcDbvfV41yKE0UAbe2MheBI1tv/uh/afVu+kIGsJo
         XdWCPPPVcuv6VdjPj0cJ4ist0BUAzHgIYN8Vs3ykfoJCEqrhVJiCA9TP1gmQG0O556u4
         mvUX1llCH782AFLr20MD69Ep2y+Q0QuxyHIbN9BPwHXo/8JpwUITNSNVpUmytHHujrne
         tq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724959390; x=1725564190;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kb+/gPdGEJGskPrMhsAh3708IPHwwoKYQn4i2knABsE=;
        b=RbdF2cWYl2q8fAZb48KT5YIfGnGyPOWWTnoIrY2VBd/9bpIXr+wi7lMqSMAporXoNq
         ZBgzPaznngXQZttumW3P4j2fnTjhFGi/XbyJemnSkvzybnTIXoIltNoNawvXle1iJIUf
         u0f7uDqv26FeTUNhavf7lgp7m8qnG01G37dz4dwFHqc2sa+C99pbdqtBgSKNyIY7ww7A
         r7fQ+AoF1lhKubboQLDrB94S8Kgx/ZCB0TzpGg2lhweZu4NvHnGqXnQe/2C/ajglZNps
         H1jp4wrrTzvHWomAm0aDg9npgvRtlaC18YrSMEwdri/plYwXTW5vElgmrDn24HBmGdf8
         UPLw==
X-Forwarded-Encrypted: i=1; AJvYcCXpIGj8OSO/alkedCXgMgJP4FVh2j6uPoJAMs2LkfhGVRSpV3xYZu9swTTjQSV7pw7ksCjifHhmwAkpnt34/iU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSNM77I131WBYEPKgEaZG1g2r+FP0UZZNlgF14TOEc31/8FOx
	jl2XqpjaIG+T3Y+51dyj4+DQh/tMZtQ8BvhOZgoYGEylyHs5g4meVPG2gVB71Cc=
X-Google-Smtp-Source: AGHT+IE4wYbt9jCHc5S83ZfW88uhbElBJKmpOtRl+dxUob9KomXWqzq1uB65e6/dHM7+SpafO+b45g==
X-Received: by 2002:adf:f510:0:b0:371:8682:467e with SMTP id ffacd0b85a97d-3749b58168emr2590741f8f.46.1724959389644;
        Thu, 29 Aug 2024 12:23:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee7475dsm2115161f8f.27.2024.08.29.12.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:23:09 -0700 (PDT)
Date: Thu, 29 Aug 2024 22:23:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire()
Message-ID: <19829bc4-1b6f-47f7-847a-e90c25749e40@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the __qcuefi pointer is not set, then in the original code, we would
hold onto the lock.  That means that if we tried to set it later, then
it would cause a deadlock.  Drop the lock on the error path.  That's
what all the callers are expecting.

Fixes: 759e7a2b62eb ("firmware: Add support for Qualcomm UEFI Secure Application")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 6fefa4fe80e8..447246bd04be 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -715,6 +715,10 @@ static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
 static struct qcuefi_client *qcuefi_acquire(void)
 {
 	mutex_lock(&__qcuefi_lock);
+	if (!__qcuefi) {
+		mutex_unlock(&__qcuefi_lock);
+		return NULL;
+	}
 	return __qcuefi;
 }
 
-- 
2.45.2

