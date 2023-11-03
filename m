Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A41FB9
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXTi326A"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14ABD52
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 23:34:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9be3b66f254so246359866b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 23:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698993279; x=1699598079; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uIiPKuyQpg3FTiBPP755iaSmhIMJh4QWqX8Y/pUhBTY=;
        b=SXTi326Adw2oNGuKppUcwRIOV7ZMPpZ/Bw7GtpkY9VSlT6ovQbPIW5XzITzMHvjHz1
         ZYfdHoxYtEe9ro5Wm6qiGjZkqBzfq+bylKERbzpOZvzHXnxn2CsXGEoAwpics0dCeLMw
         VVyZsJooVYC28Tv094e/Dl4rysKObLs3BH2b+Y1GHPT164FnqEN8GrF8Z+24HV6ukcT+
         +nfc5QKq5kZ3MAO7tyTT06tog7M6H46oaijIyKjmLOgDEHz879o+TWM60USrOym61r8f
         6NRtF2mPhZLRTjjKgKM3axjNc31luPdzxc2+C8BZY77OQdbYag8HNvMIrMm3SSEAc/qw
         pMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698993279; x=1699598079;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIiPKuyQpg3FTiBPP755iaSmhIMJh4QWqX8Y/pUhBTY=;
        b=l1VxALsMc8mpO/dOD46gGCq/lPkuFPOn+9BuO5jUeFSm9EsKuORvVvTK5rT1EBwSm7
         8QH9PqSPltPa7ugEZxsu8j9mTEAH2zqaqZCi0gFWKqpH2kwPWSyaK1AE+lgZfi+E6nbj
         rJTbmoGs2I60cKfV+gqfCZmfJJXYJWBqpytRjRYZjdKtmiidEfAlS8JiTo4usUkO607l
         KqP5VDO7zxR2tdIBrZxUkmYQ9qnBnb29UPGcjxv5uy03E/OK7muNmWhlVyswWYNTGmSn
         UAaJ+JzbExXQipGzlGLVFMCoLUeAu1auWZJb8A7QmVGYNUnVbJOG7Qnu33Y9U0Vxh6RB
         d6/g==
X-Gm-Message-State: AOJu0YyNh7k13/vXAgNBUjPq0gors58JZfeVpvVQTuB6NXAs/+IkavIV
	Dx8K9/CRK1NnWvzcFFdPGYwAocCPXsUiAni7YCM=
X-Google-Smtp-Source: AGHT+IENGjqyhHf1sID5jH2elSAvdnw8HI0e0SKRqezuCCB4uA4X5pXZs/7QKqwGueGs+zY2Voyl6Q==
X-Received: by 2002:a17:906:6686:b0:9ca:e7ce:8e60 with SMTP id z6-20020a170906668600b009cae7ce8e60mr5073987ejo.41.1698993279122;
        Thu, 02 Nov 2023 23:34:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b95787eb6dsm537427ejb.48.2023.11.02.23.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 23:34:38 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:34:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] bcachefs: add a missing tab to bch2_dev_exists()
Message-ID: <b5297f95-ee72-4160-8824-e62fd12f6aad@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This line needs to be indented another tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/sb-members.h | 2 +-
 1 file changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/bcachefs/sb-members.h b/fs/bcachefs/sb-members.h
index 1583e80afcbf..10072088c299 100644
--- a/fs/bcachefs/sb-members.h
+++ b/fs/bcachefs/sb-members.h
@@ -190,7 +190,7 @@ static inline bool bch2_dev_exists(struct bch_sb *sb,
 				   unsigned dev)
 {
 	if (dev < sb->nr_devices) {
-	struct bch_member m = bch2_sb_member_get(sb, dev);
+		struct bch_member m = bch2_sb_member_get(sb, dev);
 		return bch2_member_exists(&m);
 	}
 	return false;
-- 
2.42.0

