Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED04818B47D
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Mar 2025 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741290555; cv=none; b=rq+KMYCLhBmghGJn8YVsTyQidTIEobud08YSdFjH8s6+pNm/C8LoXMpUaqnhyW7Kch39oVqZGVKLmF5jn7QNASULt+ORMqSCA+MUMRSx1LKPq8Ftoy40Kzpqyn3vRRyEp17UAHKfS50G02NS6yMbXqJUPTG7AIn250Tl4L771f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741290555; c=relaxed/simple;
	bh=XJfj2IjX+cfbBfCUZB15uM51uhBAxMUtheYDfRvrsG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gK15DiSXXv969wRDMt8NRdlyVOPzdSW+vDuBSd66Ggk4U+0xPxmYu6Lxc2WQ7RbUF5sXwVHkf4ui3bbDXhkOj/Cq4bwGJ3sDfUvZ/7bZ/ie+v5S0t3nrbhbuL+NLFDA2H3hfQwCKN6GVVSYUgQks2U/okV+R+EyRYMlCx9J6BAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVyteuIh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVyteuIh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390f69f8083so999851f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741290551; x=1741895351; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12HOUV0N5LQ2gOm+72FrFChkl6gwbWnu1Vh8fRPsrGk=;
        b=AVyteuIhnvCmOWtB8xDnGN7AoQjB/ZixK8AXKWqiBM49ds/a59/XAWlGmALEwapeAV
         XH0w3zJtNUtGOA4kWDnAckb1EdkT9gjoNH8TH1XC7UuszbDgWeDkLppRxPkYC9+a9M0v
         ldwxyvkCV7w6Xooj0+pfe6bw68tOX251ygnZcH/7Fq//9A27s4L2mQYUCMSE8vruSURC
         fUNoU/ZSI9OpM3dsoXTguVtw87ngXax+OEkNNTbzYzV1sLLmLaay6NkTrlDKOFicdhAG
         o0C7h6XjuQzUhzhKoOeA5Z9693rXZz6IDJQ6SdCTf8KJsaNK2KNOnftwxpMbyvOhyYw7
         qV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741290551; x=1741895351;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12HOUV0N5LQ2gOm+72FrFChkl6gwbWnu1Vh8fRPsrGk=;
        b=xKYJ5FlgwpMGU/JH9fHA1cabt0w0yRESwrmd02VasDZ0QrQbuWuZsXdO41hzaprw/m
         JhUCgPSHPzD+EZwbXqWjCZDDnnD57jlBM2ZkfYda8G1k2Ya2kBdX4rE8U3/QXRRX2K1g
         cRWvP2fQRNpMWanTjUa88u+E53v7KI480mDDSY7d5i1Q5PBz/BicUiZgqPeNTl7mp54K
         Vde/3w8iM4gEAjfw3HXd5J1/395QGYj7qFlJGDqHyDpu8ZiRIdtugti7wNbCl67fDVJd
         GLRsuB2aLfXNV73R6UnP7nbw5Il9Ll0rccJqElF9bKsm+G1UuIpYcNDjEdaMbsG0oJ/o
         9sVw==
X-Forwarded-Encrypted: i=1; AJvYcCUwJDTwrHBxLU475G/yqmmeg3QkhTl38W5kVjXxtgRxKUoj9ZfGzZgZZsDC8nX1UI1MMskaA/LCAhBGE8yrIqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgdtcpTe9MVgnt49vuRvYEc9o0BTWoqtRhJLw5BUuanDqu/pO
	Zn8yPPIeZup9ugzT/mbtVUedQyRBnJ0/Tx63udTHm4DNRjBksMfTxkeCYChpYo/zg/qKLNBfiHx
	T
X-Gm-Gg: ASbGncsXcW4+h/x96Ee1ybZr1E5TBOQIyUIUvvTZ6rtJdUQdNmzTP0TugO8/Yh+62RY
	z17v3149wG0fdtxCvWiBrwvZIjkkr6U4+jtBJuDnhASpHnLK1mMhx1lH9gA4k9k8ReBwWhrRrWx
	7uvuDhQmZLly7zYRLoB1YS+9AF17L2bL19r2krpAmvTEU922c/Xt0D+pTwPIvBBzEjCu2cTA0YT
	bipIH+eaS+40AbKQ/rtb2MYuK4D7LkSfdt38YTJLj0bJ0cYAgnqwq8MKZGJaQtCTmg6xflj6B3G
	ncjfh3IAzzuk39wE6DW7RAwlVxq0qtC4mPEnn4XKAQND6ENVvw==
X-Google-Smtp-Source: AGHT+IGs4Yei7Uj3yACj+GZktDDXIAXgpcENDsnATVmO5YWfHDh8m1kzphPMYmCnef1sPY9l6157dQ==
X-Received: by 2002:a5d:6d09:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39132d1f8acmr264061f8f.13.1741290551233;
        Thu, 06 Mar 2025 11:49:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdff72sm3009082f8f.36.2025.03.06.11.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:49:10 -0800 (PST)
Date: Thu, 6 Mar 2025 22:49:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Taranov <kotaranov@microsoft.com>
Cc: Long Li <longli@microsoft.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Shiraz Saleem <shirazsaleem@microsoft.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] RDMA/mana_ib: Use safer allocation function()
Message-ID: <58439ac0-1ee5-4f96-a595-7ab83b59139b@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

My static checker says this multiplication can overflow.  I'm not an
expert in this code but the call tree would be:

ib_uverbs_handler_UVERBS_METHOD_QP_CREATE() <- reads cap from the user
-> ib_create_qp_user()
   -> create_qp()
      -> mana_ib_create_qp()
         -> mana_ib_create_ud_qp()
            -> create_shadow_queue()

It can't hurt to use safer interfaces.

Cc: stable@vger.kernel.org
Fixes: c8017f5b4856 ("RDMA/mana_ib: UD/GSI work requests")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
There seems to be another integer overflow bug in mana_ib_queue_size() as
well?  It's basically the exact same issue.  Maybe we could put a cap on
attr->cap.max_send/recv_wr at a lower level.  Maybe there already is some
bounds checking that I have missed...

 drivers/infiniband/hw/mana/shadow_queue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mana/shadow_queue.h b/drivers/infiniband/hw/mana/shadow_queue.h
index d8bfb4c712d5..a4b3818f9c39 100644
--- a/drivers/infiniband/hw/mana/shadow_queue.h
+++ b/drivers/infiniband/hw/mana/shadow_queue.h
@@ -40,7 +40,7 @@ struct shadow_queue {
 
 static inline int create_shadow_queue(struct shadow_queue *queue, uint32_t length, uint32_t stride)
 {
-	queue->buffer = kvmalloc(length * stride, GFP_KERNEL);
+	queue->buffer = kvmalloc_array(length, stride, GFP_KERNEL);
 	if (!queue->buffer)
 		return -ENOMEM;
 
-- 
2.47.2

