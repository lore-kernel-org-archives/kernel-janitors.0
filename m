Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7301F3ACF07
	for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580907; cv=none; b=YTRNW0XurqvDOiHMz/tSLewcwF2/Hn/RDr2ELkEKMS9XGjJv3Jh7Rppl86TLuNXm4yP3NBCmUGZLb2jb+aGQ0NaPesYrF0TjKho1oGsMM0Xwpp+/Y4gSbGwow743l7ZLifzpmvICD1O3m5oN6f5E5uJmG1Qni/PTJtxIsjXulUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580907; c=relaxed/simple;
	bh=2QRlf8TtrGAzb92WjSJ/VIQrumsR9VRuS8WfIgv/fgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZvkyoCU/7oRz95TA9ag9uZ/aOxMmzlDU+Prv6RqKgHh41CJjwEhpVWyYNVzdi2hWbZsq+mqdbP+khTsQUKWNw3DXUo9eeUBkYLlENQQjYPIYr90axswQ5iPJxdd9JEJvU5TwI2O9Lu7q5t3DDByTCeL8U2u0vmXORrU9Qrhi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNGtVUl5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNGtVUl5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48896199cbaso48176545e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580904; x=1779185704; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97EuWmgETgjG9Q2E8S/+pdJDfeJXRUroPOhRTM16Bbw=;
        b=fNGtVUl5V0yQeAvjNKNksQMHdi27P/StUu2N5oKPw1hTwXb35bjF0awDVxtQLxAXmk
         6LohkrGJqZ8Vn7BpNY9eeRISpK9WQtrJoc9mhz5LWCla5pP+ukiAv6kUSdTQtLvuG3lF
         ukrpyzHRUESmtqb4zjuPmVCsxswCtDKFdNc8TAc+ECSu7w+76EWWuqB1g8BIREyTP+jx
         Gd5QN23qWZERUDuPXtVKafDlGEdVDvzXQUQSxUNUQeuaL2mfAq1YvxDR2dPYXzWzlPrH
         e+/HHzRDlFNNpKS3H/vvEnxLwnQXOXai9eUzJcFY/4FBgKdWjMkcjJqIy20g6HIEEHRh
         MBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580904; x=1779185704;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97EuWmgETgjG9Q2E8S/+pdJDfeJXRUroPOhRTM16Bbw=;
        b=Su+gxJmOPUUChFwI7P0GyMPkPWm0yg8vrXdO40h4RZ0cmpIVVeIEYmguSq+blzXoPV
         7VMHCrOxvQNbbL694uAie9nMNh4bQe5+j8gxmIpqgQkqK8i7ZXk8rWxuPjB3AgHsz2C8
         sutQAw2mFr25WnWjDtpqX5ZDJ6BZlgXVYOPwjsC8SGeJDe1SQALDs+JqNvKxRSQr+P+G
         Xvdu5sqNjvOFJ1FoANLed/3vI3INAAvF+r737Cc3d49X+j731RGldvbuOUXgNJQug174
         AsgUTAqrPCkbO+Bwb8+yephDtbSwOLb5J1RrvVtpRhpPFBhMpaxkPr1/FDUZ6Gq5Wal2
         LSJw==
X-Forwarded-Encrypted: i=1; AFNElJ8Yo3BX8wn1Z9dCf7ON5Q/Y8LSyYtrSsN0MhbnQ+c6y3ZMXHQhK5UfGXhCALd2bDbcG8VvggHEOufTqfhVx3bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTiV8/B9d1KRYudCpKy8cYRrtb1ZDvXIQcxl6NZ7xB8GTLh7OM
	wm7Z0WwW+XLapks/xSsbGRuud0NqIhbTnkiztp+r+fkNzw7Nqdt3nmeu
X-Gm-Gg: Acq92OGxX7n270U/9/0mXq/lAslv1bJtcOINQblQnrNAVdAqXdkKJ9jmawjzfqeagVk
	/WsFgcpnGmW8voy38RUItQ3IXkYTP1sqp1sRCPAx189b5rMna7C/KH6FC0Tnv/AVzXjFsK+6+pd
	VVm1RqJtfCm6OcX+VNg+Eh878EouTMAwIm/36w7ClOYzh7tTI3RNaVSVgMi7icatgpoLnQ5z0L9
	y7iK2IAYeKmFnzwnnZgCY//U6ARKVm/mqtzzDkgJLMezIHJe++OGhrO5OSvGDpPlntjwcuMzrQ5
	CDje5/6t1x2O9cgxZG8REUeeuCBzePLQ4sePdBteBs3Gu/YJbEtnBtCgVD53llDVJ33IObntcHH
	ATCdO4dS8IGRuJQwmGiMViXfCCj6Z9epfu1vkNVnuXlHPT3AmA+mr0aAZMWhuUYMm7vZfIHQltv
	VLaEwChXve3KFX6fOsOh1P+lv3TivwIw==
X-Received: by 2002:a05:600c:a11a:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-48e8fe011a9mr27551855e9.0.1778580903550;
        Tue, 12 May 2026 03:15:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9052c7dcsm39585415e9.2.2026.05.12.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:15:02 -0700 (PDT)
Date: Tue, 12 May 2026 13:14:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: typec: tipd: Fix error code in tps6598x_probe()
Message-ID: <agL9o7wUK1dOVBTy@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code on these two error paths.  The existing code returns
success.

Fixes: 77ed2f4538da ("usb: typec: tipd: Use read_power_status function in probe")
Fixes: 04041fd7d6ec ("usb: typec: tipd: Read data status in probe and cache its value")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/usb/typec/tipd/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 43faec794b95..d0b769333bd9 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1835,6 +1835,7 @@ static int tps6598x_probe(struct i2c_client *client)
 		goto err_role_put;
 
 	if (status & TPS_STATUS_PLUG_PRESENT) {
+		ret = -EINVAL;
 		if (!tps6598x_read_power_status(tps))
 			goto err_unregister_port;
 		if (!tps->data->read_data_status(tps))
-- 
2.53.0

