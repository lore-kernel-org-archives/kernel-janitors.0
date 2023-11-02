Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5763E63DE
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZY9QEtj"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840C212C
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 00:51:11 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so912803a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698911470; x=1699516270; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLeHfEw+cn20BXnMZ/DKySQ1fS0mAfiqS3/naT53NPg=;
        b=HZY9QEtjw+L6I62BldV1gztQKtOu+Tdg5wYhFX0k+9kgmYdFXX2OgcJoGj6hTOisgE
         yXnOD20OvzWLBV32rIC1HWID+HWBiHuoTZTNb57zbw10igviGFIFbiFyzI6cSBhYWPjz
         x8mXDkFW6/yBG8fcTEGo4zqiue4v02Jzhe7luopv1aUxMJWK45+5bixWaRPTyQvSK/hg
         niQ3xkfMtlIOCk/rYbNPQdX4pKck1lY1iw5tCYAtU1QXpKs2yrXSUmJ1JVDFtJHUpniA
         qNUZBSRMimHaJDYg22GhqrArmXKnrAGgUW9g3Suhpxv6qltzFHty9neHDlI55hrSyD5/
         LEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698911470; x=1699516270;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLeHfEw+cn20BXnMZ/DKySQ1fS0mAfiqS3/naT53NPg=;
        b=ARsGXl82i3vj0gzgGLmUJAWIrp7r9uZIAj+215TmA1A60RxI3ERW/A8D/32vCtextA
         BsJGOs7EbmKwHHD7qwirLUfVaO0vlca7rgeo6P5fFT153QOyO1TCsAg64Dncepauk0Ib
         xFHFeG/ZXFiDbHCWJFRa9NxU8DY5SKmu+nef6XKl7WhQmkaxjR9WGhdrteZA9zNjlgDi
         KRQmkLsOMvPZlFPRmePcMkTatiUKIDvJo7/b17e2F7r9iQjDlcJu13SLvnG4si67dh4p
         NW9LtfkvlQRk27XOd1c8iEjEWhn2hzw6pIL245DgjQsIGAV9O9MZ7iab1DmJLIiFOUew
         yb+A==
X-Gm-Message-State: AOJu0YzfCEjkRr/0sAV7ncWMMOWD+T799MBmLYtetItZ2NIpks8XOmfH
	5hRs0moaZx2gsbyBxi5WRacZiA==
X-Google-Smtp-Source: AGHT+IEvdPf0bsjLKR2aakbO3iQpSkAUBXV0koo+A/Q6lU6+FKL40aJmbs6dvIzpK3w8Pl7MEUx1CQ==
X-Received: by 2002:a17:907:25cd:b0:9c7:4d98:981f with SMTP id ae13-20020a17090725cd00b009c74d98981fmr3233503ejc.33.1698911470132;
        Thu, 02 Nov 2023 00:51:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709060b4900b009cc1e8ed7c5sm801913ejg.133.2023.11.02.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 00:51:09 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:51:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tony Olech <tony.olech@elandigitalsystems.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Deren Wu <deren.wu@mediatek.com>,
	Bo Liu <liubo03@inspur.com>, Justin Stitt <justinstitt@google.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Chris Ball <cjb@laptop.org>, linux-mmc@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mmc: vub300: fix an error code
Message-ID: <0769d30c-ad80-421b-bf5d-7d6f5d85604e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error path should return -EINVAL instead of success.

Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/vub300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index de3f443f5fdc..fd67c0682b38 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -2309,6 +2309,7 @@ static int vub300_probe(struct usb_interface *interface,
 		vub300->read_only =
 			(0x0010 & vub300->system_port_status.port_flags) ? 1 : 0;
 	} else {
+		retval = -EINVAL;
 		goto error5;
 	}
 	usb_set_intfdata(interface, vub300);
-- 
2.42.0

