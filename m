Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1982E3A963B
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693352; cv=none; b=PVu4rYR3i172eZUp7FGdq/fgM7TLv2CqKfumCt4gaXcXkDP7I/pGGewHI6o1JGPNc5Opds9ciKc7H8vT8cKwXUKSLo3pKArCkalRhr01rxN9k03NLKymeM0W/GZZCwXts7K/tTPHeZQ9nWDZHpVaQ3tYlt95qyg8FJC4UTj8IkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693352; c=relaxed/simple;
	bh=YegoUY1WOra81ZJDMWmsFQL7QyD8XZV45AdFQTMRDlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EsDOgl7b0QnIZ8ut2qm6nm2ezgxMBJYnk+szu1sRo8BJY7txkW6O9BccKnc3ZQHwIfhYuTi5Dt7Vn1BZUQF43PzwhNOYTOY0fD5Di4XnQxvN87H5EmYctGQnfAs4e2wj0BUVaQ+e4tByAUDxI6YPHTK0qWFsRHrn4Egaw2lYv4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ex1VZgbD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ex1VZgbD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4905529b933so10433715e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779693349; x=1780298149; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4IiAvs5dhCMh+Wco8JSSp9GyVxeLnxNjl/psVDXbZs=;
        b=Ex1VZgbDTEpykX8792C59n1z7SZQFvBpT4H+tYeCj4UhRZC/2ML97TrQhp+TSN5TYu
         PklbH6O4NSlkt5ag8+cUvRjkqYySotXsqFXpMj2aIt1xzr+IjUrZA5xay1FATTLQXXhK
         +S+1nGXR/NqOUrJD5aUwIYJivWUZgBWBYWFeZ1CM84xPSpCYODqKRa81oZmwHPuhkAbk
         QKAv9yNERr7WhygBOCJktGbO3JK8lxXSTnPCHbDhcI/uzN1TFnZWDpuoou1NGn3JLUKE
         Amrxz8NaDRH4vcMEtbJA5o3tjgUA5MGLMjalVuajsDpsK747lhxMtbX1nGJx92t1KaOE
         HCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693349; x=1780298149;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4IiAvs5dhCMh+Wco8JSSp9GyVxeLnxNjl/psVDXbZs=;
        b=ekSInoNf0Pzxwx310tGfc7A6rB0pB/frrTmC/6OisceMIQUsPOBBOf1Qk6kKmHYroF
         peVXG9Ds2UjrZ0Bpl0xs+yB++faj/Z2zb/T3tF8szLmtAEsQXtWRFGpzlgsPBRD9zgAS
         4ij+tMqn+ZvzUVTgDpflWBz5GfoBq07T6qJN8Dz79r4AKENRIMQz1af54Yz6GpyLQka8
         zEc7LeEnZNMzlUDTXDEWlYReDMgOMdUbqKmMF/yYrxNIoVY68vL2Z9EU0mC0JOYb+TOf
         Lxbx9b8NtZvMhqjls33qlLArQiKkA/wJ+zFGEhOhCMe96XhFEEFkuOeqSQphC51zfXC8
         Bl1A==
X-Forwarded-Encrypted: i=1; AFNElJ/zpqBkMvNRfCDB1RSThXsNjZeiH2i+YjvIRvHoA4Yl2+0ZJDYUBnIqrscQvYzI3nlZUTbxlAb7i6netJzQGVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXbChAaYor4psiRWC/vL6ivWlXIt6VlJpmqB24yAtZJVSgX2CP
	Qfjecf5PLh6oOMUZsUcKj8b3QscPCdHRk970NDm8ZBGiuYJRqlwWDwWYlgZjtQ==
X-Gm-Gg: Acq92OF4Kuyt4UgkkpzJQp8prFFqdjuGRScQvcgfX9H8OyFK1MnOM8+0+GPXhVFJsgG
	i/Py0GjVR+gQMVjvnoaNr3wbyDlqUBQRBsM8Q0wdZiE4DoxFfxIDS4QUPyDI0D6bgILruNxFSXt
	dXbaDRpgSjtMHeECznAtIeLGFbaO4rzMhj1smxOw2onV3PWwvizN5zVHe4SCWsphwCtk17/ahMo
	Jn3PSpYelvuO17mQdlMUZKggrKpBKJFfcuUhLK0uPL3lzwJmi+pYYbimq221/+16mugQh0LdJlm
	MKZCkylbSSC+fBUleZeZ5gTOO1nF8pmOi1ytE33r4uijO44ziD/4Nfgp8TIIhe3zf7vggjZKiw0
	lNZS3M8k2EkgyIzeYaeYSzlptFfVdVFLfD4Lyu2ucpag1jacfR7bsPsdqKkiDkXb4xr1MNskktn
	HxhkZBA4Zk6WgAXO7Tjcd+FyntsJd7RG7DOw==
X-Received: by 2002:a05:600c:a106:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-490426dcb09mr144718745e9.24.1779693349423;
        Mon, 25 May 2026 00:15:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm243462295e9.9.2026.05.25.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:15:48 -0700 (PDT)
Date: Mon, 25 May 2026 10:15:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux@analog.com,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: dac: ad3552r-hs: fix uninitialized data ni
 ad3552r_hs_write_data_source()
Message-ID: <ahP3IjYJ87bNc1De@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the *ppos value is non-zero then the simple_write_to_buffer() function
won't initialized the start of the buf[] buffer.  Non-zero values for
*ppos won't work here generally, so just test for them and return -EINVAL
at the start of the function.

Fixes: b1c5d68ea66e ("iio: dac: ad3552r-hs: add support for internal ramp")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/iio/dac/ad3552r-hs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
index a9578afa7015..6bc64f53bce9 100644
--- a/drivers/iio/dac/ad3552r-hs.c
+++ b/drivers/iio/dac/ad3552r-hs.c
@@ -549,7 +549,7 @@ static ssize_t ad3552r_hs_write_data_source(struct file *f,
 
 	guard(mutex)(&st->lock);
 
-	if (count >= sizeof(buf))
+	if (*ppos != 0 || count >= sizeof(buf))
 		return -ENOSPC;
 
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
-- 
2.53.0

