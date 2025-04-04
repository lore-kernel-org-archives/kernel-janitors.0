Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432CB18B495
	for <kernel-janitors@vger.kernel.org>; Fri,  4 Apr 2025 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755268; cv=none; b=NhdUSJnZo/YD0l2ehzquA213CDuEsDG07Qtf8kmB/VQC/1NbI2hOU4fpLDRMFq/P0eL+sslxq3DlUd6Dz0yzfYTp+SOgXZ6/yYxdfBGRKKWe4ZUVnvhjfe1rgO4cy6+kiuKcyOoF4JeRjOJ3Lcku5+fbqTEfUMmI9D95EHeIO1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755268; c=relaxed/simple;
	bh=6J59qiE2/DyR8bp12iRSJ3b4eCHXTbUSaacflaSE4Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2J7FmsEzkun9XmU83urucIcAN+LnyHmNUvrL6oWeqhG36xmc5Y8awfNE7GXnVTeafmRE7K2a/rhRwwY9FndpoGNu+t1PSEQJfsjz+Nh3uE46w7YiOvFOrEdD370kwIxQKVNfspebGcUgUf7UbzRD75J7+ydVwpehT+j03GYY4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVY6lAo7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVY6lAo7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1407089f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Apr 2025 01:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743755263; x=1744360063; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJa0y5uHqB+uXYxg4Ee5P8Mqg/g0/KhhIdf1SuA6v4A=;
        b=eVY6lAo7hqueymdGO2mdjSexjzxtDzQEKqNPrKBPhgQBYIvNNaw8XHuRFY6p+ZYoo2
         QFnOfowEhaBIQNj3DrG4iUIc5ckQRfNrVn28dvpYCCwAhBGmsVMNTP5ggBGdTpVtjV7X
         FgMpVAnsGlH/t4LqAQlY4FTmRaONUV5yuIgRnhB5kLa3DaMtQqW/VXuRcy6LUWVp157/
         eVb2F2P9xgDLZtcwhhHL5X4oabKmoWkr88QC5KXwncM8nPgxzStN5yNYjHH+nPvLBOM9
         d1qCy5b1A7ZCZqBKqMWpPdc4tpP8feSrJ/RDV2ygKOKB0dnapGzV69iqmOn+xfDN1c5a
         EcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755263; x=1744360063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJa0y5uHqB+uXYxg4Ee5P8Mqg/g0/KhhIdf1SuA6v4A=;
        b=YIcra1J67+Iig48bqzhKMWsopXrvgpuChs1ytcH3UtwjzrNSxkafCCUIOM7SRIQcDy
         qfqW/jR7NvmbwjrZjs34dxRhTJSJiY0je+tElBBK1F0YvE9Gzv27qCphNckJ0bcw2IGq
         sqIrI99xdL/u2GwLBQcmS6H/K+LQP60ZEeaI/UDDWhKjVvtpDEhLIuLRykPk/hGkaQa9
         9rUzyU6J0K0vYQQ8yTQrA22Vb0l1+OOPGp80vLyQ9DdImRqkE4qg1WW9sm6+oKooYSF6
         oRtn1/9fB1Tpjcne3hP/8DFFwVhri7EC+GHf3YfnLrqyDQ4aKYxxRARQ4zqD3svnSicm
         ynqw==
X-Forwarded-Encrypted: i=1; AJvYcCXjQe/NCq3Uunl8fJEHKKQ/Eu2o29MajIIIjGFlHxARmTm5spBCOLBBD0bSPbMM7r+WJIQ4b9j8whEu3F2MZSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEdyckuGoNU+KrI5MYU5D3IlKdTzYVRaOYzQdAQygj8kC0Aniy
	QDNxvxZAQAayh8r9gFSw4riMrrPrdOahR3b8xacAT3iAhN7eYE1M9jZZFEcUdZM=
X-Gm-Gg: ASbGnctpidJxYvm62Rl6eqdEOXRtdHe3N+C8kAWOKCyTCJvluI7QkAM0MRiqXWGKFmp
	ZDyT0E6LwUWMJvnry9oqkN/9OZPng/8e8T/zWZxPH2/JRng4vtJQ3eoOt9somlTYjevJTSZ3YP4
	kLzy7qCD9LPk12dZs++VmgfB6Sryb2gn+tqUFx/Nxgri+IaYa7epaD2miW5e5I4QKIjzOpiBbPO
	wilc5WlsEbnSIo+scXYuP3m+TmdknxQw3SgxTyBabLM1Iksj+34Uwme3my+R/vB2qrV/4gP+pBR
	mG/Rbytze4SJFBEyQ62qSFiVrgD8I9IYmNn7Bk61hgdo4qIOUA==
X-Google-Smtp-Source: AGHT+IG+NDQDuY7wpbCJM2rLv7MTUqbCkkmKdHj5rYcXcQpcsNWGZu7a+1mkk53652ueI0HgxX47pg==
X-Received: by 2002:a05:6000:250a:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-39d0873fd19mr1619780f8f.3.1743755263387;
        Fri, 04 Apr 2025 01:27:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c3020dacfsm3780694f8f.72.2025.04.04.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:27:42 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:27:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <03c838ab-3bc8-4e5a-9f0a-331254701b0c@stanley.mountain>
References: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
 <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>

On Mon, Mar 31, 2025 at 02:02:44PM +0200, Christian König wrote:
> Am 31.03.25 um 11:45 schrieb Dan Carpenter:
> > Call dma_fence_put(fence) before returning an error on this error path.
> >
> > Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/dma-buf/sw_sync.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index f5905d67dedb..b7615c5c6cac 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
> >  		return -EINVAL;
> >  
> >  	pt = dma_fence_to_sync_pt(fence);
> > -	if (!pt)
> > +	if (!pt) {
> > +		dma_fence_put(fence);
> >  		return -EINVAL;
> > +	}
> 
> Good catch.
> 
> I think it would be cleaner if we add an error label and then use "ret = -EINVAL; goto error;" here as well as a few lines below when ret is set to -ENOENT.
> 
> This way we can also avoid the ret = 0 in the declaration and let the compiler actually check the lifetime of the assignment.
> 

I had some issues with my email and it silently ate a bunch of outgoing
email without saving a single trace of anything I had sent.  I see
this was one that was eaten.

Unwind ladders don't work really well for things where you just take it
for a little while and then drop it a few lines later.  Such as here you
take reference and then drop it or you take a lock and then drop it.
Normally, you can add things to anywere in the unwind ladder but if you
add an unlock to the ladder than you to add a weird bunny hop if the goto
isn't holding the lock.  It ends up getting confusing.  With that kind of
thing, I prefer to do the unlock before the goto.

free_c:
	free(c);
	goto free_b;  <-- bunny hop;
unlock:
	unlock();
free_b:
	free(b);
free_a:
	free(a);

	return ret;

regards,
dan carpenter

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..22a808995f10 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
-		return -EINVAL;
+	if (!pt) {
+		ret = -EINVAL;
+		goto put_fence;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-		data.deadline_ns = ktime_to_ns(pt->deadline);
-	} else {
+	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
+		goto unlock;
 	}
+	data.deadline_ns = ktime_to_ns(pt->deadline);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_put(fence);
@@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EFAULT;
 
 	return 0;
+
+unlock:
+	spin_unlock_irqrestore(fence->lock, flags);
+put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,


