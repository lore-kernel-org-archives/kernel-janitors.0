Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD22309F1F
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572376; cv=none; b=KWV2vNlrRPhX9wzv3wksMP+LFO9zj2VF7gHz071mVA75L94Mx1pYqgZexcK7AGCpgousbQxmAH6VI2hjxq+t4vclvpArcywa/rPZMEdn6U2n4XEaPwr1jpAqVegw4ww5k/VlhU2KU3xMXnv+Lsf7PzjYZyQRvuNOPB2jCeuMrI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572376; c=relaxed/simple;
	bh=S8/Y94v8eVwc9UqastYzddU3My3qGWdgHUnNWgmKh+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gouVm1ytnSDxeO0llESiN5Yuf/jCXHMgUHwrc9GG8zoBmbEioVyD9fjimXWZ5wr6fc8mea+zmE/32HC0qMG7RchThNzBqxrG3V/IGBsEGIpgPT3fptIcmTo4wGwvfqgqU1HXubnFKaPAsjSJg5J/nrjcBDgRTjzWC/ER1WuE4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N99c8bfu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N99c8bfu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779a637712so31939965e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763572373; x=1764177173; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJwi2QKFT/Im/52NKHCxltPPYMpbzS+3pGTHTJG2N20=;
        b=N99c8bfuaiHcYZSU1vG2mcAoVvP6I3lKnIutdWrwcBZg0azYMX+TLzuLXRGOLnMf3h
         muejFNbNdsfBUhMEVhdnmPBJAhoZRZpAPxgCjZVcJMOoynh10PgGiL6F7jONX7TOBY/J
         1JYBlJRkIFKYtSaS7IY5V6/uweS5LVvJO5sGcqT1LdLKsjb9jHg+W3t7fe3mjcL3OA5V
         GTekWYZUvUjyiNRUFUj1z142DsL1Ve1LN7Db+KZQY478XBRzN4hTj8wscGur54xpEz6O
         hQVHwad4LhvTC1TIcgdzwnP6kqYKKE7pzBS0ZZ2iTXkvf0/5P5fgJEqCyrjpLV+J5L7V
         2vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572373; x=1764177173;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJwi2QKFT/Im/52NKHCxltPPYMpbzS+3pGTHTJG2N20=;
        b=FTJYfXVw9nfR34wCVeqoNCb0B6bjxbubVGpxEp09K9eQ/3eVkoqB/jP6NwoP5bB9cA
         kSNbfOOQKoL8nnnf7lQxIXc3StiYDKz+ykXkyPl9OpGdV+JGpqYqnALoiw9J5EJeIfw6
         Fe7HcP59h7MulM4uohR40RPJ3sb97Pc+wMhKIi7yo0KZVDZmtNtK+pYkop2Vsdb2fvD6
         sOg2AV9DnHJeZxAnMtqiAiVfNUcu9SpZyTN9Bm/x2PwpDdz+ZCiMEZmiwfc3LGfaN6lc
         /c9DZHtm5WJtfNSxZNZSqSegoCAqbTSZCWEavpZlm91LKQwQ+vLw3BlOr6MX1Xe8i945
         F/qA==
X-Forwarded-Encrypted: i=1; AJvYcCVtQQRkKhd9H5c1s05SSjh3wnjWXfvkPBlukKmxhSBVPO6l1cjFggEHC84Gxt7QlSFSiXrCJZ7xbjmQ2km90a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeB/2ifukI4mxLcQwdbzrYY5lEeNDX6rOpmoGqnkxzqJF6AnAP
	KUOzinkUnX39D6YQ2bKgezE1WfJNkmKqTlefOBsd/1lXdoFN/FxNfqVUlrUuZWn/Mdw=
X-Gm-Gg: ASbGncvG2rYmiGoAIMf1guW5JinJWuQUqRdBp7I8uaStFhrqJAmgguldF04zONM8Hat
	vbpA7OKHqKm2CbmZRZCqUfM5dZ8iuPFZMwEkqV1hG367U858EjaTUB0ktPqv/RNZE8wKj4gy6HX
	7gPIIc4R3TRiIreBBITva1SL62765N4hMQSHbgsc3rk4xUlbo8GZhnv2ECbddt6ZEu0KQcUEtSG
	F0j4aG3n5Ph+ko46GC/+UIIqSel+vShtP7GBKvLDCsQ50DtEWAeC9NJWqX4p8FjDdR5HYr772nz
	bQa5GwR2cdGo+Yg6T8GWWvO+ZJ4qDc3KBbfisl2jNCw2irLyxZbTbz6rammn/HoVmHVOVdUQ78H
	noRpWeUIEKwy7UU8SZbjci9wMaJOlbHRKmB0LtwfkS4440lsFzpYqNsm4WPbD4K5KzRMIZvOmoW
	aNUOGTGmBgbxa8xNNk
X-Google-Smtp-Source: AGHT+IEEVRMd2tmhrhlUg3xeIxlRCDa0rx/iitGuoBw/+VdpXT2m5j0pXlDNmXSl25IkSzHm/U7naQ==
X-Received: by 2002:a05:600c:a49:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-4778feaa94amr186587115e9.35.1763572372878;
        Wed, 19 Nov 2025 09:12:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477b83142b8sm788535e9.9.2025.11.19.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:12:52 -0800 (PST)
Date: Wed, 19 Nov 2025 20:12:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] unwind: Fix signedness bug in unwind_deferred_request()
Message-ID: <aR36kCfmRhEIRm2r@stanley.mountain>
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
v2: fix style issue

 kernel/unwind/deferred.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/unwind/deferred.c b/kernel/unwind/deferred.c
index a88fb481c4a3..3dda585963d5 100644
--- a/kernel/unwind/deferred.c
+++ b/kernel/unwind/deferred.c
@@ -232,7 +232,7 @@ int unwind_deferred_request(struct unwind_work *work, u64 *cookie)
 	struct unwind_task_info *info = &current->unwind_info;
 	int twa_mode = TWA_RESUME;
 	unsigned long old, bits;
-	unsigned long bit;
+	int bit;
 	int ret;
 
 	*cookie = 0;
-- 
2.51.0

