Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226777111
	for <kernel-janitors@vger.kernel.org>; Mon,  5 May 2025 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455663; cv=none; b=Ga8DIQbR6gwITd5uuE5NMednyVSZ3QvFa7mwxcObGjYkTOMK4eOy/J33irG73saJoHA6bBIZWW2yWC+qZ7dDweHd1yoADPIQ7H0027ia/rzZgQ7ak9V26jQuIPdOOVyItSgMBEugrX80yrub5yODaB4o8az6rGke+azKs3ecRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455663; c=relaxed/simple;
	bh=wPWDiuNy3mW4l26eURif/yg3oVzB7iJnJ6pGeCyG8qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXDtePWMAYwMQwVphxWdk2x+ONs7pJ9t4C4zi78g2oTqlWQoaEgF/2nN5XBBhYtayq0l2mSue+AkQp2OWLPqHpuvPoajs/sVLZubgbVPHKUr+H26Oqq0ABtI58xkeyDRlps1ZGptl8T7OFVur4fSVYnTMx0spVhnBDN/5bi/YEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jqWh4CP4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqWh4CP4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so2882704f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 05 May 2025 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455660; x=1747060460; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnbCwzPudDkiSSrhyT+WBIXfqqkwVhocBR1cTw5NLso=;
        b=jqWh4CP4JXYguGdtaR4xZzqXsWlXd5E1Al/ZolemEqRyFbeb/buMpumPDAln7HQak7
         R+kmI4Fcm4UeR7mA0ltQOeWN4O7NyYsJ/Gyi/xeF0xpGqfOCf/goWMYyegwOCFWODDsS
         Qj5C7/eQPT1PoUmp+SVUBYpgO7rDzM9waAIEYWwGyBbVzaV3fqZXrga5cA8ItyNWngb2
         x7K1rpHy4KN2in/v9HpcHiLQHQB+TOP7r4d59Jqto+35h/KaoAIWFPfELkqaHw1/e9OJ
         TZ4BFJiMJgNmLkaSTalQJgXgJpN4mDrU7gVyZEzwWP3fLVuc5hTvxEwtXnfuib0HCC7M
         fkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455660; x=1747060460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnbCwzPudDkiSSrhyT+WBIXfqqkwVhocBR1cTw5NLso=;
        b=FUy5jcXxT/+wEE7AaqcWuRcg1xZrTfN8MMdwQtRAt0XcC8rdvS8t3T9iv2uP99IuVW
         hnf9UqE2zcG//V0jRuBzf7r/UbW3nGJX/A+xH6zzyYCwFfzqF+B6RVa4Nkk6KgK6Xqvk
         RzCVpLqf9HDt/9pkPj/+ryheAvWz4GbZh4lHQsfu74YSHSf08loINdEvmqjGJLJBebvx
         NSJM28B7CT6WNwAYc/gD18BYaEk5afXVtZFKqwuX5q4h0/iTsN/v/TPgY/wheaN8LHry
         rsqloFFQx/RdAOkSwPRHJhTeI0fY7rEqSm2rX/XpRBo8YBoxjZMtRvIxzLANwH63PNCG
         oycw==
X-Forwarded-Encrypted: i=1; AJvYcCXe8K0qI++kMeQUAPWSQgpyiG66h83pnrszz2DvV3lgok+Y/2AxHGVzFlrwz9kYchtoU5vdrEBakyB17+j836s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8PMS+ZJ46DBCeNK60HgcgqXzHUl0g4IRB5Yw8X8P1G23nidx
	/6heCBHM/qRDCcrEFNcJwArcVBexDxuExh289ILdWL2KokfWj0gn0ZsGXzTH8Hw=
X-Gm-Gg: ASbGncsOECDR1K90CWo5wnCgIKPzMKI4onswNMFsDeOV5t+UdpcZOiYnjdXaVnUuRMR
	i+vZeZgdk3ilHU5YCsetUoke1c/+g9UXsy0BwsfFG/HVtt0mNdgAXCvgz/SdHRIjt0oSU1Etmnm
	y0vGbweK3IjkPaiOipJUFUBWX7GFmQalhbnjuM6pj48ftxBFYVHkndr7nXA1zH+9chyPL6sslj/
	DmNn+U7XwVR6Exjm1HZO5qiPLm9SwxPyPbD2BFOIRi+webNn6vq3izF70jlHr7UA4sh4Jt/zmg3
	bjUZkhFfo5ydaJbAXZPgFvhQbIGed3x2Meqhn5kqtRFr9Q==
X-Google-Smtp-Source: AGHT+IGeLrfju5zWeAYtYvyAEYGbgnW8bF7ZkzBNUfY0zuisIpuKky3gv6rm7707Hc90jSISsdGZYw==
X-Received: by 2002:a05:6000:1946:b0:3a0:a09b:6850 with SMTP id ffacd0b85a97d-3a0a09b68c6mr4246077f8f.45.1746455660315;
        Mon, 05 May 2025 07:34:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0cd6sm10499390f8f.5.2025.05.05.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:34:20 -0700 (PDT)
Date: Mon, 5 May 2025 17:34:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Corey Minyard <cminyard@mvista.com>
Cc: Corey Minyard <corey@minyard.net>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ipmi:msghandler: Fix potential memory corruption in
 ipmi_create_user()
Message-ID: <aBjMZ8RYrOt6NOgi@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "intf" list iterator is an invalid pointer if the correct
"intf->intf_num" is not found.  Calling atomic_dec(&intf->nr_users) on
and invalid pointer will lead to memory corruption.

We don't really need to call atomic_dec() if we haven't called
atomic_add_return() so update the if (intf->in_shutdown) path as well.

Fixes: 8e76741c3d8b ("ipmi: Add a limit on the number of users that may use IPMI")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/char/ipmi/ipmi_msghandler.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 8b2c3fca9c4c..064944ae9fdc 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1240,12 +1240,12 @@ int ipmi_create_user(unsigned int          if_num,
 	}
 	/* Not found, return an error */
 	rv = -EINVAL;
-	goto out_kfree;
+	goto out_unlock;
 
  found:
 	if (intf->in_shutdown) {
 		rv = -ENODEV;
-		goto out_kfree;
+		goto out_unlock;
 	}
 
 	if (atomic_add_return(1, &intf->nr_users) > max_users) {
@@ -1293,6 +1293,7 @@ int ipmi_create_user(unsigned int          if_num,
 	} else {
 		*user = new_user;
 	}
+out_unlock:
 	mutex_unlock(&ipmi_interfaces_mutex);
 	return rv;
 }
-- 
2.47.2

