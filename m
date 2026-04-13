Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB05351C1F
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Apr 2026 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075692; cv=none; b=VXyLBHEkDMjr8/WKB2Axa/jsZ2cZ/m4YshY3lmyop7hmTcdwaoQUpSAAJ/sYrPIZQEgxSSoKRNEJI/N8lw0e173+UhyRZEiBHeOebdg2sFjiPyBspScY2QCS3UK+RvbxSSKHdV1mHUhzpAVp70Y9e2TNvEbGykKsxtCbX99RzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075692; c=relaxed/simple;
	bh=oICiryzy3QGI3tJheynSBKYqkqw/7LjA3LQm5HpTRaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jt2Fn+Yv3M63OpGlAJV+m/Uoyo/fADJnTQMNS4pPkm3c4EDXsBd5kkGq8HueaNKm8Cu8ugKTzXHWRGL4isT4AXRCofODNfCeati34WGyWU6f7IpdUYZAHSGf/xO0J20Lef4L9SFuj6xBN13/L/VEA3fu1XIuUwj8aEh1boGmU28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A9EwXWeM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ArYUOPYZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9EwXWeM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ArYUOPYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776075688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fW/Jk0WpKq11KY/BRAX8lJJtqZ8w0BPQk7uT/pBi+tk=;
	b=A9EwXWeMi9tUCrugUzIs6VawCzl2BJYbGr2sf0aGs2DIXYj4UabMGBHbY/0nwIep4c0xf3
	pYDpA1QCTwMbhYO7H7b+i4FYgyBOV1xwF5/OZP6Y4L7VPIb5bXBxD2WqnOBfct5kGEZoyw
	4UnD/N5hBUrU3DTTvmTO+JBl5QDrveA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-zUEfMTeqOYeLzSTD9Rv7aw-1; Mon, 13 Apr 2026 06:21:26 -0400
X-MC-Unique: zUEfMTeqOYeLzSTD9Rv7aw-1
X-Mimecast-MFC-AGG-ID: zUEfMTeqOYeLzSTD9Rv7aw_1776075686
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43d775bcb14so978599f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Apr 2026 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776075685; x=1776680485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fW/Jk0WpKq11KY/BRAX8lJJtqZ8w0BPQk7uT/pBi+tk=;
        b=ArYUOPYZQDwSETQvLfrAKlMWezJY8F9NdLedkOqutpns5inC/fsCUm61n8+XCX9dG5
         Qt2C2jT7Arw7PQz7AQOJDT33BTM4omxikYG/5wtI9DMtTSD7AEWX/SJCWGqBqPqutE9n
         Vp963RJ4DCxHgwprZtO1ycEmypGOoSx9jZd8TDtJDFpP5RLt86/LPDcPd0+A9bx4L6dX
         hjxfxmPKaq4l4AXpuUB0zVqVg6rd1ykYT0KCsjrbr7htuiLhrjY4JtRObL5ib+AVfMx4
         NhjQlMMDK91lLO6gzuOTXoP+pdQxNbz/e30XWzmykwypCtdCRJxL18xWnaYHzXIYm93v
         afKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075685; x=1776680485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW/Jk0WpKq11KY/BRAX8lJJtqZ8w0BPQk7uT/pBi+tk=;
        b=hEqWkSbP6op8buTjxdkMeGw8Wga3QmpdZxDZgPVDxH85N21gjVtSsnR8+IJpx1ARw0
         1MkaR7KoLSKrMkku6352vCUfHOqqY+xB4YFhQuwRB2QL6JPc42vM4Q6dNDKTKI2TW6xt
         y+mnBhLjBIvcP8UiI61rPeP/EV67rBK7jmGXT1q3aNBhljR02R2e0hYGeyh0LPuaGTix
         aqEYtwVoD1Feiy0E0JQpDC4yjx3kOkvqUCo5jaruGdn20LMBigsuTbSB2UiF55G6Hheu
         8gbh1DEbFqwokxVsaY63+h3k2k2tMqaQArdcUhMxcaQdjxmwQMBmZqAoAzRL6EpfMPw/
         TLJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NdkqcieuAJAiG8D8X4Is6knYnc6HL1qotQ5zkrNzpZSjzDw15I6gtdcNP0iTv+/ae/qXazZcWFjjO2TCySTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQx15QqRFANrO4XmC9SlFKAef51hxverb/PfIXbyZCgtWtvxyR
	UvrQ+4IQB6Xa+d+7pnSI5CmgX7OMq/KtEQ8bl5j2+Dk53vduRy9TsJPS8dLr5uwYnrUCpjbSyIb
	hOeZf73sZUQayGXaUXEXHUlhOW4fGoyoprUxOMHjnVpqa0C+AhxINTkLhJ27lVUCMXntTng==
X-Gm-Gg: AeBDietiY35DIpVJZXvlrpiHlkwh2rRcglMqjqGp7sl9AnEuvPYJ5i32kHfh5cZ66bx
	foZO0TzWBtrWOB9HIE3PpmKSqt6NcaSq0tq6ULFLIZ2pJeWUqAZW6CpMsY11n5rwcpRq+km6yEm
	jWXJyrHjKjn4iVkbykexDYxiPMTRebUpOXf3v7Tl+Kl/z9XknoKttsehX5zbPfKL6CXAJDoNE6I
	hguil6qb42dPKPX4Ns5r5UakPlnS6/CJtawdX5rCUPhthopDOutwOV3QQ/bGJXoTPIT2xeWI1TQ
	vzzm/I5jt0wu8i48gv57SxiRP2sQDbmvjGyIbj+DmQl02HL5wSgRP1bgDrs5lm7n4UK0GfnUObF
	lWdxbRzvR2TZcMLviPa83VsUUFjiMTYCZIb8TUywFQoJFf6yNjT5DxKsVgRGw3TpyHpjufAc=
X-Received: by 2002:a05:6000:26cc:b0:43d:73de:abd3 with SMTP id ffacd0b85a97d-43d73deacc9mr6725838f8f.30.1776075685600;
        Mon, 13 Apr 2026 03:21:25 -0700 (PDT)
X-Received: by 2002:a05:6000:26cc:b0:43d:73de:abd3 with SMTP id ffacd0b85a97d-43d73deacc9mr6725790f8f.30.1776075685169;
        Mon, 13 Apr 2026 03:21:25 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6a1203b8sm26926706f8f.16.2026.04.13.03.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:21:24 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Kai-Heng Feng <kaihengf@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in NVIDIA GHES HANDLER
Date: Mon, 13 Apr 2026 12:21:18 +0200
Message-ID: <20260413102118.33088-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d7610855b0b5 ("ACPI: APEI: GHES: Add NVIDIA vendor CPER record
handler") adds the file drivers/acpi/apei/ghes-nvidia.c and also adds a
section NVIDIA GHES VENDOR CPER RECORD HANDLER in the MAINTAINERS file with
a file entry referring to drivers/acpi/apei/nvidia-ghes.c. Note that the
file name in the entry (nvidia-ghes.c) differs from the actual file in
the repository (ghes-nvidia.c).

Adjust the file entry to the actual existing file.

Fixes: d7610855b0b5 ("ACPI: APEI: GHES: Add NVIDIA vendor CPER record handler")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4b396dccfe9..a74012c38542 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19103,7 +19103,7 @@ NVIDIA GHES VENDOR CPER RECORD HANDLER
 M:	Kai-Heng Feng <kaihengf@nvidia.com>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
-F:	drivers/acpi/apei/nvidia-ghes.c
+F:	drivers/acpi/apei/ghes-nvidia.c
 
 NVIDIA VRS RTC DRIVER
 M:	Shubhi Garg <shgarg@nvidia.com>
-- 
2.53.0

