Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C582144C7
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314234; cv=none; b=dfKaKZDWV//ZBde0XSLPOGN356oKGc2Z2Yl78X8Rdntt3xRZONgoOxJ5KWz8MxUz5OuitFsosaFrbAxIlM6GM9smCOxSaM+mHvfg0UwG83plPYDPXWscpV7Chv0CmIeQgPafo3jr7oXpSUFoAxp5wxNiByk/CbotiCFSWeVFNB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314234; c=relaxed/simple;
	bh=q3Pyh0mPfhHACxJpnFH02ODrDqfs/HGagIlO+IJ5DUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9QggabU7x2k5OZEngI8dF+17lJN8kz4iaMEQ9Kp1pipaFHPOrn9mULPpHTEeoPdllkJohpf/sUqN7lGjWQY50E1ANHeNO4JBH/l/vOoitpiYldESV7fU7FlZZeATcOOVBxnZCnW8p/Q6nI97QJBlquHMaH80Zerb+F/NYX1h6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGnYRGaV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGnYRGaV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso981180f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 23:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764314231; x=1764919031; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QECuucpOB7mGdCP5CNDlQP92tCoOeBkJ5Et2tCmqPGs=;
        b=OGnYRGaVawR+DbLGlLs6I1WrzWes6l/hxz2uEGeRke4g+AADmvJJ4Zlr6BiidockMX
         T/VV5ZI9LlgYjOheuozpqnK/nkYLkzuoi2dITck9Q6eQaQuDyWLY2VmZMH/8EWjSl6D3
         7XcWuhjkrfwy3Xjg8MuOsTzMYJTqajvXarcQwpUYXfeLP9RH96IHtv+IiQonnT4Q/sdE
         fxjMwGgs+XtxvAWHl/YkPH/jeUjvWw7BQUufSYM2UrlB/w6kdbXhmMEU5oUxTy7YMMHL
         SLFki1/odgjHb7sW6df+tlwtF8j4fbaEPHTHnFNxk+xuR6oDp9YbnLnxjf2LPB5K2o/q
         di7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314231; x=1764919031;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QECuucpOB7mGdCP5CNDlQP92tCoOeBkJ5Et2tCmqPGs=;
        b=qQNNgRQLIduETZOv8sxQ/hu/mmsCj5idHq005n2RbMhYVLTrfXWZa6SbBi5kbAuixD
         NX9QLJfRSKSrLb5/Nps1FQCTWBUKgxrPzEtV6IFLNzb/UeD0mo/5MGBqJuohklEYQKob
         itkIZrOMOC7No3YcxP/8szhG+ubHH2gN3sHg5rp+jGNYKeZ+v8d5yU0MMs4RCbHKH2cL
         jPtog6GgDvCXhFKZXXoe8ZiFeTieAPwYd4jEEhocVSXFljTmXK6OzHGhNH66Qi6pqw+1
         0DWTZBb8MKwjRK5YICIE3NUfh6bwFV8i7crUq/UN/9xjZ1YNJN1AImbvOcy2TaUhaGGE
         UbKg==
X-Forwarded-Encrypted: i=1; AJvYcCUgHW5kVLZc8Px68bz84AwI03uv8AC/2DKIUlq9q4nAsIqTKDDoFpWqhHCK5rvxu7sqjB2+au5EfOnSfy7ZUI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywobp/ukpHY0jer2MsLJF2W6mSgfU1b1DgGT1YIlCKTjQ1tt50t
	CYsohBi9zZVyQnnAN/hP+oj59vVNHVS8UcXKkDFfd3bKDimynI0wRD2eFENMUpTHC48=
X-Gm-Gg: ASbGncv0radVudCM4GBtgh85PJi/6OP5/T/A14dDJus1WrtcLZfEdsTpfdae5vMwY+l
	APsM6UST4OUNfKbPv+vwPyG+d1NDRCT1MctEc708fJ2vpbgTzOSmQbtxuGBwjOGrJ3mNyCG1zDJ
	3L8tV56LeLfcATLhnjdyIUYY0MWVRWpnGGhApsKReafaNxrvil35ZE0Emgge1yVuqKMK68WMs8i
	QdMTITBj2Sirskr7I4bXL3fFPbGA3vwOGsKaBy6//9xZHWQsDPjB0MctUtNTBFVKQt8Wv5kGTx4
	tJYaLdT2gSplvTJrrrlP9ekMwI2I/snZLnLtDxxDY1jNx79XRvc3ymzbEjNC4ge8XTz7iT9wm4L
	i6yxJqsbcqg65A/eRAvMHBo1RXqT6uhGR3eGCOrg/c78iILQRVONHOB68wfcSty2GdspEAI/8Yl
	ZAPCAZIku5JqObUDrc
X-Google-Smtp-Source: AGHT+IF0PX+LalGUwW39EyN2VoluiKmvZRTiqaELlbwHxhz/OePewRHVvuqqnMneHZUO9bajq2AVFQ==
X-Received: by 2002:a05:600c:4f82:b0:477:952d:fc11 with SMTP id 5b1f17b1804b1-477c11175a9mr311346275e9.16.1764314231084;
        Thu, 27 Nov 2025 23:17:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790b0c3a28sm140159725e9.9.2025.11.27.23.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:17:10 -0800 (PST)
Date: Fri, 28 Nov 2025 10:17:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] liveupdate: luo_file: don't use invalid list iterator
Message-ID: <aSlMc4SS09Re4_xn@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If we exit a list_for_each_entry() without hitting a break then the
list iterator points to an offset from the list_head.  It's a
non-NULL but invalid pointer and dereferencing it isn't allowed.

Introduce a new "found" variable to test instead.

Fixes: 3ee1d673194e ("liveupdate: luo_file: implement file systems callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202511280420.y9O4fyhX-lkp@intel.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Presumably, this going to be folded into the original patch.  I just
added the tags because they are harmless.

 kernel/liveupdate/luo_file.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index fca3806dae28..86b4d274d9aa 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -561,17 +561,20 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 {
 	struct liveupdate_file_op_args args = {0};
 	struct luo_file *luo_file;
+	bool found = false;
 	int err;
 
 	if (list_empty(&file_set->files_list))
 		return -ENOENT;
 
 	list_for_each_entry(luo_file, &file_set->files_list, list) {
-		if (luo_file->token == token)
+		if (luo_file->token == token) {
+			found = true;
 			break;
+		}
 	}
 
-	if (luo_file->token != token)
+	if (!found)
 		return -ENOENT;
 
 	guard(mutex)(&luo_file->mutex);
-- 
2.51.0

