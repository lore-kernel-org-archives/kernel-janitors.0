Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF2392811
	for <kernel-janitors@vger.kernel.org>; Fri,  2 Oct 2026 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952133; cv=none; b=WzVLDqyXKeuPrFNVMSyz0TnRGWBYkLbcG2ukD1I3VYbdiwJFvOqqX8DnlX0rNrCwdoVD+cla8WKyTOXpRGTLLcMa9jkBn/bWfX6ifgdtgSvyMPwOkl/2zp9kaNduknngF7U63v+OTAWGqQrz6q0oS7cwz70MzT52/SORdEA7gAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952133; c=relaxed/simple;
	bh=HkLu1z/SbgPFtEWdAtjARd7HcyvxzZ1BbkfT7JyKqUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPv5OgVN8a6Pu7HDxMXDvhfZCHgGZ1ExDWkLLY7NWRhEjBfjEV2IaLhyFIdvJxEzvPi0za1QUoZk11PlMz5qQwFmOTSNTbU42BUV6dRsZvLVYGsSUR6dELwHpCIOGj097wtiyEpjd7uhASn+qR6ABDgt6atHaPuEynMzmaqg1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHjS9QG0; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHjS9QG0"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so15325966b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Oct 2026 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790952130; x=1791556930; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5F3CEI3XgaKuf1OwNaDsn6tE9wpJa5Hz1OIv8VbsSk=;
        b=EHjS9QG045bwagcPbNQtae7CW+a1yd4F1WcmeFj+tewYCwMgDAfWxj793t5uYE3Qwt
         J9OVspADSNaSkW6VgNs13WTu5weMKNwhuQpV1KYYrtJdf1woTm5CRBHGkD+U9ySf29ku
         aZro/2pl62qfLnDsEjreDqesfY//Hrl3pNuwYysg/SS1HXDL5/5qyQAAW89tdAu2+fKe
         VeTst+Jt9WZyyvX9UvxBjIIzk+iSy5a586PqmTt/m+TAmhUO9TH3v+go/TTijJ4ZQWqH
         hXwjnxX3/yQwmmS5is8RfNAIQx6h+za1dBj/NgR9pGl982RqpwJr1xMaqPq8abKsb/Ow
         z1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952130; x=1791556930;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5F3CEI3XgaKuf1OwNaDsn6tE9wpJa5Hz1OIv8VbsSk=;
        b=gpBde1peOBcBWoD/afURuwtEi0nuOdwhJnhN17EbZPyazpP0SA2f7uUMfpr6jvc2s8
         WnVPcd55WGKPPkvV7KvomTHF1RjZ5QLyIQDM6BqPcx3u9zMTwOA/zB85piE5RpLITdet
         zVuOEwCUbY/OSnszFi9/a+4K0JrtvYck7pErOGJoXntu5MoSF/Cpj+b80Yu8sll7JzE0
         twuN6YDOJHUAos43WcIu+b5Xog0JU/tRqv9XyDdYX/+6PtcAw/dMVjtykMHcxH/iKbWQ
         I8i0Sim50elbT1urNaMevh83xpfxnvELGjK0XeJcRDDil/nEs1lVFf/NSLj+p6y0XpZb
         SRGg==
X-Forwarded-Encrypted: i=1; AKwUvBzEgpk+SNs67dI1Ur3PAnWCYVyi7qa7nd7fb+8D4rL/SIAArDqMfJhuj5nG3B1/Trvcd7oiwJXp0jzPoN2BrqE=@vger.kernel.org
X-Gm-Message-State: AFuF++nIA7Oye2vgSwPGOVkhCPJPIevBFsyNokVbZWOCeizalut4IW3l
	zDWFsipRHiLXCjlDKqZTHH/LckznfNs9Si8NUjMP72Xi8LSPnaN5+UcM
X-Gm-Gg: AYBFou2YpHbvwWCq9EDOcIBJfBbOtGoOMqNV8WKsLEgKxa39orG6rTfj/GS3ufy0XlV
	VSduLJ25oBOFV9ghnXJzzJek2g409nK1IKkoF78xyLo4YxasVNgm+rA2t3sEJ/tIO7AlqER3BA9
	gATFQwWUBisHDalk2h2szQ7xXMfxHF4/iBt95EIYllrE2o9JJDNGuUTwfP5mP9DmppyiyocD2Ur
	viS5W/MHzORSS5jUegWSohnV3k31z0gCpuImyxnnCHs7lPbN181jvsCGXNUZeeqpLjDiXfb3si6
	i+AxNVn6sfr01rRt7Sa7kB3COXpYY6bA6tHy79ZVSItf5NUbzc0m4r9CtAsRBiNHDiZjyFcw4rP
	SMkAe7vy50utMrLfvTBrECuKgjoT/ABI2HrO5/lfuSkfQdaaodgYmmqv5O+8sKk/3HTsmJomi4d
	YMHfFDUjQEBYNp++la3h3HfBzsR0EjarJQvzrLHb8uFvtCTmZqG59eG1EBNPeSQSv5LlQ=
X-Received: by 2002:a17:906:c109:b0:c2e:378c:8ce3 with SMTP id a640c23a62f3a-c2e4ad81a66mr241243566b.32.1790952130085;
        Fri, 02 Oct 2026 07:42:10 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf7c341sm93304466b.55.2026.10.02.07.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:42:09 -0700 (PDT)
Date: Fri, 2 Oct 2026 17:42:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: ambarella: fix NULL vs IS_ERR() bug in
 amb_pinctrl_register()
Message-ID: <ar_CvNPWBA42BAlx@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kasprintf_strarray() function never returns NULL, it returns
error pointers on error or a valid pointer on success.  Fix the error
checking to match.

Fixes: b40e9d140c24 ("pinctrl: ambarella: add CV75 pin controller")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/pinctrl/pinctrl-ambarella.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ambarella.c b/drivers/pinctrl/pinctrl-ambarella.c
index 83afef6a123f..5ed1010c5ce5 100644
--- a/drivers/pinctrl/pinctrl-ambarella.c
+++ b/drivers/pinctrl/pinctrl-ambarella.c
@@ -426,8 +426,8 @@ static int amb_pinctrl_register(struct amb_pinctrl *ipc)
 		return -ENOMEM;
 
 	names = devm_kasprintf_strarray(ipc->dev, "io", ipc->data->npins);
-	if (!names)
-		return -ENOMEM;
+	if (IS_ERR(names))
+		return PTR_ERR(names);
 
 	for (unsigned int pin = 0; pin < ipc->data->npins; pin++) {
 		pindesc[pin].number = pin;
-- 
2.53.0

