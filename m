Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C833ACEE6
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 07:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693412; cv=none; b=qMFCKQ30bW1D2xBzXJVMbt4cRvwibylz6QvvTVtNWP0I86KXn0wviXLu0EA/Uvnc0BXahNtJj6rPPMZUxsA6YXTp3ThIm7JSp283lmoJW2T7zyxipfOJ69/Z00WNDjiaH2Nzw+foWJlkIaTx3cAeU2sfR2sODecUGwILshPUxwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693412; c=relaxed/simple;
	bh=PgsGEZqzA7VFFuqMV6HnSLX0QnAKaqzhdZjk5ZoF2vc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ltOAeh+5a+JIykjQpj37TkCgvna8iTq5o/VHlbOu/Bk0DmiMOjHFWk+T3+o0GoNyXGCCFohV689xKoDo2rMTUBHUdGkHoURQd3HmxBOxY1lVxFRQlrZTv9sOywpfTvusNOvHdlBkHLQq+cuqXzCC6Ua+BQcqeASsWNebOfao9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlSF28i/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlSF28i/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so25764285e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 00:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779693409; x=1780298209; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24zthJvGUKXcZPIu9w9sob21/I+YzFqoj+uIkca7DtY=;
        b=hlSF28i/xtBWRX6hInZP9pnALpE76JmRSIIc90IXFK9xk+b6EIRMEgdPKW3hOwSgYR
         TZIGkOKSRuMV5OCmOh8zJsvt8iIqr44sG1LBp0W+zR6CQO8qalq4yRxSgh92cLJW2123
         jp2Q+7tUWf2fAyLbD+V3bOA7PucpkGHKVcNwKxjO6gYjY1RgId0d2GDbc6J7r9fiB9r+
         bo8wtZa603jN82Ni7WuHRRXCBV5LmlVnT9nlTNQh8uACPz3x3jYp28pl51s1yRSFsIX8
         zGjQtpQKwI0EnUntytWo+/f4lYlTC2d5gZFv6kSiTfYg2tOExK601jgcsw8eIEHz7sKC
         0+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693409; x=1780298209;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24zthJvGUKXcZPIu9w9sob21/I+YzFqoj+uIkca7DtY=;
        b=IZE0cz8Gupru65QOqSnO2A9gp0bHjy2GMSgqClERnOPsHSIEEgElSH7h7lO5AR8qH1
         9KY5ExsRBROFBRFNRhVpdQpOl+FlYfcWbTl2r38oggEtKPboggmN4okCWbjxYUTaTfDI
         HKQ4GyDjsX8QcvyHoPMCtHZI2pRotPte0EhYW4+Jns1phzgk1Z99bPSS7uQxZn80ctHv
         x1s01AGpTrMJ/wGMHpqtka3xVAzvBZInkawGcCHk7WV4m+yTl/3mQFav2siexp0XciEC
         tjh06Q+IOr2+mYVFdSGHAS/tirJWejF9pUwUsybMkXssfY9Y6jGYdV9AJrGc3lx/fhKt
         eMBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9Xef7tKFwEjDY5KQxPPeCc081j8aYkTIDQq8T9OM1vgl2DU7UGNn3RbMBkKLunUs6rdfVTCX0N8B7IKMiuYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx55L2pTvwrFPKupprBX3O3tJp1jDI/Kg5bR2CFRZQG+hYVvyXu
	FeHjsxMHjpNUgkFWArLgu3XNYcdESgh4E04tvtVB3aWjvcbRZ10VTbbn
X-Gm-Gg: Acq92OFWoawUtyMpywUe4Bnt7TlKiLoAl4t9cB9GcuyWA8f1h5SxIwOJ3Op7JdYq0pL
	NqL4YiA0IdbKvTtnfCCKOM29/NEl1yZoTyIVv3kzP/2FFADGfQM7W4ZTfzLIYQEfDtXSvNTHslg
	Ahnlp3apa0uDedu1kvAl3QJyTGlGjIiFReWNGQ9X+EIDSlXLhWSzUBIgt1D0C4844aVcUlmLuxA
	UNKh/sAx2ImeDhclGoKbN4QBRAv2s5ALxOFRctkJfH9YC9EhM7SXKRL4VUTY1+b0jGoojADYTw0
	gMIRCoLsJse+tpvUd4Cwgcw/xDH/nq5EApfqfak1Ok1AlhlZ7LTkI04lCGSy7+8FmtH9HDoPZp6
	ymYqqeySTfLq452gHYJkm7fn4CkthotVP1pv719Dcc5W0JtlSAQowWBh3mO0gzgp8lfeWg4q3ca
	KGX+Y93ndfHFfYNQIl/HcsE0zcTNpKq1eGiCYYuw/Y5PMp
X-Received: by 2002:a05:600c:4510:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-490424a682emr203079855e9.10.1779693408960;
        Mon, 25 May 2026 00:16:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd1780sm26456454f8f.16.2026.05.25.00.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:16:48 -0700 (PDT)
Date: Mon, 25 May 2026 10:16:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: zynqmp_dp: Fix uninitialized variable in debugfs()
Message-ID: <ahP3Xagt1LJrhmFl@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the *ppos is non-zero then simple_write_to_buffer() will not
initialize the start of the buf[] buffer.  It doesn't really make sense
to allow non-zero values for *ppos, so check for that at the start and
return -EINVAL.

Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 7fb11b0a44f0..847179476041 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1888,6 +1888,9 @@ static ssize_t zynqmp_dp_pattern_write(struct file *file,
 	ssize_t ret;
 	int pattern;
 
+	if (*ppos != 0)
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf,
 				     count);
 	if (ret < 0)
@@ -2028,6 +2031,9 @@ static ssize_t zynqmp_dp_custom_write(struct file *file,
 	ssize_t ret;
 	char buf[sizeof(dp->test.custom)];
 
+	if (*ppos != 0)
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
 	if (ret < 0)
 		return ret;
-- 
2.53.0

