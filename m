Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0D6F31C
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jul 2024 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592631; cv=none; b=X4YeQywkBKgNIk6RQCbIHfhaxlDBY9HWNjghmVwurmu/mfC5XhRAtT6wT+DP+Kkc3890bg2e8+KP2zRi3vIyQnjKEJqY1y/OcN4uWQZf7PyUxlNWDMkTiZeLF67yquQ/Gy/BZKE9bSiCPXWTWyPMLoVNkytaTefDpUBfuqHFHWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592631; c=relaxed/simple;
	bh=1MzlV2SivzQk+toU9O0s1wYx7Gxy0Hx2ackzSFFM4U4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IEPTmq5xCDqS7CLtWg79XOTDQef+Mq+uuZ45sm8jPaMCx7dQaRnWSGHmmRAKi3oO6LpVij29Xvr+EisM4pgpKzGd65SSfs7tIVwr9x7EC6rugTi1AaP69J6hMgh2IctlXXoWagrpMdn+r8kGugcJ+A+XWzfjmM+Pn5x2K0XORMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=K41vxN1X; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="K41vxN1X"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e9ebb9cbaso742428e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jul 2024 23:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720592627; x=1721197427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peZsNPj1BNH4twyiHnIZz89+5SLDTDtVFfp9lmKUxv4=;
        b=K41vxN1XBNHWYrqcnA2JNGiZrMzESpr1xyF0sCMrLXUppgzkOqwSgl8T28ralCx9MO
         rW7PqW7bA0k8kfs17fYRBRuu7qa0khlMPPpik93IN83tdf5AAIyut176qWDI6/wX9VML
         KVfZ3SWsUco0E4FJStAks+xlgKX+ulbWtBtS4j7vjDePEl3lyitlczoUvxvG3yY+FxNt
         OfyvcDt6+zhIwijAfqZ4zVM3+RNKLgadUiEdPnM8lzhAxd3+QPRgc1W2rvqfRdtxuFDt
         PzHRnO3VV6HIDP5jspeb9irs+tKqaUX+RxtFvsGmaSd5CMkdS6BwfitvCQXuj59mfv7O
         +npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720592627; x=1721197427;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peZsNPj1BNH4twyiHnIZz89+5SLDTDtVFfp9lmKUxv4=;
        b=fDjKokMAb2uc2vk1wvsBqAtwvtc6s9GqS8unxrWyq3Y4srMR8JDisDi/4IOSznt7Ed
         qd32wYeXNfsmsO3ZuBzfq8cWP2yAX0y7VY9Au4c+q68MbPOPfjG/RRQNurrNlaz8kjgV
         y9suanBP9waqtJTP3PC5Mp6+E4He+S7fAk3i034WE750MrmOn0g3mFAl+X5/JIyuGXR1
         Lsgi0P47efmV/S3wjJwlN7Qb64tyQ04XXYIbBI+OE+pUEY4ToHouvMg7E3jZK1pV8O++
         safxKVXWqAUOexpG4tW/9vlHOMMeHgcJ5G4u5PalqBJ3UUHvrlNom3K5pVLa6g01XsUC
         wThQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8jxzKq3HZ2SOEkfdD7rMU1Q8VuSu77GcAvqhir/jF01DI0aLLm21LBionRybJT71qwTThhOdd2BeZ2Ljjrb4k+w3RmM5C5ybTYvavTdI2
X-Gm-Message-State: AOJu0Yx69UlAk6ELsS8glyDUHxRPS3a2TI34mqKLZvdyM3VA+j36FQ51
	l6TmN81R8X5tnHE9VFZrGManfKDzjUi43cyOuvHM5Sh43HQw6LsuAYfoKgHBqxVa9jttwIKAbV/
	iiGeRZULJ
X-Google-Smtp-Source: AGHT+IH5aoFqMDetAj6DeM6xs7OgL2qyb/6WTEb5Xw8gbWI7SvdV3F54U25nwN6xMLvlPI5WP9QFwA==
X-Received: by 2002:a05:6512:3d8e:b0:52c:f533:1e21 with SMTP id 2adb3069b0e04-52eb97586acmr3136252e87.0.1720592626693;
        Tue, 09 Jul 2024 23:23:46 -0700 (PDT)
Received: from [127.0.0.1] (87-52-80-167-dynamic.dk.customer.tdc.net. [87.52.80.167])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb90670b6sm463892e87.197.2024.07.09.23.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:23:46 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240602-md-block-xen-blkback-v1-1-6ff5b58bdee1@quicinc.com>
References: <20240602-md-block-xen-blkback-v1-1-6ff5b58bdee1@quicinc.com>
Subject: Re: [PATCH] xen/blkback: add missing MODULE_DESCRIPTION() macro
Message-Id: <172059262581.380385.3520658420031785227.b4-ty@kernel.dk>
Date: Wed, 10 Jul 2024 00:23:45 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sun, 02 Jun 2024 17:37:28 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/xen-blkback/xen-blkback.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] xen/blkback: add missing MODULE_DESCRIPTION() macro
      commit: 4c33e39f6201ab130719d44d6f6f25ec02e1b306

Best regards,
-- 
Jens Axboe



