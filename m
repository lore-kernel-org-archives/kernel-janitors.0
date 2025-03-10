Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A5228CB8
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603688; cv=none; b=rATzY7Wao9P71ZWixUUc1kWfUXSYpl5jw0Bb7oZocRhsvyiOYAhvo8jTLlHsBdX5NfU7VrWjXMHvabkmXHdlE1oSJDA67xevqE3I1bFSnrbr4AhfwJmnmMM3J0PiufmxqY7PMZBahkKuX60F05irRs7xApG4laS2fI2kRmpdOTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603688; c=relaxed/simple;
	bh=ezePfKdiVomBp6Nu0vENgcyh212zJvF8/6B93fEyRqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UukCt8KoNVXRnkZLg4aSo3N+hNeUBOsTf+erO9OsFeghPjterSgZHc4oajQiMGH/lUKfHDiYKVabl2oIWpuvyXUTxctgUGJtwzcPqi1O1FJzLqSlQuN0BCLl61hw0tTfGf2i80IMlvoHTmL2zj0fW9GES/lZf0lMZdGzEanyga0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KOoo+PAd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KOoo+PAd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so4760815e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603685; x=1742208485; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0yircpCo/QVU3P+N7sKYScgPv6naVVovFtBRlbgD6Q=;
        b=KOoo+PAdvWYa2/1thUQHnSVgyLB9AJq2/pBagS62WEQkqE7IVuCiv4oq+dkl22iDX9
         Dqd99AM0bMNsRTor0H0T8NRVN2GcUQuyrCLn/hSYA0xonlbIfcMd2ImWaerXjycmVa/u
         nlm+jRvOdmwq9/CUL3Fa7IqV6gF1Bf50eDLVciP71+y3Sl2IMXD6ad24eOJ2g4gENxtW
         KPyk5BQ+UUNKj+hhKy4OAva20BdiDQvvZ9UZGLXa4WJIElgEyGcZY6lQdshSCTNAYNKY
         lyuhsFEXg0y7nfJv1cTgqMbZa+I93Taz/oKXuchZ4aM9w3+OlDIQlqRnRDmEiN+OJfSX
         kAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603685; x=1742208485;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0yircpCo/QVU3P+N7sKYScgPv6naVVovFtBRlbgD6Q=;
        b=NryqxCEzsU4oxfy2RW9FITHKggTiB28kN8QiavCdLfyWXZB8YBDU2iMWfl34ICztds
         6iMu1W2vDyyWq1xFKzAfbx+f3gc/PuaJ74xYZKlhT9wQoBmTXgbg9V3v4rbY3dp7CxCf
         DBMBY83ARdr4B/Kyqta07VpaLEpGmcCL4wf6JRCaH6O2Kx5i+YxXUv5oEL5iZFMvVwsu
         tVskuAvfKlt9RufqxPmMpdprJ+a0rFDx1wToASimgPmM3eiHPYWFKwMc/U/rqNTMNYdZ
         YacOqHKFRmCF59ZMLjRNmzJq2se2J7+HQihDy/TLiwlwEPztHo3Lj0A4FuzFfq/A97kd
         JxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE3D7khY5jpVJSMV4pT8dCpn5R1glNklb8ztqIdMKD2PIkJ7DA9jBln2hlovv4NXwtSuXmXC8dx6c3Twbnayo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhyDh1CnaO4z2d79ufA4NqtaZV4EeqW8exYpk6r1NWHyXgIllc
	qwX8oQHh2uQ+lfllE2FNyhR/URofp0b34yXLU7rtMtbGGCqDqLrOlD3QpY2A+ik=
X-Gm-Gg: ASbGncs2yIKB8qhfEjmM3frCXoVmMmC1aS1JbHkuT+V84BShUnwpy6kGGOPMZNtmaLT
	hZFpyUddiFlRkm/jYYnwS9ma88SIoMdBTDXeJ5Ka8wMnXaUeWv9kC1JIRwJbOyTO/LmfoNkoSyM
	GHK6LvnIGeacnlLsn8lgGvUlsbfIEb8tTuZe6Z1G2cVAUk982rQadCmSxIrPXcyujkzSBILhVVe
	y6DD6XrqUKfNufQUDg1Tv1WnybYR2OYI18/SyXmn2yfhqdji6NLaFgm6jv0j2mBb1Whic1BLyXa
	cxXPbMb/8oO1YemjiGaKeYoqfU4BFRVc9eVRixJJqcd9V8IQjsGEOZiZor+S
X-Google-Smtp-Source: AGHT+IFlBbMsdDkibGs+3E90ni36pDU1DtBtQx2GYLaxL8v3OUzQ9CG7PxwMtpFknCcyL00KBQQ92Q==
X-Received: by 2002:a5d:47cb:0:b0:390:df83:1f22 with SMTP id ffacd0b85a97d-3913af390a9mr5568803f8f.25.1741603684736;
        Mon, 10 Mar 2025 03:48:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2bb7sm14676793f8f.63.2025.03.10.03.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:48:04 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
Message-ID: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error handling assumes that vm_bind_ioctl_check_args() will
initialize "bind_ops" but there are a couple early returns where that's
not true.  Initialize "bind_ops" to NULL from the start.

Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22a26aff3a6e..d85759b958d0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3287,7 +3287,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_exec_queue *q = NULL;
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
-	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_vm_bind_op *bind_ops = NULL;
 	struct xe_vma_ops vops;
 	struct dma_fence *fence;
 	int err;
-- 
2.47.2

