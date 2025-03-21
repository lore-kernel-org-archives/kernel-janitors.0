Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7414221D90
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567766; cv=none; b=mCJufG6QgJu8vgJsVGwg5+hUULvN3wp5dkHTGwkuHgWLJg0KEr9acLnWd4cQARsSfs8iR60xMrTZ1WEWF+LQ0sAGGEqpcJNRmNxgxzB+z+5062iG8ET0IINHgr7/6ZRduXjyxnf4oxOokLRsoFd1D4Q9DAf9HeRnvj87XI5+hi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567766; c=relaxed/simple;
	bh=3Jt22z68KyWgHvqCCZSGvvKTcyUcRvUGovF1IdxZ7xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5oj0tzHAtdqwJnWvewF8qFgNEoNmLJfA2hIvkDMjQl4RoBHjLiu+c3q0dHPs/zXcxkapvoxXfnmMJ8MUq1OQJ55U3HfgesrgUBqAic0fNwTuQ89sJ4zkvVCuKsMQJyMuq2aJ9za3acXIWRPZYQt4b4fS5WflVUBb+D0w1/lucA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzU+Lroi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzU+Lroi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913fdd003bso1114964f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567763; x=1743172563; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3TRMcYPovdCcpxNpOwTnOH/MV3MA+4jBX9Ey4iK5so=;
        b=jzU+LroivtyPIYTpsTInSmhx5KVKMRWTGfqT57ULYQI7kUHv51iwhpoFMLMoL+0NJp
         ZtXtrYSlPO4lbDG7V6aw1nLJA9RHZ4KrHyvZd2j57S9ySAMrZfLjYitp8th8x8vNZC3y
         2CjzEGPwe2e5F7EklPNSYsENQjhNEWJ1W8mhZ4vJw1a/2ZTf1/jifEC/o+IhdrGUvULX
         ViH02x35qqocIPT4O954ln0J90RmtXr7GaJ1kRVbi7lKz7WdOdMiMHT3qwYoY+IpR/RQ
         OKxgQn9ftLIRG7K4u2oyCT6jr2ciOKK7sWvpHq8t83P/uTScAwX1CdSQjscinwl5A2EF
         N1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567763; x=1743172563;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3TRMcYPovdCcpxNpOwTnOH/MV3MA+4jBX9Ey4iK5so=;
        b=P8Csa203f82GZ3xJjpc0fYK4CYQWgY6GplZ1I3Awg9RcJc1myPaUECiO/uKq97A6mk
         ltx+bKkdZmau6ty5r5zAc3WI3rxpOeH1plTnEoJ812ccxF4sWUdlvbMRwbCKwzqOVB/p
         b5z0o9tyo9Bym3WuUYAHIw7cZhgCncF2toz2gbmyOEydtEbvYYxye2IHRTOEbODbuO2S
         fGss9UUVNpZuoJDs30KZHqdDrz5pWI5cai630yMl585aY+olGs5XJXq+9lyXvZobBfli
         CLjH+pV9NfDN2Zpy8HExjfRFjEJcX8ZWZnXXsyt+YQ/W2kyDs4xA280LhFcywgyjMaHi
         C4eA==
X-Forwarded-Encrypted: i=1; AJvYcCWTzsFuBaBLqQnTx9b9scjv9+BojenIopp2lg2m4ify7aJyF7vbf3s3oKpCZ7H1/gGXLw1DL/P4M+e4QdL2Obs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HQxWTEXI+apZ6OCzVFDNGj5OxEqEh4iD8RXy+/0FIzJXFBbn
	cz4Go8fBQHkro+QnQQFUBDBIU7s2p0TuN1xE9CImKlQYVlYL7AzgXLKyW2kQ7+c=
X-Gm-Gg: ASbGnct8XrsCSM8p3JydngfNy4l1X3/ABy5+Zb/VxKqVDh8oN3lr6Pp5Bzx0wAt38l3
	wbFOqYo2IBI3U0NV+JEUOF8ZKaD4DcxTpBxEf5tkVVPMKzPPE8hH7biBUk2xOwXIAvsWMinEn5w
	2L9rLa6prjfLI6G+vG0GQgGywZ7u3cT6yFv+s1Jgt8WQRSz09kc44LnFpHnQTEMPFt7TdPrmcdG
	xbAytxtF15Gx6zoZ2dKr0oPOIT23I11/Rlj/9k4sgKOU7y3QhUuPQKcA5U41r3Cwlnq0FpHe6Oj
	S/OAFCdCvgukQIH0ei5E5jw195oY0e5lbYuCM2DOJ+EqEdj+5A==
X-Google-Smtp-Source: AGHT+IHhiGmfwux5UkjuIUqxq9oi+dkK+mUOCpGIZ4do/XrfF2IaNbNhOgkz66lIuN/uqIj/iyqgng==
X-Received: by 2002:a05:6000:1cc9:b0:391:32d5:157b with SMTP id ffacd0b85a97d-3997955cc0amr5526052f8f.12.1742567762989;
        Fri, 21 Mar 2025 07:36:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f55721sm79742765e9.20.2025.03.21.07.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:36:02 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:36:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: iwlwifi: mld: silence uninitialized variable
 warning
Message-ID: <add9c9e2-3b44-4e0a-a4aa-7326f6425baf@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "resp_len" isn't initliazed if iwl_dhc_resp_data() fails.

Fixes: b611cf6b57a8 ("wifi: iwlwifi: mld: add support for DHC_TOOLS_UMAC_GET_TAS_STATUS command")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/mld/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
index 453ce2ba39d1..89d95e9b4f30 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
@@ -396,8 +396,8 @@ static ssize_t iwl_dbgfs_tas_get_status_read(struct iwl_mld *mld, char *buf,
 		.data[0] = &cmd,
 	};
 	struct iwl_dhc_tas_status_resp *resp = NULL;
+	u32 resp_len = 0;
 	ssize_t pos = 0;
-	u32 resp_len;
 	u32 status;
 	int ret;
 
-- 
2.47.2

