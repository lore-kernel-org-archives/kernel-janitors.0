Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9188C1AF0AF
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835068; cv=none; b=HxFu7jrYmC6BNcUcLMEwG+XaIuejd3iQwfGVqqw5koSETC/NzbNlrY5OLksSNjSlh8vBYn/q4AGrBCiHf0MFAUIvnFOI7Lv0zBNlbzp4iRCU7XH3+Rx5A9Ev/+eLaWrLv3tdXh6IB/lqIstrCPth++/0hIlP3cg0I8QRXVn6624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835068; c=relaxed/simple;
	bh=uiL/+HWIqkPDhLYnB+bmPpKcGNU/horgbRhtuBxsmro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6WRPuSVBOo1sUuCi7mGk9pj7P5OLqMJIF9iKMK4okPthTFNfvEpJ/UHaRhxhEwwByXDjpognWsaokDAKTBDhSn8MDcdaX7dNrPmPYX9MjhszbibreKVYAiR0oYpySN7lN/ghaQD6nM5JUUwvUBQtGixreQF8D7Jy3q69TW/VJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L5oBJuYA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L5oBJuYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761835065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nkks9IPPTiRjudJKz2fy8ztuwHSVrBIwR6A4uWG3RWI=;
	b=L5oBJuYAb59YKvU52ig9pUfcmIKo5BjfBdoFXi/VyctmBJ/MgX5woK7Bf4brQgmIkZ57mV
	n+Lp6kJstPuYWU0i5Y1U76lO7ZKW6goB9AlQk1nakgnfbx3YvMruMk/DNEhB6S64uWyltE
	5l0TbeHfX06TTIEdx1jZkxC7rMurTlQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-af29Q20mMZqTVtiUWUa8Zg-1; Thu, 30 Oct 2025 10:37:44 -0400
X-MC-Unique: af29Q20mMZqTVtiUWUa8Zg-1
X-Mimecast-MFC-AGG-ID: af29Q20mMZqTVtiUWUa8Zg_1761835063
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-40cfb98eddbso1051746f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 07:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761835063; x=1762439863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkks9IPPTiRjudJKz2fy8ztuwHSVrBIwR6A4uWG3RWI=;
        b=lBwmXVd4BRXnFPvwR2gGjJ1dGp8OChnLqe4ajk8JSKc+20Z8lMU/Xq3paZgevifgTX
         wHrEgUZKjzrTiPOra9w8+1xqdulut99TAC+2c9kXrxGH1YECM5ZrxaigpknbHxmS7U9K
         T2Si6krFxPTimoQ4URM+ss3z2RIyrKHzAmYdVqzXAItZ+Rfh/icVIRPHueFNBe1yYxsv
         +SjgxPqC4RZ6S6i9d7FgxAvh4XnEn00FXGiRO7ZqwdvannDCt7OUNQONcCLAvm+oW3G3
         3FU2n5WCbNgD32JAwMUAAHbGAI5ZP9KaIl7b4fNSCvxcNt3eIjN1EU9uZTb4DWbt0iAr
         0qnw==
X-Forwarded-Encrypted: i=1; AJvYcCVqTLorjQZRnbHh3LsV7slo6Wav1DXy/UWuCDINVtrkSFSUBD0ZEeNVaFO2K/5XB46G1ttr3njob/i4IVkSlQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/kzqHG55jiEDXvihiSiJ1tbK8nJMuuoa2TdiI9129obV2BQZT
	qoulfxtHAYwx4hrPG3+50eyTOd7iMNpP3fRqN/77HS9lXMAB6z8LUbkwssBEYTfg/k21tNIET4m
	FBcv+NFke7yang+3g1GtzOM2wBB63b05Jsp2QmNqdNRS1MRB/b5ZRVUHXaEsWuCwBhmoNqw==
X-Gm-Gg: ASbGncsVtRP3E4szkpFqtQL7cbCh+eGwcdZbQMbNLzPAm7VJ9dMT3KjEu+FpPSRLbcn
	WgPIMZbyG8vy4AKgXLFUusfk+VLF4QmT6+pjziB5h+Byn+QXLY4zWzH4elq7HlHjwLLNveWcKxS
	0yAn72HHlgS6ibLLW/tIZuY93jH6EteAs46TdZOw2hBFCeriNRVrtV+rAYsN9N0nMbSAw/yRR6m
	0nz5J0bAF5WH/hM6stv50iCq5ZQGpQ3zRMfIZ9ju5tQ3xfksfpldECWTcXHjuMButYksV5ZBrDF
	jQGcTtLiMrQP9RHEK1/7e5wrhS+MA5n63A/w/bTWSNRExYqeGh9nlzAhDrsB0ky7Mgl7rGTu2BL
	BqROgFJ8Pj1YuiWX+0YTnEvlw27Nj8Tl/ceFysOqdrVxVf/wY
X-Received: by 2002:a05:6000:1449:b0:429:b963:cdd5 with SMTP id ffacd0b85a97d-429bcccf0aamr87208f8f.5.1761835062913;
        Thu, 30 Oct 2025 07:37:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Hb1Zr2+1H9F1aQQVjn8swQhMlyoOrBtrdyyo6F0SLZbU4syUP2hFz8P5UzKpetZ1C9iD6A==
X-Received: by 2002:a05:6000:1449:b0:429:b963:cdd5 with SMTP id ffacd0b85a97d-429bcccf0aamr87184f8f.5.1761835062481;
        Thu, 30 Oct 2025 07:37:42 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a94sm38472105f8f.5.2025.10.30.07.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:37:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Austin Zheng <austin.zheng@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	waynelin <Wayne.Lin@amd.com>,
	Dan Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in AMD DISPLAY CORE - DML
Date: Thu, 30 Oct 2025 15:37:37 +0100
Message-ID: <20251030143737.136120-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e6a8a000cfe6 ("drm/amd/display: Rename dml2 to dml2_0 folder")
renames the directory dml2 to dml2_0 in ./drivers/gpu/drm/amd/display/dc,
but misses to adjust the file entry in AMD DISPLAY CORE - DML.

Adjust the file entry after this directory renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d739e18aab6..7031ee1e7cff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1080,7 +1080,7 @@ M:	Austin Zheng <austin.zheng@amd.com>
 M:	Jun Lei <jun.lei@amd.com>
 S:	Supported
 F:	drivers/gpu/drm/amd/display/dc/dml/
-F:	drivers/gpu/drm/amd/display/dc/dml2/
+F:	drivers/gpu/drm/amd/display/dc/dml2_0/
 
 AMD FAM15H PROCESSOR POWER MONITORING DRIVER
 M:	Huang Rui <ray.huang@amd.com>
-- 
2.51.0

