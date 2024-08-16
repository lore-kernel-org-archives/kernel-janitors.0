Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA0139590
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Aug 2024 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797738; cv=none; b=F44e9xC1UH1J8v34XzC3Ff3TBaYe8MNoZRBNAxuYEWbM5auxW1PQ6PVzkW/u7jtVR5z8s7yt3B0uPELVE2ACA5zLkFsuXW6jgzKpT8gtyAz+b7iBzNVM/Phbny65tstIdE/w4iH3oQVCXKFxT/fwEIjGR/56rg6MCxfuYF0JTII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797738; c=relaxed/simple;
	bh=0oLem+Qw7ToSbyPqLYeM0bwsjJ18/XCGqteG7JrZBqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uNRm5HmesQnXT0htOkb2O5oqRl6j9GHlY5Zuy4cWZCAUBjTZ+Ohg6/sneiaj6ZXsJ1zPPlkfilSfhOoeTixYgVEaIZ8tJJmKrwWO+VwWD+BKHtFqpQnqgGfWADLjOnPn8gtPlmQymdM4ZGztwNtyVu8YTwcxelQ8o8Xor2yryEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmbP91de; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmbP91de"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso12499065e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Aug 2024 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723797735; x=1724402535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Mf1jwtU1IEC5inSpAw3zK8tivE5WAs13EhnH9rtxkM=;
        b=nmbP91deSlmVc53sNgg2P288kTYh0BaMgP+CjpUxSbQIJB/axrKoeml6ZMMh44QSY2
         B8I8kQ/83DdrvnhP9lKpOOr1oKWQkYGH52FKZJ9A0B/90eu2QsxTZFRGUCBCiZNwqe+t
         DLrjvfZoh/FTfSmFyLexxlHuVNiOSkavWoAp7gqsmX4YdsR6HlzLFUpPVT31VoRUSjBr
         14QMvIJBLnd7HsZ0I1pZFTpUfuxh5dfRv2GFpi8XrWj4+ot7vF4IK24Khq5qn+YAF/gz
         bIbiQxG7Wkx5Yufr+xUS1mzxKxPNthP9lu2oCvB9bAMUBX/lT8c6tAm4qpoh3AviBwvM
         ygrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723797735; x=1724402535;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Mf1jwtU1IEC5inSpAw3zK8tivE5WAs13EhnH9rtxkM=;
        b=NleN8PQv4w1Hq8u6BjQBvPwFSsbJHuiIJ9Po3qEQZvkRlqqqlNgyJar21clvFEc8QK
         UMEbXhfOEnm5oYwpp8N/hMC7XENMAibVp2YBxgm4iC4X9TJCdO1qJolKxE6ObL5X1UZC
         HmkbjYF0UVPcVLk/Rd3vs6Gk1XfdW7iAlzDHnGe0ZoweLNZGNoxu4MWqe7M2rloHLtV0
         xn9wU/SJlpWQzg+7/D3+qikrGvP5aguWyUGJn1d7KPxqTBJJMIpT1bSq21fjsG5HqGvV
         Vjrr95e4cKtsc15e6zmNt570vQOaAkbEmbm5X1qtAiM1Q5qWs5oKI0nmCqLYm5v7A0q1
         8E6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+mIHjXsgGAAtd2FlIbFZaJyufbHxR70U9oWT6sjy5ltjX0mPKb35An1OKShqAWvAhffSnxI8oVcb+S87Rw53m1KpU4mCZmvRDWLTDZlDs
X-Gm-Message-State: AOJu0YxY5hLqmXYNfpapqj2mJGX4QxlmlVIw/laCP4P4MroDN9olDjVe
	tCzZ/VzekH/0nKuVB966SLLfOvmwCNSqm19saoLyOWUmBwTKynTIZc0WxrfCsfI=
X-Google-Smtp-Source: AGHT+IEf7cfbN+gD7oBAopP7fq2DDt7WFnAIqgbBVgGTKPU7rB9hSONbmM2OmELOKV6w4B7AP104YQ==
X-Received: by 2002:a05:600c:4f4f:b0:426:64a2:5375 with SMTP id 5b1f17b1804b1-429ed77da5fmr14056025e9.1.1723797735389;
        Fri, 16 Aug 2024 01:42:15 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189849831sm3134341f8f.30.2024.08.16.01.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 01:42:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Sukrut Bellary <sukrut.bellary@linux.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230602113602.1271695-1-sukrut.bellary@linux.com>
References: <20230602113602.1271695-1-sukrut.bellary@linux.com>
Subject: Re: [PATCH v2] misc: fastrpc: Fix double free of 'buf' in error
 path
Message-Id: <172379773428.48571.12712764336372215330.b4-ty@linaro.org>
Date: Fri, 16 Aug 2024 09:42:14 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 02 Jun 2023 04:36:02 -0700, Sukrut Bellary wrote:
> smatch warning:
> drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
> 
> In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
> fastrpc_req_munmap_impl() if unmap is successful.
> 
> But in the end, there is an unconditional call to fastrpc_buf_free().
> So the above case triggers the double free of fastrpc buf.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Fix double free of 'buf' in error path
      commit: b056e4e23acbbbf12fa011caa781f7cecbd5b311

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

