Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE34193088
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206879; cv=none; b=FJFyAUROh88xGr7kEbGihuUOAMe7QgKLhPUi8x3lhPFtyDdWGRrSNox4vMbxORom4TBLCMyR+RGA6DY6/uNsQ6qxznAgm9znaK1E2yv0QESozbCEHz8I3djnGyIqVU3V2yFvKSg1H9dEpB8PdkT0tVSKkkk1altGHfYTsL22vmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206879; c=relaxed/simple;
	bh=dFQRHkthV2CiGWZy7z+Br0AUOk55fvfBCAujfUth+ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=So83WPkZsmL+wB/bCsapInRzh3S6ZuJMW3BuNX6JX8Mtjp3vXKTnay9TYRviCbmuP3bsx3AL+neiUXka54/GAEkvtU9n7HBHiMiQ5fRwUBFV/MvvrUfS6xTnIyqtrjlczjqkGy/AkT/rIc7BXHnpe5vSQ9TG3KhGufCBUZCFTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiyMs+Pe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiyMs+Pe"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a8caef11fso237942866b.0
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723206874; x=1723811674; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZDoeVn0Ui9DaBYyRf0yS/xJKDLJH8VgYEQMX6ljq/0=;
        b=XiyMs+PexbDUrvUz2Nls1SXA28OiFJAidssFsVyx+O/62AhitBne17u5Jj0MUZxILT
         Z8bAhCOB541b+4YsZNzd9L86loCGvZXGSr9Fo4A+ILgBIBP9aHPieCWMFZzoUkJ0Z5CE
         h0uvsv1nKh4kqEEDsx7enbLb1TK8FS94k9NTWmxox8XEOWlWH0eYPYvjPfyjzSK6s90i
         R8aKeviuP3YCNZUB5sWHK0DXCwCHhPEimE01wVetOwskh4ftbtSNrh9SuHOEy4IWt0AM
         5Zpjy/I9pyI+1xQpKqSMZT07YgfltJz1Hd08oNjAgDGzDdEh6Uixzsx1HLi59PCMazji
         ALfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206874; x=1723811674;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZDoeVn0Ui9DaBYyRf0yS/xJKDLJH8VgYEQMX6ljq/0=;
        b=tY4k0dn/XL2GFlHUWtl/UPHxokLmouieRZQnC8DeetorCx362TPAG2L6y941k7xofP
         fi5yU0GzRvhg4qPRbVJHVAzzblJth1EMqNcX9DfeGOdZXxQ9Fai7lBvoZFQLxvZVMmIO
         LolWXR42W/WdqDG6/BzkxdCSaU1iHT85GG3nwgirW942BCL9WzBHyLKl9M+W0aPUdK31
         MR64UPyKTMPtbcIMU8tlna6YNMOpQ3bE20BzTR/GdB64vLf5UN04H1coHjjzTxPZ3Swg
         PcJeiBNFJRVNJmoKBfajlQQ9J0BAmPHaAGGL8LXdf+XwF3rmP/9p7aqyzaVNNZfdCbGA
         qucg==
X-Forwarded-Encrypted: i=1; AJvYcCXpH0iclCfSQPxnUpUZh8QIWFDQaNNQwHIccSbm94jJ4WzTumCDX0L3WNNSjCwQP6L4bpDXXQr2/4X3ZEov8jhthDCOLL8vJeQAbBWhAHQs
X-Gm-Message-State: AOJu0Yz2sBIagLXMiKf8cdetkk9/9Vnt9uTM3MHa2j/iN7wHS6ahcOpc
	guAR1p/3cN8LvW7Q8KvqNq5j/hEpujAkbF76AwHz8go5YlAdxzgkb3hH942SYSo=
X-Google-Smtp-Source: AGHT+IHhcQkeSlgaiaLuH3O2urxwGk6K9tJx15iJPwIKKgrG2LT/FmwImrhs1ImaNZ2v2YJcFRxg3A==
X-Received: by 2002:a17:907:60cd:b0:a7a:ab8a:38f with SMTP id a640c23a62f3a-a80aa5fb107mr120044866b.41.1723206874085;
        Fri, 09 Aug 2024 05:34:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d4545dsm837841266b.124.2024.08.09.05.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:34:33 -0700 (PDT)
Date: Fri, 9 Aug 2024 15:34:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Kacur <jkacur@redhat.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Clark Williams <williams@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] rtla/osnoise: prevent NULL dereference in error handling
Message-ID: <f964ed1f-64d2-4fde-ad3e-708331f8f358@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the "tool->data" allocation fails then there is no need to call
osnoise_free_top() and, in fact, doing so will lead to a NULL dereference.

Fixes: 1eceb2fc2ca5 ("rtla/osnoise: Add osnoise top mode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 tools/tracing/rtla/src/osnoise_top.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tools/tracing/rtla/src/osnoise_top.c b/tools/tracing/rtla/src/osnoise_top.c
index f594a44df840..2f756628613d 100644
--- a/tools/tracing/rtla/src/osnoise_top.c
+++ b/tools/tracing/rtla/src/osnoise_top.c
@@ -651,8 +651,10 @@ struct osnoise_tool *osnoise_init_top(struct osnoise_top_params *params)
 		return NULL;
 
 	tool->data = osnoise_alloc_top(nr_cpus);
-	if (!tool->data)
-		goto out_err;
+	if (!tool->data) {
+		osnoise_destroy_tool(tool);
+		return NULL;
+	}
 
 	tool->params = params;
 
@@ -660,11 +662,6 @@ struct osnoise_tool *osnoise_init_top(struct osnoise_top_params *params)
 				   osnoise_top_handler, NULL);
 
 	return tool;
-
-out_err:
-	osnoise_free_top(tool->data);
-	osnoise_destroy_tool(tool);
-	return NULL;
 }
 
 static int stop_tracing;
-- 
2.43.0

