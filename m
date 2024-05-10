Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F250171645
	for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715354580; cv=none; b=unA7r3qOwWGTXLAR9cftTikgH69EGzlgAgvAsjlJHxbQKLUtaPNPSN8YMCaQuOu3LwgnZBA3IR7SIVNj+S/mZJdQHu3PvUEEmoA40hYBiMXQhnHDj8DnKrQkI1TJDY6uILxirxrw95qvnR4dXRZjNJqH0qUF1ujh6tXuxegTgj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715354580; c=relaxed/simple;
	bh=xDmeGB3ZsvbdC9b0Eap8RfCmxjnpKodqPjIW7iJ+0cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sUSh76vIv5dDdb+C13kR3xPhXFHfP+rR+LF1p0j4D9zfR63pt/N5E3TKh8a8oP5w7Ij6SKtX84cF3k267scBgS7oMsK6dtHj2ORDIqf8JydK7BT3E3V6zSVHV+YAaEXPQRdwxSoF7GSD9VvP1y/vosTMbU0qrTecBHXAMU8xTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdjjvtrz; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdjjvtrz"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59ae3efbb3so235200366b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715354577; x=1715959377; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BP4hiObhnrJXL+AshuqLMzgV0aIGD7OqswBGKEywkcQ=;
        b=wdjjvtrzfxJbVJe2qYnLGpcFGHz2/giNsfEJFuWLweXJnUQbvKqZ4QQI19WYVAAybq
         NBdfPRAoOakva1F1pSWjYhEK5YuytDZUzE5CxE4HzDwM9PizaFGkrLSwaWvw+6RybydK
         91UScMG8dLLsNcWJ12QCvOAyjiNas7ScLh1qaqyS4dF+BMiaHUECUEZBOVXJwgfzvWDJ
         lEJCd8GUR/2hVCfaGYjU3yCAX4/hb0PeaeB1/tZx+OmMntjoIYiYEK396G+UQmZ/BNcn
         NtV+5dauAyWI54DjTnvJ8kiD0EKKLEp0xZwJtsWgEw/B9am0kauGhBSH2l5bAUKHHCmB
         cb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715354577; x=1715959377;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BP4hiObhnrJXL+AshuqLMzgV0aIGD7OqswBGKEywkcQ=;
        b=gJUVZpIs6dgdWtB/+2zvWQmUcw80Njtd+wV+U2bNwu3mR/03YsFjKxYh1UeARA+sUg
         xZZ0ZejQFRKnTVwfhqv11Bb+BV5khq+92C7QOvBBs2uttTM3EG9IesK/e3gTwypABXLi
         5RCu9m5CRw9NTgVjajqMjixklrRVbbf9TCwgOTOJ968Tfm3XnO2byu8S8/AfNKvzkh3V
         c+cP320rKAZetRTRXI38kH+rVKJDGkoqyUbYeOtgUEkOKrLO3MVYU0exyYY6OjNMEvTv
         CP1GQq8jiRBnZeyOljv4mFcWnemJExFMPjwl8GepaCr0YJtogPCGTGCsm2EOXUF6DVgD
         KsBw==
X-Forwarded-Encrypted: i=1; AJvYcCUWImFDxt0Am3yeyXbdxeAjWyMp6o7C0uCwfQnIpNOMcRMjmcYYWxZQMwqjzOIq87T3d6NFrEz4C2EnlpueIzBSjkozBaZGUOvY2OZcmqYY
X-Gm-Message-State: AOJu0YyGlkA+OCzDUEfvcOmqAHVfWXIx9GCVRDnmKAJ5KEORRJ5wj/pj
	qnw9gIwhiYxos0RTTtA1cH2+gk9uw9FQymZTYuTk3Sj2pKBodY2bNEQSzfKv1fg=
X-Google-Smtp-Source: AGHT+IECyncmlyBZlx8POXK4gXnXiaTjEWCp1Q9Ts1yOT/JsMxgrlDRoEy7sB5jOG9XSuixGma2Gug==
X-Received: by 2002:a50:9ea5:0:b0:572:a731:dd18 with SMTP id 4fb4d7f45d1cf-5734d5c2570mr2746612a12.18.1715354576789;
        Fri, 10 May 2024 08:22:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2cb52asm1925091a12.74.2024.05.10.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:22:56 -0700 (PDT)
Date: Fri, 10 May 2024 18:22:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ext4: fix error pointer dereference in
 ext4_mb_load_buddy_gfp()
Message-ID: <eaafa1d9-a61c-4af4-9f97-d3ad72c60200@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code calls folio_put() on an error pointer which will lead to a
crash.  Check for both error pointers and NULL pointers before calling
folio_put().

Fixes: 5eea586b47f0 ("ext4: convert bd_buddy_page to bd_buddy_folio")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ext4/mballoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 648989c125f2..9dda9cd68ab2 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -1717,7 +1717,7 @@ ext4_mb_load_buddy_gfp(struct super_block *sb, ext4_group_t group,
 	return 0;
 
 err:
-	if (folio)
+	if (!IS_ERR_OR_NULL(folio))
 		folio_put(folio);
 	if (e4b->bd_bitmap_folio)
 		folio_put(e4b->bd_bitmap_folio);
-- 
2.43.0

