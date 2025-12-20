Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952041A0BF1
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Dec 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220377; cv=none; b=cp6D6TaltuIhC2ulvwAS11+Jxr5vZ9e5+p2Ds6MQQBnO4Zas1Uj7IleBWGtLaU8K2bjjlcGuN5qUTxQSLIwORzCXeN/16f7eyILSYDhHtMbndVzkt7GNEBVnEMUuF3wL4V2USHRlnRSjMlUhA6mum1LYYYGkneWBhDBNHhbdSW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220377; c=relaxed/simple;
	bh=GJz0TV3dGwznk2pjw9vchjZ3oHpNifJ97zBYxc0cjic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ejTwZUqP/rQagCqSLC/ypg5VjVRBhtYjAnbyJqbjGcqfF5qcTxE+G5Tbu0B11i+pFHcgN2EFEmIv26/oNphppe7yo1U1FMV9XZPdzzmhVTWejM4N4b7S3v5EwEG/W0OIzhjYr20X+pWA7I/P6gouIon1jqJ7mU5JB1gKRYzGbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rI2mq1wY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rI2mq1wY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so21811075e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 20 Dec 2025 00:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766220374; x=1766825174; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMd8hFhEdud5JNvQYdjzkL/DFZ3OGk2JIW+0oeUQ8pU=;
        b=rI2mq1wYV33LL/hVOGnUHEdqMy7FE74tJZZYDESVmV3uFFvgFyfcULvds93LXHmz0G
         fDPbn1/7LBHefYErleS8drDAR9+NLjt/XLP5/vsmpkyXuH8BVnX6kU6D2ErLgFMgMnmw
         4LpN5bDE2eUlTWuHvGw1cRRJX8p547rJNvHpsdnnIuDt+8044iaN1BFyr+HBOPGjaoCV
         iHTJMxSnFU1KPN2reyUN/jA/mujx6GYseQi/B8vKZjQw7Quilb/VCiDXwCX1lhYhkziX
         qeyX8Reb+FLA9d1T+FnnVLc38HvoCxjCR10xpZre6/DH0vG7717ThmL0FmpFMA/1Wqqt
         h9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766220374; x=1766825174;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMd8hFhEdud5JNvQYdjzkL/DFZ3OGk2JIW+0oeUQ8pU=;
        b=jug5jXUWOOKpn74vz4Lj9nbbfs3C9Nsbms9GsfisQUgwPIxu+qFmE57yZ/q52xEx0q
         ow0yNXCHa7bVU8gB40AEDo22F2DOyTbcRjvIW8z5XIRjo84/BEEDXDSOSr+M6wwawa9w
         9xD5NNXnx4OhCu4DjxHgbg4SK/Andhdi+x/DcBuKdkrvIGNwoCSmIr0tiqtKKmKQtydF
         ES7LICB2pdrQXns0rqJkfqsp1veHndPecQFJlYTEJ1YrhzXw7Z7p4VYjplx98Xx1XSU8
         aKzLl/fIV3UQnH7AutQOa55ePP1buKW/DqJtQzYyW8iHEU+gaCAEOJEFbL9Li1zR4x5+
         8Rkg==
X-Forwarded-Encrypted: i=1; AJvYcCVQqXJzlDRS3152D2rqEGWtQSA21lf6TW5+DHkhvayKseGe7t3w++ouSmEIs+yQXj994PLW4kxWyGfFEoqze4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKz6IGg6azS87+tqpmboyOZW68bgiX+ClTm6EMSeNG61HZfdwp
	51GHfVOFc1UcXiOhXvL91ZU+O/BkLlNDAGA9DcktBfNCsqAj0CiBD9oMciVk+63eUcE=
X-Gm-Gg: AY/fxX4xXmgCJZ7woW7sxat1wYwrb0HQtAj+tLl7iNkc9YEjgVPikc2Cz/drVH410ZL
	enFKoCmMoZDz2m23hbSV09diNOcfRjawh2UWuldxpznlplPpwjAqb8OajPTKZVnhRTctI+v58KA
	nUlwqqf0oQGbIdfxCmDguEFtTuRx1uYls9kFZY6TQ/FcyON/Ft3grId7hhTuIMguO1QrqoBKfy+
	XAbcQwi1m79q2TOB0a6paE71LigUp0TfKaeaWc4/vGfQKJXB1Njz20D23wSNIWQQvtTFT/fAIW9
	XaJCX3UjDfcStw//OwQhOyLDMKlb7ohcZgqHDw94CpschjgC3vsWpM0kyZe4ql2YtYFI9IknPT8
	ZC5oIoXpdXgebGefYClR0F/+O8382agbfoOPpxd+Z2/LNNJdITtfx4Jr69TkWQu2Vl0WatPSdDZ
	lNQ668avjFccjxrFGL
X-Google-Smtp-Source: AGHT+IGRYugwrsODSO161b7aXZ0dgJ/paBxDcbXlBkrr1+MKuen7cVrZowP77Fgt7jWv7lc6dZre1g==
X-Received: by 2002:a05:600c:1d1d:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-47d1953b8acmr52521985e9.8.1766220373854;
        Sat, 20 Dec 2025 00:46:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346e48sm79604965e9.2.2025.12.20.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 00:46:13 -0800 (PST)
Date: Sat, 20 Dec 2025 11:46:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] block: rnbd-clt: Fix signedness bug in init_dev()
Message-ID: <aUZiUjcgaOue4j9S@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "dev->clt_device_id" variable is set using ida_alloc_max() which
returns an int and in particular it returns negative error codes.
Change the type from u32 to int to fix the error checking.

Fixes: c9b5645fd8ca ("block: rnbd-clt: Fix leaked ID in init_dev()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/block/rnbd/rnbd-clt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rnbd/rnbd-clt.h b/drivers/block/rnbd/rnbd-clt.h
index a48e040abe63..fbc1ed766025 100644
--- a/drivers/block/rnbd/rnbd-clt.h
+++ b/drivers/block/rnbd/rnbd-clt.h
@@ -112,7 +112,7 @@ struct rnbd_clt_dev {
 	struct rnbd_queue	*hw_queues;
 	u32			device_id;
 	/* local Idr index - used to track minor number allocations. */
-	u32			clt_device_id;
+	int			clt_device_id;
 	struct mutex		lock;
 	enum rnbd_clt_dev_state	dev_state;
 	refcount_t		refcount;
-- 
2.51.0

