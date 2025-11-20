Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773782E8B81
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763668336; cv=none; b=EcRFupcBKtRETtofCrbBAQImACAlxhsYi6Ii32l6b7x9HlT4Yl5NKnZnR8GWJYoe+vhGSr74WBmXw/cukO3nfRUTCcpbn7LS6iSHLKlMWjZkBmQDKrZCt+ts01C4KuLNv59YdhtXDIqVjqm0cpedq/RkDCPS4Y6ArWwUFg0j6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763668336; c=relaxed/simple;
	bh=u2+T1r+sWsvkftBxAcy6kHz++p4wMgmzB+K5Zky2h7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PcgLpEkz4Onw0fJAJZysZdhv4eN2yBw6buV1mGAnU9wU8/ZMmMcq1hJpVvp6M6vQhivZKiHVehv+OPWq/wRcJM6sTcJGZq4dcEiLDQijdMcksVGZBEpnccqJu69xIeN/x2Hk+8BLn1qxYRBACEdnApXY1zAqfGlYuDemVK2Z+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/R3ReHN; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/R3ReHN"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b935df7bfso11798761fa.2
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 11:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763668333; x=1764273133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Er2FJbbUBh6YnvwnjR3JbLaZQz/HmWBPLBBSx8YXc30=;
        b=O/R3ReHNg9yfPZePautjRzF19+lEy9Hf2j4Kpj7ri0B9WyAH7mSEGa4DT+6pBdcp7R
         jO4xtupiuCkKRKNs1tu1iaxLGriOYp+Ur+/CRimjHwICAPVMBXYa0cLkzEikFUpnxMIh
         hyrVAaIsgiCdQrviBEwnZespK4Nsm+e6TCoCxp0yue4MySR4PUOtrg22WH3yD1y8zQW6
         COEUlp5WsXCdJEDeAqhCDWgUjRBYMpQ2Pt0a866y+FzVq+GgcXoGvqAgzlLUT4MnktKj
         KxDRYolCqClZ4YGlY5B47UfY7bM/iRaLdHtWXPz3tDtYlNKvcYQL7Hhawl2tiOZzccUH
         OzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763668333; x=1764273133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er2FJbbUBh6YnvwnjR3JbLaZQz/HmWBPLBBSx8YXc30=;
        b=Hu59p6Yx9OR2QiOsZUFQxHXSG8VzlsBv8nYImTKamqUDXJ1ZwiMktozDyN8X0MMV3+
         13Yj0UyMVU/kU9WXEhmd2UKWp51iOQFMQEdR/bISYS47OCw1Hae44/ocEHoSk4lE34fC
         HobCcZRiZVDxTvNRb+endAViy2nbFJCe2B8RkX3kijUYtu8ZUcegd7co3TiBRYNhBMWT
         zF4ryKFjFeB9JndcyEAJGu+eSc5VL3lMLX1sMIhsn6FVp8mkCn4AlPHWXzpGuG3gdN3Q
         /8+Lp7qLrmeNu7eUsYxaNQ3QMet80VaPWgdqvHj0woxeopQzN4VNazkAgfIsgyySBEbh
         IIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbSNu4JEe7oZEzHLVVDy8bSAmEj2cHXB2QCc2XbKMFRHjw+tSqbgu2Z2RcETesgoKg9Dx90LymVahZGQ8qTL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQS7xLQNiSy83V7lrG7FjTfgh9VtaOJ8pDfzdDqqG4WXYp/AJJ
	mOG3NzS/sh1FUHs/OzmqdJcoCdppS7AbFwQK4jDw/I7517ylHn+IdRyQ
X-Gm-Gg: ASbGncspnpOHoYPp/koO3kw0U6YOOS1b6L2e5dzcYjTMKDL4JKFkgma1ebMfSD3aiSx
	5C6QqmkWftl9ml6jTxz/WJ9e1TSxm+ILYkHloWgdoHa7+N88koC7EIJ81KqC3k9GQGnPRyV0+M4
	CSrk8Z5/Nnq6piMFCZkShHcJ+wCjcxXJIbUxamEs+FBe7vM0p+B+dmt+WyTf4q7wWVQpvbJq+As
	v2iImmmKEVtjXQ9Gm+bFe57dq46sbye+yoipal52E9xHYZ6YbxvOnSUGo16rf81touFLg9gNvGx
	ZpjwLUNkATKZPn/avRagRtZ67o8J0F7vpkbQcN/V/WJaCLReMpu5zmYi8mIr/CJDc+a5ylmT4eW
	RQGNlkgbpmThmlt8UBijjI4ZiAgs6wcfHoig0IuB0aEcp6D3yCWb8JqDSAbPDTKPcbyG2KpfabY
	3i5mpAMupK
X-Google-Smtp-Source: AGHT+IGO95a2DriC/sUFBPYgQuutgp8Cgi9UCTrUgdhkhO22s+KUmGoBKxdV94i/DlK6/m1jFIzlDQ==
X-Received: by 2002:a2e:7205:0:b0:37a:4714:ff39 with SMTP id 38308e7fff4ca-37ccecd68aemr7615261fa.23.1763668332347;
        Thu, 20 Nov 2025 11:52:12 -0800 (PST)
Received: from localhost ([109.167.240.218])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-37cc6b4b47fsm6967301fa.2.2025.11.20.11.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 11:52:11 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] include/linux/fs.h: trivial fix: regualr -> regular
Date: Thu, 20 Nov 2025 19:51:40 +0000
Message-ID: <20251120195140.571608-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial fix.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index dd3b57cfa..247e37090 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3103,7 +3103,7 @@ static inline bool inode_wrong_type(const struct inode *inode, umode_t mode)
  * file_start_write - get write access to a superblock for regular file io
  * @file: the file we want to write to
  *
- * This is a variant of sb_start_write() which is a noop on non-regualr file.
+ * This is a variant of sb_start_write() which is a noop on non-regular file.
  * Should be matched with a call to file_end_write().
  */
 static inline void file_start_write(struct file *file)

base-commit: fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
-- 
2.47.3

