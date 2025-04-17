Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641C211499
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Apr 2025 21:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744923976; cv=none; b=Q1/r7lEDCoTBmIayp2NK7IWNwnfFZIMTyLOBKV9BQmrBiiqzWToFp6I8RRAh9z+or3gyThoCZOAozvluU2Uua2cLUDOquxjYWNMj87UXRhomeF1hCc5Rk98Ln1SD2/gdu1r07jmP1Qqm54ZI+o3RHapWqxgyjiawmPQPLHR+F6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744923976; c=relaxed/simple;
	bh=c90eBYcUytbvHTx30qrG/03FOXwBOODWH63LkdXpJPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmxeO/OB7Hhc/HHi8hnlw81OR0xQQ8E2zGkOqfAja/pKFB6MLP+MYHUUaLVF6ndw0oaFrdEtV8VxWgVbcecWpGsszLilfsXg6VckljU7Sm2XXZC/tc+DqOnrxxB76KdeFyzfWqcGjTETbMRTDMjoAVezyC51Eu4qmwoPhq+mDPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=UJlCPua9; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UJlCPua9"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5WPju9RZpCZIm5WQ1uOdEQ; Thu, 17 Apr 2025 23:05:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744923909;
	bh=9B0EuenjQ9zP2HXkUxbNq6nKhRgcdF/8wpSLRR9fe24=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UJlCPua9/AiS6k3Dp2oK5zTkqe8m/AkjuzXyC5VZY27zR3y6SfrsUtZ9ZS8DHd2/v
	 ZLzCNIH4K7S9GkwQW0TU1uKf2+4NM+CYJV11zJgHhA9+p0RhPyb1Z8/SgTCD2X+vDm
	 HcNMECQKw+ILYgMhRlA9LZHaFNqgLt1+tOi4H47mJicEoKSjLaQknNGozKYuzOn29X
	 H9doqILM4zMi6y0ph6f6ECPuYuN4gFENN/OXVyD1iX9nWg9DZwX48ou7XB1GRJYCTX
	 gIKafY2AZet7rvwB0P4oLzGEWg2l3XYGJvLy6tCHHnWj4V07Z4gRv5hhjkKGKK3YIh
	 mpCF4qJp5E7tQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 17 Apr 2025 23:05:09 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Stefani Seibold <stefani@seibold.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] kfifo: Fix some white spaces issues
Date: Thu, 17 Apr 2025 23:04:35 +0200
Message-ID: <63513bef7d65f93829cd7c189ae16265c459def8.1744923838.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <e25c871bd379f0f3595c2045925d3d25731bb194.1744923838.git.christophe.jaillet@wanadoo.fr>
References: <e25c871bd379f0f3595c2045925d3d25731bb194.1744923838.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some unneeded double spaces are used in some places, and 1 space is missing
before a trailing \.

Make the needed clean-up for the sake of consistency.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/kfifo.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 707dd90138d2..9b13a733efa9 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -132,9 +132,9 @@ struct kfifo_rec_ptr_2 __STRUCT_KFIFO_PTR(unsigned char, 2, void);
 	struct __kfifo *__kfifo = &__tmp->kfifo; \
 	__kfifo->in = 0; \
 	__kfifo->out = 0; \
-	__kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
+	__kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1; \
 	__kfifo->esize = sizeof(*__tmp->buf); \
-	__kfifo->data = __is_kfifo_ptr(__tmp) ?  NULL : __tmp->buf; \
+	__kfifo->data = __is_kfifo_ptr(__tmp) ? NULL : __tmp->buf; \
 })
 
 /**
@@ -268,7 +268,7 @@ __kfifo_int_must_check_helper(int val)
 })
 
 /**
- * kfifo_is_empty_spinlocked_noirqsave  - returns true if the fifo is empty
+ * kfifo_is_empty_spinlocked_noirqsave - returns true if the fifo is empty
  * using a spinlock for locking, doesn't disable interrupts
  * @fifo: address of the fifo to be used
  * @lock: spinlock to be used for locking
@@ -679,7 +679,7 @@ __kfifo_uint_must_check_helper( \
 	const size_t __recsize = sizeof(*__tmp->rectype); \
 	struct __kfifo *__kfifo = &__tmp->kfifo; \
 	(__recsize) ? \
-	__kfifo_from_user_r(__kfifo, __from, __len,  __copied, __recsize) : \
+	__kfifo_from_user_r(__kfifo, __from, __len, __copied, __recsize) : \
 	__kfifo_from_user(__kfifo, __from, __len, __copied); \
 }) \
 )
@@ -784,7 +784,7 @@ __kfifo_int_must_check_helper( \
  */
 #define	kfifo_dma_out_prepare_mapped(fifo, sgl, nents, len, dma) \
 ({ \
-	typeof((fifo) + 1) __tmp = (fifo);  \
+	typeof((fifo) + 1) __tmp = (fifo); \
 	struct scatterlist *__sgl = (sgl); \
 	int __nents = (nents); \
 	unsigned int __len = (len); \
-- 
2.49.0

