Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FDE2F291B
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Dec 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760496; cv=none; b=eWXCCMcSLAV2PFAfJvI/aAA+hBnDZVDgdM1O88g5ZHFsGkWTMbvtJCSfa9lckpjZAjm9+ZU7R4H7AJtqD6gACmMFCzBzQul+IGIEfsn1T9V+zqLCaPTxWpQnCwhPK+UfnogJDoo8gZ3N+c6UQso7CyQ0jv/YqZ12BW7TYYxtmiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760496; c=relaxed/simple;
	bh=FVTaTUHkj0hCiF/8oDz0IRLJk2VFfDYMXcQ5TgtXHuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NG347YOJABuwytTeJLQwjL1arlY6s3veoK/5+i5W7/ssNkQVoGx5K40TuHKciqQ/cwuF9xp9IwNa5GqfDTm5t/VsK17GgjeGd8diJCF77osZMXgtERRuZAKPDFxQz3mM+VS0Zft6tnGBL2oKl4Y/UnimblJJjpPY9eKrEvqfKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFrm2sag; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFrm2sag"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso5614905e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Dec 2025 03:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764760491; x=1765365291; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQuU8GXO4td5lpFMJSEuUSNKl2naOb+LA1iRC4+QgDE=;
        b=kFrm2sagbDxhNjqHenQQgXdwOYRol2V95Ma+rx8SCQzHc99psuBEwzuACRECl/sLno
         hTqt/p0bolW+OY9i3PqVGG56Kl56WufaDzGuw7aIoDVBez6BFH4VoGP/6poWeMv76LXS
         /VYYwmx5GZm7e5aTZ4bD/wCTvoSrdVkx8M+91eNmqhBs6jcNOXYnnyWBUFuzSu4/9e67
         1wugbaTd8T+/KLARBOP9GUyOies7G7jPdFAoDqEyxGnmKH3isvO7MrfSRm6Sbj0B/oQC
         nXVa2ceYrxmzPhfFmcIr2YXd9/20+s1H5Jsw22LnrzuvtRL+GerDzzMDo5LCC6vfecDZ
         gAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760491; x=1765365291;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQuU8GXO4td5lpFMJSEuUSNKl2naOb+LA1iRC4+QgDE=;
        b=LOA4BCVMgyaXQ1OMgOgPs7oF4Fwe7RrzEt1gGIilKVrjTkTFCFGg7mCzsIvvTP8iz2
         50Y5ImXTeWAwkcI04GAdoa8S9NuR5VfNR2Y8W+2i0CRAFJY/HbgG0ylqts9i8V7BvV8U
         9jwrbReW/aqoE9xAcTTRfu3Nv0nDsy4ABzR+pt2S4DayjyEdq9FrPX+Q81ZjH4oLSpi4
         mYVC6v5atq6mtYQnwGkY4Q1MQmu6IRBG7R0uOoTPjIcaZcwlS4xvuB7y2xe8hmBguLgJ
         ZxzuFdVwd+epk0Pg9n0l/qXWSqboqVO3mQe5ZlGMOfSCSGco01OOGkkINqtevmnyfWP1
         whww==
X-Forwarded-Encrypted: i=1; AJvYcCVJd0RkRshefmo7NjpXntuRE4yUz4TXemS+GeBmyBpO54KGQlYqyLgVbpVHJLYP3z7kJRB1lWWLeUgAqGvnuHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz65riuCH8ZuUW192IvjoZ17xXEEA6DXjOTwGiesUMg4vGr9FC9
	xlmcSbQGDxR0aIH3SdpillAgZsdixk1cRGauHUH/k9b2fi+cE41J5wj9LCA23cQ1emE=
X-Gm-Gg: ASbGnctPxwhUB1XR/OBLrqrWzkITPeIjR5FrDSwQeK2GgAjcdCJH+lERV+NZNlFzAc8
	7G7kTtrnATbiw39W0jzl39RkY129tF24GhtfmQXwaNxAsskmmTU6K4JLEngHNpVg7RTSJQ+AGZ1
	OcMLTHUDEJEDMDPTtAUndgfYLb+CHIP1C5ft8ucRnP8rEc3ZrkP9G6Kt/7HmfGcgmAhqM+u2Qbw
	qGf5fNnGzn8n2QH6BsNIX/v8lZz1MvzvBp/fNJcDFl3TafbPS6aWHt5mJF7AAZER/SqWbQdFVF3
	d5roQyYo8ENxlEmwDl/y360B8fVUeyrznBdyBhlLP86Fc+auzeXOzgErzq02sIOWNoaXlM/Cu4Z
	kgNdmxfVBvXi174CttHoeKaSnsEYtORsbRhVSWE+eAiSXd9wlSyyVo4ut8PEtwo7HxhZSMy0qC9
	mjWsjUDXBUm6zsdEJK
X-Google-Smtp-Source: AGHT+IFvxMW0hrVy7sS2LWr2Mu2vPFg5Y67EUhHisjMmxypFuUsGFVIcK/2jhTXExouZzHZBW8uIaw==
X-Received: by 2002:a05:600c:4fcc:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-4792aeed1b5mr21815965e9.5.1764760491023;
        Wed, 03 Dec 2025 03:14:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792a79ed9asm41687785e9.6.2025.12.03.03.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 03:14:50 -0800 (PST)
Date: Wed, 3 Dec 2025 14:14:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: qgeniecore@qualcomm.com
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: cfg80211: sme: store capped length in
 __cfg80211_connect_result()
Message-ID: <aTAbp5RleyH_lnZE@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The QGenie AI code review tool says we should store the capped length to
wdev->u.client.ssid_len.  The AI is correct.

Fixes: 62b635dcd69c ("wifi: cfg80211: sme: cap SSID length in __cfg80211_connect_result()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/wireless/sme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/sme.c b/net/wireless/sme.c
index 3a028ff287fb..4e629ca305bc 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -910,7 +910,7 @@ void __cfg80211_connect_result(struct net_device *dev,
 
 			ssid_len = min(ssid->datalen, IEEE80211_MAX_SSID_LEN);
 			memcpy(wdev->u.client.ssid, ssid->data, ssid_len);
-			wdev->u.client.ssid_len = ssid->datalen;
+			wdev->u.client.ssid_len = ssid_len;
 			break;
 		}
 		rcu_read_unlock();
-- 
2.51.0

