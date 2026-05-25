Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687863C4B93
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693322; cv=none; b=fS5pvwcQ061KpwjgEh/WIXjqYsVSQ/VlSdXiOnn9utZMDjcfyqgDEIiis4Fi+s94SZpCTUWtVcGfr4pElXP3R77gXXeSKqOysgpk925oKxO/fSSv7DkGnWk3mGnFiewoYyx36g4paH+8ivy+ZPOOdhp32fq8RJjm5jWZ778Oktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693322; c=relaxed/simple;
	bh=mZ4KnxOox8XVDHY1nDh0/a8GjdvSDmvGTIyanCnS7MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXX6x7GViYoBoivL2JozVx1ii5ZMGtYBUPT+4oPJ7dOobE3MiNDs7yeQWvN8OQzXh662/IoPXZzBTeYooOUZ/fGy9QpxWm4mmlz+thNqIyAbip7f7F9+ln0gCk/H5emRliT36v01OR5DpTNAmo8awDWsZ4+VRN2OILOcxk0XlWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5kGxe9R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5kGxe9R"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903974854dso32007815e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779693320; x=1780298120; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47oa6+bWcTdZtRyJkBYrwULdTRG5mV9VUpeXnfu9Pl0=;
        b=g5kGxe9RYQGtcMrjBYQ/Rb5QZHkPY7D25USs8q0oHmHMqphXLXGvitgte9f9TSYa/X
         njI9go/vXdx/GOQGHzKeQfC5WGYKzHet7+wE89n6uORqc6soo//r/DpC75u2CIH17nyS
         axtD86txzWDE1wpihQitq10h+5n7g60WJBQruqse1/WRb0EaUjfacgv2gMD58AW8H2Tj
         tJVBu9jNC8CTeC1oGyX+6VMXkMFouIvzDGPX+VbebzfY3NZI3DGCcASgnTeQbRposAXE
         qhSjI9n2jp+NgAIqR60M3s2itlSK1FE4EchK4+7+l4QDuDio5+U5Ls66CslzLLkOiep+
         Z4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693320; x=1780298120;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47oa6+bWcTdZtRyJkBYrwULdTRG5mV9VUpeXnfu9Pl0=;
        b=WcoVAPTat3XqYnmkwhmbqm7PKXSQDlNQM2Rjk4Sl+axnRJ49LDjctLWVZzNOMhGTle
         53XBYKm3RorWTOsgPgtsIaR90g1G1om/cVK+btQOOyXzYfUjaDc++jcx7ANE2/jjcxc7
         cYLM+etKVJytabJI6qdLpkFhEwnU9G8Wx84AeKgkYDBM26ewuj937eqw8M/HfgIudjTW
         0sbC+FJj3g/jclCqFsVAFgz8DC+7EAJMArx8b7eY3TU1DVys9JkAFgmgyE5UiTuckfoT
         HEC9i0k3zV9AQmLl+1AexEfUxaWHh1pP1D9ZHcLdngAhzGJN5u1ENjtFTOoSE1TL8BWj
         lf8g==
X-Forwarded-Encrypted: i=1; AFNElJ9UamXM+rvVAB52yk9oHHXV6zaHQsuiPzlF4IRdBtbMIrk2JMmlC18d89sNQrfHzAk3jScCaartVRLdZMrgdCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCrd1FbH1ieqmN0pqqXTsGDblFshDi+9Ne9H/QXWp36ZlQcfhl
	YXxS4WZ7P2Rsg4Sm8GtqxWqrGWonQXjOZEip1DEys19YeDx4E+uw9D59
X-Gm-Gg: Acq92OF98nPisIaTwvHcWF2+o0FPe4N3d3PSEjXVUfHOcB3MuDXFckmgWJVhoGhOmbj
	McBfbrqjY9oIgfTqCZHM/FpoCETKA7VtCRPZsKVsH1DCxLBmf5Ra06HrO2j7RpOMcrSyLuN5914
	/R0cgv5j498erAPRCsB0dTKTWcvlRsjlmUW2R8tSwhZODb2V9C7lFbnIwF44KUsUvy+H7ze5sYa
	+QbHiPiAuIHyAbzTDVHX90jniHndkU0sR1R0AY3uq81v3B0vVTFOTFOqhpudUDE20iFeSUWLXfm
	j6JvslYm7mrKJPdnY4nnjRS4RMLqeeoFXcHkJQeO9YjpuNL35ma46GZusvs/2MIAVM7EGEa497e
	m+ZMbpyRDDO5djdXt4GaOQBIy86mJsTRc4cRxDmRTCxAo58ykG6KoRFXCbEBmFjWQ7iBQ6HVwNd
	8uPoaBlRvyDmnpStu8CAzf0uJik0XfVGGhxQ==
X-Received: by 2002:a05:600c:3593:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-4904225ae0emr248431945e9.0.1779693319595;
        Mon, 25 May 2026 00:15:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49044f2bad3sm244022805e9.0.2026.05.25.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:15:19 -0700 (PDT)
Date: Mon, 25 May 2026 10:15:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: virtuser: Fix uninitialized data bug in
 gpio_virtuser_direction_do_write()
Message-ID: <ahP3BJWWy-m_qI0X@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If *ppos is non-zero then simple_write_to_buffer() won't initialize the
start of the buffer.  Really, non-zero values for *ppos aren't going to
work at all.  Check for that return -EINVAL at the start of the function.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---

 drivers/gpio/gpio-virtuser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 128520d340d4..846f8688fec5 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -397,7 +397,7 @@ static ssize_t gpio_virtuser_direction_do_write(struct file *file,
 	char buf[32], *trimmed;
 	int ret, dir, val = 0;
 
-	if (count >= sizeof(buf))
+	if (*ppos != 0 || count >= sizeof(buf))
 		return -EINVAL;
 
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
@@ -622,7 +622,7 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
 	char buf[GPIO_VIRTUSER_NAME_BUF_LEN + 2];
 	int ret;
 
-	if (count >= sizeof(buf))
+	if (*ppos != 0 || count >= sizeof(buf))
 		return -EINVAL;
 
 	ret = simple_write_to_buffer(buf, GPIO_VIRTUSER_NAME_BUF_LEN, ppos,
-- 
2.53.0

