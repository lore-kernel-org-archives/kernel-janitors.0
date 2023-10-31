Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021E134BA
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1jiqDVX"
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B97EA
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:58:38 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a55302e0so7670474e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698742716; x=1699347516; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXd3kUS5wHNAxeLEX9Wod1It6j8fLEdxdydd9z/gl3k=;
        b=U1jiqDVXHKkahJdGdvgdhW35pLmIJxtXq5pnwqnaTg+8ec2sjZRS0sH4ApwP+df0Du
         18+mS0CZvkI5bivO0IuU8BQcBbaOly0fZtcWvXulvUBkflGq/bE7HiOc+xT6F/t6urA2
         Th3m7Efw1X7HyO50E2yOrM+bl7Gyom+wpHqyGnTU4wwAbcWweOzs5o8k/DClV0+EFGBG
         JrwXT0x8c4yNd9Ssi8PsROsY/oKvwtbenXPp1AV7LQ1hVYlTEeadTAKKPfSom65gLirJ
         woUTSQneRopXsG2Dgd5EYPyK/oTy56A9m+kqIMXmub9hsWUf+ToeKznFh9RVIMha6ORs
         32Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698742716; x=1699347516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXd3kUS5wHNAxeLEX9Wod1It6j8fLEdxdydd9z/gl3k=;
        b=Ni6s9KxPzXet/d5b2LYZTm4YVcopYK2Q+LYSv076kK0TV14ldF0UsbDLqY0XZFBQmN
         MK6r/7NR43ZK3ChZPONh9cmAkkIhGsQoeF1mGKirj1Qs9jmbHd9LdgNrqWA70P3PEa40
         CgkC4BcIMvxfXrSbJZxVZnwteOJJEiBQIeagIMR9aUW3zhwnYUiQiqbSGGCW2d6rc95F
         mUdWC83ywALSvd528QLaiFCWRhz4XvyVGErWW2ZS5OaJYuv3K81b3zl26LMp2gy74ABV
         gLL3Fj5gHv/DerkWVn1H05RWMc2NbU1KiCyIju3atUdO8db0l2tRDCd3YsXMAZa1vz/1
         DeRA==
X-Gm-Message-State: AOJu0Yy7HVdHxE7D2HyTqirtM5VMN8ZVHryhJThKcIPfPIRdfJpXUBtD
	gFSIHDnG7e6EWhOyS89yOCMEyQ==
X-Google-Smtp-Source: AGHT+IEFqBdMG3El7Gl4hxNtoAhylcDlcZMKG3r/NcM6r+dI2+dtHsm53rfSB/1p1rzQYinkmTsSbg==
X-Received: by 2002:ac2:522c:0:b0:507:9dfd:f846 with SMTP id i12-20020ac2522c000000b005079dfdf846mr8472138lfl.69.1698742716351;
        Tue, 31 Oct 2023 01:58:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c8-20020adfef48000000b0032f7c563ffasm983675wrp.36.2023.10.31.01.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 01:58:36 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:58:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ciunas Bennett <ciunas.bennett@intel.com>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Adam Guerin <adam.guerin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>, qat-linux@intel.com,
	linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] crypto: qat - prevent underflow in rp2srv_store()
Message-ID: <3fb31247-5f9c-4dba-a8b7-5d653c6509b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ring" variable has an upper bounds check but nothing checks for
negatives.  This code uses kstrtouint() already and it was obviously
intended to be declared as unsigned int.  Make it so.

Fixes: dbc8876dd873 ("crypto: qat - add rp2svc sysfs attribute")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/crypto/intel/qat/qat_common/adf_sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/intel/qat/qat_common/adf_sysfs.c b/drivers/crypto/intel/qat/qat_common/adf_sysfs.c
index ddffc98119c6..6f0b3629da13 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_sysfs.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_sysfs.c
@@ -242,7 +242,8 @@ static ssize_t rp2srv_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	struct adf_accel_dev *accel_dev;
-	int ring, num_rings, ret;
+	int num_rings, ret;
+	unsigned int ring;
 
 	accel_dev = adf_devmgr_pci_to_accel_dev(to_pci_dev(dev));
 	if (!accel_dev)
-- 
2.42.0

