Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E76D1CAA79
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620603; cv=none; b=fbX2GrxJCDI9DUQBY3NIBJ0llN8WIVToNK7z/zTB4ctEV+AZezEQ79hiMB/yp/aJ3fyFLT2EGiZZTfnr8nYzgee2zJvEwNzoVZJFvhql6+QKceMjjzSDTAuor173W2UUG60KuWhMKGNf8/3JVcG+waKVFORNVuSbigX/KTbsKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620603; c=relaxed/simple;
	bh=ojsONraykAW73nHFhU3JR6gIK5F+2qzAE3NHVXM9K1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pkqr/2+JYUDqYKAWF8+90l1SAJKuNZ53wBCDdapGOb8/MnG5IZ6KW/8ALebDhJuTVUoTGQqSJk9G1gtLdOJs+vGwgf/itNPJiOKUnX0v+doRgPnAaB7ar1ac+n2sYVTXOPsWC2UC9XHognblJErESLBvd3pOsecP2cmr+gTq6TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PY12zLz7; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PY12zLz7"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-41b7d12401bso879372b6e.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 16:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620599; x=1753225399; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVPOIdRXltuwUh+ovIsPk+9c5IV4XN6F0lzLlze081U=;
        b=PY12zLz7XbgUIJ0jnzV4J+G4gATelRhx0W7ggppvUvzVRa88eAtija2wL2iDSfbdJF
         1o1YV+yJjeV0w5XBK0GX8cHLgkZoriJbzlguNAk4VoJWJNoKWkixN34UoP4oO+pO5ETn
         yB/lcEpOMwszSux5wXtPA4SqDwp84c4dGmYQ9QakeFu8m4xvkkxtmjQhSKvqJp1zb0x1
         VDA4EhQAaZULUVk6ixmiv/MBvlWo1eNCWHVjLPCiVRcobpGhE/1cU7RWpj6KsatsRTe8
         /O209DUhoxXARr7FS/HWif/XXIOqEobCTaDhpqHeOziX3iGHTBEZ1r5/tzdJxdwpnHsY
         4xaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620599; x=1753225399;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVPOIdRXltuwUh+ovIsPk+9c5IV4XN6F0lzLlze081U=;
        b=CAcFJ2IQcPzOh2r7wxfqUu9sYABS+TGYgQX7EN6V6NRGY09T8tILCRZFNghaov5MAa
         P19mWXxmmzXx+lR+lg29OVXHRRNtADeCBws14cDUNo0ka7L7onFmetG9IAMA7ziJEwyI
         OWfQuA7Ulxzupjxwkvnx5FYQcdUo4WhxXzwxbNqOrb4SUE5KlHBFMxx4QcXf1kx6luTX
         BzDoalHiW82anb4pz135a8cB2eT+uMtuwxA17vkQfc7WfkOVrAnlkIBnbqTTTtvk8uHJ
         BJ/opV1W4RKFT6NdDyzTvZYhtn4/WB/mH1p2A2b3l2mdxfisUJx3UduxuxPrFNm5ztbw
         1YOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGu6zNVr9LJvaKjSI0KnOMW2A6Fq7ycM9u9Rwl0gv+JYowsrwml6CEwTK8rdie95nayOQU31CgnsvherbKsP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWt/FNUCr0skXSkwcpH1pIyyLD7J1DhBmGX85xzAOtkxJQH1N
	Wix1Dptuh5DtBuGw1CAslbSjW8yimhLq7uAaD5kXpNgbZfvnu38f5ZrO5pm+24oY+QQ=
X-Gm-Gg: ASbGncsz0jHreLDe0jwhKC/sqN4AlMBP+hBYRgnpE/o1aHbSeLyt9ZtUKVOV5YF3Qkd
	aGAisYKvZEyLJ7FC3gAv5XYyvKvwUuAULTTYaf3tNoWJUJc8ZZNhN9jXLoFvWThH3m3WvjXjAYn
	C4WA3p0znXANZvE3+Ad82NTi2EriAVLugheCEAjZSSPIN7IWRzukcJflid/7Dmh3ls/ITzb4djL
	JPSjwmAaDNHgaAC6Opbn2vFYLQe5s514apB9I04DJFpg7m63pp8RYAoKQWy5HDtSD1m2AvJvZBj
	7djYzWY2oEDG561spE44b+NXqfuh9bGgYnGqtS/K4R6GXP7G0ZK2eaHgRfPPlYIbz6JKRU8Go9m
	ApnCaw0QoPLbsQUICXraXQuS/chqA
X-Google-Smtp-Source: AGHT+IFURZ/gT+RRgf6lI5IpEJOCthv+wsSYmy36S+x0hFRqDxCmnWN11VfQnBagXrYe5WyxizT1LQ==
X-Received: by 2002:a05:6808:14c7:b0:3fe:af08:65b5 with SMTP id 5614622812f47-41cf0abe5admr693504b6e.37.1752620599527;
        Tue, 15 Jul 2025 16:03:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-613d9f14472sm1859238eaf.29.2025.07.15.16.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:03:18 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:03:17 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] fs: tighten a sanity check in file_attr_to_fileattr()
Message-ID: <baf7b808-bcf2-4ac1-9313-882c91cc87b2@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The fattr->fa_xflags is a u64 that comes from the user.  This is a sanity
check to ensure that the users are only setting allowed flags.  The
problem is that it doesn't check the upper 32 bits.  It doesn't really
affect anything but for more flexibility in the future, we want to enforce
users zero out those bits.

Fixes: be7efb2d20d6 ("fs: introduce file_getattr and file_setattr syscalls")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/file_attr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 17745c89e2be..12424d4945d0 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -136,7 +136,7 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
 static int file_attr_to_fileattr(const struct file_attr *fattr,
 				 struct file_kattr *fa)
 {
-	__u32 mask = FS_XFLAGS_MASK;
+	__u64 mask = FS_XFLAGS_MASK;
 
 	if (fattr->fa_xflags & ~mask)
 		return -EINVAL;
-- 
2.47.2

