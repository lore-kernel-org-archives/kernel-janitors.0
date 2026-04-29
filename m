Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC803FB05C
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2026 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777466726; cv=none; b=IsUkuKToWGPwvADD4Bh3E2TzY42bMjxBD6wxCsMs+tbO+h+ZduAgMY+JodUq0lqvvqqwvOnv20FyoXGjjzXrHRCa7p8XmdMGqBPrLWXsVTchaXrvS45rNjFPTumrufUTiAE0i7cZsaYZUph5c5J5ZaVNzuTWlny1TTCaCzVSfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777466726; c=relaxed/simple;
	bh=3kncHomSFV93pRVIuKcHHGoGJjLhVDX1Yv+ukkduUbE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SDCxHkggXvEhgAvDYn1lUL7frvY043nS7s/YEldfzzA3AE3Shg6s50Da9AcFku1w7kEvyohQrNSlsuSUiqHb2CDJfMDnAAaRZHqGzTE6JE7gPUokcpO/cfP5q9llML+e0rHPh8Da5vnhQQuDVdNCurNd15z3cqFZbdqAkWWHH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDM8TKiB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDM8TKiB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891cd41959so109067355e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2026 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466722; x=1778071522; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JywTqc2jzlS8kLhkKielAStQs9LfcxdmjK9IqHTFcY=;
        b=pDM8TKiBXyWmA/5Rl8+jlrqcJRkWQNwVNlda29wbei6/Lh0FY5v3S6x3/fMZKU0CsK
         p7FPLwZYvt0feFZwJ7Gj9BrVKNbcu1rh2fKbqawU+yGhBfSbYIaikRQhP8KMn+HUdVhe
         /jdBDSTH00ftoKeG/ExpzC9JWDDaZUNsQONO0RencAeU0XmXHpU9ByjwcXJhIF4BpP45
         ml+Ad1LCNmtXxLu7OD+ZO0kjR6IHP0WqxuHNqYXNKDYD/VqMeH8sUQuz2Hea6zk5s4un
         WLyva89Uw8I7lwq3FG3cnhaeFMz/c4nuCnggq9ge9sQ1sYFwNeTg8RtDB+nqZ4z87ZdJ
         kMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466722; x=1778071522;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JywTqc2jzlS8kLhkKielAStQs9LfcxdmjK9IqHTFcY=;
        b=gh1rDSa0W2FG36L9yw93CCdg8mTAgu0gfAcwjEgrTlRQWeRMm2ka4CL0UNT2jjBr4k
         EyftCJX4cMvL0YVtjQcNNHWSKSRh05xl2FuYqCoX6chrhLkKndTmhP9O4cbkTDe+0ImK
         7CgtR4/WZKSMtfix+QEnY1TcWgMfTphku4Um5zIw5SSAuvykZHo3PrHIKnIT6sFlTicf
         we3X+15lqJVVMxuVhNBNnlCgaDmpPt6Idfvu//6yndyg/exaU8wlT9F8UFfbUy/Vx0y1
         8O2YM68KfVHHITI9cri6ZEG781dGuOhELRrneBvuqQ4FU8AwdAdIt+A0n+NqHToBiigz
         t8Uw==
X-Forwarded-Encrypted: i=1; AFNElJ94BSng4w6D3jgbTfyMoxeYS/6613G3UGC1LV9NwZQqeL6kj9cxeB0jk/QEZfe/jPSIjxFa8m0ClPDKqXYaphk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPSup0tHW+1jSCOZdQmg9H4f7Q3ZWggcOMVC7qnZIEl0lAEAMF
	RlXS7AMFn4hMFgWa86kxejTEYbrm2hQu46PBl0QOO6nXzZLwse75MY9y
X-Gm-Gg: AeBDietI6dP090pX7yELiPkz4uyGv3cfiDivSWe7Cg6oHjr2Xope8D8HyX+rOIrPbKl
	QHxjuxQqTBSz+HyjqBokNHFmvgr8ZLrJz9Ya8Jzq8fxKIgCNdTzZ6srsoorLKWVY2nY4ghM4q8F
	zw7spyIPS3d2mKzYpFOQ1PKX4l1pqbTABIoVW4hgpDIs9oIAGgHVUiufvCPjkCmBbXUjPG5Yu60
	k2YECCvjQI6ZXdCr0WxJ55cBySdLA4AewSbnjCI8vD9Ey8KoOxxf3Ziv0UkRf5Ehm4kDPYF2HsI
	OcWpmZOagIwVmDeeH0wHfr4q3sBHuiBeE8ucP8YzsRCiFKpfFKoaDwizHlxKOJoenlAPrOoycND
	SPEcROJN4jNsz/QW8AJjwoOF1/JJO9+DdYyR2Ctph7Y1bXLUythGGiplOiUL6sDpY+qCTKD2D12
	ko1lg38K4p26hCzY7Vm40WdwhAzH/NFJR+Ll/tdjCGm7m4uLy9/VsKU63Ll+gGRizylZQhx3FY
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48a77ad59bfmr101037255e9.2.1777466722407;
        Wed, 29 Apr 2026 05:45:22 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b421721fsm5286047f8f.15.2026.04.29.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] staging: rtl8723bs: fix potential speculative cpu oob
 read
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Probert <linus.probert@gmail.com>, error27@gmail.com, 
 kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <2026042959-discourse-favorable-edc5@gregkh>
References: <20260429111016.1260295-1-linus.probert@gmail.com>
 <2026042959-discourse-favorable-edc5@gregkh>
Date: Wed, 29 Apr 2026 14:45:20 +0200
Message-Id: <177746672061.1273374.6835519289220492184.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=linus.probert@gmail.com; h=from:subject:message-id;
 bh=3kncHomSFV93pRVIuKcHHGoGJjLhVDX1Yv+ukkduUbE=;
 b=owGbwMvMwCV2OqdW0O/i2pmMp9WSGDI//k1oLFD5XsI0497/X7u3RPK9Plsw92DyvQDHr/7ZQ
 W+WlsTndZSyMIhxMciKKbLs74zkapy/srf2AsIcViaQIQxcnAIwEXERhn92F7I+fbxlsazwE9Oc
 Rw1/3j5Zv1NqepkPV7zU3QLpIy0VDP8r7HmuWNa0+39gaO+Rq30X7F3zKy7rOqPjFc8ly+5cfM0
 CAA==
X-Developer-Key: i=linus.probert@gmail.com; a=openpgp;
 fpr=CFFA060FD5CF9FCB9E3637DC640993AF63BF6854

On 2026-04-29 13:31:46+02:00, Greg Kroah-Hartman wrote:
> On Wed, Apr 29, 2026 at 01:10:16PM +0200, Linus Probert wrote:
> 
> > Fixes potential speculative cpu oob read in os_intfs.c by guarding the
> > index with array_index_nospec.
> > 
> > Fixes smatch warning:
> > warn: potential spectre issue 'rtw_1d_to_queue' [r]
> 
> Is this value controlled by a user?  Or is it just a normal operation
> that happens that is not controlled?  In other words, can a user
> manipulate this directly to be out of range?
> 
> thanks,
> 
> greg k-h

To my understanding, yes. Which is somewhat limited due to being rather
new to kernel code and not having access to this hardware. The priority
is extracted from ip header which can be user controlled.

However, looking closer at the execution before I see that in both cases
bounding is performed on the value as follows:

	dscp = ip_hdr(skb)->tos & 0xfc;
	prio = dscp >> 5;

So my change here adds no additional security. The smatch warning is a
false positive. It only warned on one of the cases. Most likely because
the bounding happened in a function call and it only sees the u32.

Some quick LLM research told me this (in my own words but have not
verified extensively):

The case where the bounding is performed in a function call could be
susceptible to *Spectre v4 (Speculative Store Bypass)*.
But the fix I applied here only applies to v1 so no additional security
on that front either.

This is probably best to NAK unless we just want to remove a false
positive smatch warning. But I personally don't agree with that.

Br,
Linus

