Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789ED2AEF5
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140381; cv=none; b=AOannLfaeCMFmpB6S5anl4JSlZ5DEXD8xukD1Op6QrEUob3SK5RYQxtO+Z2Nf2ShySEMXAvDN8ePgxlIFDo4Tapcuer63VT23QOTnIWJRJQ6sHYQvswqSxuKxQb3CAjEmLYBV0Yx+fjYWhVxWtwTfpYKJAKE7ld9hDiSwRvK7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140381; c=relaxed/simple;
	bh=N9a29ixQhoodI4K0FcWH4qF4uc/vPwrZEztDP4/6UYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZpRUHSWP3XmezSJ+EJdBabMX8TzwBRWgHcFqg6Se5vIqYiDNSCSi7co6K/MT038j7uYUZh3bm7bCCDX7Xu1zreGgyBembjjdWBGI/nb7WedxN7hs/UftzwTPo6haDBnQvlbMCCtoxroEEngICzCWcJRd7Gkz2buZqaHqaP9Tsac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXUzW7Rt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXUzW7Rt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so10941795e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 02:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766140378; x=1766745178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LN0RiP4VaJKIkZXx4Id9qUPVqdrFmfSMAyYyiGl4w1A=;
        b=UXUzW7RtedJLE4fiLy/JdxHcyoqD5sWoB2P33PUqLDzgVQ+goH1JFKfcdcNO+ZarOK
         fBATS/THCCbZnmXA8vrvk1ZXFqP3eQ6jdIU12E+RG4FYemWH6KBzv1KwlgFdzbZcu/J/
         320XmOZijDQxnpmC1xb6/ZrKnQhdHDJEhV5Soq9a+EWhKxid4Ld9srGtIqhtKdqhVz1f
         70ktvyELJ4ochYROkbRWUpa8ncoSotUXZS81eqtqA/zmktj/p/U+907y6kL65X5ONcyh
         1YYv1xqfEMnH+eSFoBNq2W+xnTogw4SuFtBm6DW92OnWHgcACGp9jmPs/rUkRepGPJGD
         kQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140378; x=1766745178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN0RiP4VaJKIkZXx4Id9qUPVqdrFmfSMAyYyiGl4w1A=;
        b=I/eKcfCuc5s+zPTZ42SzmI3ZNmLcFPJ206Wyh6Wx/g4BQtB2a1qBR6HlSYQgvFi3eh
         MbYudDMzOD44JuMBFVYjqcZ+0ThTiAqSPREfJDfZGoCfOalb3G9BwBuMe59kKHMjjtCI
         gUN3UH9cNjFb1TMFFbSPWMa5Z1hb35HHT2RjiulqR5G4RqdR8TSCHUWgdRmeZrNDu3yI
         /gJVtSh+8JsYvu0ydy/TtY1+iljromaDZlB4Hob8bcPQind5Fd3nbyOR8gRraEhQDAnw
         XEOWQ1bvx3UVcLQTHDgO3hdgTGCI0plhJpErM1GA+1pUSvhly8U6MwZyf5UtQkoa2/ir
         05Iw==
X-Gm-Message-State: AOJu0YxJHcksKj2J3iu4N5jDs54cxMBOq7UwU54QlT21HcxyzrurM184
	OX2kqe4lJC/iOPweYqsriOVQJqkdCe26ha28oFKQDw+Oq+KE/e+DU36o
X-Gm-Gg: AY/fxX63/5fSkcVPXZOpUMVURT8KAc9VhWFG/tgJaAz8u9ti6mo1u4nbKhn4RKdpl86
	QGf+iRdm0mwNmYxkkDH5uGELG6YAGT7K8hCmXmox0SrSProCDnRNYtaUoDAH6r5cd6AmBONit/C
	HBDxUPVnOI55smP8ieQUejWU6fjAge2AeQEd7QceZ+/E5y3jVQ++VEp4MA3k9IuET0aat0xpDB8
	mgMvBJ50Jo2o53uolqxopCxkQLxwKhIDWKz3/TqD5Pwn0K4faTuOH4Is8m5uNtchYJBVuRa37Qe
	glNZSpgIHkSTWU/Cyn8zP4E9HpVqy3/CSFFbhuHrIknKA91+sR+o+PNz9ScDxjLRM/K0kaVlowT
	PgNBVPeJzh7u+HmoZjYiF5t1EAAf6fNPPtY4VD/Fa5jmfmWD0uQVij2Ahf9IdS3/EyrxCJpc2rS
	A+XvnpKyiPDQ==
X-Google-Smtp-Source: AGHT+IHYSFDlihEYg4HnC8bZnP0/P9xZlyj7AJRApPf5PBdUXAv16BVjv2N0J46NcNZ0tjReuEEsrw==
X-Received: by 2002:a05:600c:6211:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-47d19598fdemr20194665e9.31.1766140377663;
        Fri, 19 Dec 2025 02:32:57 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aa7cd0sm35078965e9.8.2025.12.19.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:32:57 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] btrfs: fix spelling mistake "duing" -> "during"
Date: Fri, 19 Dec 2025 10:31:58 +0000
Message-ID: <20251219103158.464213-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a btrfs error message, fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/btrfs/transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index 206872d757c8..41e04c808d27 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -1623,7 +1623,7 @@ static int qgroup_account_snapshot(struct btrfs_trans_handle *trans,
 	ret = btrfs_write_and_wait_transaction(trans);
 	if (unlikely(ret))
 		btrfs_err(fs_info,
-"error while writing out transaction duing qgroup snapshot accounting: %d", ret);
+"error while writing out transaction during qgroup snapshot accounting: %d", ret);
 
 out:
 	/*
-- 
2.51.0

