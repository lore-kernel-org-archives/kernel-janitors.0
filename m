Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4ED3C1F3A
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693293; cv=none; b=FyATF0FuZ3hgrV4NlqWWcyLIPbFB9MyZg410jJ+Tp2z0Yi7OEMqwgy6i86vkFN8glmEAW+KJRdQWKqXt32D6bW+0RDJjnQZt0N/hJ7WmY7yCFU+/7jXQvEqgERa1F0Kfl+FKCSRV1rfDoa78ShigVJ5Yh3KGQbAEg0EI3c29P1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693293; c=relaxed/simple;
	bh=1xXVGaPB55QHeEo8SAN3bkN5O/LMUFsXfkgs6gm+HdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRSvNBYlI2TvIKp5UCFh4mqY659Z/wcZUzUU7c+XD/c8ZDAGYf6EMUhfTgQUzMfViMv9Ap/dngVUnTxw4mMXtoUQwU83eY06/h6dPvHPAiWf5e16SPc8MB/r94RAoAxjWjOrSIrXv/or6a4ZfJJWzVC8miA7wyegn87PvCU5BFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXBqeiWf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXBqeiWf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490686877a1so2269855e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 00:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779693287; x=1780298087; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5YPxs0JzfTvXLL6qyKCCkEFV46IOQigJmqAvNQ18D8=;
        b=hXBqeiWfuUtjshM2blBevtFzsNe0l9/RjzwpZInEoOPJtgzCzmSCnaBWLhnSLEjsh7
         LsqXzVbdSDfXNn6HLEdNlU7crzS7CiVJR9IRkGONRCLWegNoYIymfIN8hv14n0tUqT8d
         70CRkV1V8SWrQbPX2gn4XqAZ6PCBhgV4l5PUa+lM6X5ELCw6/ieECwYSJ+oziaOcgr3F
         /vNa1hIXnT3DCEO6LI7h7csgpsB7f0SV71jsHdtgWrg3A9XW80DSndBJ3gKTc6TgEF/R
         nm8w+c4Sogq8np8mA7HzhUkvl3Ygo+7ssgD6vqQnOBQVIgOQ9BQjyDDFHcmTmUTaZ2h9
         Gpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693287; x=1780298087;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5YPxs0JzfTvXLL6qyKCCkEFV46IOQigJmqAvNQ18D8=;
        b=hgqw1IW1GVxP/YAxLc8VHxPZDjvsPBMxYQU2YryFf2+okxdtg5NsSpMDv/jA8XvbgW
         MFqBM4Qk7pROXa4B1k/v2gkSh7ARDQ9qkS2QSpHEjVJEYNscinSWcpmD12hah7KPuK+t
         sQ2HUguITbBv1bWMfkq5oagPWwhwYiW4B0gSpz/RWwz3KOanKif3IdER2DBuRYV8kk5Y
         yRVQSoGidA4GnWMEBc31AFejK7NEEV0jmoB44JxLvxIyY5zyF6hb2BOh7ABGMJQFEA26
         KXmn1tO4WLTzeXEVOjYCrHqlPXCpnNI7n7mqypAdhniwlHqwMUfXBDVBeP8krKy/HWv1
         mA7w==
X-Forwarded-Encrypted: i=1; AFNElJ8kSjIWc42MHZlaN/yflql73ZA5j7eMP4iqwunHVrI93xbX4vnG1xeTXqyR9s1nULdV+IbFAm0t3UF1qlDRjUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOyCZ/GHU8r9KwZ+SdoQjacLbLpgjurNG8wcy9wFjn1VGF5vU
	1p81+6/BF+zdExtvWv5JxIngiclR8N2IxHEBmbbavx9Vqas56ZBr0CPJ/EZklw==
X-Gm-Gg: Acq92OH59uImTm3z8PFU30QudolWE/USxlKcVdlM72DVQZOHoNU5vyT7lKWB3DX+8lK
	4+IN8+JZry1ak2dKFnAqceJCl7WeEoM7YCgPL5gR5SOnkN3HoI1RoDCDrVqa+ZLbP+T/EjTUdUO
	V6TN0MhbgZLabAGt0E2g9Djyhk8v+XNjZHtI6azOj8Ojl/pFnpA07fnkdwrgVw5JchpMaIzct9m
	Gissii2ZrPMvH15S85tnjoqh54d2aONnb6XfhYFlJljkZXU8Nkx5hqnjZEnP8RQ3Y4A52agVnVe
	Y1WSi8dPpj4RPM8qu4lBOdVmMiILbDbcZb0recDbMeAV1CyLaYcIuHzHFpwftTYjQXSSCi0P2fd
	INmKhYlg/w6R+owGRPd6bKrFFkD8UT9mlCM9RzLekOUrMcCEWx63qlxToWCA3sHv1ONo80xeR2C
	JuwmMP7CObqd+90/4xhEW3sts=
X-Received: by 2002:a05:600c:8599:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490426ade02mr136310365e9.15.1779693286465;
        Mon, 25 May 2026 00:14:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ea134sm255601535e9.8.2026.05.25.00.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:14:45 -0700 (PDT)
Date: Mon, 25 May 2026 10:14:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Karol Wachowski <karol.wachowski@intel.com>
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/ivpu: prevent uninitialized data bug in debugfs
Message-ID: <ahP24m6Mii9EDL7Q@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The simple_write_to_buffer() will only initialize data starting from
the *pos offset so if it's non-zero then the first part of the buffer
uninitialized.  Really, if *pos is non-zero then this code won't work
so just check for that at the start of the function.

Fixes: 320323d2e545 ("accel/ivpu: Add debugfs interface for setting HWS priority bands")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 189dbe94cf14..dc20bc73c6ed 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -450,7 +450,7 @@ priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t
 	u32 band;
 	int ret;
 
-	if (size >= sizeof(buf))
+	if (*pos != 0 || size >= sizeof(buf))
 		return -EINVAL;
 
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, user_buf, size);
-- 
2.53.0

