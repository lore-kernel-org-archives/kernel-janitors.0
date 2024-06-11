Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956894CDE0
	for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109500; cv=none; b=fJMdCAr7/RTy6ztGF8Ghfh53JduFT/gxFyN+NsNaUxT3E2PPTqadSuME4w+Ry/UnFvu+USA5reoWQfCI2uadWVL7Ok9Sdtjy/3FJsyibCF0/A83XouI+IvyEWs49ZammTZ+tMwhrd7gNC+zbmT3k6ncwBJpIzdjsp5XcVo8o1ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109500; c=relaxed/simple;
	bh=XN52i8CqC7+2+wbJGjsKJnNbV1EtOmX3DDcwmxkn62s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cOcKXQ7iaRz7ktfs9C/cY7NXUm2lLhZ8jbXYzjBGkc4rQN+iBqNsAsk6ameHjgukfUSM5LWa/JA6WmN8zNDnzj6MV58nQAdSHAGy5b8evy2DE7L8MvifO8yfXBCKecD5LeKZSyPsWaVZZKDbl3ZYCZ8VAm1R8LiDXN+uVt2djPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tWyBT9AY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWyBT9AY"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f1c490c13so3055146f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718109497; x=1718714297; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaW169oqeSKLpqcvU28Mohgp1aN0lils3oMJkBYfdCU=;
        b=tWyBT9AYdfW6tOo9Pjn7mnySMQyBd3BmnmPxQ4old4OX/LEi/4JGf0viwywT3iLVH9
         QariCGAl6hcACWtqPRHeiNZR2g9Qk/L/Ybj+mSXPwbTKoyR91sv1AtRu51zmFz9BpWfh
         9O1KozyZz+Xlb3tjgj47W4mesiLSVH0KiRZNDcaeYCRYjxoY8O1JSyetAEEMrOUcAyhZ
         WnYkDdeSlsk8NmcaSz4voIQOIZEcZNeSjb42TPVU8viK7Mlu7v0H3ChQw94mVwQZE9WM
         5XRlLhWTFukYLXCtZqrhnTb0F4gZi2AkO1t2SVVy+RKJdOGXllLk51I/p4kbD3/k9n2q
         G4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718109497; x=1718714297;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vaW169oqeSKLpqcvU28Mohgp1aN0lils3oMJkBYfdCU=;
        b=Pld5B9aB/4CaH8SbRtS034XNiOobe6soZAk4ecxnksm1M+Ir1BLCTyp1fi/6naMgAf
         u00jol4xtmleB6+ARHK9Rul3K9JVtpUuMHmebLGyeB8K1qbGg9IQHCdoj8AY71kbsy8V
         xM5AorZtGAYMTapwH+FGbssuuAxZQW+FaaKzEBQ2v+iARDV85mOT3wDXLy490hdnNuW7
         pgOJ82J2gjvWAavl+AJmU+sXq8Q3+d7aMAdMWM2mvj7SkS4+tIAMYJGDjxtX5ohkrzeW
         CQcfuVraF84mzV8nzCc715UUuEA/rt8X21rA67t9qTKVm7z85oByKe96yVwD+qPDM3Fx
         Cplw==
X-Forwarded-Encrypted: i=1; AJvYcCVjuoy85l/JuLRGKektjgFZM8n74MPMaZdKAcL2cSur80oMlDrwl8osSTOtI/VRtkDrA4ek9yZ/ECcM29gg0QjXytyrKAYVQd9z2Q6+4Rr+
X-Gm-Message-State: AOJu0YyaPMHK123OvwK5e1pWrQMmBnE8YY4pPulP89s+8CnVjEpWzOYp
	ZsfSSdaB46vdDMzu9ivHicviyA8xVaQkLg7VzIOkeBwWBeJB3EuE/WSKVFxSSss=
X-Google-Smtp-Source: AGHT+IHg02WcIth64AxHydDfrCzP3dJZs3yHUm+FSxLXj+eO5NSt07iZMz7QK5MsVXvzym9ZqDqH+w==
X-Received: by 2002:a05:6000:144b:b0:35f:1846:72cc with SMTP id ffacd0b85a97d-35f1846737cmr7795462f8f.7.1718109496798;
        Tue, 11 Jun 2024 05:38:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1d3d7b11sm7512775f8f.28.2024.06.11.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 05:38:16 -0700 (PDT)
Date: Tue, 11 Jun 2024 15:38:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] bitops: Add a comment explaining the double underscore macros
Message-ID: <5a970f32-25c0-4955-b480-a4738bf86153@kili.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Linus Walleij pointed out that a new comer might be confused about the
difference between set_bit() and __set_bit().  Add a comment explaining
the difference.

Link: https://lore.kernel.org/all/CACRpkdZFPG_YLici-BmYfk9HZ36f4WavCN3JNotkk8cPgCODCg@mail.gmail.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: re-word the comment, put it right next to the macros and add a blank
    line in front of the test_bit() macros so it's not mixed in with the
    non-atomic macros

 include/linux/bitops.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 46d4bdc634c0..ba35bbf07798 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -47,12 +47,17 @@ extern unsigned long __sw_hweight64(__u64 w);
 	  __builtin_constant_p(*(const unsigned long *)(addr))) ?	\
 	 const##op(nr, addr) : op(nr, addr))
 
+/*
+ * The following macros are non-atomic versions of their non-underscored
+ * counterparts.
+ */
 #define __set_bit(nr, addr)		bitop(___set_bit, nr, addr)
 #define __clear_bit(nr, addr)		bitop(___clear_bit, nr, addr)
 #define __change_bit(nr, addr)		bitop(___change_bit, nr, addr)
 #define __test_and_set_bit(nr, addr)	bitop(___test_and_set_bit, nr, addr)
 #define __test_and_clear_bit(nr, addr)	bitop(___test_and_clear_bit, nr, addr)
 #define __test_and_change_bit(nr, addr)	bitop(___test_and_change_bit, nr, addr)
+
 #define test_bit(nr, addr)		bitop(_test_bit, nr, addr)
 #define test_bit_acquire(nr, addr)	bitop(_test_bit_acquire, nr, addr)
 
-- 
2.39.2

