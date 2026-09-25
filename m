Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25BD4C10D7
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Sep 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349005; cv=none; b=NTw/hKrHUq/jC449x/2KejtpJ674hm67i+lJfteQqlAG/OochH7pQwNso2F+GrfOPO4vFh/UUOTaHeVoC/dEtHIsuFMaJrNZq6O2MZzJMOT9iejC1mRzwpYZ3W/tV09bD13gCyX9I3HK7DWUH3nq2bq0rlnzglViJVITOlJ3In0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349005; c=relaxed/simple;
	bh=9cCuvtffogqWFceb2/RPE6mHCW/Fr+oXKNH0JoB26i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uzim5U1AmfJ/0lZJ8Om7xkczt2zhdDplN88/+baEEPJi+mYtY+lHjjQC19v4OHZ60ZYr7p8SJjMd/e6rbw9L/pZUU0UU5jYZce/OfoFtnjFuRWruX4l4q3qM8qJqeMKRT4xDmi9vum6Pq++gzmMV7qmxZHtlE6BUbFJ2VrUW18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXxPJgF2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXxPJgF2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso10935365e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Sep 2026 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790348995; x=1790953795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cCuvtffogqWFceb2/RPE6mHCW/Fr+oXKNH0JoB26i0=;
        b=kXxPJgF293I1qtxYBpYK0LbrWdgWSRe7gaHTDTM6drj0pJFl27bBTOKf9RX480FUMN
         Uedrbt0Xp+ihyvyL8ijeWGgzeQHfYKzH7GwapRVGebx2HR5rdm2lBk73hr/iTBqB61PE
         fKVmMBeQqDZrX44hoy+xwm7fVM/445m3YNghiBG6vWQEMugVgrYI+E1f3zmxB+Oaigh0
         JLFtqPxsw3uLXpl+i3xJdmdimsQFjBG9I0AnVL8Ng5aSb7QFNRP6pYt4jaa/liOs+tgg
         tH/ICu8aDdcmOFlAD8fQ12Iv17nBC0O3zWPK4uqTLPe3Xe2PxXfCJA4uV/HbuKKduTIA
         RvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348995; x=1790953795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cCuvtffogqWFceb2/RPE6mHCW/Fr+oXKNH0JoB26i0=;
        b=nzg1KvRj1Ieb4hsTKMcV5yVnLYNf7Aybz4SX1FyUH44jA9rKjeIq6cr3EybE12cz8s
         75qRYbNRqlWORgQIfLAsvqNX1YWcheFdHGCdR78yHj8BcZiHzYFmKOKBQNnEc9K+FY9U
         ntKU/D8Br8xapuqdm1XgbQCdn7L/tnDYk+r+UExwaUjz3zl6PUpPkBRMV88cUFYZT620
         zTt6UHPKXXi3ugY1dPMFvWMl5F3PNhgeNndQjV0kl4G11VwciQRGGlDOtaRwGVDTNgbt
         xWvBLcGszGsXWz20plMdJyXeCNemwbaby6Rbxjg+epXFsCeTkU6dVmeO2eK7FivBhE9N
         UInQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIhbiFsxMRgJpYtTDQIOcpIJaFZRXTe8rdDvaTUnAyTR5GyKbjUsUF0jT+1hGCeP/nA0qt1QktxH08zTXRHKA=@vger.kernel.org
X-Gm-Message-State: AFuF++nlR6/30CpfFLxdqahXlOhv8gjIYfYVTTEvsF7ZIB3qjd3dMulb
	r+4Ju7YZgjFAIbZJZhBdFOAbBkzlu7JUuoMVa9Iqv8odCkPNiA6pIm8=
X-Gm-Gg: AYBFou1njluh5zDaBQLyHURBal5/4EDVLBxvjmpq/l9lSK8o1qjWhkpEF/QBuy8sroy
	1L+UkTZCx/gbNbuWTJIaj9uc/eEvHoVFA7NYxKZXclQOuSILUGC+gQMr8oid3wKyekF+Ihx7J9L
	jbe4NFQZNwIaPRjP+RHJLTuQFjDlzfp+CPlyz9IkSdWqkHCCdTOBpfzkW0eQTYefVDBBiNd0fmQ
	FiwEK0OYDUsOwMo5GlEk2fTUPczLRiOz9BiGYwgDANa2akLiRpKJwNzaPTY5XQ5ShjO2RxqgCq8
	/BpVHTUDCWEfUT3aWtfjz45LIbtPwWeiPQT1l7a030DXQsqytdJI/vnougI/A1F+il3QyIQg1+m
	V+8Ki3q4ifMdfe1MbvrOmsAKc/uaMcoQ7+FkRJxlkRY0D8Cojzhx4UBF39ddeytvydIyBSuFVFU
	Qa3NMsW/KRlzBuVIf0OspDpoPJFp6UalJaQ08COXOtxEU/3isnR66puq8ahh5swe702jdxEWrJW
	jwhZQTyTTMqnOQjObbTeyyxNeJ/IMYjoFq9COd7dHHjGWCCpJKTHPRqKA==
X-Received: by 2002:a05:600c:8718:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49fe7bba7e7mr98053885e9.25.1790348995166;
        Fri, 25 Sep 2026 08:09:55 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm8393125f8f.3.2026.09.25.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:09:54 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: Markus.Elfring@web.de
Cc: x86@kernel.org,
	bp@alien8.de,
	daniel@quora.org,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	mingo@redhat.com,
	jwiesner@suse.de,
	kees@kernel.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] x86/hpet: Use common error handling code in hpet_create_irq_domain()
Date: Fri, 25 Sep 2026 18:09:48 +0300
Message-ID: <20260925150949.4500-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5c9b0231-5100-4668-a33e-ccb330d30c65@web.de>
References: <5c9b0231-5100-4668-a33e-ccb330d30c65@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Markus,

Thanks for the patch.

While consolidating the error paths using gotos can sometimes provide better simplicity and readability in codes, the implicit fall-through from `free_fwnode` label straight into `free_info` feels a bit error-prone for future maintenance.

If someone later modifies the code and uses these labels, it could lead to unintended side effects or a double-free error. Although the syntax of the original code blocks involves repetition, it is readable and safe.

Personally, I believe the original code is cleaner and less risky to maintain in the long run.

Sincerely,
Habil Eren Türker <habilerenturker@hotmail.com>
