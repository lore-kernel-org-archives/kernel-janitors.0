Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A382594A2
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328850; cv=none; b=jLTITKOMRai+VNf0nPIssSL3AWICg9MH3caa/Na/CG2rSjg+jGaPu+6DXG9MCYiHjjX0qB6b1hap1BubzQ/xZaJ0N6RBjMHrpzJpBovnr90IVcNe+hjjRfBW6IZ18PWBFHoGQRnZoWdxoP6l3ERKMNA7ND6G497bjmJ9LtOJmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328850; c=relaxed/simple;
	bh=YEHRYqphhlHXIFjLhXf/Fqi8uitgFtuwyim62lLZhNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ExhFKaCbeZ9uKLZtY2DrIrbEyKWpCDlghyKGAdaVLDyp4GSl9ZjNaUPFaHotI9bTz1Ork13xmkwFBHQLf5njeSNVKXp3peJihI79p+QTYFxNvjyrXkszl1iFzjlLlXuZaQwb6RLHhc5HUomDOoEcdqh3KXEsaAbCM6NJec1VmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GWfmduPt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GWfmduPt"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e0e224cbso8241061f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736328847; x=1736933647; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DjUCM/jbBSR6cK0gy/+/2U77r5hRrUDOcnrZNiR9wY=;
        b=GWfmduPt+da0vX5ejCxRsUAt08kvHdCohVnCUgrxdBWwCXFjMJQ/6ak0pkZtCjxt1G
         3IE8ORWGbZLQ4wrAx4JDaIHGcbwRBzpZhwPJgjQukIBEpB7T52HVR9tdrrMBmcWLnXEE
         I1p8T+Dkns6S1rh9e90eYgkJBP1YiIA8cfh/jbPHbR/siDj93WjWdioq/Sk5z53O+wbZ
         zKey4zhsp7NShFLuNukY2gyA9iRW2uJPrizl8RFpH7boQNzUAIU4kIDNNhQwtxKY5SU5
         VjCuV/BbSLSeXGa0dEkhgzEyQPHtUoYde8oKSdxum6Aj9KBhqBTZO8HPjHHrLLvgSMIB
         uxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328847; x=1736933647;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DjUCM/jbBSR6cK0gy/+/2U77r5hRrUDOcnrZNiR9wY=;
        b=XnLUt6HFepjdEu8xqeyASNNhVL9wK7qZn+4pIJuoGUvat7ckjNMeq2lW9DgMFV2FHP
         blWXGEQFEDJ0SIDOPAcWds6ftwyFbatcJ5WMCjS/OfYF/HTc3lcwcdodfMlfg7nLxjWd
         5TMKcbBqM0hZuOKz/MCGQxtLHdmTC7vaJ8yqh67qDhq9Fc0Mq9/gkNYxdTq+GN0ucZo0
         8a2tUBKJXAkpkv/vfKYnne4zKyrpKhwa0kJ/bWRxjvP8/yuuy2W4geoo/5rf5F4ziRm0
         s8Iwvz3abjc15zgLqyUATAtIS+GHx6Rgr5KSVSpBwEOt8g8WziUkoy+1i5Dv92TLcKGB
         yk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyz0HC1nBkvsEFCo8eOBVzqUXGvWz+KGyUdgEQC3NydK4mV2rFmZT7yGLsT9p/UJovxjS6m6OAaX7p42vxdUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUc++6o7+NinklHDvr0zLDCbx6s7ipaWlHxBJylmKJkrx6RxuZ
	kqndA4iS7D4tegtk93337dkhXIK0kSt9YJPikTqFLVgBiwfG5gKqS/VT8s++ovw=
X-Gm-Gg: ASbGncu3VJ5kQ6Vwj572N8fxI/Euwmda+fHi4hn/O/EzlFjqJkaU1EHGsqbjNMP11f9
	qo9tMh/be5SkM85H0GZ2NPTb0Kp4Q9CFg+GDdks55Uhj/+pRmY/oBGhnoJYn78pUbu1/6GUAYiW
	m0+pPe0+aY1VZQ4fGoxGm8BubVW8atVH3yUDaM7RVocdZxzGaEyhGsmW2rVNND+5FyTGyS8Qyzf
	KJG7PsoxlgJNcYZp9BlubKwq2d2P5r4EsNS6WKLwAQiXjGK4fn6MpzqNMX9UQ==
X-Google-Smtp-Source: AGHT+IFIvyFGgaq0/LulwNY8T7dmzAp5swTnN2NutVuGddfkmNBlI6+QhCrQSOIBcI4yvN6nZlRY8A==
X-Received: by 2002:a05:6000:712:b0:385:f3fb:46aa with SMTP id ffacd0b85a97d-38a87308c15mr1512201f8f.43.1736328847516;
        Wed, 08 Jan 2025 01:34:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da63eesm14430465e9.3.2025.01.08.01.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:34:07 -0800 (PST)
Date: Wed, 8 Jan 2025 12:34:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] nvmet-auth: fix length calculation in nvmet_auth_challenge()
Message-ID: <2abae353-5e30-4dc5-a2cd-26dab4db93d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "d" variable is a void pointer so sizeof(*d) is 1.  It was supposed
to be sizeof(*data) which is 16.

The "data_size" is the data required to hold the data struct plus
"hash_len" which is the length of the variable array at the end of the
data struct.  Plus the "ctrl->dh_keysize" which is the extra space after
the end of the data struct.  The "al" variable is actual length of the
buffer.

This mistake means that we will not zero the last 15 bytes.  We likely
copy data over these bytes so it may not be an issue.  The main problem
is that the check "if (al < data_size)" which ensures that we have
allocated enough data is incorrect, potentially leading to memory
corruption.

Cc: stable@vger.kernel.org
Fixes: db1312dd9548 ("nvmet: implement basic In-Band Authentication")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I thought about changing the caller to use kzalloc() instead of kmalloc()
to get rid of the memset().  But we need to calculate data_size anyway
so moving the memset() doesn't really add very much.

 drivers/nvme/target/fabrics-cmd-auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
index 3f2857c17d95..aad113e17072 100644
--- a/drivers/nvme/target/fabrics-cmd-auth.c
+++ b/drivers/nvme/target/fabrics-cmd-auth.c
@@ -356,7 +356,7 @@ static int nvmet_auth_challenge(struct nvmet_req *req, void *d, int al)
 	struct nvmet_ctrl *ctrl = req->sq->ctrl;
 	int ret = 0;
 	int hash_len = nvme_auth_hmac_hash_len(ctrl->shash_id);
-	int data_size = sizeof(*d) + hash_len;
+	int data_size = sizeof(*data) + hash_len;
 
 	if (ctrl->dh_tfm)
 		data_size += ctrl->dh_keysize;
-- 
2.45.2

