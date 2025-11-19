Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BBC2F12B6
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539851; cv=none; b=TS1mhRapljc24dTx/LPMQN3LEz/L5PrJQ/ld1ZR/4O/Akbq7lJ+J6/Tl4BSXcyVwqsLu7F8GlxOKJNhoxwLuuxmbPtsf3JU5igfi5Bf7/O+NpZJM1puYBVi7H1KhZ1HzwJTzlkWcEZ46YELYlqCoSKnveGMtqX34hTfIpPfBFiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539851; c=relaxed/simple;
	bh=1T1+jAbl7kIhgWk6qUK1AsoH0OKPzv/Ln63uJS+N5NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyY/ZOPYDD7T+Cqk1JRBV8kwaojqZmXMIK0oC835BOiU+Z1NDxVAuT51IDQd+WsRicli/oWEBhR9BzuHdF7OpeCelsvzEn4gip8KymaT1Qkli61E2qYHtPFpTAm9P5piyZZypQzRX5LET3Bp/CwBcABVrgPxakNIhExIC5Anopw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2XaDnbb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2XaDnbb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42bb288c219so3135011f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 00:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763539847; x=1764144647; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMN2hgnHRjdnPSJYW5xImXYTzHzljoemIaE/vDCS39g=;
        b=W2XaDnbbRaLxqLzH2/xIIKTFThGvuZXHaOGZtmW31XBQNHjUpaWZqsmpSNbNyIcfec
         tu+6HHNRpnR86VbGe6C+HFtXbvNy+TeaCtYFILKKeaF2KXgmlK1dUPAICNW+/BsIE9FU
         VnfXxL6Bpt9LqjHuyYrwb0XQIQwyRMBqli47tVHGEBZufFApXfowrJzoJtdrBmfwyXd2
         YAaHsDYMTbVbsGCJB+D6jQmTiFqs5PsVSrJEiI9kWqaiDHSfzaTPLksUqzep5qCvhT6L
         7sAaJuOEZLZGI5+dXBcEnA+1PPyANC+Feo+GdCrLa2hAgOcEDyklucJ/XQB2CiRc5nIR
         z8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539847; x=1764144647;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMN2hgnHRjdnPSJYW5xImXYTzHzljoemIaE/vDCS39g=;
        b=q3DSLDBnIfb2umx3cFbQ+5iOD6SM0YIjTEyNe0hod1VrtJrQXkQ7D0Y89i2C9w6CU1
         jm0sNoH+2pw/+FDuYgAmFh1mR3DTamnCUrq9nlxHo3pjggU2w1U4RiUvYLRU8mkOPapv
         B5jBIQADinnFBqFUbuqLcFUjNzK1fFofkyinCpJq+4F1INRVbXzI5ytwcOH/Mju3TaUT
         dE18oLC1u4SrTZLX0mMXrBFQYwIFa9OrY4UmJdGhKzdT8c01Vi33qPFtwSb6cOyrD9fB
         niDeCz9RjNRTDfJ0ElrENcFmsCNWB8YfuXDvS0nt0LuO+UYYe8MjC+3wmbTgsKozjBV9
         REyg==
X-Forwarded-Encrypted: i=1; AJvYcCXwmnQWlaC/ssvpKeoz5apBn0jpERSHIun+ISNBkgBQIOYKRitfUU20+BIYg2yVqTmrKrHRqWZyBU2oqrbfAwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9bHU/mOGpRSgIrLyvKNyAuaSCm9uzLxZIFt3gsCeld/ajRQU
	5kQMgclZjNvYxusmNSmF9PZLX1UYFq3MKGmPaK8FtXI2PBnE3xk9Mnujb/Q0vK7eBNw=
X-Gm-Gg: ASbGncu4ieMdC43CZLblvykzC7AgH6NuvRJDAOU65x5bqhKfwJoWf7lv4erG2c/cxuJ
	keL6GP69Tsxh6JiPLP30DNa1CqP/FmA+PxVMPIcgjN7PT6un0CCC8hANTOLAHZ+BDM2yd+piQHZ
	RPyr1JiIcrTPuAia4fJBz12E8JUaPEfY+we+ehoSDBQaK/WZFfnolIw/LjiT0HPVgHsytwDVAvq
	ILR9oTiwuNWhEn3BoMp2twMH9wvjI84jzZRTWllMc8oFEvI3PQ6L3UemwCtzF+SCE9b8M4jI5iC
	Ft1AV1KZHURwpT7OdaooTyf5NSMfFw9oBfAXZiVGyEzRyc6IaqM1wNwLHAM/iuC/WCQ9HJvKLvp
	l50QJRSdV3BTscDkDZMZXhtzGT6Vj+x40MJizhj90+aIGtjp6fTKtDYI0y0P8cQWUJ0RFNTns3U
	U0AJpsTobXokKXrQyvJLal9MV7CQE=
X-Google-Smtp-Source: AGHT+IFMAB84W75/smMpky/NBlEFmUpRSjSTcnjp+yIeuN1AfzdIXu0eJmDXc3YZJMHtKEA4S1hqEQ==
X-Received: by 2002:a05:6000:22c1:b0:429:b8e2:1064 with SMTP id ffacd0b85a97d-42b5938f05emr18865514f8f.47.1763539846777;
        Wed, 19 Nov 2025 00:10:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53e7b074sm35135682f8f.7.2025.11.19.00.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:10:46 -0800 (PST)
Date: Wed, 19 Nov 2025 11:10:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] unwind: Fix signedness bug in unwind_deferred_request()
Message-ID: <aR17gxtrzOJnVNFq@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "bit" value comes from "work->bit".  It is set to -1 if we cancel
the work in unwind_deferred_cancel().  It needs to be signed because
we check for negative values.  Change the type from unsigned long to int.

Fixes: 357eda2d7450 ("unwind deferred: Use SRCU unwind_deferred_task_work()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/unwind/deferred.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/unwind/deferred.c b/kernel/unwind/deferred.c
index a88fb481c4a3..8dc11e0d9374 100644
--- a/kernel/unwind/deferred.c
+++ b/kernel/unwind/deferred.c
@@ -232,8 +232,7 @@ int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
 	struct unwind_task_info *info = &current->unwind_info;
 	int twa_mode = TWA_RESUME;
 	unsigned long old, bits;
-	unsigned long bit;
-	int ret;
+	int bit, ret;
 
 	*cookie = 0;
 
-- 
2.51.0

