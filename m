Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616A18E057
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731662045; cv=none; b=s+EF7NzKX5iEV8P54hBTKQqe1UABLFSCjeM/CwMMYkPbw8Yn1kUyK6G2UnGYHeWWg38/eKl8lzAqV1gLhoyIW7wAypcVNxrOeC62PWmhNtVk2572OfHnvGuDZECY4S/qW5L+hqemtpXCTdYj3+icavHT4yF0igf9k+8SgaaYH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731662045; c=relaxed/simple;
	bh=oL0UzlFZqjOr/6ocBd/mXCjQcqAFgGA2jsO52+VBifQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LsOOklxV36aERFrGECQ7zlAb9LkcGnjyVpgU97JLdg2Km9Yjs7nKs8BVad6cRVAfFsAz2WDyxBAuk1nhmKrcDL0dxysJNl1PFpUNqtnvhneN9i+MBRifd47B+ay+47Hda/3mx/RqxtClkiSMerZqYfiFJNnX5jdY9tkecf9u++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TeRfDmx0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TeRfDmx0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314f38d274so16985015e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 01:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731662042; x=1732266842; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7YuB/szIEkMxlq3tPJ1z9SjBnVW4504PF0OtGMyd9Ts=;
        b=TeRfDmx0sSznIaXIO832QZ3lrjOKmsmr3ZuKVWR6RfILfEReImRvSg153NjPKvpLwg
         IdV/y/y8iPPUjb50MApxbLOeit1/zbKduAGAIappbfVINE7FvemoiPteUN/mfF/BfMJx
         pEDv71PQO9/RNOegrxJdhrTmjcgSurepFk0rr1uscrB1JPhTOujk1ESuAUpS8T+Mwt1I
         +ApDcfd/zwyaOxw//N/SkdEq+Ayl61MtwiBxJAZ1vx1K4br3M3Mup7cAjpGqQlfegirE
         oROduPYLOv3vPOf5wnlSaZGABEQy6HpUDu9cpPqAfiYvBOLSTaL8Av6BC5lRjEsAoafo
         XwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731662042; x=1732266842;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YuB/szIEkMxlq3tPJ1z9SjBnVW4504PF0OtGMyd9Ts=;
        b=p9kMdoDiBhWMpC4Ns0yA6yI6wM84D3ULoA6MROp22mA8TqPZeO8/FSZDelaEbCWdG9
         y8IbtP4zyF5E83Wayvdzl/LmYPpzNBSTzSYedGXykjM0fdujZuRshStQtuGk7sbiLynt
         cd5bWZLXOpEx+gUd1iD1jB+Lrjfvpk7VyOYlxGYeVrYiltbjRgDkwrSBJfiY16KAhorp
         zTjeZMB3rP5I/QTZtZSNu0Myw/MreXmR4GDTTalY/NyfZyBTb3alqMtn09yXiY+gCk+v
         2cyroTYbSEhsL2nneSLZS8E/Dq56LEtSW2gTUXt63G04AUr+8+1NcNw/y4CGt3pbc0bs
         yK7g==
X-Forwarded-Encrypted: i=1; AJvYcCWEmdUNhiPWlWbxj3BioxMNtJ0y3rjfTeDXlhBnZOj82SMNawQn6+okWQETrCnBxzJqgJC8ib55yL8dGXWpwuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxffbFbpJTLqKBtBZYqCI8aKRLTHHZi0OvG9sSGgMgBiKbk5ob+
	J12La4dAtyH/bQKSCl3TuMeC8XLNr0GyHCGJPZAu251JJlJ4o6wnIhDN/jsHjLY=
X-Google-Smtp-Source: AGHT+IG/yzx2BrirfQLi4fTkAmm6tdWmADdgYhJai5mJ+OObY3rJiGs8gvXT6Hvgka4TOkojxVFw+g==
X-Received: by 2002:a05:600c:198b:b0:431:4b88:d407 with SMTP id 5b1f17b1804b1-432df723048mr17674985e9.5.1731662041725;
        Fri, 15 Nov 2024 01:14:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac0ae04sm46823735e9.33.2024.11.15.01.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 01:14:01 -0800 (PST)
Date: Fri, 15 Nov 2024 12:13:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
	Meetakshi Setiya <msetiya@microsoft.com>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] cifs: unlock on error in smb3_reconfigure()
Message-ID: <e4ea558b-5124-4f3b-83a1-267097d067f4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unlock before returning if smb3_sync_session_ctx_passwords() fails.

Fixes: 7e654ab7da03 ("cifs: during remount, make sure passwords are in sync")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/fs_context.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
index c614c5d8b15e..49123f458d0c 100644
--- a/fs/smb/client/fs_context.c
+++ b/fs/smb/client/fs_context.c
@@ -1008,8 +1008,10 @@ static int smb3_reconfigure(struct fs_context *fc)
 	 * later stage
 	 */
 	rc = smb3_sync_session_ctx_passwords(cifs_sb, ses);
-	if (rc)
+	if (rc) {
+		mutex_unlock(&ses->session_mutex);
 		return rc;
+	}
 
 	/*
 	 * now that allocations for passwords are done, commit them
-- 
2.45.2

