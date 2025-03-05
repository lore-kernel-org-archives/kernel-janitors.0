Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF2A24BBE1
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Mar 2025 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190013; cv=none; b=p4wZ10cnHLkOFcX6qijvHRCRuwRxvZQ0KdLnYMvgxAJVxAuEZ+qK0sm3ChuG+5zu/nu2bgo0LANoApD7piV9SCCBcrx91En1BDKR3s0hLvC5PsiR0D1AohjdI1MQE82DK40Jqfm+nuE90+2udQBjR5IHGTfrGpEBdmXnmg+fIRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190013; c=relaxed/simple;
	bh=7pugq9Q0HrD0WFy5Cy7xHVcUHRDsYuQl+Ilp5KZtAgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1R26GZErANGb+tLr4Ypw68tz6ERRJVuLBK50Kp1IMOGgAHIFDb9k66uatx3V303RioLVLXTeinwybwkZb6/qGVSf8e7GAvH+xMtm2c63tH2bZcINufni4rkm04AQj3t+JlMG6uRSwNNveIWNEoUAoCe6HxYwC12Itq0eWBsS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFCUIxZj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFCUIxZj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bd5644de8so8397685e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Mar 2025 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741190009; x=1741794809; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95chebkxx5uPpuk8Hf/uN1bb/WBC6Ds7j8DqJcXx7/c=;
        b=rFCUIxZjwzGncw+CJ8ac0yOnBxwosI+HlPG4hdlWTffVVOJ2Y9HKgp/qgGnFUDUwRE
         CB8w+WHFjdGDAJoXgep8bFA0Yw40X8jbbjQ0+SVzMn9MaQ8WVSwEW9CwUCTKvIgvFHsl
         7Wxc7WCH80enkOsVwm1RJ8Q8eL8OlvDMReiHYr14RfWCZb+IJGZbaHx7NMO5fC4LbnSk
         o2gLZrHAS00uk2UHuhlfhBazO4AjzZHswfxQW39OQhLhNScoVY3ruSNJ2byJGN/I4W95
         Pv4+KPOnBjRmw8cjxm5JWY+MaYe5RuBkXVHnpLJUJdphZqzG+e1tLK0PjY3ASL5h6oMO
         pbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190009; x=1741794809;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95chebkxx5uPpuk8Hf/uN1bb/WBC6Ds7j8DqJcXx7/c=;
        b=e42mBqrVKYd6CG3iDRKp59Re9asxEjyrmDYF/wPTwYnLdYjP+GqC/8riBAMgz9TM0O
         cVpoxxmCM9eawnGovMfpzuclNLyP/Nk6FISRIWKEofJoX09ucbUWa3QgxavqIXhGYH/i
         9IpjYCjiHwRMV8QHhgxX++1Wjxve1vcvVLFSO7sIFIVxIkP+Wr2orfiuhAMW2Y6+xkSu
         giMd59JZTpWm03TTyb8HbNMGb9BZTLoA/d14jySt2YEjSUJjeBRuAoXIvAQjj6GkcA/P
         b+6Ee/UGdE9x55GmhWbcPAytekkU46eICs0pyEiBfyUa7/Wq6u+nts2R2o80Ptz26olF
         51zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTEDAEQ0S/XW4askZcpq57T08T45vLfdwLZD8izdNXK6dIM7SCX8G0yLDbPn5lD+Hye243Nm5W5MnzZxTJdTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNy8MWEhT2XZxAN+D69zVWfaPycBrBAO3xw85nOqnwiWZAYLW
	wIdr6Ns4p/wQ8/JmjOBO1Pgl4qlgytnQCmb2e56+2qcViyygQ4119eYQPQo5muE=
X-Gm-Gg: ASbGncsuSj7gF3Pi6BwoZ9HxHXIrRqTrGH6SbObchj+ZmkzQf8967saIqiW7X6CViFC
	5bpzADtNmr+aW3I8lMXCPHXma6pC+46OCBpgCYYABqjm9t20Gov3rDgKbY45UWClWC/W/vAK4YQ
	7EmnOO+NaseeAPqGZ5z+6a1aMiefDRs+fMIdFRmvM8y0PZfMcxWhbkDK6qCFdCtXn1AalTxKe68
	7oRL8SQ1+WNBts3WfrDem+h2butCS4btuC2BtaqGahgG2DnhL6GyXAC3tDm9u8lovmRAozwqPWL
	D8L8+J1EoDS2LJRSxHwqmfzvIGMBbJgnmisLupVkJsyw+uvWCA==
X-Google-Smtp-Source: AGHT+IG46qG9NZg5asWLlzpx5UNbKVYGM9zYolGfR5W2sKaY9Lf5cmP+PeNKMAFOBaBivIz2363Meg==
X-Received: by 2002:a05:600c:198f:b0:439:9ee1:86bf with SMTP id 5b1f17b1804b1-43bd294309bmr36486625e9.7.1741190009583;
        Wed, 05 Mar 2025 07:53:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd4291ffbsm21180345e9.15.2025.03.05.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:53:29 -0800 (PST)
Date: Wed, 5 Mar 2025 18:53:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These are u64 variables that come from the user via
qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
integer wrapping bug.

Cc: stable@vger.kernel.org
Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c20eb63750f5..cd5a31edba66 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
 		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
 			return -EINVAL;
 
-		if (slice_ent[i].offset + slice_ent[i].size > total_size)
+		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
+		    slice_ent[i].offset + slice_ent[i].size > total_size)
 			return -EINVAL;
 	}
 
-- 
2.47.2

