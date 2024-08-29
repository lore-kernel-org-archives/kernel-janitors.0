Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90801B9B36
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724959847; cv=none; b=PYbfs+pxZ7US85Lzyv4qIxQ9RTEY6ANlBSSaq9geU2rZ40KcPkIWapP8C86rHm6kv0acLM9XeptV0j+LX4l92BEwUHCTs+emeN3tFMvLIIfvqg4Ff1OPJzdUJ9OUot3nFLbhbA5OvssrP/J2NYNG+phNmsRZVYieMVv/A9zN8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724959847; c=relaxed/simple;
	bh=CXsIUiDA8SVSLQs9npYgmvUfqux38XLA9LpGsNTuAmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agY9tRA0r2WSYYewSnFdhgwz9AxEA9PEQaSqbKwvSBWZL6HZ6MfAXwrH5S2muwxtGCvhwRoO2iBCCdOG+dg4Pl0Gsj7FqQVpaEmzoihTs5nNhYqzxSt7GokMmbzohAY5bQalTFrIPuqyt1DoKavjY8bMiznCrGqsVinOzb0AZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbYM6A9K; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbYM6A9K"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3717ff2358eso664943f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 12:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724959844; x=1725564644; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTIlWbVkKMoIHTYoPixZvVSXn7Ujj8xniVFLaiolivE=;
        b=FbYM6A9KMRV4byW9IySWbU3U/PN/eFWvi+L0A3L3K5TONTHj8DiMwB9v42GW13pksw
         egH+iDFnrWWrwy5q37E1G24+0QO7vOBtImCOJ2myw7pkyPHh3IOVdlo2MQ8RMbUPubiV
         +AS1xNL5brjDI4rTVBz1AKSKqgHKL0QG1C60uP7RdV+PcRUPlfjjZcKeKQRZaplEuM5t
         rKCpOGHyXp4RS/aOFYQI/uIjEin3pG8FPn2vRy800oheH5YgcecZu1nJwbSLjqEivdSE
         EHRDUGSzT7bsTgI/q3jjWJQ+TCcUWSr45fZdhymLsSbE9dLnfZiyHNGBe8FwCo3mXOBf
         yWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724959844; x=1725564644;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTIlWbVkKMoIHTYoPixZvVSXn7Ujj8xniVFLaiolivE=;
        b=OT8ZclcsED/yFhwftXRqebzWPdchhCLDUvEUpaiKTPsyJqMAzr1AhrMEI+hfZ6IWf0
         FkQaBaX0wS5g+ed+r1IIol7zDdw2QjJtz4UwJM0MK5qOH3/MYHHnDlR2EGfLOh3Z+ijs
         SSV6/rjEHg2sRzkWcEF3VMRQFncamBjSKV+LjWQATTi8Gaz9cwVD6AOJUrYzAyouTin3
         j/0OvoA1rLvlRApdOQtyMVU1oJgft7iosvdtntiCqh+MUtbErF+T+mZQWCm86mlnNI1m
         3nJU+zvjiZ3xtwDnervfHaCNYEgqkYjEnXxbQUb33OZF4XCCl/VBQhH5Tvr93fKfhCYF
         Zavw==
X-Forwarded-Encrypted: i=1; AJvYcCUFvjMl7vfBZUywgaQsI4vmsB9wdRpIxFndNhL8+EnPQNOsfs0hCYguxniprazmJbGtTD7yG8v5Yspw1KXANHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRy++wNmnGm7coTeSoBLqZXQItbk/+vmZHpRbALlg1rZYP2l6r
	8B4CcoMdY5q6tgbn+HISNb0Cnj2l/2+OPHZ6c3uc3Hs4s3EjSlUdG0Xvrhzqoek=
X-Google-Smtp-Source: AGHT+IGMmdJvaYiB1UpCQZzEoivkHJ5zTToQgDAadoaIM0r4rBLJnjEluKCsaEeb89RagvSoKzM+YQ==
X-Received: by 2002:adf:f792:0:b0:371:87d1:4248 with SMTP id ffacd0b85a97d-3749b5508f7mr2840300f8f.29.1724959843972;
        Thu, 29 Aug 2024 12:30:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df954asm25460525e9.26.2024.08.29.12.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:30:43 -0700 (PDT)
Date: Thu, 29 Aug 2024 22:30:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] HID: hid-goodix: Fix type promotion bug in
 goodix_hid_get_raw_report()
Message-ID: <a04cfa63-de06-4d09-af80-a567f2db8f12@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The issue is GOODIX_HID_PKG_LEN_SIZE is defined as sizeof(u16) which is
type size_t.  However, goodix_hid_check_ack_status() returns negative
error codes or potentially a positive but invalid length which is too
small.  So when we compare "if ((response_data_len <=
GOODIX_HID_PKG_LEN_SIZE)" then negative error codes are type promoted to
size_t and counted as a positive large value and treated as valid.

It would have been easy enough to add some casting to avoid the type
promotion, however this patch takes a more thourough approach and moves
the length check into goodix_hid_check_ack_status().  Now the function
only return negative error codes or zero on success and the length
pointer is never set to an invalid length.

Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: take a different approach

 drivers/hid/hid-goodix-spi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 5103bf0aada4..de655f745d3f 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -335,11 +335,12 @@ static void goodix_hid_close(struct hid_device *hid)
 }
 
 /* Return date length of response data */
-static int goodix_hid_check_ack_status(struct goodix_ts_data *ts)
+static int goodix_hid_check_ack_status(struct goodix_ts_data *ts, u32 *resp_len)
 {
 	struct goodix_hid_report_header hdr;
 	int retry = 20;
 	int error;
+	int len;
 
 	while (retry--) {
 		/*
@@ -349,8 +350,15 @@ static int goodix_hid_check_ack_status(struct goodix_ts_data *ts)
 		 */
 		error = goodix_spi_read(ts, ts->hid_report_addr,
 					&hdr, sizeof(hdr));
-		if (!error && (hdr.flag & GOODIX_HID_ACK_READY_FLAG))
-			return le16_to_cpu(hdr.size);
+		if (!error && (hdr.flag & GOODIX_HID_ACK_READY_FLAG)) {
+			len = le16_to_cpu(hdr.size);
+			if (len < GOODIX_HID_PKG_LEN_SIZE) {
+				dev_err(ts->dev, "hrd.size too short: %d", len);
+				return -EINVAL;
+			}
+			*resp_len = len;
+			return 0;
+		}
 
 		/* Wait 10ms for another try */
 		usleep_range(10000, 11000);
@@ -383,7 +391,7 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 	u16 cmd_register = le16_to_cpu(ts->hid_desc.cmd_register);
 	u8 tmp_buf[GOODIX_HID_MAX_INBUF_SIZE];
 	int tx_len = 0, args_len = 0;
-	int response_data_len;
+	u32 response_data_len;
 	u8 args[3];
 	int error;
 
@@ -434,9 +442,9 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 		return 0;
 
 	/* Step2: check response data status */
-	response_data_len = goodix_hid_check_ack_status(ts);
-	if (response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
-		return -EINVAL;
+	error = goodix_hid_check_ack_status(ts, &response_data_len);
+	if (error)
+		return error;
 
 	len = min(len, response_data_len - GOODIX_HID_PKG_LEN_SIZE);
 	/* Step3: read response data(skip 2bytes of hid pkg length) */
-- 
2.43.0

