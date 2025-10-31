Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CB34B1BC
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915908; cv=none; b=oLq5a+jUjF0wgWRenqIk+Oj3V6VZBS527070lWZlgeSgyV5QW6mqKRiCRnPVhHyeGVwwnBzjYe9gM/f1Ps2Mc3BtPdz54+3z5WfmrOFb0mXiBn0EtRGcV8bNUFUJvqftfIEWGo7YeMIUSzTPFqcHJtzfVEEcHq1WjErQRdABJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915908; c=relaxed/simple;
	bh=ohLTL0SvpZNw1YyqDgj7e+a1xa9YzqNdtbvCbNOK1Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h9WU1G9DfbuKixeJs6FIPlcuA9EjAvXG27ujzbJ2y/No6QBV+qkbQTuY1MiJ0i2XV4t8leII8xmzp/j21bzVcrfcT8xivBG2AeQMo2+DwTMkQI7xJ/uF6C0Htqhr3CYaoS5qHWNoqhVRQuG1cJX97HHzifNk0XtsU4nHZyh9Osk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKUuAA8u; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKUuAA8u"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4770e7062b5so15989435e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915905; x=1762520705; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+w8jqf2lCxSEA+gKuomLF8ByPnOiEIRxtEHIBbMby5M=;
        b=WKUuAA8udu4w586zlyk6R83XVRBVK+QbQAx10NwNt6RXYxYb/rEHdS6kcQLMkhG1pv
         9ST5l8+qPAVXWBA9LM/L6FzfRAi59AwCAdYofww4RJwxavGQanzqPztneObNQdaDHaXV
         HpXv1x7zBi8oiF+74ID3GU1cySw0/PllMzxNhhy7QP1bvwX/qyrziX5gJaDdZrRQ8wdo
         4adrxPwtiCqtcwCAZuOQiKPr3wdDcdciJ1m3cqASQA18cSTGmHgPLr0ON7tC3MXQ7bzC
         ygiH3gQgRC6yVWDCbdAMGfB/YKmj90Gn76+AtJ7qUCBmlo2qDGFyJC+1f0s2ccN/q/Xs
         sj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915905; x=1762520705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+w8jqf2lCxSEA+gKuomLF8ByPnOiEIRxtEHIBbMby5M=;
        b=LrLAzwQcBfKUZUFs3a37utBlhBWby7R4kSTuF5pltXvgWqW/vFcVrJbuS3f2t52GRJ
         /6zUdJB4Q+D01M97TGrpXEu/fx7ZbB2v1meMDKvDZTBO4DzDbofMWiduoWxgp6YHFm8P
         bZC/xCbbLEdFNHtOVW8zP8d4aE7YFRMbY1szetH4yl05J+7MCW8BWBkmxReC/RWTHFy4
         +XCjjVMhRfJMtbrN9zYNT9XAFidxHteZzvHVzijXLF3+BwrnglmUBnLI6LxSR6tqXjy5
         7HOTnzHphfLSa/GQG9XfbejpL8lXnooNxrZ2dkjGgQ8M2KjGAP1+AhTOtZnEA5yWj0ID
         PqMw==
X-Forwarded-Encrypted: i=1; AJvYcCUZWrvd7vl3ayxuffz2ssNsjwbVXf4BchRbayX/XgpJO6K2SmDlCmPFnCDBqz/W0M+9gSHFlbnjGGdQsMDl+2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxavsyrMVhGnMMnAgBVN3e0e3HTH9OgplFROmI72rYH2nNnPROG
	R5WdIgbfshhCgrdcfj5s1+RFnu7aW8z2EKEO8rdTq63yP5aeJEmArMj7gK5zDBOfcQM=
X-Gm-Gg: ASbGncvn2jU31ysy0Rdr3lpOlh1XAoosSM1MrsojMgdfrYKpwac93c0aD/ZMUMfEywj
	MiVDYwP4GzItFrmuIrFOIwpgTlQZfoOOMXP/gYUs2FQQV2MMJPLYxThnex4OUTG7BwDJbVfBZIm
	yV3sZf8LAz+Q8W7OnV1EcuZa9a33Dv9M5P9fdl3M8SCoVVFFI2RNkhL+FtirlGQPz2SJPtQ4Y/B
	NeEGxOKcxYZBgEAYX0ClrkCG8/9QKG25Xldp/2dc6YqrgGF4IFfUaeIF8fE0HBmq+47hpIePUGL
	C5QTaqXeo28go+qpN6t1pQ3zSl56QcO+KXhHzjyYaB0q0kLY+DWQDr08ncjieGjmsmKa2+A69K7
	WG61BgoU0Mc9w4FHCjK7jrXwQPeEA4BU9vAoSjcX9MWGyJwFNVCPpREHoqU3hXjuC+09psfPyA4
	t+jfxbFNpDu+I3On2r
X-Google-Smtp-Source: AGHT+IEJtNSHRo+8kbxShLrSYoJ1sltDyk37yajDo7sugoAhpxuanGQrpoVYtZmOoClzTAqz2jv3ug==
X-Received: by 2002:a05:600c:a44:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-477308cd816mr35529135e9.28.1761915904754;
        Fri, 31 Oct 2025 06:05:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c1406a45sm3485008f8f.47.2025.10.31.06.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:05:04 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:05:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tristram Ha <tristram.ha@microchip.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: dsa: microchip: Fix a link check in
 ksz9477_pcs_read()
Message-ID: <aQSz_euUg0Ja8ZaH@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The BMSR_LSTATUS define is 0x4 but the "p->phydev.link" variable
is a 1 bit bitfield in a u32.  Since 4 doesn't fit in 0-1 range
it means that ".link" is always set to false.  Add a !! to fix
this.

Fixes: e8c35bfce4c1 ("net: dsa: microchip: Add SGMII port support to KSZ9477 switch")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is from a new static checker warning Harshit and I wrote.  Untested.

 drivers/net/dsa/microchip/ksz9477.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/microchip/ksz9477.c b/drivers/net/dsa/microchip/ksz9477.c
index d747ea1c41a7..cf67d6377719 100644
--- a/drivers/net/dsa/microchip/ksz9477.c
+++ b/drivers/net/dsa/microchip/ksz9477.c
@@ -244,7 +244,7 @@ static int ksz9477_pcs_read(struct mii_bus *bus, int phy, int mmd, int reg)
 				p->phydev.link = 0;
 			}
 		} else if (reg == MII_BMSR) {
-			p->phydev.link = (val & BMSR_LSTATUS);
+			p->phydev.link = !!(val & BMSR_LSTATUS);
 		}
 	}
 
-- 
2.51.0

