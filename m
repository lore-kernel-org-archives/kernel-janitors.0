Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDB1C1AA9
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Nov 2024 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730740610; cv=none; b=Q08HHtamxP0q+dOJbbtiNWnDVmuSbclxm24WRJydsUN9DbAKnOPeBOAtyQHvlnxTu5lEbZUFTFfTQEJpXQfKR500u9oIaWUv7V21N9JEdK0sIdHxw79JYiLEBwIT2gHXjfEXgIP5nOJ8dxlU+KLr82YZ7c7riGiPFVaMVyf3McE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730740610; c=relaxed/simple;
	bh=dKw5DqDoe8MgxSnmUeCxVwAeG6L9UIQQ6Qj/HTMdC3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKjWEutC8hGWySQZRkYUFnRYlGHVZVMBd9Q0/4zf/BoNoJ6DS2ttM6mohmO5jIk4VSFQlBnVRZhyz3gmyYrNBTqcpDUaAmY7V/fV12aMcE3fNi0WfCsfZcZCD0aUD7iJwQQmFZicW4+574dVycg5QkFf34E+vJMuZS6OceWqLfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6Nnl+tx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6Nnl+tx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so36784485e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Nov 2024 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730740607; x=1731345407; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUsuOJD1CSVhGbrX3jOvDO5f9FE/bKS2dJ6VzFgkshY=;
        b=w6Nnl+tx+T/6veDegQJsyD7dKAKWv3+AEffzAoGmysFU73m8GTjH5Dxkc9Korr28X9
         s1LfY4+7Py9K6KM8AZ5Ih2MPA8vFVfps+0PYCivIJk9yK0yuA4vw7pNMk9ZIyLq0bBxY
         KpwIjDgExTkdel9Y2t513KY+YugLqCPGpXoIXVDNl05YrYI/EaX2aKMSm9wqA52Vlqy7
         68t8omnanjCZBRwc/3K0SPyGIrxb1/lBO4SmuehrY/+w6Z3yHf2Cjq3q6Y1+HIErehYQ
         TFHqEV3WQ8tdKI9QIt5djxETXGh8z0teMkfJHSOBdFwSOKEQy7cNmbLGhx06666edjBg
         TF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740607; x=1731345407;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUsuOJD1CSVhGbrX3jOvDO5f9FE/bKS2dJ6VzFgkshY=;
        b=dy6GlGLKeOHtm+UfMjubT0O9XjnFCiBlvyPmK594H6AGKbBtlP9WVgKlie9NxVGybj
         jXPtC99kiiwnqCEksS2ZbsJp9Zrpk2WYTr0E8ZXhrlbbGB8oqQu0kN48fbXJX/OuVcrL
         P0RsobgnjvLNupAyUziUJRTVxOZgj0awSrh6i4y0x0oqS+tG3v7cy9vd6NXs/qZURZuS
         AJKkVjHQCKhRZiC89WoUf6KLdhPsFDF/k0lFm63X9ZumTwsVtEjXy992BGf63/8YqUWD
         3QxnnkShz9Oalk8FYKB7sl4gbT+HvYfVuyJ2BfJMkhFCe3uM8NehszXxplF8cWPaJkTg
         8TNA==
X-Forwarded-Encrypted: i=1; AJvYcCVMPjF/rj4XWjg3yAvkYCHKJa5qQb9WTeiEoLHX8iYkwDmvB0+BbCvr+CCZ78nqM21alaSnf1IvXLTSKMrSUzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQrJfR2KfN77vzkEw4eyfHqt/CO+VQf++DGMyfhUFyhBMoLJc4
	k8pqzaW1dIYSOI+EoFP+ZcK7eyo55ZLw0tn4zIW8rYMVBvfIzt58/XaT/1QCD7E=
X-Google-Smtp-Source: AGHT+IFfusRu5JqkdiEh/meS4hha6UDfm01Hyu41YH65fzgVfhWnjDRMyOquZQ2D0Ub9JXotfcs8pg==
X-Received: by 2002:a05:6000:4185:b0:381:cde6:4ced with SMTP id ffacd0b85a97d-381cde64d44mr7977658f8f.45.1730740606792;
        Mon, 04 Nov 2024 09:16:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm13643154f8f.100.2024.11.04.09.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:16:46 -0800 (PST)
Date: Mon, 4 Nov 2024 20:16:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ajay Gupta <ajayg@nvidia.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Haotien Hsu <haotienh@nvidia.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: fix potential out of bounds in
 ucsi_ccg_update_set_new_cam_cmd()
Message-ID: <325102b3-eaa8-4918-a947-22aca1146586@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "*cmd" variable can be controlled by the user via debugfs.  That means
"new_cam" can be as high as 255 while the size of the uc->updated[] array
is UCSI_MAX_ALTMODES (30).

The call tree is:
ucsi_cmd() // val comes from simple_attr_write_xsigned()
-> ucsi_send_command()
   -> ucsi_send_command_common()
      -> ucsi_run_command() // calls ucsi->ops->sync_control()
         -> ucsi_ccg_sync_control()

Fixes: 170a6726d0e2 ("usb: typec: ucsi: add support for separate DP altmode devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index ba58d11907bc..bccfc03b5986 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -482,6 +482,8 @@ static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
 
 	port = uc->orig;
 	new_cam = UCSI_SET_NEW_CAM_GET_AM(*cmd);
+	if (new_cam >= ARRAY_SIZE(uc->updated))
+		return;
 	new_port = &uc->updated[new_cam];
 	cam = new_port->linked_idx;
 	enter_new_mode = UCSI_SET_NEW_CAM_ENTER(*cmd);
-- 
2.45.2

