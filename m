Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF54A99D5
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490280; cv=none; b=Em4tzD2bVV6ZcgoFQdd3w8MTPnqxCsChUVG5zPi7UFRCzWOQvZ1Ze67hgjjHTWLm87NDI4BGQHzXdE61HcEuEd0cihTbnVeIacAFxhSG0ElYFUWMj6EqU8qPv9UkNf2V6ecxm/EVVFTj82rJKTw82L9nztcvq+FjuFdb9qrbAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490280; c=relaxed/simple;
	bh=KPKPGF5qsUQqYvKCR/MMxXPy5D1ntqEEj0Sa7swQ5r8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2LGkBRexNytTiUK5yjyuDiT5qU32nGY8y6l+vmZRpqf0Riru42wYeDJRIr9DUfAzZgIK0XfiPArbtddVP+feWVadcKBmNmx6c0FGqa/7OyWY5Z2sEID7t89y5FI0v4378ZfAyxz3oAT+mq6qRN0MA0cmS3/6lZEjw3xzjcaMqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClksJwj9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClksJwj9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so1197899f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490277; x=1790095077; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP3itgi5VQlf+VGvNzurDARzBqpMd7On/zzuIfwN8vA=;
        b=ClksJwj9NL9O5VrFv1vXx/Av2PseudcXqXs9dmbmj2kCGAaxOnqMZWpwgGBsvU1L/k
         RjvdfE031DE5SJu2pDR0n4n+Me8LhEZ1L5Vvo5ENieEMDV2BpcTe5AZynDer0iPH7hCE
         6o1iUd6+NSB1H+VQoS9y+eYPBjWRlpmMMnj8LeTfxFnjlv/uSqp6ZN1F2eLTLRtkGbvR
         YTb5/QgkIgh3tZiDBzOA1MeT0vYBKrwAB3qTXBz9eYHmMi5o+arN8Jcf5ufHanQpeOdJ
         OzqForr+4dC/dKkNtGwRPaTvoJnW0vEXWxzgfPD8lsXWVPIPwlOavQtSF+iF03VY2I2N
         RJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490277; x=1790095077;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP3itgi5VQlf+VGvNzurDARzBqpMd7On/zzuIfwN8vA=;
        b=l44qKs0Igcv7/+N0hn30RQdv01862Ey5D6NDXiOXLjyqRxuCkv8w9XNzKPGeWVCEYr
         uQ93QY2jkVJ4TMKfILynFLq9fw9rXZnL+h0v+McgP890UfJSPQspJoWaio+UKqwdIZJK
         10Mar5n5sgMzWwrYHHRb3+UB7NppACC701330xjh9PNve770FACg9rj3WQgSzo0GPMyT
         2yAR5vexWQDIN7mEyxGhfQvZe3rYgobbk1h2tQ3JWfjMtbtkcL4hU5PbpRYUQHCvurvE
         /BaDFtCbwmiN29KcoaaJKeECaUmQpWztGTlvo0Itwu1YlzgWXoaddrL99rfaDSK8XXi7
         cf2g==
X-Forwarded-Encrypted: i=1; AKwUvBxdq6/19n2TOOHTkHG7nprVuBX9Qeq85CJuziu1VfDztIJGxgTkmXpSogLKKum/bZKjwyHTSZxvTKYOk7B0kLM=@vger.kernel.org
X-Gm-Message-State: AFuF++muwHQkmllenPDptrMVauj7up3djtqxMnlJe/NJ3I6dd6woCCAM
	btayWhHc7sU3jZer4bMtphT7nkikCAsMmj8F4183p7bmokfrJTwvVEWP
X-Gm-Gg: AYBFou0Et054g/NtG5Zk0bbtfr5gBgb1/7BnuV8XxNP0lhXB216BGtOeQhKNaJevaBV
	XRG8ZwElIL46ptVEUMWbZ0BS4Z8CUImU4lUtNXhQCiR1j4w681RBehaNma3/Z3Jk9HQs/WPYGmq
	YC23uOfBga6x/Aq6JlonTArfXoxumegNAqrs4Wk5GOr+btV+ofgI/X4Zl/MkCarK3ogso3M0W4B
	ubhDBircslml0fIV1fO2RsI8PaS8Q0muWS9fIH6IcAgSXuAuUAVp6ugShcwEC4CEQn6AhqWCXJz
	LHNx6Yztq0C9c6yc2Xj4KErKpKrtTy6UBPaudJ83ET92ecoEafUr+gDTyq45o4BacvZ2xZnYbz+
	ZVPk7Jhy68ezC5hUUKapNtnsBiBBZMXcZXopMGD8M/1udtDcORnoc5fqlG75JgIrxg3c5n/9XoA
	ROTcumAeVk/TzYgSqVAcB0JYCZR3CiWOjF/hH3OQRQAqEYf0Qgflc8j4m0VhwSjdDnHEyfsTTAb
	ukptg==
X-Received: by 2002:a5d:64ee:0:b0:487:342:eb37 with SMTP id ffacd0b85a97d-48705a44316mr6723385f8f.7.1789490277250;
        Tue, 15 Sep 2026 09:37:57 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf34440sm233295f8f.25.2026.09.15.09.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:37:56 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:37:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] vfs: clean up indenting in lookup_open()
Message-ID: <aql0YTgwtRI0VZyG@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These lines are indented too far.  Delete a tab.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/namei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 1dd4ec7d0e62..48b28ed44a9e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4636,9 +4636,9 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 	if (create_dir) {
 		struct dentry *res = vfs_mkdir_no_perm(idmap, dir_inode, dentry,
 						       mode, &delegated_inode);
-			error = PTR_ERR_OR_ZERO(res);
-			if (!error)
-				dentry = res;
+		error = PTR_ERR_OR_ZERO(res);
+		if (!error)
+			dentry = res;
 	} else {
 		error = vfs_create_no_perm(idmap, dentry, mode, &delegated_inode);
 	}
-- 
2.53.0

