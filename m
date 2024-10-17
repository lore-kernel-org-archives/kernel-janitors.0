Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D11817DFE0
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729193518; cv=none; b=Yyqs5L5r33V39gxIAEZbB3jI2lHpYzgD3d+TbK+2/ApHwzpQrRrUvahWNpkuWjRQ4L3vWCc8YoQmylLEAd4Wct6vwnp8PtdRypjBwMOO1FVoH5eplP/IaOiQzL3w0KbBwLMmibBo1DaTbgi6sc0mn9jHkjJ1YxR5nSUoLmDQfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729193518; c=relaxed/simple;
	bh=dAkeaamY7o1370cUdKQG7yxKGStXqWiEAMiubdm6br8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YASmN2yieKOGJI6LGYTfbqhgNvPxG7kObyPO95r/Ynhs01L+eLSbLE11FI9vk1xzd47JqVM+dyXMEn8DldSbXCcPVcHiEMm35cpUHyXJT1tXo4tt2aqzTF/Z6CMeNeMwOJi/7q7Em0TvIa0Omgc9nifS9YYT8WApEEJ3RZIxCqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6PF+v+d; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6PF+v+d"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so210108666b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729193510; x=1729798310; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PI6B1iY+JP2eo71Lss2ueaqQvzi03LBy+TDhNeB/Zc=;
        b=M6PF+v+d9fcEMOCsw5XOt4VzTOpjY9o+uyqpThUW34bL7cYJ6fayc/IvN03gd2FwaT
         xYdC4AHZ3fkwOZPqZ4YFuD9sIljaHKYWo0wgJf4nPxIzVqGpRTaEZCeHJ30dmfHLjVzn
         cRvlP52U20kua5gecnh5TH2XFAlPWARw9bhoHZl5DaiYRnc2dnogbHdVZIVmbWj4kzz1
         f517Vxarwy9U94CPhVW3RKYkfhkR036vAf7Bc+yrca45DWYVyAUUX8ndcgvLmRJRoFeD
         tIBfHs/rH8MGLtQhfelgQdPJpkJoTP4vYS978tkDvmZ2QPntrSs3WUG9E1pvmYqorV34
         D3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729193510; x=1729798310;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PI6B1iY+JP2eo71Lss2ueaqQvzi03LBy+TDhNeB/Zc=;
        b=QP7jJEzax2pQuP1h8g5dBZVrS4XmK46AkJEfZcexHr3drlp8WIGCDkL2uvouInjKV9
         4zWk/qAE4Zmdv/R9aJgS18X+6OgW4YsF8DVj9AniAeDB4zQNhVVtK4qm+zdetvzlgWx/
         VzFaf4CD+OBQeDmgu41TdfNkTr+kUmAIGRChbC1YqgWXSYa8rQx3YigVQRzZm0kfB2LI
         L2CwuIjfLrpkJJE2mo7VH9ULZw1hqUbjY/My1NYt1Wbi5CK3JP2bo9IvhNeevm7JYJ0B
         J1LQsYyIFvhEvTBN9k9fb19OrnlekgPWUJFLCU6hxf5uDc89OElW6y/2d/OtP/BWHy1Q
         yx/g==
X-Forwarded-Encrypted: i=1; AJvYcCU2eSSmoEGNapNTUkSRLXNgACZjWNe1vVCzX01iTqC4gKyLU6G1HrKxVRO7Hd2Og32jVi/Lh+gjViTJRcgwZ1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyORzsY0RPt5Z+mu5pJSIIFPsQ7uhfpZYhVx/dvvnbjydW2IesT
	mKIPMIJ1TKKJYc99t2hvbW0SZ1/o3fVpxaTgpnMGOvRnc9OB2yLlyEGTUN5Qu7I=
X-Google-Smtp-Source: AGHT+IGJon+b9dsLW9OFTm+VNv4AExNUwMLbQMOv3biKDHICy+rUsUPzF2VOZMg3pm/HFx79t1+13g==
X-Received: by 2002:a17:907:f709:b0:a9a:b4e:b9eb with SMTP id a640c23a62f3a-a9a34ec99e7mr838913366b.46.1729193510331;
        Thu, 17 Oct 2024 12:31:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c29b73sm2298166b.202.2024.10.17.12.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:31:49 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:31:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] staging: gpib: fix uninitialized variable in
 usb_gpib_command()
Message-ID: <a7fed100-ea4d-4dd8-97c6-3fbd2c15f795@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The number of bytes written is supposed to be zero at the start of this
function but only one caller, ibcmd(), initializes it to zero.  For the
other three callers, setup_serial_poll(), read_serial_poll_byte() and
cleanup_serial_poll(), it's an uninitialized variable.

Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index aa7af352e709..4bcbaee65aa9 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -596,6 +596,7 @@ static int usb_gpib_command(gpib_board_t *board,
 
 	set_timeout(board);
 
+	*bytes_written = 0;
 	for (i = 0 ; i < length ; i++) {
 		command[3] = buffer[i];
 		retval = send_command(board, command, 5);
-- 
2.45.2

