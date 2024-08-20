Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6517818A6C8
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143302; cv=none; b=IZQJAyrDTgKg96N/BSN8ul+0GdLU9PUhT97y9CE9JhaTD05nVlFjpgygJyMVibIXGQxwq4EE87nWrF7BhFyUhetPWdII2hWhJwTuczugr3Sdk8ZjyQzwUreJR3miFoAxykrBWAZRdXviXk+WPl7e/uNyaA5DvUYuwqxSdHRpyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143302; c=relaxed/simple;
	bh=5N0nCpfI+nhaOWK3OttM8gAvu11x+K2UOJAXcQngNTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nH9lfA95ZWNxwnegwKQiTy/i8+5lNmyyeLsmSA83kpG8Mj+wFJeGW2mY1nfl5dpALlpp9VTFvZnRFeyktMzrWha1xPY3qGNMhuJ2fo64Ix+RSOF6z0dH2DaiV98AwBRFu+iGp6l+wN50rv+ZEQSu7g/fdBBg6/F5/cQEBpGUIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R0iM8Bl3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R0iM8Bl3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a864574429aso75260366b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724143299; x=1724748099; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWAdMcy/9NR2ReZJmKOUCazwYMQpggfHiZptQK0YIT0=;
        b=R0iM8Bl3McqDIFGmosSr6kZxYcvG7PLG2u35SOxIo3ClI8TzujyHo2VnhbuFG/PsK8
         CJxdkG0Gk3tr7T8nJmn8HiE2Xi/izsT8hGsftcLbHTcnMhZgUPNNz9YVKxa4SQN+ymus
         JnmDT3erjxdzxJAFyWdNpyegD86dCXLj3fwoajz83mwewLA/NKBhXXBxKGxKLzIZO1v/
         X2Xf53PF+tGXe1HA9Ro7xeMdbiRB25GXcQhGPTYdDNXXJYQOLnwF2sqMuucarhT+XjfI
         3HLt4zR7rcVRCtLfK69Td+5+YEZIAiIuB9IcfweW9vQmOxDotIpqtmOBI6EW0T68Qflz
         QNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143299; x=1724748099;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWAdMcy/9NR2ReZJmKOUCazwYMQpggfHiZptQK0YIT0=;
        b=FoddDGcEMsSnHrwyXHTA8Fn0LIFnn52jZZm0V15DcCb/N+vcQO924Wro8IM9HhkneR
         t34mZaeoGJ/ygh/AElIuWxmKccO8WvIYnkbfTde+xASo6g7Z6B+5lkVa23gW9N69CoEw
         e4hMF35DG9xm4EUZUTTV8e7an+Xbx7r/iV1ZxaM0SNJZztkqywGGupZRXcOD9tyiTJyg
         y4dv9ipWkTzdMkGdbbeKJ8Zrcr0bHvwJartaTeB/Q4G2ij/dcGBQDh6ebvsQ0vrincCJ
         1VhzXr1rO2Uc5JlbYRXzXexnh7DjgYhRTuJndkPe2B2rGMR3H43t5sdpGwiljh/9xntj
         E8+w==
X-Forwarded-Encrypted: i=1; AJvYcCUj+2EHseiMAjz2iyCrY5eXCJPZ5+ri0VixX4HArE8dfsUcRNS8J80d/toBooHG3EY5f+UKwBLTupaoxk4JINU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAg23/OH5goEVNAHxydMTE5IOuu+K24CEX2LcvG3MBCli8D0nR
	nRuhgPJ/NnREcLb+UCPZ0kiSWaJa0MKwPzNr1dVWDFmNsXH494kEXaqwHdSuMEw=
X-Google-Smtp-Source: AGHT+IFnTZZhFh0VCiwtDwh6MDqi/R4yLEzQF1vj4INSiVJzn84a9KH3cF4dzK2xWm1zg8MzWtyOCA==
X-Received: by 2002:a17:907:e22a:b0:a7d:391f:17af with SMTP id a640c23a62f3a-a83929d3755mr994995066b.51.1724143298645;
        Tue, 20 Aug 2024 01:41:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838394880esm729365066b.185.2024.08.20.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:41:38 -0700 (PDT)
Date: Tue, 20 Aug 2024 11:41:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] powercap: intel_rapl: Fix off by one in get_rpi()
Message-ID: <86e3a059-504d-4795-a5ea-4a653f3b41f8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The rp->priv->rpi array is either rpi_msr or rpi_tpmi which have
NR_RAPL_PRIMITIVES number of elements.  Thus the > needs to be >=
to prevent an off by one access.

Fixes: 98ff639a7289 ("powercap: intel_rapl: Support per Interface primitive information")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/powercap/intel_rapl_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/powercap/intel_rapl_common.c b/drivers/powercap/intel_rapl_common.c
index 8b7a5a31e8c1..67aec73511a7 100644
--- a/drivers/powercap/intel_rapl_common.c
+++ b/drivers/powercap/intel_rapl_common.c
@@ -740,7 +740,7 @@ static struct rapl_primitive_info *get_rpi(struct rapl_package *rp, int prim)
 {
 	struct rapl_primitive_info *rpi = rp->priv->rpi;
 
-	if (prim < 0 || prim > NR_RAPL_PRIMITIVES || !rpi)
+	if (prim < 0 || prim >= NR_RAPL_PRIMITIVES || !rpi)
 		return NULL;
 
 	return &rpi[prim];
-- 
2.43.0

