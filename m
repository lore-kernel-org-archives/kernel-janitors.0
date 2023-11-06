Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6352E23777
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWkqTceX"
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBEEBF
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 06:04:39 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99357737980so675169666b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Nov 2023 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699279478; x=1699884278; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8fFJp+6thPSgTWdug5tZ/JbqQ1yt18b9c1a5sYRCho=;
        b=mWkqTceX605aszjCuQ3djv2+dKQeuE04k8OBtwKIsF8swqRezIMN6QM+UP5592YKn/
         8birCkGT0YCJeZafYBlKDUIXg5wi9knWtLVNgt/dd9HZKiON+nDMaWiTdwrs2608c8Fb
         NkCuYrtOhnK2W9x6GQFncvmdYf0N5E0tpf/r55R4eAVBnC2be+UXZ8TCEToCZMITEktg
         p655g6Idq443Lv7mQ8FD1HIin1KCzdfaWQqt7V6QeYVAaHcONaYMHluPzK0HXtpKaNSc
         Rpnm7cHFNyVHdUc+V2BhxTP4+TG5wjGekGvt9QgxTbu2PeGsWFthZdb+AFV56l0yzVKB
         FyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699279478; x=1699884278;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8fFJp+6thPSgTWdug5tZ/JbqQ1yt18b9c1a5sYRCho=;
        b=gIYrRbPiRU0kbtDC/bMqUfhGyXD00wlm/qNjy0vt56QpXd/6LALPM3j4897gqY3nXh
         zgCx9DCuJFoOjbLW15QQPJGqpawQ929cacLt4rpU0/WBDvaLtoi4d0p4WlHodDGLrL8o
         ygET7j6RoJrpXGBAR080n4TyaGzFPTfJGkk4slFFVkbl5Q5rHU5wcKq7iNRUFzjoow1g
         FzWiPRPsNfmlXwhuVT6L8IPO5o4YrTiJix4QSqIIOX6Gks6BAA6Ibl0GAJSxtmRf2Ls8
         C9JcLEfOWONrPM2M8wxW75YkfePrKh8THYVnsj4naQozefbwtkKhW5c22gBMKsNtXLvD
         yGsQ==
X-Gm-Message-State: AOJu0Yz+b16SYNDbrQawdkp/jNsuo/2juas25jNuY5srR6Xf/2LDanzt
	XDiuYQQ0h1qmqK3L02IWA3nKgA==
X-Google-Smtp-Source: AGHT+IEYSN/SDYqcdexC3uheG8u1o/CHFCDzFFhLGwA4BcqeG4BAMwpoOZJ0wcjNqkPyHrR3KCVRsQ==
X-Received: by 2002:a17:907:869f:b0:9c3:a193:2580 with SMTP id qa31-20020a170907869f00b009c3a1932580mr13858512ejc.12.1699279477984;
        Mon, 06 Nov 2023 06:04:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id mc27-20020a170906eb5b00b009b928eb8dd3sm4144123ejb.163.2023.11.06.06.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 06:04:37 -0800 (PST)
Date: Mon, 6 Nov 2023 17:04:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wenchao Hao <haowenchao2@huawei.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Douglas Gilbert <dgilbert@interlog.com>, linux-scsi@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 1/2] scsi: scsi_debug: scsi: scsi_debug: fix some bugs in
 sdebug_error_write()
Message-ID: <7733643d-e102-4581-8d29-769472011c97@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two bug in this code:
1) If count is zero, then it will lead to a NULL dereference.  The
   kmalloc() will successfully allocate zero bytes and the test for
   "if (buf[0] == '-')" will read beyond the end of the zero size buffer
   and Oops.
2) The code does not ensure that the user's string is properly NUL
   terminated which could lead to a read overflow.

Fixes: a9996d722b11 ("scsi: scsi_debug: Add interface to manage error injection for a single device")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: At first I tried to use strndup_user() but that only accepts NUL
    terminated strings and the user string is normally not terminated.

 drivers/scsi/scsi_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 67922e2c4c19..0dd21598f7b6 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -1019,7 +1019,7 @@ static ssize_t sdebug_error_write(struct file *file, const char __user *ubuf,
 	struct sdebug_err_inject *inject;
 	struct scsi_device *sdev = (struct scsi_device *)file->f_inode->i_private;
 
-	buf = kmalloc(count, GFP_KERNEL);
+	buf = kzalloc(count + 1, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-- 
2.42.0

