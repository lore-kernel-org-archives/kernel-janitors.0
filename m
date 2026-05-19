Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64E37CD3A
	for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171220; cv=none; b=fAjfKitLXMOJbVAlULx7y5MmNCvz/xTzdHp8mX0svi4s6qbJEaqc1CPOOkMZ3sWWE9ZfFaYcpEyNiQmkGCSP1i/E++3bB+pgDXDEccxWZ1091aWFR0sFO0rtTKYFbHY81qDJOQt79ECSVWvvCYEhJ0aUSyOUhOA6ZNND500jlAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171220; c=relaxed/simple;
	bh=BkN3e60PEXdoyx0mx5F/cbqqVlK6TvHKD+Ae3IxWR58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=be39DhlqwmdSoLNy91AyPVrWJEDFATWJTVhEaIBKYY3L+8jXykJSGw2a52BNDhLZdIuoNdL/u8ANPMmWPQFXcCR65C2E9VReGcpQ+ehP1GaS9cVfObHTzhb+J5q8WuLlz3nyrzlpe30FCgDG6khPxzIu8WazNmF/H6V0/j/nlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJojo2Oz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJojo2Oz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-452169ae568so1973819f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 18 May 2026 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171218; x=1779776018; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqjUL/F3PkV7mQ5AZkxkB+XxR2b2VNgyAxYreLVSeSA=;
        b=fJojo2Oz6Mxa6lIJFFQzyDkIBKBQa9SBAl+9PX6Ql7ufUp9AcbPse1W9jK5XdCd6Jf
         zTMSs3xKF+6+ErYBnkKrA9LnqVy4Vp55crWUU1WuTho2K4W1e+UcNqeqowSbrZy5wGS1
         LfFAZmTseTS0Xs9i+Py+GHRwVDaBDL5bbFcK06le8+Ft50L81cz5gUwDJ+ptEn34Vu6Z
         FcZuse1UoIKKqUbXtubeaaf6sV+OE+rDwXyceo04WSMuZC8zfQopZqJZ/FW0eDoYT3LF
         FOoKEXdQKcGK+NbxrpTbPKjrolCBkCfJR3NMyKkiV9RhrwYprHRLBgg8L+0skwe6LqBh
         4IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171218; x=1779776018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqjUL/F3PkV7mQ5AZkxkB+XxR2b2VNgyAxYreLVSeSA=;
        b=j+9BMh3N5Z4lDfLIb72tTrnmLkKeCMR35Vb9HVp4Hs5TldSIQ2yYnbIa0VVkWOeL9F
         8i3kmmiK70vurP/m2t7qNBGK6t7W822Fp9v2E13l29+B5er8iWagPGQpKrnwVdMlapQb
         R7+CsH1TIfB3zz2Zu4SZcey8TBZPMW5sAaqWsfkjCU6wSFfE7fAfT8Q4NRGyfr9i27FF
         fkUMuEnMEmemw1iRkoAWkMcRk2vbndDclhpgyefwXwK2yjt5C9L4QhDh6NAfg+hpM5kt
         olGI/sJYUCXtVjm5VOf6IYcezEkqQAv1lKozylP/+43JDWTpN3ePZW5O57tTDsoosoXV
         Tqkg==
X-Forwarded-Encrypted: i=1; AFNElJ/fDTqoZJ0ENJuRBB5RTNdzLG4aUlnCAzGvem5Jig4WgTmfG8Q81ywccnJkt0uXQIsHY1vLuhiKG36blyiKeGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRt2kpnOyeIVTckk65TPZ0vKOacm/svWZ4T68IEZ4uSNm/OIH
	9lUWdcvIXCzxsouSac1OuASyR/koiktQD/aftm+rVBCOInkOhB1vpBgB
X-Gm-Gg: Acq92OFdAMfeALOhTihLF83sztgVoyTT0hU4rpeTuCHTGWnlTR/Mhw3M7ul/7v1QkaU
	XeIsagi9ccb5KwuBFoQifOJpa93RiDiHJDjPOWboyBnvast5vLITUj4zWyyOlK6gz5SuorqLSjJ
	fcgFGfdjf0sipmAT+rhVYyNa2KoSc9Xcca0/kHB/jMdK42JSsos90Yt5XS+E6nSlYXLmsniq1Y+
	U7+yxyxg8tJERxqhnH781QLXDxeUDUNUhTpEORkelKBIjMbfuDz5s2XQc6qGfqt8blBq293WW7N
	qaPh7tkkTJIoyh7FImPok7e1VEjY2iBlnG7Z/vvESZxkvINoBPBHcCrpGUYwkP5wTN7TvD+41ZQ
	KzQjJrkbyh0TTPudo3qu1FccvK0sg64uelBzQKKxJGR5furuw9tSd+q9MMceUkLYXyT3iJdjFwp
	SfUWIDnpXFZh+NH1IBffA=
X-Received: by 2002:a05:6000:4021:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-45e5c5fd95dmr30269534f8f.25.1779171217859;
        Mon, 18 May 2026 23:13:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm45974707f8f.7.2026.05.18.23.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:13:37 -0700 (PDT)
Date: Tue, 19 May 2026 09:13:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] firmware: imx: fix use after free in
 init_device_context()
Message-ID: <agv_jhP-2CNTfQXk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Add a missing return statement on the error path.  Otherwise we have a
use after free when it dereferences "dev_ctx" on the next line.

Fixes: 63536a73a3bb ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was in the original fix but I guess there was a merge problem.
https://lore.kernel.org/all/20260514090457.2186933-1-pankaj.gupta@nxp.com/

 drivers/firmware/imx/se_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9327d47e4312..010af8221dfe 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -486,6 +486,7 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 		kfree(dev_ctx->devname);
 		kfree(dev_ctx);
 		*new_dev_ctx = NULL;
+		return ret;
 	}
 
 	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
-- 
2.53.0

