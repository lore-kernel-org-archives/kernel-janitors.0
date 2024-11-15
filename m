Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD6B18B484
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731662033; cv=none; b=OSXe62qp7xVx0mrPftqmVd0KjREX+9Tl/7+yLyB7Zx84oEdw9pe5FW3b52RxBCeVs2SC9dWcJ/23Uo9mk4RKWkEjTTRCVvc4/S/BcBtQDFRxO3vcCEFFdilmMfW+mW+KQtd4rUBQ8NuhRzaJtdUZeNrE9prTof1onMoA+MC2Rqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731662033; c=relaxed/simple;
	bh=1gpbH+F/EyAt7/qdUtEQNzUhRagbx8xAr7oPVt5RjTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNZ5J7HCQPYhfyfvLxGy6PkLeOlTXRcfGjqFF3nJ7nK/aDxT+YxIGSM8fELnsLTylopA2E6EPTxNdyHxWMeUuvYWglG/YWiYgIJ8vOqk1YNyDvC5ZumZw2RjjihPstdinE2lVtAzY8jgSrb6AWJfESf/fqsacocn73Zp+/Hc11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5I9e5Co; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5I9e5Co"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso9676985e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 01:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731662030; x=1732266830; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8COCFgpNqgb0Y7Anvsa8b6bhjh2JHm033ij5t0kw0Q=;
        b=R5I9e5CoPM/aQPgX41XFKdbka73yFh+88oqZ/9hJqCCj+0y9MQRtJIX9f+wRfDaHLv
         KiVC8C4n77YvLqMopfeX8Lk6JS/QuXvG0llSlpBBZAcqvZkr1fkLFjj+UtGw83XLgpCI
         Obw0F1/nuX9CdXbq/YplY36vIqKtuDzmtMa8nuNocUaNnqOcBs41UxHVP1b20xoSkZY/
         t2MOCoWP8/Ff3xRbxSafG0g6mKXekMr5mzPGmns7nljistl59aD3RKjWsR/B0+FZA3mJ
         514/v9ROijofCtf/w/U0ifxdYgyeh3QXNzXdCPhVfnpvDd3oqbphHkDNfhw0eT/ipqD1
         QV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731662030; x=1732266830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8COCFgpNqgb0Y7Anvsa8b6bhjh2JHm033ij5t0kw0Q=;
        b=UZRd81hs9/hcwfG65ObzGHXQaAiiT7R3C94pT7xdLnJU2rpZmURDmvOka7NwlO59j3
         4NCITLO8rj9/biwQHqQpkSKxFDQLOzpOU39Nh99y6oChgQZ1K9f78Ex/23kdd66tOYya
         ZVdPwOV22k4i1xPo6sype4gPslVorNLBiv+Co4LljKj048g6kBwlFk5SoVc3AmcZqi6+
         NO0ZhZzUskpNedFeOO0dCNk/FoxNd4LuiI1BBlV5Uq2hBM2CjfVAxAG3G4/rCkNofcYq
         X6Vxp9/WPNlLzdyvQnStnrT3GfdL/Qr0IigN+iQGzNrz9y5b4JPPe7BQ+qnGFEFPYeNG
         Owew==
X-Forwarded-Encrypted: i=1; AJvYcCVVXAjwosG9qW5rBpjVDcsN6wdqX0lFb75b1sK2MPEWM10dRenbdg63o40kNY+zMeZ74XD6WjV10Msb+FfXZmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywDjf0ZkfkastGZ9p3dIkH1Q8H9KPg7wv9ReJwIoBmRR/32jxi
	fGSIhchOWp1cVI1ljbV0eIiy8QNznVVBKWAso13KY9g1xX24f84LGJsIxj78Wlk=
X-Google-Smtp-Source: AGHT+IFDwyeF9NdbO3uA8WPZbwIsipDKiK7gl4rjQvHP2ciMl3NTCJLQxQXZjpw4OVLXp1FI70A9Yw==
X-Received: by 2002:a05:600c:a4c:b0:42c:b991:98bc with SMTP id 5b1f17b1804b1-432d95ad53cmr54878725e9.0.1731662029843;
        Fri, 15 Nov 2024 01:13:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298c81sm51915835e9.39.2024.11.15.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 01:13:49 -0800 (PST)
Date: Fri, 15 Nov 2024 12:13:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>, netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] netfs: Remove duplicate check in
 netfs_cache_read_terminated()
Message-ID: <dfc4ac23-88eb-4293-b4dd-e617779ee7ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two checks for "if (transferred_or_error > 0)".  Delete
the second check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/netfs/read_collect.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/netfs/read_collect.c b/fs/netfs/read_collect.c
index 7f3a3c056c6e..431166d4f103 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -597,10 +597,8 @@ void netfs_cache_read_terminated(void *priv, ssize_t transferred_or_error, bool
 
 	if (transferred_or_error > 0) {
 		subreq->error = 0;
-		if (transferred_or_error > 0) {
-			subreq->transferred += transferred_or_error;
-			__set_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
-		}
+		subreq->transferred += transferred_or_error;
+		__set_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
 	} else {
 		subreq->error = transferred_or_error;
 	}
-- 
2.45.2

