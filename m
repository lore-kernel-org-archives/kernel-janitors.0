Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28672E3394
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Apr 2025 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591597; cv=none; b=RMxHBaImMtZYxmCOu0q9Iwz+hP2PRHAPjSKKna8db5Uulj/DnqwU5YtPSq3thDp4Bl6AAbHk7RTSFJrRdQE+OX9F7NA1drSxc4DlI/wHpc+JKoAsbnBVt8CG+5Ahoec4UZ0Y3P82Enm5ANFibFYYbpYVfemxgeYrFE19yAg/WBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591597; c=relaxed/simple;
	bh=9yLicTejlhArWUH0AESaCnDBxMtBvX2kpvdlV6B/8A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqVwYcOMRezCQGd7DQV+zeFS93ivEh6EKrJ8EBzfdI6K4EQ2ciQsKxVkCpE5GbmlvkMxI5BnZXOvmLU/gZwhPr18uwzAH/06V9a54htQ3Qzxmc3pXXHZzHqnzN7uf35AQozCE4nnoFcHQCpLLcPsTkWHClx5ZSYBAhKr5bTEW5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iizv5asM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iizv5asM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso62783655e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Apr 2025 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591594; x=1744196394; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=Iizv5asMiua2B/rjAMbI9R+nt0nkTUhtyFlelshY2Wc1P0HyQqOnqQzk+Mv/hyzObm
         Dc8jqEE89lm1+yJAAh1rfPd7s7zUhHqbMbljqbfqwxWmpIBhMszoHJ8BBd96HqE9aA0u
         Ai94zMpUf4M9K3Do1o1hM6ps3SX/sz9b4h2Gu+2X+SBVPTzyiYD38cd87+mCKp/LQpi/
         yuNqP+1DdQjILH0I3BOArl/Bsnu2OrWbBC0pMBejLPbb88zMn+j8dX+on6K4RgwJ41HT
         W92fHWDaTUae5NCiXX2h/wlVrYFSX05BU7GZaJpUxX+eBZWhW8gWZW5N1S0mHfRXbaqE
         7psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591594; x=1744196394;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=MxvnNExPsCLTOSE7pSayBmsqyvNPz8lg9YADZerdwvqId3JI4FQ/RMp2CNJbkyo9kX
         kmQ67rVsbiX323/cE2O2c+ml1OO8K0j5fbfP9P/A1n/bcGqYNKH7c+5odou5v5UdAws5
         dMtArsRMeNVRy/Ag/bp696ZbEGDsh+rtkxFCqyNnFS3Oi+YErsawMA0rOC8Ec1AOZf29
         5jgy2kKuX6UZ+fFOi4oVQXitHXeedOHRLWtNht4LO/bl5WB7NhDJ8zeq/i1XjtGtuIcv
         8sXK6h2L7glmKocqgA/gU4Hdf0CxrOpSMrdYzwwvd1JhNLUeuPpTIb0ghf1dn81JnJEf
         wNkw==
X-Forwarded-Encrypted: i=1; AJvYcCW9RqHxf+3htJmSU2Q1PMQp2gAMSRSW7olWskRaCqaSgDeRecF2tGMuJnfqd2OttvdAsmEfXA/YiihAE9S/ir0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6BT2uflWko8r74SwJyB3LGlA49yN/BD3Dm/sbGiV0redHu3e
	8sQkQdwbzSzpgWkBu4AMjYmQ3Xtu//D9qfoWHDyNvAMRSYvxc0lMSJtE3i/NiUyCqT0ysKJ6lg7
	Y
X-Gm-Gg: ASbGnct9xxm+gfsjXd9RK/RJWJ8eaEcV0Wg8OvoDDDgh9DVEnWYi7m62/bNJGc5V342
	621CicAR/R0MB1w9mGAu8yc6yCfLf8zP4HNAxevNtWAiG0bICFuxyEVdnyMpmaJINpynlSQhQt2
	FyzGrY5lnLzUfoBJqIfETCKPYo68M0jLr8DxGgxO7enQb8ISF1W7aLUhH5cDgT0M8vBjL++QKro
	R/Go3k6ZrpoUcA2+feQU+o1wxO6j7fQLXSRou+q2ozV/TsCwjFzPPVRVW1ggEVdJASPILNkayjS
	IKtHwmor0oNsgDRHZYIfuGN1fJNOKFArFanj+JrXthOZuWnMYg==
X-Google-Smtp-Source: AGHT+IGo7cTRo8kiQ/h++DgBA8RW5r2euHnxHw/uTOTKv4yUHsRawjSowGFkmPkzcA245vQdY6nlTQ==
X-Received: by 2002:a05:600c:46d1:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43db624aed9mr150397785e9.18.1743591594310;
        Wed, 02 Apr 2025 03:59:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb60d3627sm16842805e9.24.2025.04.02.03.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:59:53 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:59:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on
 error in probe
Message-ID: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The device_del() call matches with the device_add() but we also need
to call put_device() to trigger the qcom_iris_release().

Fixes: 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is based on static analysis and has not been tested.  Please
review carefully, etc.  Another option would be to call device_unregister()

 drivers/remoteproc/qcom_wcnss_iris.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index b989718776bd..2b52b403eb3f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -196,6 +196,7 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 
 err_device_del:
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 
 	return ERR_PTR(ret);
 }
@@ -203,4 +204,5 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 void qcom_iris_remove(struct qcom_iris *iris)
 {
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 }
-- 
2.47.2

