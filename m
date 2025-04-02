Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D75214810
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Apr 2025 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591766; cv=none; b=UHpy/GQA7m/UCr9B2OIEoOmML68TN+kPQRbDcMpe9R8Oyz3b80YKVtjsDZf1YzXHIRpR7EHQNdfNB3bFQB1cwcVDy1NNZTBemvhfXscMcsIETCdZ6sxhPKQSEEdEgvDGMNpjDfthGOuf4TjHMyDLOD/Eg8kt4/Gv3BQn0XyTBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591766; c=relaxed/simple;
	bh=/ksHMeBu/p/asNzn0ejbgAzHS7nmF3zhaWIA6ZgUn2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adfxFe00w/MuCBH4MnL+vLjMul9eXh0NOplaZjbeXEXnLIqnnd7wnTusP0DfSz/P4LT/77qQw1dpGe4AQHFdJW9jYIUBbTbYezr3oqTThLms/5EaVBw59aEe9ebCx1LN3ECEMdEoouYPVP858UTM8XmaRW5zKbBwaKDbpZv3+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOSbTBU2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOSbTBU2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-399737f4fa4so3334439f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Apr 2025 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591763; x=1744196563; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPszXvzT1nBu1lLTF10nosvpBa1AQVUmdaJflyBmnvA=;
        b=FOSbTBU2yUZDuXFdijjS/bTo04BelqhiKRVjT8rPHXrXERtTdR/4Vg8C95WgQTWUkp
         rm3cT+b25kcM//rOIcqxfs71vOnUfnGTgF7NhotEUTzfZeFRMsAbRnVnMBeuwtrS2Spp
         0vN3RuVElf5bIcdr6iHX/BYrt+LpQbEpkUuwVM9KWZIJcH4JjjT3kWNZoGJUPlyKYwV/
         IWELFqtkq9W4FLbrnbhu2glbTUs8VVClvDXiw3bniidG0XaV5H1EBC9dBagaQknYeLBz
         ZBlziqjpRuGEPfE2XBdko3ozr+mbnu/UuqlKSZh8VYeTSwZkhy8OXs1hGzzNH3coiV09
         EzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591763; x=1744196563;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPszXvzT1nBu1lLTF10nosvpBa1AQVUmdaJflyBmnvA=;
        b=HD1nOnZ/1Twub8T/4ah9L4d+4zyk/g6md8QXa2u+t4OvA6FBFf/Tg1Yg+PCamoVOU2
         dS+La5ZBQ+srP+Eq4muE3w1I/pshyhcMO94eHKHTj+G4Go8VQXkLzzJCOabn2WwmHg+d
         /nKMR3liFNV69q2XOFlaS1y81Ao0dVTCt3PEDR6HbJu4DFZXk8iJLbhWH0XNMb4+P5KF
         0PaFYyuhdk0JPF26h0H/3UDejSNrh7Sup68IWxhaD9cChWdpH7wJrQ6gcwm4E3gcDEYG
         4qxpgIVyYkFU7qu09H5+dDEW0Ermzg8q4vZuUT980z5ORzsc3L8dWyWvG3mCPgvJC35i
         DW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNf5MCSo5Kv6aaMQAOEOHw/LHqL8kfPQ+K40qmyZBPLpJGOvm8JFxM5pqO8s8Vb3iNLIL1i4VbxSb6gy+XxFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMMZVV2cSin5Yj0Ux8owFWFncOguAAq3t9AsnjBBHXPKkBVYb
	ThGv0zCaupV0LCnUYrbGCOkt4nOIsvT9tYtwW0K7z4D4/U53p9gCvqUz5Cb9gfXiiC5eSXKRBp8
	N
X-Gm-Gg: ASbGncta6z/MjF3uhXFuLqclVUVYStqelhPfAgZ/VFvHqjL9Bpi2zHA9jbCZWrO4AmK
	9F08HK0Q8llqt560Zl8QwBueE0CxO4LSYuc30lohENuVP/9GTDpDa918DkX7Fy8x/8YkXXGZPCE
	WZ+OlOevURV6sxDI/NU52pYs36lr11Ws4dUdQEQ78xFDja0tcL7+MDB+iV2xMp6TR9fq/dg+J/C
	kqoVduu7thY9tTtYyk4LZVuCrFD6E8d+JapAzvG6g917qtGiRnO0HK9MNUFY7+I/HAIDo4ZnU5k
	LO/sEiZdg4OEIDFGe7cHAp/Yy7cRU1oRKEwsn2iWxnGdui1Pew==
X-Google-Smtp-Source: AGHT+IH2PxxnwoGmEekj/JPGQfhyg6WywOXDfzxclh3b+yJlm63bf//RxWl96Bfbtzsi6wSpbo9I/Q==
X-Received: by 2002:a05:6000:40e0:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39c1211d5b0mr12864765f8f.53.1743591762880;
        Wed, 02 Apr 2025 04:02:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a41b4sm16396725f8f.85.2025.04.02.04.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:02:42 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:02:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nfs: Add missing release on error in
 nfs_lock_and_join_requests()
Message-ID: <3aaaa3d5-1c8a-41e4-98c7-717801ddd171@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call nfs_release_request() on this error path before returning.

Fixes: c3f2235782c3 ("nfs: fold nfs_folio_find_and_lock_request into nfs_lock_and_join_requests")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis and untested.  Pretty sure it's correct, though.  ;)

 fs/nfs/write.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index aa3d8bea3ec0..23df8b214474 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -579,8 +579,10 @@ static struct nfs_page *nfs_lock_and_join_requests(struct folio *folio)
 
 	while (!nfs_lock_request(head)) {
 		ret = nfs_wait_on_request(head);
-		if (ret < 0)
+		if (ret < 0) {
+			nfs_release_request(head);
 			return ERR_PTR(ret);
+		}
 	}
 
 	/* Ensure that nobody removed the request before we locked it */
-- 
2.47.2

