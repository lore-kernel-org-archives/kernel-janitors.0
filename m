Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC743148D6
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Nov 2025 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462944; cv=none; b=YtRU/GazeTbkvEJqGkz5i0jaA9CZgswqWuS9r01m3GTqvOIbgRU7NELsQLc+mWJgZDTZZX5J095R7BvW/mwi7IcjY2dGMOSXN2qbqOBy15ypoTxKu6rK8u6a8+dbYg/VOkfFyvmKM+cT0AyigaTUDm2YiZHbAABiv27mD8WnJNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462944; c=relaxed/simple;
	bh=pSacPUfTJqdVOpSE7Tqm0QbIDxP64e72/O29IF4V3js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpsVb5hzV2oGvrfbZYc/WN497MPWiNmdQ7KFEFPufX0Ypoc5kYBhI+c7yp7Ylx/ULf2BkYPnMbR8Wh5NEfEkStAM7YnvgpOY/dOdc/RfTm5TTLMeDX5CaIU0o9tRzn54Zk86pHt/gvEfJBzx+F0W/jFMWnPj0HI6fXRvzMq49yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukvmWUg4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukvmWUg4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b32a5494dso3156803f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Nov 2025 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763462941; x=1764067741; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1y/mR0RQcwwMGAg4az+yXoD/LmwVs8/J1VOM/Bo49w=;
        b=ukvmWUg4dwwnJ0JXXinhYfidVnPXVz4EAAX3kZFoJUGU4b1Jj2vpuyZ4xbsvhbpKmU
         IUrvkL7GukMavnHxkTKILfL+VkRtmWfVPqHiguj6fRODXp5gmPaqs6Amv7DZ3WXflhTq
         nYGoSzjo7mUYdpgPA1iNTZ0N//hFfHVeiJ4He/YsvkdzAyxKBZeeoXbZzp8LLIOjx8uw
         ZfRqEWt91Aa6Gq/hbsDD5skdB55ePq9T+c/afYZPi8V/NcP8sMyVOiIcKMsAwJdZYqBE
         N3jcRFOw8LeYVz48K49ukbcHmPFUZxgGOMHQ2rxsUk/Fkaoci2Jaovn0Njmzwz3h+n9C
         3S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462941; x=1764067741;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1y/mR0RQcwwMGAg4az+yXoD/LmwVs8/J1VOM/Bo49w=;
        b=ifoCAz+mALyW02AwtMGi9vbUX3i7dYpmetWMeiNoPz6a15Ph2UN049pihhAFl5mfet
         ME/EQoNzayGoLAN/U2QvR0r/YiufoH/8Qno33pwRgWbEEUrL/StNGt/pJCZXYC+8K558
         ZOb93U/npJa6NSZultO/6MT0PFPkFM7NRiIxApqeA+np2oWlf2jzkK2ZNfW9J4Wg6zLa
         d44dt5dkmoLUzXxqPoBoZQpvdTkc7aAZUbsDE5Dg7hGwzbhUn4i0D+7ArCyKF2j2HD6o
         VLt6+fELv/pvCh+851hQGc22jmvI7teZ5Wp6FZPtGslPLVz5wjMSJnpHOTarq31shB9g
         4Y4g==
X-Forwarded-Encrypted: i=1; AJvYcCVnSTETrQ95gR1DsBrD0YdsAaqfaSa7/niu03BJMe9edccd8SyPgUsw8fUkV2JGSQKimcDv604e7xH4/C7yU2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrmHL6XZRbQkM6sTt98nOaL1NRuqbkR1XFWd7HcIbAW3Y1zOU
	ZcQBhr9lq7Q+uhB2Qm/Fu0gqQSIy/vgO15MNIWUptH9svhwg6t/KyVK5iBcnYOGezwHADqC9EAN
	W7Ko9
X-Gm-Gg: ASbGncuOMmG6SzVnrA7i542m+8BhaIw6wW6b25CISIqkJaMcShul5at2ecazJrzw5np
	8kEpPs0RWL6m/E4wPlLX00VtBhYt0iqL6twTdJ2NP8uv9tisnBPH3J9aqCUVwgeO3vdSXrt6ysX
	p8Q6CeZiID6FvIjmgpCAioNiKH8NA5LSrOn4bWd2ro+e5V2U79Bqq3Keb2q+JOleR7j5Vc1lN61
	EzPLRg5CSXGIx/rpf7kGa+SCaepoFhjo35cSY+n5yr6LNCn/TSPLcBoILTHErsFSHfkfyTBjHZW
	Bceiu8WxZ4Gg0mHEmdxVb38stKZKnus9NVefHxzuDYj9RPcsA7Hh7CxXlMmIckrfDa76eHpzP7w
	0C9Hx6f9V10lyNBHB8H+CnA5HDXTvaaQehWf+SZyuUWSpgHLY5w/2Ls7wA9oB08h6B+4zz9H4kS
	ZgdO2ciQ==
X-Google-Smtp-Source: AGHT+IE+uO9N9ifqs1Y8ygDQTWEad0nnwpu/28efWIWor11GJUehCS6HQAbsFian1eY23T6Y6M2COg==
X-Received: by 2002:a5d:5f42:0:b0:429:c711:22d8 with SMTP id ffacd0b85a97d-42b59339b7dmr15233727f8f.15.1763462941281;
        Tue, 18 Nov 2025 02:49:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53e7ae16sm31647134f8f.3.2025.11.18.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:49:00 -0800 (PST)
Date: Tue, 18 Nov 2025 13:48:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: CL Wang <cl634@andestech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] rtc: atcrtc100: Fix signedness bug in probe()
Message-ID: <aRxPGBEX8hbY6sjV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "atcrtc_dev->alarm_irq" variable is an unsigned int but it needs to
be signed for the error handling to work.  Use the "ret" variable
instead.

Fixes: 7adca706fe16 ("rtc: atcrtc100: Add ATCRTC100 RTC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/rtc/rtc-atcrtc100.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
index 51933ae1a2fa..9808fc2c5a49 100644
--- a/drivers/rtc/rtc-atcrtc100.c
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -296,10 +296,12 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to initialize RTC: unsupported hardware ID 0x%x\n",
 				     rtc_id);
 
-	atcrtc_dev->alarm_irq = platform_get_irq(pdev, 1);
-	if (atcrtc_dev->alarm_irq < 0)
-		return dev_err_probe(&pdev->dev, atcrtc_dev->alarm_irq,
+	ret = platform_get_irq(pdev, 1);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to get IRQ for alarm\n");
+	atcrtc_dev->alarm_irq = ret;
+
 	ret = devm_request_irq(&pdev->dev,
 			       atcrtc_dev->alarm_irq,
 			       atcrtc_alarm_isr,
-- 
2.51.0

