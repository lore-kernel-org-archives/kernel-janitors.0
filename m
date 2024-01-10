Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022774D580
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HF5HZTaD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e4f71288bso23482175e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 10:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704912896; x=1705517696; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vw5h+K8iPYs5+icWSGcWdfm5hPFTfCqkPS7TON/HzoA=;
        b=HF5HZTaDiGVQ0nKv/eUnU5KXnQHz/R1pEloEv6HzQMeekEU5h7DgsjyniNElSsvPtJ
         aoULqTua9qu7PRUuq9nYD1qMaDNE7/Z9Z/+1dE8wDGeH1RVn2zn1B0B5xUbvePPYmx69
         H7xkhNpv4iRA3Ka16orDLcD4RhsowBzEaA2zJ1qke/Oyh69ky/n6z1N7MRw/jmB4kcxH
         riirZRwPAHr4mjwb7azItTjrQg4C8phOup4kHd9gnbcW0DD0BSpIL9ap0bPCx4bvG3iy
         8m7lohtpVrI4Bc6+F/UlH8Q8W6QOCPHBTPmF4FnGMBXY9VMqByrUwaaDvZDj6GfloeCK
         4ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704912896; x=1705517696;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw5h+K8iPYs5+icWSGcWdfm5hPFTfCqkPS7TON/HzoA=;
        b=D38kGJmMuhO3gHIPvhiyE/cLK0Ms6HtmUd6vsfkXq+AJ3zcizHm0gRgR2MzIQMxd1G
         lOoP1aLIHO2KXMpSlN194pWpkvEPxs2NhGl/IKXkhhxkFSyAyrm7QaPZIQByNOdk8Xp6
         1vi6LDee+qkaAXQ1Xt338yDHQN0FpMk4tsKmPnOz1k5IVQtZbPjmPorX2bVctaU3Pqx0
         U2Gsmkyhzfvz6bVDx40e1memhGhPFl8WvQjvd3FC9dSAbvEoqlQKdhZTqdP0+S/RB5RE
         SCeK41shiH7HdEn7C8sTxrsSzJXg7GIbnXTVa3aPER1KOQ1UozaVfacimINm+j+AHvJq
         ePYw==
X-Gm-Message-State: AOJu0YzH+LdTgJnT43GO4tPGTLIi0Qo9oFk2wqXHO/9huSxW6+agqcDj
	ILVAWn6Fr957Vjvc6KJeN1a++aIg6DjnNQ==
X-Google-Smtp-Source: AGHT+IHSk34uwWLBmmfHCsZJ/csyHovbBwA3upD7ZO+iYFsDfG8ClAyqdZ/5IzlTpOWZynEA+QUSJA==
X-Received: by 2002:a05:600c:a297:b0:40e:4359:ae82 with SMTP id hu23-20020a05600ca29700b0040e4359ae82mr621278wmb.89.1704912896369;
        Wed, 10 Jan 2024 10:54:56 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b0040e451fd602sm3091715wmq.33.2024.01.10.10.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:54:56 -0800 (PST)
Date: Wed, 10 Jan 2024 21:54:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] netfs, fscache: Prevent Oops in fscache_put_cache()
Message-ID: <9872f991-56a8-4915-b9b0-53accd6db0ef@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function dereferences "cache" and then checks if it's
IS_ERR_OR_NULL().  Check first, then dereference.

Fixes: 9549332df4ed ("fscache: Implement cache registration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/netfs/fscache_cache.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/netfs/fscache_cache.c b/fs/netfs/fscache_cache.c
index d645f8b302a2..f0722cc2eae5 100644
--- a/fs/netfs/fscache_cache.c
+++ b/fs/netfs/fscache_cache.c
@@ -179,7 +179,6 @@ EXPORT_SYMBOL(fscache_acquire_cache);
 void fscache_put_cache(struct fscache_cache *cache,
 		       enum fscache_cache_trace where)
 {
-	unsigned int debug_id = cache->debug_id;
 	bool zero;
 	int ref;
 
@@ -187,7 +186,7 @@ void fscache_put_cache(struct fscache_cache *cache,
 		return;
 
 	zero = __refcount_dec_and_test(&cache->ref, &ref);
-	trace_fscache_cache(debug_id, ref - 1, where);
+	trace_fscache_cache(cache->debug_id, ref - 1, where);
 
 	if (zero) {
 		down_write(&fscache_addremove_sem);
-- 
2.43.0

