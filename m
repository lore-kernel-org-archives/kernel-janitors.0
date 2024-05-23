Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0442A18029
	for <kernel-janitors@vger.kernel.org>; Thu, 23 May 2024 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716478511; cv=none; b=HI/1UfiQGH/AkgapXICiiBrNGYRxG0/6e7mWg8Kki4gNR7Pqh/nUwrNvpnwO70k5Nu5u2ky2qh5EY2CWs2WNkd2tMiwD+xYm/x2Avp4IKbRkeJ3rQGbXRoEEC3wb8oAnvKBOOKaDO3nFMHLkfefsJgxMNaN7UF5SlWGU4V4z1XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716478511; c=relaxed/simple;
	bh=Epa6p0WiUcII668vol4NtXtNkWKG+qcknEpx6s86hxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSz1hMMQvQBYHZLPGkzkjyREKv7XBL+2zbnzdgb629+vuXFwdMHVY0eDxB+Dlo1oaTrcjzJXGVBJ5krQ5jT1BI1j8lPTttBLfGXI217yOakzlKznXI1mu3JIMbdmzEiCuwnZ1a6vdo51XnSRhTxTpRpg//61geFkwwMI2SUM6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYRobr3L; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYRobr3L"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e428242a38so116804631fa.2
        for <kernel-janitors@vger.kernel.org>; Thu, 23 May 2024 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716478507; x=1717083307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aOvQxFRbcxYkm/Tz05v9NM6rfH41Zt8Flh04Mv7Dqsc=;
        b=DYRobr3LvYvrndNzNS3kD3T59PeCAPDE5X65zSoNcb6yrLAPmy+GoIR2j4TJkOw2AL
         wd92q5+EuXXD2NdHWgOWvU6axHHE856Gzm75yU10I52zw/5KlxjK2ZtM8iLdMxePNAp9
         KGVHoZRxbokimmIyzj9alutSOcvvmr3eQNuXfEvG7Z9SVUihWJ3W9fs+y/GE9r0iEbWN
         YjumddemuQDu3FEpEwJxQmPWanHyPERtMNdEgnsBberAiWC4M9avaon/oyqZvgutwaY6
         VfuxoPYSlCRA73X7XV7Pbh6WYicnUHrQ9ASaqG4KqB+IuRd1/RXGEyDXqASIeKMSNuOt
         RN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716478507; x=1717083307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOvQxFRbcxYkm/Tz05v9NM6rfH41Zt8Flh04Mv7Dqsc=;
        b=ElerC/l9zLfqdUHqxGqh3duxR0E9XyWbdaAP+MPl4+9XEYJZWRqraWrqqFBnKYVe0a
         nZLAVsmpOo3ipdvD3YAfqv/vS2FTMDxyg2G6dpmd1QNqmSVuK2wP4ZcmyeV/W9I8qPDj
         Ye8AG62Q6zfYIhzYKJ3WezJq7McCsExzJW9PtapEpYF9Vr1Rc2FwnkpkDDV+T+V38SD3
         CUQl6C4ClJPEfAthWrHDc3gh95qmnAfGhXT3xouHSl/9FBXv24DOoMhxlFtVbepJI1ej
         OEox3hRbpmDAUEFUlZbi/36J2C7H4ZOLeadiUVnXUY1b1J/W4fJyO9wZHioiNUANUgsf
         FGWg==
X-Forwarded-Encrypted: i=1; AJvYcCWGdpTUsRWZEn0zFAy2TnXBi2ORXewo1YmROG/ZLAY+Tz55vvj3VLT7ngXCyReOOCOPXqKZeKZgdI5GWw8G2OfVp14pOOYKhhunVM7eBsnL
X-Gm-Message-State: AOJu0Yz2NBfT9ZLLyxntH3iP2Vq+BMCngeMmjVNVG84ncgCwAY9p6K8Q
	Z77R+zRqmoiE2qf8k8DUrlU+jFmYu/LRro1B89Z3qOFKKYpODFL4nS6fcTakobY=
X-Google-Smtp-Source: AGHT+IHyu7a5dgm+ZLm9NrbzpbVq+k55CrZv8rXn8T2Ikss68TYZof8GfyRY0kYs3jFpGkT8WMJcqA==
X-Received: by 2002:a2e:99c6:0:b0:2d8:5af9:90c5 with SMTP id 38308e7fff4ca-2e949540d10mr43991071fa.39.1716478507009;
        Thu, 23 May 2024 08:35:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f5d189sm28802185e9.24.2024.05.23.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:35:06 -0700 (PDT)
Date: Thu, 23 May 2024 18:35:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] selftests: kvm: fix shift of 32 bit unsigned int
 more than 32 bits
Message-ID: <da8581c8-3d56-454b-bddb-e523a983cb44@moroto.mountain>
References: <20240523113802.2195703-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523113802.2195703-1-colin.i.king@gmail.com>

On Thu, May 23, 2024 at 12:38:02PM +0100, Colin Ian King wrote:
> Currrentl a 32 bit 1u value is being shifted more than 32 bits causing
> overflow and incorrect checking of bits 32-63. Fix this by using the
> BIT_ULL macro for shifting bits.
> 
> Detected by cppcheck:
> sev_init2_tests.c:108:34: error: Shifting 32-bit value by 63 bits is
> undefined behaviour [shiftTooManyBits]
> 
> Fixes: dfc083a181ba ("selftests: kvm: add tests for KVM_SEV_INIT2")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  tools/testing/selftests/kvm/x86_64/sev_init2_tests.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86_64/sev_init2_tests.c b/tools/testing/selftests/kvm/x86_64/sev_init2_tests.c
> index 7a4a61be119b..ea09f7a06aa4 100644
> --- a/tools/testing/selftests/kvm/x86_64/sev_init2_tests.c
> +++ b/tools/testing/selftests/kvm/x86_64/sev_init2_tests.c
> @@ -105,11 +105,11 @@ void test_features(uint32_t vm_type, uint64_t supported_features)
>  	int i;
>  
>  	for (i = 0; i < 64; i++) {
> -		if (!(supported_features & (1u << i)))
> +		if (!(supported_features & BIT_ULL(i)))
>  			test_init2_invalid(vm_type,
>  				&(struct kvm_sev_init){ .vmsa_features = BIT_ULL(i) },
>  				"unknown feature");
> -		else if (KNOWN_FEATURES & (1u << i))
> +		else if (KNOWN_FEATURES & BIT_ULL(u))
                                                  ^
Should be i.  How does this build?  :P

regards,
dan carpenter

