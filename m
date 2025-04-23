Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D9D28BA97
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428932; cv=none; b=bXzjE6kqaJ7qdxF7lUBdBu2Grznlxd7D/12fRmTq5H/XEaEHpLNmq8GOec/SxNpBskw7UqY4bvnWGBk84XsqKxmY0f4Wj5lCwqbxLOrsfcxLhvHX1tKmh6E4ayVsiGrFaP896kEIm1C10b0CAGT2ZPwTG82MHOrmhs+1cw7z228=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428932; c=relaxed/simple;
	bh=oJSYqGkH8eJ7nnI4eONslaNCAK4zDKV2Mf6cPlywreQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dcTo0M1cH1sSz2GyzT2QVNaD2FDY6rCA1pFtF47Bam6RSDj4EhTU2Tl0DL43M78es5U3PajVaO1db2QcuIOm6rJcOD7dslcTrAOK8u4uDMSz2716n5muK/EiSqbBZJTtypry3xtsuyHvD8bZ19hAE59Xj9dy4F9gSeUWuCLpHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIsTen+t; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIsTen+t"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913d129c1aso114725f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745428928; x=1746033728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=PIsTen+txJ4y14/TzBIiwRaPQhjL1Zx7srnlszJHjVqrqoKe6tLh23V9tXqmqwAVRo
         7wEO3Vmo8s28ddYy9Ypyap4toFXwh/GUYi8/LOXySKfHS38D+4kGvEwhLks/LmtHT5ln
         orS+xQg2/vhfolUbGfDwoSmMuNtf0HNlH42P8h+BtfjE8c9FCHMaNXs0iedaq8VNM0N8
         xMrapZFwNbFHuxIU9PWus5fWm/CQyIY8oFLGwgqb9ckR3+3z1AnDFcztUPi8OU7ESN5D
         jrDw6efb0GulF2VEsgAn9kNv6cIk3etFBwxRzW3u8LwJYToDTrSyxUf9RF7V4SgefNFI
         gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428928; x=1746033728;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=dsCLAR3RxwLw3qK2DTdztRDk6aNPLr9w0eTRsYs0LXiOZ0cKIclyE9uVs2UMPJumee
         vTQJ9Qp3vUp5qu7lj/xyRXK8/BDp28Cj3YRb7ho5uB+nfatgqUxD/L0J3DXJYJrKtOTA
         IT1qkt1sl+mQMxem+l/NA/3B6eIyhju4/icXYTiN/rr3+MifgumXM8qk4zD9M5dlWMyg
         a5suZAGaptLP1qo9NRyoiTDjDIsxR5FFssnlZaPCoFQ++lvu83mxaF37hi+4dzMHwLJf
         pVhFqsg5Af8YjU+X0K5FgxwWfcxn1GOlggm6EHuSuGbZ3e5vOGYg7AHqDDeULG+5DNMK
         9FEA==
X-Forwarded-Encrypted: i=1; AJvYcCUhGo7eHBgCAQw+DL93JM32OSP2qbwWPZO2H64Ka+kXJ2LYK7ZODbBDi3a/Tl4lCCcHNychd0lEPtkxu3gtaZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9M4aUAmIZr6D8YCgOIqJgbG8QJGc3IWZb1IYZYdMwEIvi/aye
	4hwhyuCgHw/Gpe2D8KJ0bP7IygHcWG6n7gYO+T4YgQTTxEYzEqZ3q2yWHleXGTg=
X-Gm-Gg: ASbGncsJOnQ51U0jXqV6URq6eooLv10lBcas7jVPSfIF02vIOE+RTwyaZIJ9Ny51bQh
	Sidn/wf1w9+kULNdCyDeY3Z3eIrV+6me+aAHDEKbROFKsSv/TBAkvtiRSpKgaanV1NK39dxD7/7
	+Sxw/xWwhljUCZLc3975TXNl/0Hn3poXqACDKa1GgryAB7jgTioP78S7mLY7j8dNKjMst9SC+Li
	SqAGG56ZSpLG2M1qgXdlZz7r6lIiInYS9rr0RRze0imTMsR+yC4Zns+j8N+DXT48j8FbR7Ok46D
	FhjW6ipPc8BnNzk/M7u/F6MjJ/+/UO5z+OBgSSctUk9HuQ==
X-Google-Smtp-Source: AGHT+IHpb3M2AX8ubADr1y8Clnmgy74dWjubTc/OZ082AsTXoWv1+RFKxrQiRpJTvsF1zuzQls4pfQ==
X-Received: by 2002:a05:6000:1acf:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-3a06c6bd8cemr18787f8f.10.1745428928559;
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa493115sm19460396f8f.78.2025.04.23.10.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:22:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
X-Mailer: git-send-email haha only kidding

The "ret" variable isn't initialized if we don't enter the loop.  For
example,  if "channel->state" is not SMD_CHANNEL_OPENED.

Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Naresh, could you test this patch and see if it fixes the boot
problems you saw?

 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b..bb161def3175 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 	__le32 hdr[5] = { cpu_to_le32(len), };
 	int tlen = sizeof(hdr) + len;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	/* Word aligned channels only accept word size aligned data */
 	if (channel->info_word && len % 4)
-- 
2.47.2

