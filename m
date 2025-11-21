Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E2A34A786
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732088; cv=none; b=grNaxYDIU8hibjDvPuAn5o16OAAp8RqzXJcy5z/+O+RHVVgf/HNxufxvJvJpBq8am74esPnf+jiTe2XwbKCPxhMFwzrvQ/px62/0HGUta79+iC8e/IWaHZRQcDbGPf4jy0bnem3Sxm3nbSDhOlolFBhxIu/xHDKr1quO+uUnBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732088; c=relaxed/simple;
	bh=pEJOqtWaAMxX/RjbYX+LQL/3Q83rckcnVW180CH61w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3Yxv77yMtLkCwwEkyXUTD/+ow7Cj/z7/prvfAQhNmqAOVNuIuM9mBKfVMb6W8bZzRYQrNf6bH//3kfCskZLGNhE5aZOG6XNTAZhZMhAMz+E2xZADc0vyCkSpIp3/RWmrIWmKMkpxr6AYhhw+1VSVC2XDmNKhr86R1MD7rxsETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qizInxF3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qizInxF3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so13584355e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732084; x=1764336884; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItpimcDMwBpf3e6iMcEO1lFFMQ331Ene036H++NMK0o=;
        b=qizInxF39Ashm1clWSvYhA/nid8J+z9MsHlgEuNdhYz3QcCo9r67Fs1HEE/7N309cv
         0aq/Jl1QVK/LAzhQ1OG107+1X/732utyRR1LLh2gzyylzPuf/y9yWtXYn9mBSDv5ILLE
         c0hm7LLPqRSOSBUI5GUQO0F7mC4UgxRrqymyBUDhlG0nEpl7HVl46vzqFC5mkcYxfL0O
         2U+uHF7D4R183lPSxovbnuPStwkWhu96TmFNY74aEjMUxYIoVvT0VGfzB0FAH5+hQZFI
         6QdW0fuhaRu86wZIffl7nBe/mBXA2OrDuZBmf11AsyBRE/45tPSnFMnOPNNlf896tuuc
         wMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732084; x=1764336884;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItpimcDMwBpf3e6iMcEO1lFFMQ331Ene036H++NMK0o=;
        b=l5wvvbYpWb/KmDJLWTf2yd5X25g75gwte8k7SSUpWvmoIYfbikaLX2dRe5zQEVsytb
         Ekohx1gnMV8DfASRxnfXPcsZYO4obVqBHB6fPBD6uTRNxdXq/qEuRt2pH3yQFNADaHM2
         NizSckP5+oFz2zNuF0sMLA/Oy5okhP3+PpppIn6/JpwbZKAF6OsXb9R9gWZjioITu9Br
         UKqGND+KHxeST9u8lOAVbZpmdWH7Ge7dY49ElIot8F0XotHBawrj7b5IErAvK+DlnbJG
         mZsbbm2YTqS44TD1FYLJgwjUXXlInWrawa2ZtaiXq37JlDLTigun3YC+xd0YQ6dnugva
         Z0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsgufk32zOOzCrRj9pugReavCT6nKQW28WQFSqbTPKiRdTbqqVQEPB8GjHKQLOS44fEvJZmHHm5xbo5F23rkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17McvzBINqVakn2RyCEeuxMeL/RTybZSbjlpaUKCiH+L8szGN
	Rt4zTCHkI70rRQhFohv9XMN/8L198CAPH+7M4EY2O4Wr8Ri3VvJmOs85Ulc9+AzMP0M=
X-Gm-Gg: ASbGncuy1gWZ/GJAIaYOzjOSKeZTSOSQFYQUnugmQNqYR88X1BMawY4SYJ3ISpBU46U
	3WIlBTzk3HLZI3ryO0aTkCZLFAeb8RGhQYzvWGxfr3BzkSOH5RsBziYc18GtecykJ39BJmPETMw
	+nD7cGHpL4/PobSvXzKemX19EDa96+PgNxhe75VXfzCvcf29MuwAaiDjuEhWrAJviqFiiYOzkWY
	r3GlheBDXH4ZwRwR/fKsch+f/IrTDe/bvqsref44Wz5mZ8JlDDBFO4n2hVRJlCZ/Xc7rZLUNVuG
	f90pijbpxv37V9A3qZFP92z9e7SLa+XsRIu7pMLvIFDImcQg83dgSfz1NO7OJo/oDXBqC7qjN2U
	7QcQUFLeHu1tyP9ffVS0c9tCfc388hmvUqRB+vlcF5kRAagksgdhLDPo8dZBJwyphqgpOpydAar
	cG5oMXSAYXZjp6eRCB
X-Google-Smtp-Source: AGHT+IEvAG0kvRQXJ4DftPbJm2c/FLmRyERE7abWjohM2Uj6l2300Y8ANnBcMHQWGUKmBjDJ+g5NRw==
X-Received: by 2002:a05:600c:4509:b0:46e:206a:78cc with SMTP id 5b1f17b1804b1-477c01c14f9mr21963585e9.28.1763732084209;
        Fri, 21 Nov 2025 05:34:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9ddef38sm88119155e9.3.2025.11.21.05.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:34:43 -0800 (PST)
Date: Fri, 21 Nov 2025 16:34:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mahesh Rao <mahesh.rao@altera.com>,
	Richard Gong <richard.gong@intel.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware: stratix10-svc: Delete some stray tabs
Message-ID: <aSBqcEl5y5fqF72v@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These lines are indented one tab too far.  Delete the extra tabs
for readability.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/stratix10-svc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index b91f68d9ae98..59d9f588d9ee 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1316,7 +1316,7 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
 		dev_dbg(ctrl->dev,
 			"Async message sent with transaction_id 0x%02x\n",
 			handle->transaction_id);
-			*handler = handle;
+		*handler = handle;
 		return 0;
 	case INTEL_SIP_SMC_STATUS_BUSY:
 		dev_warn(ctrl->dev, "Mailbox is busy, try after some time\n");
@@ -1701,12 +1701,12 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 			kthread_run_on_cpu(svc_normal_to_secure_thread,
 					   (void *)chan->ctrl,
 					   cpu, "svc_smc_hvc_thread");
-			if (IS_ERR(chan->ctrl->task)) {
-				dev_err(chan->ctrl->dev,
-					"failed to create svc_smc_hvc_thread\n");
-				kfree(p_data);
-				return -EINVAL;
-			}
+		if (IS_ERR(chan->ctrl->task)) {
+			dev_err(chan->ctrl->dev,
+				"failed to create svc_smc_hvc_thread\n");
+			kfree(p_data);
+			return -EINVAL;
+		}
 	}
 
 	pr_debug("%s: sent P-va=%p, P-com=%x, P-size=%u\n", __func__,
-- 
2.51.0

