Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8636815ECD7
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322457; cv=none; b=fd6Psb1bXCRGBhiPI016FVaIYJH+w817agZLMqwm8fPwqpWOuW/6tYJvOxTfIlyn6M5PJ2LiRbNlt/Ep8ADf/dzoplHl6bq6bC8sE09Mr3uR+TyYziuNNvGQ9VKJvblOV/zE5P0ZQapjOOtZRSUUYfSyAtuYOe7omchGd2MxFYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322457; c=relaxed/simple;
	bh=OowcFAz5Dwz/C1seGeNFxtRG1mxbi5v5LtbKYioHDjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGb1dssbwm0IgEkt2hq5dyru0AzvqIJKSHDR+V7au1nhvcX03uMBoxb5pPY8dqeQYFupauOADTxfcWM8oX+QTv3LE9eFYMkbD/0Dh/V9NvoLFYi/vzf5JTL6wojDCwcSnRSgC2SMFIcTXRlqA//NuLd7mEVDz7DwAAuRM5MFli8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFWlgv4y; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFWlgv4y"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so763412266b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 02:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731322453; x=1731927253; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQneMUOMjSH+Cp2gVnrl7p/sshIVbnp503eWg1V6QLc=;
        b=dFWlgv4y5jEjfnjNP5Rxf29H+bSS1HT7f5qxixeRk/Pf0OL0idbXp/folesxxMZxGz
         P7BwQpdNvxTjeLg6qURBwHJ1bqb52ywYZIy4vZSaDRoWcfGllCMDiI2/35YawF9CmOSM
         sWR9yakxxUra4El48sVqaNhO4Ut7X0yev+aQK+u6ho5HlVEOti9ndAgYY/cyl+1UktvJ
         asuRT6sCFBui7ExBvOwyBeAWM0O5/+exEl/Dz5v9sb99WB+NcAIzBRNMJdxnm7OTfyKe
         HH7xbZ3EMiv6PjMz769Pg4j4EAbNe5XTNv6ESo/og7iBdYWtAELOsijGlELMfacT2QXa
         FFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322453; x=1731927253;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQneMUOMjSH+Cp2gVnrl7p/sshIVbnp503eWg1V6QLc=;
        b=Eah8WR3jyUGSQMTapKxcTj6hzOEsukIihyXUg/MIGjR4zSRTIpwKalQgFNtHEKkiKk
         QaeYlEIcJOEThhremKHVC/16F0B/CV+NUaLgO6jIsEmUoIytWzteVnjudFDqxbSqdxkP
         sAKhVAZcIWh0wlrW+pi4tuxXJxBR+V/wTy1hVh7f9SapQuPWgTwRT/W056ewZilMIwMU
         /uAl5nmrqSoHGgjJeooKRCgs6S7a/UJ6FUO6pFdNeF7xYbTZV4P211WTTC6pr4S6eNOK
         xOoUdXlBJipydTdNnyzU3kTAtToEAAquWTaKPSPn7MBSmPXdU4+ZO732b3M1fMV1qZG4
         OPHA==
X-Forwarded-Encrypted: i=1; AJvYcCXqUNz8GFsecIBJNbcf6yC/TAK4W0Ybl1PQSHnmx6KhEfScOjYfFVX09hRbhxow1HHl1aSnIrFGMd9tiscR5l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhapNMd1O51VneO4+vpX5Rx6l/B8D3KLXZq9QeWbmgqAq8MrxJ
	Sc8GCzicAqkxnsdOtfvCJur/HG22Oe3j0VwfVCSdKeDbXfNaY9vhlKA2T5E/FfhgdnsqyzEOz/W
	+DT0=
X-Google-Smtp-Source: AGHT+IGGNGfUJKhCO6MzCsxlQnH5pxc4VNoNzngtjkm0QZ2t1Vi54hvYQhkfEkzTtVc4Yp3e4sQ5dQ==
X-Received: by 2002:a17:907:1c11:b0:a9a:26a5:d508 with SMTP id a640c23a62f3a-a9eefebd194mr1111771566b.9.1731322452841;
        Mon, 11 Nov 2024 02:54:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0abe369sm575830366b.83.2024.11.11.02.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 02:54:12 -0800 (PST)
Date: Mon, 11 Nov 2024 13:54:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] kunit: skb: add gfp to kernel doc for kunit_zalloc_skb()
Message-ID: <b31a16ef-382f-4b8f-b4d5-1c4d93803779@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Kuan-Wei Chiu pointed out that the kernel doc for kunit_zalloc_skb()
needs to include the @gfp information.  Add it.

Reported-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Closes: https://lore.kernel.org/all/Zy+VIXDPuU613fFd@visitorckw-System-Product-Name/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 include/kunit/skbuff.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/kunit/skbuff.h b/include/kunit/skbuff.h
index 345e1e8f0312..07784694357c 100644
--- a/include/kunit/skbuff.h
+++ b/include/kunit/skbuff.h
@@ -20,8 +20,9 @@ static void kunit_action_kfree_skb(void *p)
  * kunit_zalloc_skb() - Allocate and initialize a resource managed skb.
  * @test: The test case to which the skb belongs
  * @len: size to allocate
+ * @gfp: allocation flags
  *
- * Allocate a new struct sk_buff with GFP_KERNEL, zero fill the give length
+ * Allocate a new struct sk_buff with gfp flags, zero fill the given length
  * and add it as a resource to the kunit test for automatic cleanup.
  *
  * Returns: newly allocated SKB, or %NULL on error
-- 
2.45.2

