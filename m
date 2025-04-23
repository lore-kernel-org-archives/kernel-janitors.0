Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF3263F59
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396557; cv=none; b=L+et0djy59VF8HrqkjPNl8Gl2E8H9U4HKwVE89YW4YZGBVl5iV4QsG+C9mQywDPoazKsBoilcVoFKSEDuWbgY/u5ihzzLP1KAivDlEwjKRHEXnNxlr/ZWjHVkvkqJSY5Xb5lxtbvgC2ZKROqJ2YSmg+h1YCf16rFY2dXT3XMrjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396557; c=relaxed/simple;
	bh=rYe7xCZFXZi2rJ9KLdTiTXrF4ctqCKSc48aSu6KmDK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALopnOb6CHr1OVQSXGhrjcC47Az2OHx+FP/L+qGhx/f9W1itcGeylTHlzgVyI/jv0SRPvJ1H1i5trybPynhUbexjDrDZdQ5nDB84dbulkBhSrBtHs5vml7UYNf5QK9w/K//QEOGpOflhIw/++2b7mL+uE6EVhFHtgvS2rvd8EH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNB8slTR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNB8slTR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso48596225e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 01:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396554; x=1746001354; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzrQBA4CpzckjRHBNUti5Dlgso51XuHDeOZmJZ7DHrE=;
        b=CNB8slTRiEStK8/1lkXd+jPpxmUz0vKCoGCOxLAkF5uRYRFk2PE7b2It/yEkf2egUq
         97OldNOjGFfhm5RCwrVs7//IwGnQxvpMOgbetvPPyMt35OhEvY8v9GjpwDRQaDgjxtnl
         cvw63ecRK4+BZ2guAuz/vuygGDbhwssyhG1Wm5sxX7Y8btxIJOjnaabl0uyUabV+sfut
         8Ue05qCSNovuXQ8dFn54auKwrIfEHCWUhtBdK1QeFYOyn5FC2kbwKb0fpW5dmofPbifE
         cbxx1u3NRWYtEm9340RyEH7UmgFnOJdJuEmNytpPgIODSsoM+/JBVBBKWQ+Q8KFyE5Mc
         aE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396554; x=1746001354;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzrQBA4CpzckjRHBNUti5Dlgso51XuHDeOZmJZ7DHrE=;
        b=fFJRp7470U2yf3vK4k21/0Bwzfhr012jiG2D5B9VgGchWaGFQw9t+oK4AH5qxUab5Z
         rp3xHQsmWjzTXERLOCY2hJFR2K1rqVdcSlmccUWrS05Vh++8F7AWKKMFHPY71UeYdF2f
         IYWBx4dP45rDnMEHSS7UEMsfIaGoZ5Wn8DfEZcyBgNWgJ7dDHPJUhbC/5Mn2v4HxSuy7
         KpMN7NH8MFTF7HcaeNg/sxrvQa/G6iRkLGrz11URbZtztJbm9mvY38WhZX9tLvljX1js
         uTaSY8Ym7njbXh+H6qE2YKCFbUJocdQ2auriqZ50+YDFjP+dd8j5+w2vkeffOxQQL+ha
         I3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOdZclOUBOcESmgOlRf/Sy4Idk1Y0SMHVx5NM5qJWG48BWQth7/lQT4orsz5bW+MYxkqAFme/2OeaDSdrNYQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YztacfymdR7RbkkGe/Hz22cnoBIwdCKjT1Ef+eQF5rzcU2BzQci
	ka1e3dw2n6+MYHDwzwqKLVwV6WHgzgd6MbZd3XtxPKo1ZYqXFTGroVU2Rq1YZ8M=
X-Gm-Gg: ASbGnctTfJOIlKF0Fa1Teq5BUDnRwbMoAsKXhAfhiywowmB2ORucACF+qFhO+2dxCey
	XT8jSGRe+R5MtGtmavsTNq5g2BAp9Hx7Ju7ljOJg7b2Y2B2V8S4N40U8gS5u+bePZR+9W8MR2rQ
	lEDa1nuZUTHH0O6DuxfnnDl65MwHsQyuL6OACMMmNKNHk72h7J6TuMF65xfHcHu6Yr6r59sHT6u
	0zi+jYvTv6RZARZoH852DeNjA14huQzAxnvYRMAy3UFbFTJw+1EPyZjtulhT9qM9RY9bV2sJoX8
	0XBaUZhPg+7vg4nDwaXvOkL83BWpXhKSs/gpYgC4Y1hTDTmwaYNE7x5P
X-Google-Smtp-Source: AGHT+IE65/jSNAWn1NN058whXaIq0omJUvUad7kdZ7VsTeU37e9qUVTYQjbwSJReUDlCUTQKveVgjA==
X-Received: by 2002:a05:600c:1911:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-4406aa8b882mr174359035e9.0.1745396553802;
        Wed, 23 Apr 2025 01:22:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092d1709esm17040125e9.7.2025.04.23.01.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:22:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:22:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] misc: ti_fpc202: Fix off by one in probe()
Message-ID: <aAijRtGLzKLdwP0-@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "port_id" is used as an array index into the struct fpc202_priv
priv->addr_caches[] array in fpc202_write_dev_addr().  It's a 2 by 2
array so if "port_id" is FPC202_NUM_PORTS (2) then it's one element
out of bounds.  Change the > to >= to fix this bug.

Fixes: 1e5c9b1efa1c ("misc: add FPC202 dual port controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/misc/ti_fpc202.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
index b9c9ee4bfc4e..4e1871870769 100644
--- a/drivers/misc/ti_fpc202.c
+++ b/drivers/misc/ti_fpc202.c
@@ -370,7 +370,7 @@ static int fpc202_probe(struct i2c_client *client)
 			goto unregister_chans;
 		}
 
-		if (port_id > FPC202_NUM_PORTS) {
+		if (port_id >= FPC202_NUM_PORTS) {
 			dev_err(dev, "port ID %d is out of range!\n", port_id);
 			ret = -EINVAL;
 			goto unregister_chans;
-- 
2.47.2

