Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F07DD302
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btJogvBK"
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7927E1
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507a55302e0so5879379e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698656608; x=1699261408; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Og0eGEy6ECnZkx/WHAySjGVnAuOJT/PL7KvVeqDKaQ=;
        b=btJogvBKRD/2sSBeYwuZkt0DD9rMsW7Uha4WYku4+MRNTcMew9moEzzOdvNqWt8RVT
         FLmwk4pr7/mj5Lt3MMkapv60tzZScrpZS2HOaSBR0ybK+2wFJqEO3i85VsYZwA3Yzxfh
         RP0VFI0uW6UG375CWzP0mnfSW4HM5tALMsUtS7ZFcmiMTqIXmjyfkunledcJ3R3x4ZYW
         nJIFjssZN1ikwtsZyVfU8Dib7Kil8uyaS//cvgAeRdX5ktuUqa7xKMZMSl7I4XO1Z7ar
         2YB/MaTfipawugQxF+Nd2GmRKVRTtU1kmxPjXm3cCfgddrjCkI/3+ojIUCVZz15hfGG2
         d4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698656608; x=1699261408;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Og0eGEy6ECnZkx/WHAySjGVnAuOJT/PL7KvVeqDKaQ=;
        b=svTG2dOiNRg1tYDEqlWOa2ATVMGpBKqI+2xCbN2JwqDC7RdJHco04XKDMnM06Mogyf
         2RHshIBNtFbIo1Ss83Cf9ZnY37hAPhPJXwhlp6b8y0eAc8x7LIJZgtPSs3ozUq+8ojL1
         xLNrX7fH/ICqT+sM3KwxpqfolRJxKHhCklfvPA7M7m+XDGbWZPiD6lWmNQUSNLBN0CBK
         6NTISSn8Kn6OPedQM1vmky/1sKdYUsUcbO78DL1asGYsEHT0uNcAyhZe/uIxRl1r0cWQ
         oHLp5OR3/Z/5ifQYFY+YJ1UAnwRS7/SLX8o+sfBzvSYi6HoyoGB2HgbLsfjgkRUPAy1c
         2v2Q==
X-Gm-Message-State: AOJu0Yy0diwTyb7KSbBfR5zeX3qA4h/BU32iZkJyn1vAZm+9WQ4hyygX
	z5HbY777wzPkDMC2Ab02++uduQ==
X-Google-Smtp-Source: AGHT+IEVwK0EPwzXp3ZPpA567lm9mf9RmP+zWXN0GwNBvo7GPH4UCC9PSUAH//0uQ+MLYDODelpm9A==
X-Received: by 2002:ac2:5f6d:0:b0:506:899d:1989 with SMTP id c13-20020ac25f6d000000b00506899d1989mr5436459lfc.44.1698656607852;
        Mon, 30 Oct 2023 02:03:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4ccb000000b0032179c4a46dsm7771900wrt.100.2023.10.30.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:03:27 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:03:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivasan Raju <srini.raju@purelifi.com>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: plfxlc: check for allocation failure in
 plfxlc_usb_wreq_async()
Message-ID: <e8d4a19a-f251-4101-a89b-607345e938cb@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Check for if the usb_alloc_urb() failed.

Fixes: 68d57a07bfe5 ("wireless: add plfxlc driver for pureLiFi X, XL, XC devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/purelifi/plfxlc/usb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/purelifi/plfxlc/usb.c b/drivers/net/wireless/purelifi/plfxlc/usb.c
index 76d0a778636a..311676c1ece0 100644
--- a/drivers/net/wireless/purelifi/plfxlc/usb.c
+++ b/drivers/net/wireless/purelifi/plfxlc/usb.c
@@ -493,9 +493,12 @@ int plfxlc_usb_wreq_async(struct plfxlc_usb *usb, const u8 *buffer,
 			  void *context)
 {
 	struct usb_device *udev = interface_to_usbdev(usb->ez_usb);
-	struct urb *urb = usb_alloc_urb(0, GFP_ATOMIC);
+	struct urb *urb;
 	int r;
 
+	urb = usb_alloc_urb(0, GFP_ATOMIC);
+	if (!urb)
+		return -ENOMEM;
 	usb_fill_bulk_urb(urb, udev, usb_sndbulkpipe(udev, EP_DATA_OUT),
 			  (void *)buffer, buffer_len, complete_fn, context);
 
-- 
2.42.0

