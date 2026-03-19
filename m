Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8E3EDADA
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Mar 2026 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962910; cv=none; b=TMra6/WfgKXQ8nMVIZ+3fiHS9eJv5TfjtRnhRN47Tk36bkrR9N2VTFM3nP0dJqdYF51ud8O8nC4WB4FH4jbp4REk5fjwGV1P9u/ngift0sFNAwMHVC9SGfn3SHE1APmb2RNzvnQLykdj7NED/VdZkKrH3NP9p2thVInbHgwRywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962910; c=relaxed/simple;
	bh=RWPSrq0iveoOJKvr0MLwMT9ETGu0pPtPOzleo4aJxXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EsWRgwvT7N3DwELT5DPLn5L9x0KKw4qzWmHvSDu77z7uVKxLj3UahW7KhIa3mfO1Sp86B65IkZAbqgLDwuwtgIhXpCLiXEJVHileCor7scZLqfp0J/PXa9MEWaWxNo5YMCC0g4bv8MYhkeP2HMEeDw1PiYdo8XhAFM9Y/L5Yeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUcruU+C; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUcruU+C"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486ff201041so1573475e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Mar 2026 16:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773962908; x=1774567708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ukH6iurOqmVqpAUSNgmGXdSqfeMmyiANM/nmwq1iOMo=;
        b=KUcruU+C4FWbNWVBm2aYgrHfDftRMTBpMFt2jFDoe8/o/6Z2reSuHuHnHlklFoGEBv
         vN2iMPOHeo/YFALHJrWBRasdg/A9Wu1t4BalUC5rCSLDicRxSLDGbOAuFN8panCbQRlz
         cqHNq4VLzeX7eeFimiac32EmGX147pIvrD6swnoZE9fzWxkbpjgbg/laRSsYzJOJmI2U
         egQl+CWQiH5ebAVOoyZODSY+PuC1itEREinL9iefdd3pQtdmBc9Kd3TaK/bUcqRg3NaH
         uHxoT2j2mZ/Eam4yKYmj8kMsJkUeo91mj/VJBnS5sad7N8PJiCw7FETXDRKjb1iU5tch
         /pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773962908; x=1774567708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukH6iurOqmVqpAUSNgmGXdSqfeMmyiANM/nmwq1iOMo=;
        b=EHu+y9XiWwT0XnPUSbiw49Q3bR7IvKp5s2/pjteIKfv/q/nrAydRCETIxZl99tCRvp
         TQnsV+5wCWnZzdssPQMc/svYYtkrxnGv7W8T9yXa48cW4RlQyOhgQPT3/ZcsYxgm/MHf
         5XefBZNNmQOl+USOZ6hMxyxcAli/olxF8l1eBFnuLxXhVPcybduqPHSB/ZQ2JpBJquXh
         xoKfzV6A88A41IxVnPe0RFzjjvPpp6LsSd8vi42J/Yn63iLT8q11cpB5ayPVaMOpQZiZ
         5P7/P4B6NTHisBcLXFzDby4OSRWmpWv7gsf4779Td2q2ET9Pq5IlKOAaPm2m1SLPeJ++
         d3vg==
X-Forwarded-Encrypted: i=1; AJvYcCWRzf8McboiOZ4Jxfmv/rWyV3MZ+0nvzwGCdwvFPmA//cJQiZJddA3LD9nhyxo7u4v4fyFr0yqfdSN6YNyMUSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpXZ6n6iphul6hxnCsQvXXgI1a50jFj6ELNwMOlJD6cGCYJib
	g/Q0f7lTJunzmWy0p1vGSuo/ZTD9Rx33hgzzpzk6LhKbvbwmh8eBNWCK
X-Gm-Gg: ATEYQzzrNgzEyHjzVK9MxrtRisRRr53UH+cuzexBLPhJwMeSIR3FWdr44b+Uon9OW9f
	ZLAGPCpAeexxkTdpTvSEF/e29VItOauenblSi1UVsI9+C0dsc34m7jIy1qN2At6x8sCcGvv/pmR
	EWNp9HYv15FayE695aM967I1EAA1jLWefi13PjTweR7LagkTyZG1Toh+RY3YavL3SdoJM0wLU3A
	p6pOONnd7Fpm4Picu7EbXa0M2yMgp2HGcfgFGLfH5aUbs4o672aGXrLguLSFNuy4SdXgEyAu9qw
	ooREzEZajwGCgTR8JYqqkC4n5nT+cbqwMAOYj8tgxuCIjK0F9Dn1EI/uGo3lZlhMeVcWXCAQiD5
	qBy9HUkstNAvWy4PKTKvmby9+MjovJYlbg9+Ah/0Y0ieBeHfZ1Jv0MAik3Qk2GX2mBy2B8+4GHW
	WQsG3vXFpH03wkd39krtw=
X-Received: by 2002:a05:600c:524e:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-486ff020bc4mr14311315e9.32.1773962907672;
        Thu, 19 Mar 2026 16:28:27 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-486f8b1d03bsm83143705e9.4.2026.03.19.16.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 16:28:27 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] init/initramfs.c: trivial fix: FSM -> Finite-state machine
Date: Thu, 19 Mar 2026 23:27:21 +0000
Message-ID: <20260319232721.452950-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FSM means "finite-state machine", but I think this is not obvious to
everyone.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 139baed06..d29fe0a5c 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -212,7 +212,7 @@ static void __init parse_header(char *s)
 	hdr_csum = parsed[12];
 }
 
-/* FSM */
+/* Finite-state machine */
 
 static __initdata enum state {
 	Start,

base-commit: a1d9d8e833781c44ab688708804ce35f20f3cbbd (mainline)
-- 
2.47.3

