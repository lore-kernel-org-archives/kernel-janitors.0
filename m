Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDB512F582
	for <kernel-janitors@vger.kernel.org>; Thu,  9 May 2024 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715251693; cv=none; b=lgx2543wdT9mwin9fhgPkBtPwhZjNk+Wjni+3vPvK3v+c4mgRaEQhzivcaK7WfLJuKWHB1mQxNcsyKMx0HN3wtdbFcKZZ1OKiAMWGiPh6/OkGhJdopBf0+Ee+2eCXnqjiJfbICQN+TvSVzTiJU6AqjJuFwYWm0Wj5vcfd+rrRMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715251693; c=relaxed/simple;
	bh=EAmmvUuXUCvQhVJyhOjnloUwsHV7hU6+Z0N6I4QkxKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qz5bc02o3ROeyZIpUQ9rmHSQEiMCmsSRxWYyDtUm82YTjb3Ww0zyCUDOmqGIdPUAzAnApb+5TESjNk9gE/v1GthO0YGHqU7kswgjWY/HUMwNZ7/29OT8GoMGngWUHPiXYD3ZXvxu35Tlc2OW2iNoeElA/tnRSh2zX2glLlNIHQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kSLMi02n; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kSLMi02n"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59b49162aeso164308566b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 09 May 2024 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715251689; x=1715856489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qlZtZk75coxcr32t+mJEdsIgCn5e7In21AxtT9MXDc=;
        b=kSLMi02n7NAwcdlaLMJ0lWD8/Lr9jOYvdvnDDWEf81jzisupG21zC9AkK5LJaqkxN2
         JW2TI3pXpHNn4cjfssxNLaMT4cG5MBBaoTt1moRnFdLvyvfv1DlpbMLvlRI2TlR8Qw5d
         nBYzg7wKRoPcj2WHksU0Jlu0uoyeyNKSIjZ9zJ2W+HUA2nmp7sanhS90PPQ2Ytyr+0ht
         ug00jlRzAvhVDCnbnaQYo8LtvY2Rx+ellXzC4bA4JbI8Pj3aAeKBamB8bQsT68cxOvJX
         eiq1bPp9QMECb+BGC9TTnBNZW3JpVqLMUhs05KT49HwsCyhYlyLunA5uKsuGO+UVjKEm
         HFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251689; x=1715856489;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qlZtZk75coxcr32t+mJEdsIgCn5e7In21AxtT9MXDc=;
        b=BLj5rK40kIeg9i7/6kITq4COAPQTpCCJytSqyeifgQwJzhisjVURHjXoA3mP5mSzA7
         ov4+yuZ/sDTaCkWCms5tOzm/TYAxjFTr8A1eSyjpu/calmPcp2Aj7dHGew1xtm2If4BU
         JksZGRmB9RhSL5x1r7F8WNQ8VJcyzvrL2VaCvOfyTynAsUmtSgy+kAOhQDr3kidCIX9a
         PQ9QoIiaH8v+tjzqXr6SJW8U+gSF7Yq4B6QiovOl2CLxDI2IQaI28xPH8F21Y4OMd2AM
         EZthNm1NrPfJbOC9efpcl0XjmULGwPfakhiNWU03yudM7LDzlR5A636aGobA6XIpEddm
         zEXg==
X-Forwarded-Encrypted: i=1; AJvYcCX3ZtJyej73ahD8qmzqrusWSK9jWnTm6iFZ2MJkmw4maLOmtB610Ewlppny6m86VfMH0TF+hFq6d5m4RFYmMGT4cpSD/DRGUt2gkJsUMwyp
X-Gm-Message-State: AOJu0Yyx2oMPR0R6qtLiXVQuBxX8/BdT3MLMz4fY4MQBjuIoYLY902rq
	e3Uj6IbHn6/qcmkk+j76Nmrwm5AfA6XTfDVexyoSPbLYNXXJfd3rTqScpvNWLuI=
X-Google-Smtp-Source: AGHT+IGOSEuA2npGO9GewqwIXTPylXogor9RcnRiDhrr39n3ApUuc/Uzk7+5WHH+SNpvw9TtEXjwgA==
X-Received: by 2002:a50:d595:0:b0:572:a7ec:1a5f with SMTP id 4fb4d7f45d1cf-5731d9f1eb8mr3880773a12.24.1715251689505;
        Thu, 09 May 2024 03:48:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bfe2dd1sm572297a12.58.2024.05.09.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:48:09 -0700 (PDT)
Date: Thu, 9 May 2024 13:48:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
	Neil Brown <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] SUNRPC: prevent integer overflow in XDR_QUADLEN()
Message-ID: <bbf929d6-18d2-4b7e-a660-a19460af0a3c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <332d1149-988e-4ece-8aef-1e3fb8bf8af4@moroto.mountain>
X-Mailer: git-send-email haha only kidding

The "l + 3" addition can have integer overflow on 32 bit systems
when it is used in __xdr_inline_decode().  The overflowed value
would be zero and the check "nwords > xdr->nwords" would not work
as intended.

Fixes: ba8e452a4fe6 ("SUNRPC: Add a helper function xdr_inline_peek")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 include/linux/sunrpc/xdr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/sunrpc/xdr.h b/include/linux/sunrpc/xdr.h
index 2f8dc47f1eb0..585059f2afca 100644
--- a/include/linux/sunrpc/xdr.h
+++ b/include/linux/sunrpc/xdr.h
@@ -14,6 +14,7 @@
 #include <linux/uio.h>
 #include <asm/byteorder.h>
 #include <asm/unaligned.h>
+#include <linux/overflow.h>
 #include <linux/scatterlist.h>
 
 struct bio_vec;
@@ -29,7 +30,7 @@ struct rpc_rqst;
 /*
  * Buffer adjustment
  */
-#define XDR_QUADLEN(l)		(((l) + 3) >> 2)
+#define XDR_QUADLEN(l)		(size_add(l, 3) >> 2)
 
 /*
  * Generic opaque `network object.'
-- 
2.43.0

