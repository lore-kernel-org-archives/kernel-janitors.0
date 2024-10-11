Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB011D0E3F
	for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675768; cv=none; b=NZztxWIHrLocG+18CaEeHiIOJBjsvAaw2Nx3n6cWu39AhzdEilX6IUSH7q4UJIgmy3NlFZfFVNgJLUdtrbLPGtQCIz+xlo1KBsQ/6y5bnLMLb1QYAgyudvnXoiiQwkTDuk1M5LyNdQAUczugBnQ4Epa6hEML6jsTCrcz1jbX9Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675768; c=relaxed/simple;
	bh=85s3yh7C9E4AhHzzxYnfMTj0KjOdGEaz607yZpREXA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SwFKJ74zDqThr0OxNQoOH0zTiefQYsbvog9PiUjFGl7NO2KV20eDISka6ijTIyEk33uUCf9XMwt2oU4FzGBvrdC2t2crVtoLqUIha5JkF8DsYmSJBl7EQ4SNrPKpGznn40/ZQFyFqOTxs707DDe2p7+lNBfUx5Nnm9+nYV02E6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pXAWbZD5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXAWbZD5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4ec26709so1293242f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728675765; x=1729280565; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZGq6pr3z7F64KN+AVciDpV1SQYlsTgST6RCikrEM7Q=;
        b=pXAWbZD5Zy9AQvz0OWfCrOA1Pg70LfNpIVG7SlrcsuIvfzticU5ql4yJltui17mLLS
         5lHieZNmU0iuuJEuLJeM8u6KG7dIpr7V8ZcFkgGQr9oWlRxllbZCAggBatHSGUdtk1vU
         TWrAI7/lwyIg0t3FbdB44O7bJP3+tn6X3FY09ltK7qr6HnVGpvv6FbGs5Lk7pt4nWWup
         saH9hdmzYfXfgng6Xd36ungNq8vOLLmN+2s7dJ4MKm6podLGbzBULHKIxrAKUdSq1y9V
         2XlhE485zi4afEXM3yThjyoruebi2R9LCVyBIqOPXeUcN2CZB1AN1frUKepexwBz8SN0
         EvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675765; x=1729280565;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZGq6pr3z7F64KN+AVciDpV1SQYlsTgST6RCikrEM7Q=;
        b=Fga/PiYu3sAG0PYWh0N5t+F/KPVZRryhllx2X6NSjSJzBKah82s0ju2OCN7ZVFSRJR
         a5ITi0LSku97HKclAVOzbmVWWHSJRj3rFfF/YlHXANkHlWWeXQL0jJUcIqvmwyRI0QdI
         8UUNtN2mgkPJ4W1wuOZfTRSuwbpmY9D2x+7pXehSGA9Ghmr+AY/2SNOvYBWXDKSpTHBz
         cENpapLAfSpByoly0KJN8u10WL05+2XDlOr6Jn+twHCx5AvWbE6h9A/2s/JzsK9EeM9g
         R9gNS5HN/O4lzr+Rw9yo3jU7eNotXO+++Gx79jRuS+EQnpRiszj6AOiGQZN0u7/Sd9h2
         KNbg==
X-Forwarded-Encrypted: i=1; AJvYcCXMWRHd5RtH1qIudQ667XdBda5b8ereTTWgFKiqJizNf9WKLbquc59hHdhF2V+LYKmcFfVU1A5XDMMKQEkkoqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxab48SNx+LcAfF74NNtpmTMpvRzDVE9cC5+ufIF99Nuuvpf/FU
	4JZI8VJn/kWPhCFrnz0l4xkjXIVd7x/CnYCNAHrTvXlkZxhyVMf+IE0SLp2V0DbZMNJKqqAOg8i
	7
X-Google-Smtp-Source: AGHT+IFCNrJOiSqG/e7LBD2Xkmk4NY0UPLW2yMbv5jbu0JLA6sQvg79ITZPssZ7JeTNGLfi8yMk+Pg==
X-Received: by 2002:adf:f2cc:0:b0:37d:4517:acbb with SMTP id ffacd0b85a97d-37d551d5265mr2770332f8f.17.1728675765355;
        Fri, 11 Oct 2024 12:42:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd555sm4585466f8f.28.2024.10.11.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:42:44 -0700 (PDT)
Date: Fri, 11 Oct 2024 22:42:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] afs: Cleanup on error in afs_proc_addr_prefs_write()
Message-ID: <12f261b0-c44b-49ac-a5a1-9a2a18f987f4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call kfree(preflist) and drop the inode lock before returning the error
code.

Fixes: f94f70d39cc2 ("afs: Provide a way to configure address priorities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/afs/addr_prefs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/afs/addr_prefs.c b/fs/afs/addr_prefs.c
index a189ff8a5034..c0384201b8fe 100644
--- a/fs/afs/addr_prefs.c
+++ b/fs/afs/addr_prefs.c
@@ -413,8 +413,10 @@ int afs_proc_addr_prefs_write(struct file *file, char *buf, size_t size)
 
 	do {
 		argc = afs_split_string(&buf, argv, ARRAY_SIZE(argv));
-		if (argc < 0)
-			return argc;
+		if (argc < 0) {
+			ret = argc;
+			goto done;
+		}
 		if (argc < 2)
 			goto inval;
 
-- 
2.45.2

