Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D251BBBE5
	for <kernel-janitors@vger.kernel.org>; Sat, 30 May 2026 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780170355; cv=none; b=XoJOrAI+b4f1nLTxYWWReWcXFUXtZijOq4rY0n0lLP2LYMS9zOJx1/LtPZZtaIe25oF8Vfn6AjwwWFAgpwaRk9wqUA3bN7x2Qy1AQLeLrLbwvP7/IaiKQS1sArcgXYE4AAox5GxZfVDuNYk6MQ+gG+g+Mk32JwvrG60VrjrfQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780170355; c=relaxed/simple;
	bh=nYlM2G8ceGl3y9T5fnmZhdbw8OoHi6DfQitXHZGs+Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u7ZJ05oBeckzeXlZnq+ysLS8Sk1XqAV9gVmUboFUqVR/kE/uDl+A8HTtp/GyxwZFxraW10yP8VR6+O3T25Ll6VLvVNiWaGDRjqoaQpk4fkqWG48yGjF6wBnaYcTXyQKA13A1cu4lrsJXOCuRcBBIBJ70JhhCf/u4BJsS3DHm4Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/6dimAW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/6dimAW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490a7a9f81bso387725e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 30 May 2026 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780170352; x=1780775152; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sp2k/2dsuU3p5cNxUvdrCd2ECXlssNRbjfeNkqPWDi0=;
        b=p/6dimAWFhxgAFQz8VMJid+2/ubVOs/09iXD6eanc2QUidoqI6a5oEuV/wZBJDGAZt
         DKo0iAPNbqW3x5Mlsmmi0ToI1icHv/7QZSagdxndY27kuNuLUf5bD5DqKC2H2CIWxWLI
         gkC2UuaGVlUi70nGUK4cgwelwahpqIuAfJ043bIukQ5C3bO6+yJyVJSybbMD/yPkHgyD
         sY4c4ZNE/LA3uR4ghM2rgQVF6QMAY8pAtZD11zNSeOR0e/5zfbOXZ3MIWrD4ruVtlPnv
         SRkml10O5eOSOBXknup0ybPH1rpcCVG69RHM4yJwGsd7y2IUZFF9hcye1gQgLrK8pjlA
         pG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170352; x=1780775152;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sp2k/2dsuU3p5cNxUvdrCd2ECXlssNRbjfeNkqPWDi0=;
        b=FbZpiYEn8fP0b56T0bOtlYMpXFM5PZaBicW0ukblpWsR0SbooQPS9qZCFxDERPf7hx
         /xECUny8LE+B3FxrQOUGwNfVXEhxO2KicyNzCb8hIgsrNXAVvEYUYYb5Rzy1mAqVxN4M
         /vaRtSOlQtjVpUvjujjnbQ1jlSVsW0sAbUUf8myCbcXCYDifL/pqBmnic7rkpDOSDH8p
         FR7zmRyk47tKYXysXIe40WhjNbHHsOSRDJv5F8eFuAM7z/6IlksgSfCYCJkDvzCCg3eE
         8DKP6E8wNQW+J8V0XPX6OEL6ikm5EGCZq3bf5LG1EeUcQ3lKX2DqAmahlr9N3aPZ4DcJ
         5KUA==
X-Forwarded-Encrypted: i=1; AFNElJ95T7I2DjQeXS5lujA6ZMyXimQYF/tLwCye/jGzI9W5P00cUkpQba1swmnSj2sAnK8VDS6WIxE84rhnmPNbGE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0a2SgYBAwAwyJ2yNJTFnM1Fte45QbIIq1Klz+GjHSnK3BLoYp
	s8eeJVmwTTp3pWMsOgB4LgYxj6YjJ3aPrmQnNPd0JYQJYHmEhKcEqPE6
X-Gm-Gg: Acq92OGanhZKocIOKmODPYhm7JJ+OPpFVCr/n24qVNBrH4u5z6x7wem2KkzxVXQ24h8
	qoMFhGvlw0fUqToVIE/0NQHVSojUClvZGW/lEbH/cMOMLvnucqUXWl8CgQ00F3Yy90y+9LqThTb
	1JodP+ofwqB8enjEXPGAeaCsi8JOAWEAvYODxWONDlX/4E44qu95StGMK9waP+Dp535fhvWF0u/
	ZoZhUyf5Jj2hrZOsm2p0guLyVbbDqEG3izHe8/A+USc6osz6OSWOw2qKyA70E9LpaOUNBBauLUb
	s+YAneOcPHLzQ9ihH1UtLE2zPqM4ZT6hMkTL396qiSCDSodANpR/tpQPFt1EAx/bWqy5dgTseSd
	WgggAKC4Nmxia64ENbLba5ZU5BKie6fOrMGTvmmSKxjZmHvntm3In+E3ni/qdO0lV3eXh6G0mOV
	4Sw9JHxvklczgRyfd1LXmuhTDilI7MGadfommiWTVp/ic/
X-Received: by 2002:a05:600c:314e:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490a2a78973mr64877725e9.15.1780170352446;
        Sat, 30 May 2026 12:45:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7eeesm126175175e9.10.2026.05.30.12.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 12:45:51 -0700 (PDT)
Date: Sat, 30 May 2026 22:45:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Deepak Ukey <deepak.ukey@microchip.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Radha Ramachandran <radha@google.com>,
	Viswas G <Viswas.G@microchip.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: pm8001: Fix error code in non_fatal_log_show()
Message-ID: <ahs-bEsBJH0KhnsX@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The non_fatal_log_show() function is supposed to return negative
error codes on failure.  But because the error codes are saved in
a u32 and then cast to signed long, they end up being high positive
values instead of negative.  Remove the intermediary u32 variable
to fix this bug.

Fixes: dba2cc03b9db ("scsi: pm80xx: sysfs attribute for non fatal dump")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/scsi/pm8001/pm8001_ctl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/scsi/pm8001/pm8001_ctl.c b/drivers/scsi/pm8001/pm8001_ctl.c
index bb38b2d63acb..a27f3287748e 100644
--- a/drivers/scsi/pm8001/pm8001_ctl.c
+++ b/drivers/scsi/pm8001/pm8001_ctl.c
@@ -588,10 +588,7 @@ static DEVICE_ATTR(fatal_log, S_IRUGO, pm8001_ctl_fatal_log_show, NULL);
 static ssize_t non_fatal_log_show(struct device *cdev,
 	struct device_attribute *attr, char *buf)
 {
-	u32 count;
-
-	count = pm80xx_get_non_fatal_dump(cdev, attr, buf);
-	return count;
+	return pm80xx_get_non_fatal_dump(cdev, attr, buf);
 }
 static DEVICE_ATTR_RO(non_fatal_log);
 
-- 
2.53.0

