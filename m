Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856CE1B4153
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741636023; cv=none; b=kV/mkRjDcZAMXs1PnMKMDnTRnVCv2d0ISt2s6wtPGajZy82tW5uWi9OCi6MFwNYf9Dur/MkemZkFkJNQV3hQ5gMwSKz4yNZKO3NAl/doq11aR0JKc4TiEh2Z1PfxukiXn8WbDC9XfwScnVVvjSyDX3O4PxCOGbB944smHlN1SOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741636023; c=relaxed/simple;
	bh=aiqYQfMgtVBoT+W6uheJpa+d5vkkhkEs8dbJPBMcziM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZF34uBmiVcahgxoPIEWqOgvBlNiwLV+P/4XQb9qjvw0ufTvW5xJqC+yZH8JNPWzCGmtOqLKx3x1W8blquLzlgyzj9ZzWrsKNdm8n2ftfoT0W3xstRStHGQHXLoFg2Mt71oqV/99P5/Q0kJk10wkcQ0xumhdb40FzQOUwtbAoD78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=meYFYdQ9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="meYFYdQ9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf680d351so8842675e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741636020; x=1742240820; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=231CPUYYKEzM9Mehgd894YWLVMFUlImKftBC8hnTO+c=;
        b=meYFYdQ9rJBDRae16AWGHs5pJSwvkIN5PBx9pbCsS4JeYL7MbsxGDoJkcsqu1PowMw
         PDNcCUJkmydel7A+v1bErYoqdVm0aC8WGID0mVYOgaw4dd4Zqbq3xG/ZLEz5xpJp1EMo
         Q90FAz1buHU/Mf+2VdfJJy4YiZ77ZmPUbFfjor51ZDWGCDCiFGdesCuoE96tvupo5hwJ
         F1u20cVR8zZQwRpAe6RrLdsZGm3OjSliOtwsVwJMm9HfcNXeHNHpyzIiwqs8UdpBICdr
         vnFeCflHCuVWrtelSrIv4mvfQ9JBZ6LwDYcc7H7bGD3dT7OC/kPpsRdO1n4oo55P1+5H
         ZUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636020; x=1742240820;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=231CPUYYKEzM9Mehgd894YWLVMFUlImKftBC8hnTO+c=;
        b=Vn1fqFl3WdUeTb/id40mMBXKXWyW5JrqP4QjvBfaILAQBaGba3SJI8vW2lbuzUpn0d
         gA/RusNv4a43MtxCoFQAmHCOyqWDnNjAbAjDmpOdz4eQiXIjT+5IFTAKtAoTwKJQ4PYK
         wALsxJXQ45rTIZwdYEWbemzmzPRPmahHEGQm+EB3BPZLXslAeWN+UzLPiKJF7qTkr0qw
         W8FcPwmvvHchx7f4nwo47cSPoFx8si5pqLOgGOGw/wIUUEJsVIfq+TNSMHRAM521rX79
         BzxADaJ8KKJjf668WmzBynO14ZEt1ICFHL5QtpeY7iVt7XBMSSzEvKlzrNefg2ldHoBX
         beew==
X-Forwarded-Encrypted: i=1; AJvYcCVtH3afUeMqUKoeyeVuntVMXI9H/gU5b2j9rXFzESLOJqHDAmud0PbQLBT56Lw4YfTwiHKhbgkbsOlnQu5wyzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz81oQRGpvGEdu51TfyT9FaCHYOOietEr0ZBmO4si6ff9IJ9wbO
	b/fPTrU/YCzqUu5JSlLJvCVup1tUMk2CyNbR+t/p4HakeCANi6QO9cwDyTz8qqY=
X-Gm-Gg: ASbGnctnN3FpMYTWosVXVe7b7O13aOccHv+VcZjlk5jtf6em7h3LIyWJ/1yO3zBU7u1
	cpUSQiQuEuYa9aNTqqK7rFw23eQHGQEFk5BFyvKaqR/gzQpS02Q8K4CR9TuJVufH/Woj5RkajUh
	JM8tcJvibwrRbNBOixeflkH9GLX1KE2ERfiQg8dXOVWADH5Am445BnFt598Ztxa6ZguTf/idYl7
	XsCUSUowyBgLBTN/FRcoAT0WKhGFjn40ChAbPSEpK0XSDZr9Qsk/lrCyZL7uYXE6MjXzWMZf8Kj
	xFtVR0+/KEnMBNCvIl2VCAGTsJHAHVH2cvYubUDR6tlK6Xthww==
X-Google-Smtp-Source: AGHT+IENOj/L+kmWW9WOCu07BV/iNTaznn7bJD1hHiIqNCa8h3p/cdYsNQAG/D5Kuu+UjabTbgrN0g==
X-Received: by 2002:a05:600c:4708:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d01d322f1mr10018445e9.10.1741636019918;
        Mon, 10 Mar 2025 12:46:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ce8a493d0sm94209265e9.1.2025.03.10.12.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:46:59 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:46:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Bluetooth: Fix error code in chan_alloc_skb_cb()
Message-ID: <2144b990-e584-4f77-a3be-5987b56d051a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The chan_alloc_skb_cb() function is supposed to return error pointers on
error.  Returning NULL will lead to a NULL dereference.

Fixes: 6b8d4a6a0314 ("Bluetooth: 6LoWPAN: Use connected oriented channel instead of fixed one")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/bluetooth/6lowpan.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index 50cfec8ccac4..3c29778171c5 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -825,11 +825,16 @@ static struct sk_buff *chan_alloc_skb_cb(struct l2cap_chan *chan,
 					 unsigned long hdr_len,
 					 unsigned long len, int nb)
 {
+	struct sk_buff *skb;
+
 	/* Note that we must allocate using GFP_ATOMIC here as
 	 * this function is called originally from netdev hard xmit
 	 * function in atomic context.
 	 */
-	return bt_skb_alloc(hdr_len + len, GFP_ATOMIC);
+	skb = bt_skb_alloc(hdr_len + len, GFP_ATOMIC);
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+	return skb;
 }
 
 static void chan_suspend_cb(struct l2cap_chan *chan)
-- 
2.47.2

