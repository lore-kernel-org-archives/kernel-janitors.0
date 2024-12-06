Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91470201278
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Dec 2024 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490567; cv=none; b=A+gc5WQwJVkaed8ppWIlLJEP6R9Syv3y/+lfl0W0eNxUI4YBgEHGEBwRDId4iNJ0Sc02vyiVEKgAARH+HpBhbZq68HQnkKlVV+QjIvVzrb9EXAWMKooamPjkHxWXOMYFRooplm1PZVzwG74PT5pSLzrJxYMLPVdVeqQckIE7LiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490567; c=relaxed/simple;
	bh=Hk+8FdCJyJ2RtcsWXsbcyvBWzUyxa4peO3nujhwWwz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dw0hCB5gl6Fzxu6G/8ZWZnQuAV49IFVKZy6CqQ3lQY6IpUPytM2N+c0o9v1b8Q+bqjYePuNNVijLQbepK9zk7WaWkzX6xjf2DeW5qaQTMIvt92arrw0+zJGIVacONcOGJjhahY4IVI8kwxBQ5Ub2Ezonp+nc7QRc7o99wJF2NwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m4LMBlNZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m4LMBlNZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso20101815e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Dec 2024 05:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733490563; x=1734095363; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/SGgSgGbGfS4qal8H23FKyEqnU45LmUqMyclprxKRY=;
        b=m4LMBlNZ/oEep3zcGJu0K5tRl1lx77q+YjT5h53ZZcw4Wyl44rACj6eL5bFj6NSGvf
         CDd/SOkRS3ahS9FDqfEdN5pBOeGmC/L3AkAfhdopoJSqvrgwTI5mqribBO/Ls3NQinM9
         Mfyx9u+id8ldl7wfMUTEVfGvG7j2SMvuyYcOugabNgzfqgCRQLknngBI2pz7FiJRJWKe
         hIxbRbz6zHNdoTzfMz2t8vBt/4W/0m2iV9qV6OtgK1OVaMUTCSV1TjZUjnm/3eaCKbkK
         h8LW3L5cenuZWGMFNI5H7Rst0eyJ4mvzzkFKmd6k7P8MQ7kVZZYUvynOp2CR/SEGya/+
         fsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733490563; x=1734095363;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/SGgSgGbGfS4qal8H23FKyEqnU45LmUqMyclprxKRY=;
        b=H7AjDXh+fgjrHVRmQHqFeANHvlVwUjeHMetbDyZFQ4qunzZ4vJwVt+E/WojPMvZHf4
         irwooyf0wPZwmXOLWKoHa4I3EG6sbeMSZBOyKyPAvdkUFlnfxKNJx/Apg3tcRWbi18fj
         9OCcXMRH+F7jj2ugw/gIp6kL5i22LUC29K0FNc7S+b+Sqq9XxccyHMfJgOPbNN3KVSjX
         VWU2ProVb9KopNR+jsmML+eEWzNp0Bkhq6zgGDgY3zBtBBO/MKsa/3UdFTApFAvZuiaV
         8xo57WJXrpaijWF7kMJerjUCU2uWyRcH+58Ztb3EXb2SQF7xKr2OfGaZmXUtnfsmvpJz
         7Sog==
X-Forwarded-Encrypted: i=1; AJvYcCUq+egltLLnEq8ZZ8ze9US6t9gZhY2+eyr+/BYvpaihzrpulKbyj5YblTit6ImMcOSUk16ABkmOP0CQfAxsd9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/z4yCNqgh4O4fTOSRe3Or6MZOxXwYK4simRHrsUXz/Rviu9S
	o+Yfdkp5eDpzmmzB3o522MxQM0pmQXwj0czgRgbEUwODeIJXJRfj47xxiSZrNYk=
X-Gm-Gg: ASbGncuMlxOdSNVxmg4Ca2o5svv/2f+ztH2PLGABb+gKeSJMhV9I8gXicNvjvGTwIeI
	gfbvjng4VDnvwlGCJhnlYXFT4NOoyzmrwKNhr3YcLyvdO28W8sakHH8Xtq2CX0Z0aemici9KVhm
	v3HgY7Msvh+Eg2q505J4G4ZZk+3OGuUIG6A/9lOGjh+S9xJPiGxMk9QlYzvBezzyuiefo9nPU+D
	EjDS2quwWOGkdWfEofrnQkXojpttwP/MRjoh0K+82bTEtS2k5RAlpQ=
X-Google-Smtp-Source: AGHT+IEe8eUou/A//oG9K2iNOUpaAPFb7T+EAvrirPkHn2z8KIBCuyQ60MWJalATbJ02kxAAUHl+dg==
X-Received: by 2002:a05:600c:3b99:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-434ddeacf25mr27975715e9.3.1733490562877;
        Fri, 06 Dec 2024 05:09:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da4a1sm57254375e9.19.2024.12.06.05.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 05:09:22 -0800 (PST)
Date: Fri, 6 Dec 2024 16:09:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm/tcpci_maxim: fix error code in
 max_contaminant_read_resistance_kohm()
Message-ID: <f1bf3768-419e-40dd-989c-f7f455d6c824@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If max_contaminant_read_adc_mv() fails, then return the error code.  Don't
return zero.

Fixes: 02b332a06397 ("usb: typec: maxim_contaminant: Implement check_contaminant callback")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/tcpm/maxim_contaminant.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/maxim_contaminant.c b/drivers/usb/typec/tcpm/maxim_contaminant.c
index 22163d8f9eb0..0cdda06592fd 100644
--- a/drivers/usb/typec/tcpm/maxim_contaminant.c
+++ b/drivers/usb/typec/tcpm/maxim_contaminant.c
@@ -135,7 +135,7 @@ static int max_contaminant_read_resistance_kohm(struct max_tcpci_chip *chip,
 
 		mv = max_contaminant_read_adc_mv(chip, channel, sleep_msec, raw, true);
 		if (mv < 0)
-			return ret;
+			return mv;
 
 		/* OVP enable */
 		ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCOVPDIS, 0);
@@ -157,7 +157,7 @@ static int max_contaminant_read_resistance_kohm(struct max_tcpci_chip *chip,
 
 	mv = max_contaminant_read_adc_mv(chip, channel, sleep_msec, raw, true);
 	if (mv < 0)
-		return ret;
+		return mv;
 	/* Disable current source */
 	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, SBURPCTRL, 0);
 	if (ret < 0)
-- 
2.45.2

