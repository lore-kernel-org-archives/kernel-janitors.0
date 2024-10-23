Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377A15B119
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672926; cv=none; b=PLd+Ou2AXAV9XbpPFFDYgpD/FgKMeeW8XwXrcQfPeLcHY+towj6Nh3h2O9UygFvnaHh3U/2r55Sa4iqfMyXN8EbRq6qEGtmcRzVu8c+uXZhUjGauH44NXdZEC2vUmR1JssZLw05iCAalPLSW7m7LcKJVxeSLhnrU9NLjqNrYuL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672926; c=relaxed/simple;
	bh=eLg/xfE9L4uf5NA59EESgWABT5YKgmF+DoFEsj5P+2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCiASPSxM0avRPC5H8sv1YBKRAJOt8YPILtZAZpBC2ld43NNNr92M5AwF56BoRopK0KJn4nJ1NVRx097AEqi2Se/KbdqHI3THX4hGamUFvWCHS3Vhj7LnDa9ZSFFskWwh8y2o5nv9WGEch2EWGInEUdq29gfbWERykdscd8868k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6HZm0/a; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6HZm0/a"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314f38d274so89068585e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672923; x=1730277723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgEgDyVyxHK+n1+lMp/O7AAdm5QoPSpJEhFz0fntFAg=;
        b=V6HZm0/apO52fm+3JXYYE3Slmm4jEFMraxfhRTgbs3e5np9JoYGc3/JOmtP/AC65gt
         bpbdCjai1axYBKbPRRes9lYtiB/ooXoVzk8s9bL02DUfV+Ge2WA8IoEd4KHcfZUjwnbx
         vc5wikwgzFVRuzcEiP1+LupB/dWJZ5shuXU5V7GjRFcMIm08mpzJOv7EhbRLcRCpjtXW
         l2QLEAK7Z+GndQMfSw3QlEs3mNpP0FCVeinCXf6Yi8Kbi16kP7SSQHH7dkLhdqr6wQhs
         VE1LyK2Pa377E6owVoqEhMdyHu/ceT/QqhB6U3QgrTDf3Owt1nhZ3xD++EExS7OQ1uYN
         jvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672923; x=1730277723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgEgDyVyxHK+n1+lMp/O7AAdm5QoPSpJEhFz0fntFAg=;
        b=T+EBU3NKtQU++K79tryJLkKaZOxTU3cG8i+hJotDzJ+Qj9Ft/QXfkF4jYkDpeDpCKn
         UW+IcKjPWLPfxIFWykJg6PJ3316wPVXfhRPnSuCW+LA/TrEC9ekyfibWQhVnjwsWuDnn
         uMZ6zpJ7O6BAlYx3cemXEp9mvpiuxE3leWiQgXgeC6qJo82ahULs0OEiv3HlXe1P+mpI
         MgUJMaV9gW2gELvurvnjKhGzPRQLvNGVgdtz2z1XBBYAZ7M3qG7d6NygHGkcti7WDxhD
         /OZU8wVuzF6XVl6mYTnXZdefwmfniENB6+Ytex/FfB9BauQtiWKHuFltnkpxhc1B2fee
         A2RA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Xq5JwcWLbE+gvG0ggM10PmQqQHD0GCZYh13SHIB3G/1vTQhopsrIN+R858crV7pIT9VfqmppEPmhq/qdC34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEK8pAYLnoCpV5tjKrBJ0s/RBQoZSAUdb/cysvR4uh/tGnJm9C
	6T8ce6yGUd7IgdX8o3vGRNXOkCHX4BTQ8fZ8ViKffZPBdAReycl6o8LvGhecwA0=
X-Google-Smtp-Source: AGHT+IEdJTPLU+KIutK3YvEYkbyMsNru7UMvkTH+o3ilss9qDJzDB/AM60d14OwM1KUZAzrdCjPunA==
X-Received: by 2002:a05:600c:5492:b0:431:562a:54be with SMTP id 5b1f17b1804b1-43184201b33mr18026225e9.9.1729672923367;
        Wed, 23 Oct 2024 01:42:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c1f86bsm9778255e9.48.2024.10.23.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:42:03 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:41:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] sh: intc: use after free in register_intc_controller()
Message-ID: <45ff88d1-b687-43f4-a022-4e07930cd2d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In the error handling, for this function, we kfree(d) without ever
removing it from the &intc_list which would lead to a use after free.  To
fix this, lets only add it to the list after everything has succeeded.

Fixes: 2dcec7a988a1 ("sh: intc: set_irq_wake() support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is highly speculative and I am not able to test it.  Please,
review with care.

 drivers/sh/intc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
index 74350b5871dc..ea571eeb3078 100644
--- a/drivers/sh/intc/core.c
+++ b/drivers/sh/intc/core.c
@@ -209,7 +209,6 @@ int __init register_intc_controller(struct intc_desc *desc)
 		goto err0;
 
 	INIT_LIST_HEAD(&d->list);
-	list_add_tail(&d->list, &intc_list);
 
 	raw_spin_lock_init(&d->lock);
 	INIT_RADIX_TREE(&d->tree, GFP_ATOMIC);
@@ -369,6 +368,7 @@ int __init register_intc_controller(struct intc_desc *desc)
 
 	d->skip_suspend = desc->skip_syscore_suspend;
 
+	list_add_tail(&d->list, &intc_list);
 	nr_intc_controllers++;
 
 	return 0;
-- 
2.45.2

