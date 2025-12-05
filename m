Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2538F3090F5
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934771; cv=none; b=qjPtPmZ0w4XfHhJN6Lw7SBlwT5H/9U0tYyX/pR7PJO5Hp1RzO6h8tKfskLLs++nzIBVSVqjpj06WUwkEGGdYDun1xGB9FOp6gY9A0yYzQb7jigwnh+xoToAkgdKaBIhRWf4Cr2qLDOX/6dcrTHUG7ygbc1fb5w0VBg4egP7IUCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934771; c=relaxed/simple;
	bh=aWCM9oMsrHktG7oXRRlRVkd0dypWu9BxEC4s8JYUXvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YP131oSmvU3rYYsdBEIUtoGFWsp2isSQyrbQ9iMV95sfgnKSicVoq2DeLK33g+rnNBNZ7iDuR9NPjJq+AGNM8xtEvx9ruaFvUT/mwDpkC08b8JFst6KElPartJ/+bIXHgTJUB9ZtO1hbNUUROZrp+SQN2uHlo2GLyyG/cFoKSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VWrQwTft; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VWrQwTft"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2e3c3a83so960080f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Dec 2025 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764934764; x=1765539564; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIKUJhPtyy099q/7pEHPgqG0DHnRRHLJr8Bo5eZ+wuQ=;
        b=VWrQwTftAKsIv+RfKR+6470DWPY7T0P/cNfYg7VyJGCw0S5XPYfnCfO7rIwCvSC8hP
         L6VF/7+xfVMw0QHjIQi2ncFKCrM8zcyoap0qoBnvctUHTlML6iQ0Xwmt/8WH2cnUPppy
         n7ie+ME4zv2NJ/55XVfIY8T5OeUF+pTCWxCBD3K7yEUX9C5c16tE43fRTyxSQFcwImAy
         ywpNuAq+eD8+Hw8IkRgYH8WQcpAB4HbxfZifqFEhgls+sKDjaFu+smJ9HPH9JPyneBZ3
         UUHvJ0AlzLdkDPDL/Q2hiDxfnmjaNZVU3bPWnPsoFLFm/UIVTHi8SjBVzk2XqYPT18q9
         DyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934764; x=1765539564;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIKUJhPtyy099q/7pEHPgqG0DHnRRHLJr8Bo5eZ+wuQ=;
        b=Fjc86nUFVJFD4ykcCOhGINrvq2aqt2CD5ehLuQHKYt6UKqE4BApZ7y3nVlrY+iVxCl
         QTAcUHFITNH6UENhIAcFR8nsWszKONb1WrPTz0PGwxqchWiWd0K+u5YKgNLhK4fKaqFy
         F/xngLjOquIIumXv1yUS9ZD1FLciy7kvZDjacqPAYYuiHiMI9aL3rsPCdhXDTKufoi7l
         Yj6nugMJw1eJfk/XEQ0+5vKmqfTvpQnQ5cWZq7Ol+YmkHlCOwf6eogwNwtuPK+dQgU6Z
         qNFJvNG03STnnhRrrByN+jfhhT9fXrSbYuPiG27rxa0Xw2m66fzq4g9O82DVr/cYVNA8
         J2/A==
X-Forwarded-Encrypted: i=1; AJvYcCVX+2UNHovIChhW4aVQxqLf0HHQoQkjZgYb4QhEIKwkDjFU8yv8/0a2R4mIWU8Jihgcoys7S5RYdiwkQcBUTCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOEzaqjV3UdLPiKixgqt67eWOqlcNhA5QnGcKaRAfMSiTw4pD
	lxlph9zv5X4/D7OZphZmpHJN/N3/n8fJwxSg0rJJHs9yDo8QhxL8+Cxl+hXDBhy0f+0=
X-Gm-Gg: ASbGncvlDnpO2VX+OQ/WO5/ZDbZdzdOHv8pfJfp98M5fGBC2WLsxMRUi2RcTgmQ2Qi+
	LDgllviI1VqdMON5camjPdTGd+GWMhyS1sycfclIxzo3I/SCgoXJ5er2bJDOnZJT/A8xYvUcMUP
	PVJJcRjumq8ZGeIRN7PKMGhV9FrZYwz1N81Z3KbQgKHqF2leGA0VBFS2EbRfVNXkGIDZLfmlUOY
	cdMf2uREBf1Uhjig2WvOvLWt3wHq8sc+yzxLArzmEe+W8H51FEzXJmBQdtIdxl6uBKOgDnYk3NV
	UjdIcDcRD+/gREohmaySIyePUCa8c3UNoEK/HNXCSXmeT25GSSKnuM0RQRtmzvKdITEKEIs2oPF
	bbMPGl6mx51rPsZIiMZ/H63sOVE7Lq1SCr7iZFPp8dDy9hhHZKPeIoB2J6aS2DefJZIyQnS5WSZ
	xX2Sgwt4kmK92ebFDW
X-Google-Smtp-Source: AGHT+IF7EWPLDwvBvMYYg19nIBOlQAnWMyTfDzDj21hkC8CsbxS4hgVB39BlXGxYOuNd95H6B+H2Lg==
X-Received: by 2002:a05:6000:1acc:b0:3eb:d906:e553 with SMTP id ffacd0b85a97d-42f731cbf01mr9856490f8f.55.1764934764129;
        Fri, 05 Dec 2025 03:39:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbff352sm8357272f8f.17.2025.12.05.03.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:39:23 -0800 (PST)
Date: Fri, 5 Dec 2025 14:39:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/xe_sriov_vfio: Fix return value in
 xe_sriov_vfio_migration_supported()
Message-ID: <aTLEZ4g-FD-iMQ2V@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The xe_sriov_vfio_migration_supported() function is type bool so
returning -EPERM means returning true.  Return false instead.

Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
index e9a7615bb5c5..3da81af97b8b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vfio.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -21,7 +21,7 @@ EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
 bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
 {
 	if (!IS_SRIOV_PF(xe))
-		return -EPERM;
+		return false;
 
 	return xe_sriov_pf_migration_supported(xe);
 }
-- 
2.51.0

