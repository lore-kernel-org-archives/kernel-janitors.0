Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD62571A9
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735589; cv=none; b=N8ieQf5S5igM0SzmD+mx/viNmb8vHMCWrFBRv1aY7mrHeJPsPgIAwhNRb4JIDiDFbT3DwSxlHF3F5hkUl6aDIm/Z3JJCMEChvq+WxM6vTIHTNhrY+UyYFdecNhdYCuG+nFDIHnhPvrWJ91esSA/dUskG0fCAPuMRqbiocqus44w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735589; c=relaxed/simple;
	bh=/NzJlIrCLPmoVtSm4UXmmVH9i0UM47OMoq0AeT6Hgms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DK/diSOItLiuc0vzL22nEAsE9AoS+XKAPpILhjr4Y1XOHlJrVx460t81fBJnuyMCcNyZnTO4VxC/GDpAhn9ZrIE51wRIXval4nGsFrSH+bG6H7afhVnIYGyCngQ3TBYtv5rmebdrOmOUpznmELANlsbXW/cCYgkY3WPJIDWbFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gxI6KwEg; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gxI6KwEg"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4b410e48bso2862108a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 01:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740735586; x=1741340386; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1EmXzog6dpvM5CsDQvgfubk16lqeEYHkBYJ9o/E4yE=;
        b=gxI6KwEgYivTdYyj5c9+kzZfptHdpVKwx3o5FvzPgl9/9yAZbRfoOOSYQ5SVJVT8ZU
         DtfGPlXJtQcwVSeV9LaIYJ/V6+UBiyEYfW+Pe86eLfpOdD1+dEPs38ENESzHf0jvPX8k
         jQ7bly+/cQeVM58CF8H/4ZxKjy0tFCW+PIXLisfItMvERcvN1YLWUg8rpIVS7H5bD6pa
         ZyYCvOuBTNiy5zQ3STY0LniqFzxjxh9jEJp80MZvh2aHNoFV5RG6+rUj86HOHv6/3t6+
         ZYxt+nkFCrcLRvYzouMVHwydklG9Uf1ZrKFqV8hbaVk4Z8fKBzDc3IwZbvQx5dm19gzu
         8Uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735586; x=1741340386;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1EmXzog6dpvM5CsDQvgfubk16lqeEYHkBYJ9o/E4yE=;
        b=LpdiviPrJAHc1UHW/dKblhSuXtCTtfuvnZ5PfxYDYxubyKheF5YHp66Z89U4znxS3Y
         asWZvf7y1kiBjorC0XZR4eJC24+8gxBwXxmw07E52SDwAADzwIowgGZJKbMWMgW8IDFC
         CLYMoFltVNFqSx5GnkT88ryXXZgGQmbn+z5qgpu+58Cf5ny5FMAwh1ZLDvUC1PbP4D24
         cD1JiUiSndm0x+m3iBykcQJDCyPoNs7URpolVFWvU+jRmTLX/UfDqBtAasEqEwWzH6Ul
         DlurltWwJ6VkmDdAmWF9X/JkvUOYVcrZnOrzqHm4bo+gUOsgs6PIwIFSBLu8ZFlCK0g1
         DKDg==
X-Forwarded-Encrypted: i=1; AJvYcCX/Rlu2Ommn8JxY1KziFOQ5Zty/eF58D6xmPCaSMQj1F3bhasSGUKJ9xq1WFnamyraIV3DzvKl42E8F9SJyePk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwthKQb6Q//jzQmYafM4baHt1XBA/A/9VaueWWuW8zdFzGfQmW0
	kcHcy4xtduyeTV94vSU5oi8eaFImdVRwFr3H0ltQmfixClu9wxdsTVeTnfrFGio=
X-Gm-Gg: ASbGnctzwi6aLd+8JEQrfjDI+5+MQAAB22LX7FUIRVWRqr4AACgtBahSwpcd8loiOvl
	cxX2BSGd/Ia0P3O5driNAM/QDCjpZ1j+guCcFoSMH93JvvylyTzsXzuxus6U9NEbNgBPFWWFHop
	riA5HYk3ddpZu//6od30P9WC2GM19DXYEQkIMEz+H2aSdTLbpHLNc7fogt1Xbe9TxppHMw5TfXW
	Ym7cxrPT38G2yHXASfDy2OeOXV9r4cRqKMJRPK4ICw9Hvmydm5leRNdxWKnln8w/Baf/yKySIMk
	bp3Dca6kzfXkHZR0rWWeC3+hWIqacRQ=
X-Google-Smtp-Source: AGHT+IHJ9U6y6nhglkIHEC0ZWjrm3br0eCOOxp9U+sAhp0Pingxi86o1xuAOO8VfOthG6xXZZgYDuQ==
X-Received: by 2002:a17:907:3fa3:b0:abb:e961:ca32 with SMTP id a640c23a62f3a-abf2642bc10mr250079766b.21.1740735586007;
        Fri, 28 Feb 2025 01:39:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c6ed7f1sm261343266b.120.2025.02.28.01.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:39:45 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nvme-tcp: fix signedness bug in nvme_tcp_init_connection()
Message-ID: <0f3be9ff-81a1-4c33-8960-75de2c239ae0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kernel_recvmsg() function returns an int which could be either
negative error codes or the number of bytes received.  The problem is
that the condition:

	if (ret < sizeof(*icresp)) {

is type promoted to type unsigned long and negative values are treated
as high positive values which is success, when they should be treated as
failure.  Add a cast so to avoid the type promotion.

Fixes: 578539e09690 ("nvme-tcp: fix connect failure on receiving partial ICResp PDU")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/nvme/host/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 8a9131c95a3d..361b04ec5b5d 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1495,7 +1495,7 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
 	msg.msg_flags = MSG_WAITALL;
 	ret = kernel_recvmsg(queue->sock, &msg, &iov, 1,
 			iov.iov_len, msg.msg_flags);
-	if (ret < sizeof(*icresp)) {
+	if (ret < (int)sizeof(*icresp)) {
 		pr_warn("queue %d: failed to receive icresp, error %d\n",
 			nvme_tcp_queue_id(queue), ret);
 		if (ret >= 0)
-- 
2.47.2

