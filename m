Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9A17C20C
	for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2024 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717078567; cv=none; b=BV3FSY5GwXsgBK11eQl9q4cxf/zRLuwZZhG39zv1yaIKg9t4+lP8+Vd786RTC4U9UX6rqn+KncPgJ7wFIxUTqlXXRQZUREW8ztvKojrQdCU0H3CILW1C8F6Bq8v6rXI0OITvtSas0BKHL1kSQ8xQVUHg5UmVaMcyuKdHWyOaLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717078567; c=relaxed/simple;
	bh=bvIAGvRXMNpdUhPoETcyOi3cHSAfWQnCfagkxpAFajQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Y4NXHeTaVu7rR2f/cYmsXFVkxtM/qU4PANXSPtJw47M2p6gqHLfP4fo6bil/f8/UXRoj95ZbIOSUdwA3ZxGshsVDFu9s4Mx+5lrz6QooYA+O19IA5J6mNxt0EqIqAhpQsUmJC+cgRSkLWZuANFyR74fGU5KmSLUT9NsnroXiHxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=pP25FJ/m; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="pP25FJ/m"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5788eaf5320so1166421a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 30 May 2024 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1717078564; x=1717683364; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SrOn7yUVC9kN8SKaYqmUwEiVGnDGl9gohY+ONwqgl0=;
        b=pP25FJ/m3PjicCvNhBooY1AcR2dt+/Zffxz3S1fffXNO/L9FVfTLTOrqYMpXmAxAVf
         XXHyRs4pYWBHOfZWTSdPu3hUZ2poHjh8xZqX3A9iC+pUxtMD4XG433fC8OljZWgP+Wd3
         xR4rFbPqjcUL1/Q9gqZCUylShgqkvXQhuTQ//hD9AnoDHvHKV/4GVpGO9XMq/lPVHTki
         YjdyKYmv0GPXDoUhe1wMw1PKDN5vd0zI2kLx6FjwGtzLZAt+yk7DYhRYKajhl1vscXFt
         j+KSonwV+lxCrThrZrkVGG4tGAKQPfsirGROct+jlVibaAu6zuvxPncodZixwdbtiJIy
         2r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717078564; x=1717683364;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SrOn7yUVC9kN8SKaYqmUwEiVGnDGl9gohY+ONwqgl0=;
        b=ss8efTRHyfiCEJXHrTTRyos+da1C7465FJjbl0MBkAi0tq7ESunKAu/T3FcXzy5CY6
         cb0grWq2yyVIOOsPBaEBzd6pyN5wWjZkiZt3ORTPF45GXsoB7jfivL+KQ4y5vciBbkms
         o/vmHR+BD/p8ERpt8VO2Id28WI2FVIRKh/8Y0S2+E9U9CELJsv7VIve5dYiXWSGHI+zc
         9l6xk33sYC7WKRa8ZzIek/rov/v4sS5DZ5QamCfE76Thz+d5oxDdiIAUDZa3QbF7gm9D
         Z9TADwniNBUS3YsAm0ComuYat7RJYBHO2z1UXk2Lgj7F7VYnAVfbG1MapcZ0iEBWyZkJ
         uv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzVf2dzR6zj3eBFB93CM7JWQyAiB/cPZ2VQh/6iF6qv5wghB0lFEO6MW4RGpCwMSfvSWD4nnedhbwifilar7Eve58SRBYGakiYGtAz2E4C
X-Gm-Message-State: AOJu0YzMalDRtPGmfke7+fd3Yw2UZvecWJz3n15du/S4xXPSYZL+Goi9
	bsU9r0ws+TZCsTGd4LeDGaATYS8pwD0bTLLpj5I1Vh/LV15CaAz06S4n6m4sYDdHS+ICRYPcYFG
	EuPc=
X-Google-Smtp-Source: AGHT+IE1Gxt4e7p05tnSjb/uvvdgi7YH2rrBA2tf2xKHkqxV2osqZET9Lhq+RcPBHLK9qZGK1rnznQ==
X-Received: by 2002:a17:906:6d0f:b0:a59:b359:3e14 with SMTP id a640c23a62f3a-a65e8d12314mr168664366b.10.1717078563585;
        Thu, 30 May 2024 07:16:03 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:1083:f101:c1e2:c2f3:b010:383c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a660947c20fsm56515766b.175.2024.05.30.07.16.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2024 07:16:03 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Use memdup_user()
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <4c2c8a76-17c7-4dbb-96ff-8488c8e953ff@moroto.mountain>
Date: Thu, 30 May 2024 16:15:51 +0200
Cc: markus.elfring@web.de,
 Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com,
 kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <1D5BDE66-ABB3-41D9-ACB0-FBAC207D55DC@toblux.com>
References: <50d10f0b-d108-4057-be9c-a90e2398e810@web.de>
 <20240527083628.210491-2-thorsten.blum@toblux.com>
 <4c2c8a76-17c7-4dbb-96ff-8488c8e953ff@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: Apple Mail (2.3774.600.62)

Hi Dan,

On 27. May 2024, at 12:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> Also this check isn't great:
> 
> if (dev->policy_sz < header->length + 512)
> 
> header->length is a u32 that comes from the user, so the addition can
> overflow.  I can't immediately see how to exploit this though since we
> don't seem to use header->length after this (by itself).

How about

	if (header->length > U32_MAX - 512 || dev->policy_sz < header->length + 512)
		return -EINVAL;

to prevent a possible overflow?

header->length is used in the next line

	dev->policy_sz = header->length + 512;

and if the addition overflows, we end up setting dev->policy_sz to an 
invalid value.

Thanks,
Thorsten
