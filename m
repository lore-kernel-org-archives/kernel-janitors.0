Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A342652AF
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131411; cv=none; b=E6XG9bW2/yk7W8UtAp870bCOfrvYALtYjWNblrIql1kDBV8pQXNbb1Ig2AZ0P3dOo5wyX6NiFD483yHpHwZUPYWUlIiLLEF6Tu0y9Ak83hce8jarHi+3NqHJ9Dtq8NwezDVwG66G03RLFR1807rMm/+WN2FibJ2cB+TWfuOC67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131411; c=relaxed/simple;
	bh=/bGIY46cuc38cb1abi/sHCeSyn+CEKg0h0yfcmVi7wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmrZhZxTT6Ixb349cCZzMKB7j6WuT09Xdj5/5d89h9CT3JPlvBbbYXn+x2eCD1EkPVxJ1oQnNgu8JFN1Yq82k2FQUtQOL4Lrzp2NCJC/XvNLVLd1bo9atTUknmP9YuqJKe1e1CLyD7VAwHmhB8628y/estJxByimS8+yGl7uP+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLmpEgbr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLmpEgbr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso13781305e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 00:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766131408; x=1766736208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J+/ZRMSQfz2Pe5W3+kCSEEPyZ++ydw0qjFUACnxc7Hc=;
        b=iLmpEgbrNkqpJeLCyEr9TjVU+3Jd3Tf/BfK6tpxbTLl0EFjGPuuIFWWF4DM8I209KD
         Y36n73zfJ2AcLx7QWIqk0y2EQh70ls8vhkZJiecwfTON/TwATsW/x6B75KKUl4ojMwnD
         JwEqH1HkDuYf5RhndIQTQ2yyVBdt6SxnGpxZHnNJBIMFjfl4eXNggDN+hjZ1kVN0YuwA
         8u37BLy1JNLPQ5MLFNT5rYS+cTjbq6wM2KSTy2YK1a0AWi1EP6imoZTLNCj+6imfImaX
         FtzE9SRZl1MabzIX+jIJr0Yt/sUJYbX84TR3fKb4MvqcHI+cJil0CN+1U1YmmrlqLtJZ
         z48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131408; x=1766736208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+/ZRMSQfz2Pe5W3+kCSEEPyZ++ydw0qjFUACnxc7Hc=;
        b=w5JaNCLdhedi8gO0SpVyeflpYex7uThT0V4PKKvMmzilvnEfTywz+OGhZ7oLEvNwRW
         6gjCCOoLO4fqaUuncbAum4VaJs3GuEvfR2bC8blf3KEMmrD9HgMLJggoxpZ6TbsufZcz
         9Y+6p2hmm2WHQIrZRD6pRYp9uUODvGkSnYxFcu3KesI2UkmIXTImtzM3IxDjzoQ4q/DF
         z8Xn8mU6Lfmucp6WHD24Ap9YVNPrlwGJx5XTEKvOoCNUG9WeRUR4IWf+wQEFq9IO0ZUp
         xCMq36wDCD8iiv6G7rnORzElTVQWDxqVYkbv33REmXeJqFAqVuZCAgmtp+8MzBF6gg6h
         bETQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtdsrLybrG0/qeZ0v92YstZ9BDQpt7qNTFKsRCCkLqRoxuD2XGt7u1YDMnjfiDwY70F4qa0A+el3U+6OEosAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6Bzp3XcV3OVyUJ5jGnYNw2mzrZH28TB29HaB7AASm+1tVh/g
	01gJ34G75DOCblY3+XhdwEd6Tc4pfBjpDkASE/3nt61QeD65lx8VDk60vmxrEG8jJ1Y=
X-Gm-Gg: AY/fxX7Pq1vqlDo6HQ6p3uXOCmsl0km+7kFbQGUbgtlQRaL/HzTa5JeAfeMtxKkhXiR
	Xho5ChewUZyy+TLNvYwGqfTwMo+ToqPYA+7mFyVssvHn04K2N/f1lnb+nb+9D5gwanc0b3oGMc3
	iU5koSmYpoRlysTUXxD68j5fkF5pPnHHvljTQ09yMugf+r7ZZ9L6qrQK3WJGEE44ETUkzUN8fst
	9LlvjEUeucsQAPkq7whyvvOwS9AeSafdJMgH79bceBa+MlOR92ARQendjbwVGz3K/jT4BRwoRXb
	3ERdyFcy6dsSg7rm1e3UNvbnVGaZBOKcxhDm6G3SToxsVMtNVCy+qwQnIPfwWIvwkK60hHNrj3O
	C6QF+7Upeu5aIuLYxqhvg/pTvkIfFq4QKj8vVeJGWb8ns1RZApHEiywwEdqbmq3+DWPq8MQMq7c
	aB10PH0Sf8jJNSPGn/
X-Google-Smtp-Source: AGHT+IF2eEWgioDzK9v88hc7zvDgUmt9tMsxScJV1o/NErRD5qEO8zTzXYks9Hy32CtcRV+DzuDAtw==
X-Received: by 2002:a05:6000:2303:b0:431:342:ad42 with SMTP id ffacd0b85a97d-4324e50d6d7mr2001778f8f.44.1766131407550;
        Fri, 19 Dec 2025 00:03:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm3644036f8f.1.2025.12.19.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:03:27 -0800 (PST)
Date: Fri, 19 Dec 2025 11:03:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <aUUGzCA-M-D3VFj9@stanley.mountain>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
 <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>
 <aUT8KrV36wF8ITIK@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUT8KrV36wF8ITIK@stanley.mountain>

On Fri, Dec 19, 2025 at 10:18:02AM +0300, Dan Carpenter wrote:
> On Fri, Dec 19, 2025 at 10:54:03AM +0530, Vasanthakumar Thiagarajan wrote:
> > 
> > 
> > On 12/18/2025 1:14 PM, Dan Carpenter wrote:
> > > Destroy the rhash_tbl before returning the error code.
> > > 
> > > Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > nit: The next branch in ath is actually ath-next.
> 
> I'm working with over 400 different branches, right?  I can't keep track
> of them all so I just put "next" if it's in linux-next and leave it
> blanke if it's in Linus's tree.  It's automated.

For automated QC, it's really easy to automate on the recieving side.
In some ways, since there is only one place which recieves code and
does QC and a hundred different people sending patches, then it makes
more sense to do it on the recieving side.

This rule started with Dave Miller.  He was handling a hundred patches
a day.  Everything in networking except for wireless.  Also Sparc and
ata.  This was before I invented the Fixes tag, so that wasn't an
option.  Greg and Andrew still handle that level of traffic but they
just use Fixes tags to automate their process.

regards,
dan carpenter

