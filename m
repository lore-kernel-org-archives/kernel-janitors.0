Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030222A1E4
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741618330; cv=none; b=LM2IevSxJqYY+E6O0s7D27FbwTFTu6HGfR8sTW9zs/WM0Lej9QNn4qXsuYoo2WM1M3pvxNehVf6MEXa1SglHRKJTQjxADszvnDQ8upEBJeuY6zlZdXSTg9ETpeyUWGcM195NQyt0PXHjgh8e4DDsYYPjz8lEdTvIxB06+pP6tSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741618330; c=relaxed/simple;
	bh=La8fa582+cudZWU7EBZb+kiU11zXIyrob0PJV2PXjfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZ6Rt04nlaGxwV2HoSNcm/0/zEOM7EJ2lrTvDcSqKDCU5BNvEAHYuQ/44Ym1BPdtkhOaFavt+S70cVucHkboz20n4MnsmcubAG3bNZZuYaqQVNmThQR5529tdr0VP1cHNa1cn1pyAYmorKVRyL9LD6nzm1X3flwIezfDWzLARs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFd9FhJa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFd9FhJa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso3706775e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741618327; x=1742223127; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJhmOti6S9aSxHFcfgWlRYy87Ur6fs4aWozpDuFk45g=;
        b=KFd9FhJapk9LSPrTSWPYVYrj9OPaxtDOWFbamAr2nAK3v58lTN7B1G/K5ZL/s6+++r
         Ej66R0z7uvendhA6TlVMinoHfN91/7IQfe36jmXtlxy62nz44IqciyX6wdOLXT0dIOkj
         59kDKpM7uYwhvFNKmFd/4qv8kevkUtZq1xhGXaNMZYvmvyIUHd6mBTJYdkyBo//EDdEX
         7dS41EdawFpgPDo7Av8GqU1gbK2iqC+O6YjxlXVpZDkUP1SBBZ94U+beNZx9e5ngdl3T
         R4PA32rtAdERI02fVx4CEnQYQr+qhb5QgFIwheqvM/c1Sek1g0esxv+hXFD6Aal95DQS
         9hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618327; x=1742223127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJhmOti6S9aSxHFcfgWlRYy87Ur6fs4aWozpDuFk45g=;
        b=iOGLHaxQeHQNyXi+Q7s+dVF67Q7imY0rxK9Xvxjzeia89GKQDqNUNFumzeeiUq6W5Q
         ZUjUY0s2qo/VF317FnEd2wW/9dq7UmkC3rUvhC3gswUwnV7leZxzrRk7EpEY+lQ6OII7
         KP90+MilzjLlqHZn4oyGxPUIOEtbDTaF3RIYNMLypMGKCutln/b5t42NgQeigxOtC0Bg
         yCwQD0fGRdG+zLlYyJVwVgEPzjCCCBhxAT0YUgHpQNmBdD1HTNUYiQ1077xUiywhYj+r
         Pt/jsu/QHWZ2irP3urm6cq9kOYI7CqpAP85lW8bR5cqSaWRRIaTgRP6YB1ZPEQVs2VQD
         qeZw==
X-Forwarded-Encrypted: i=1; AJvYcCU4JGEI54ekfJgjtQES+hIVUpoadUflIldkdr+ptMfc2/YzYf8JJkm8xCBaLwQ+YTsWoyHwqrurmCikxZCvQXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3k78r24tnVpFndoxpjtfLbKkkyHPj4jatcABYDEvc0wMxO3Wa
	bhSvbCluJ92k4RPq2rAb0ws/67e5MOiKSNlJfmw6ANyocNIjK/vxEyqZB0grtvw=
X-Gm-Gg: ASbGncsJnsXUO+fPfckFnZWXlYTh+a0q3EHGPrYxwhj2kGz76Pqnxa7oweXVUaiKMIG
	eGLE5C20G/UunAcAc1Z8NR1cTVG7H+9ET4jz9AgtNaZzIoH5s9GLENI3eLXpq/wlOBtJCkmwXge
	k04CDw5XpZCz151KP0By6cOfEaKUQDI/ipTZwS3GSWIDlHUcDgCravbSzyP1nBYaDIQKHv+U1KI
	b5QnnqF0HaUiQ2TETA/2q6aTs+4xQBA8k4CcnxtZ7H3t9euPdC1mShEfIQV6tw8rmcrmQiZOySi
	1PnH8jjUezGOxDk2NjleZIucomRGttu9rcazEG5RVwfAxYLhCA==
X-Google-Smtp-Source: AGHT+IEWXxlykPP+DK6XBhySTuz9TVLUo/1Ocj0YrcVL3sXXqxgbc5YK7TpnRor10s4o+P6MhNGnfg==
X-Received: by 2002:a05:600c:1c2a:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43c5a5e9074mr106986775e9.5.1741618327226;
        Mon, 10 Mar 2025 07:52:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cef25f075sm63882915e9.28.2025.03.10.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:06 -0700 (PDT)
Date: Mon, 10 Mar 2025 17:52:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Patil Rajesh Reddy <Patil.Reddy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd/pmf: fix cleanup in
 amd_pmf_init_smart_pc()
Message-ID: <4a14c0a5-d6f8-4df9-b947-a0d3c3ef02b3@stanley.mountain>
References: <43ad5358-f5b2-4cfc-85b4-e7ab8c7cf329@stanley.mountain>
 <32c6c456-94f0-f077-040c-09f67d60953a@linux.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32c6c456-94f0-f077-040c-09f67d60953a@linux.intel.com>

On Mon, Mar 10, 2025 at 02:43:51PM +0200, Ilpo Järvinen wrote:
> On Mon, 10 Mar 2025, Dan Carpenter wrote:
> 
> > There are a couple problems in this code:
> > 
> > First, if amd_pmf_tee_init() fails then the function returns directly
> > instead of cleaning up.  We cannot simply do a "goto error;" because
> > that would lead to a double free.  I have re-written this code to
> > use an unwind ladder to free the allocations.
> 
> Thanks Dan,
> 
> Could you please amend this with the information of what is getting 
> double freed, it took considerable amount of time for me to figure out.
> I assume it's ->fw_shm_pool ?
> 

Yes, that's it.  Sure, I can re-write that.

> > Second, if amd_pmf_start_policy_engine() fails on every iteration though
> > the loop then the code calls amd_pmf_tee_deinit() twice which is also a
> > double free.  Call amd_pmf_tee_deinit() inside the loop for each failed
> > iteration.  Also on that path the error codes are not necessarily
> > negative kernel error codes.  Set the error code to -EINVAL.
> 
> Maybe I should start to consistently reject any attempt to use 
> cleanup/deinit helper functions instead of a proper rollback. It 
> seems a pattern that is very prone to errors like this.

I do not like deinit functions.  They are so hard to review.  But I
detected this bug because of a Smatch warning:

drivers/platform/x86/amd/pmf/tee-if.c:540 amd_pmf_init_smart_pc() warn: missing unwind goto?

regards,
dan carpenter

