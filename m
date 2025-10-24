Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF8319867
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305169; cv=none; b=fwQyuVBbvYoS02JAVHb77TR3i6QF+kT0uDUow9/pVBFddrX6bMlaf/2F3JShptauXzOKu2obucYEYvpV5JBOzEvDNZ2cZ7EeH3kbMs1u/IaM6SSxybBPlHYs5qQDHhYQGfsvctxzKqoEmFkJDySju2LBthEMA6/EpoRiJ+UilDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305169; c=relaxed/simple;
	bh=esg5jJJrldcsg4Eme/FaVfbzYkFZVxjJszNLHkfgbVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZqOpFtF8sqjbULohcjAM0J4++VpONDcrVkNcQ0FB3yTdCzB/WRyMd7Zyj5ie5iNYlEIrK5wIVuH7D29cTdFExDzev0+eLL/y97lU9c5d7itprV7gpr43QGJe11ddbtloNDCf48NfhmdYA2aKkXFCNz18V+TTvON2dPyzASNie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ezi7LHkl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ezi7LHkl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so1502921f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 04:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761305164; x=1761909964; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6njyGgpXnyix7DPfE/AD+aT34+lBZHSBxI3vVRiYPz8=;
        b=Ezi7LHkld+Fd+HKJpLzOTKg6zBAv0QMXQ4MXOI1l4E9esahPRkUMItjQxUERJIc0lj
         3OD+qRvb6/A8DhWoH4jvCVBPUxdBK9WT9SsulZDnUliZ9itQrXYctx7J62TZTdnx9qkj
         yjmnpweYlZ9M48MNFFPoiY1ZOpu+bwyA1sry0G9R3ViEW21+x4wSnU20gGXfQM7bBnnS
         6E+P2EYaGmt7JhuaSxiGOLXt+EvPkgf0R8TuJPkcoVX/c7d1Nn/G/ZLMWuRXHwaCgwUU
         CaC0FELIc8krMLoB6/DPhIka/JysSnHD2/ozw6g6LucvxyAzv7dk3BBbJO3BgdJcC0aA
         J3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305164; x=1761909964;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6njyGgpXnyix7DPfE/AD+aT34+lBZHSBxI3vVRiYPz8=;
        b=ZNgPoIkD4GkVsmWFC+n1DG8HHShf9EbwPYKhuOyQZZqZcAOGOcq0T2btiHVM7YIV64
         ddmuISNa/SD8ZU9KmFUC3J78lb1ZBNXMTZLuco/T3t0d3Z/wj46cCPtkNQq2bQcMONPI
         KCxXAdBXCVZwdNdhnkp296JC6I10jmEFazYJAQ5Mh/AL01Hlt+IHLsKvcc+dneejdqN1
         Gf0h7DJIT1ACBVWItKQQvkhcc+bPaRxx+JR/fi055zd2hoFfL0pFv4nof+HaLb14mYWC
         TXgbGU+BY5ar6FW53AtXXuGQUveVvd2Unmv5aL/TooR6wEohtMfdpl27rtx+u06TdMkb
         WjyA==
X-Forwarded-Encrypted: i=1; AJvYcCU7C8CSw0hPCcJmFj/R6+vZbFfqnerqBI8WZ5gvZqU7A8HchF7+lIqmaGgeoNDLmeFvzPxeCJv6ptkpJcsVpgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnJeqe0JhxUJa1N6jQlCud/EfasThsSw8HODPLSoNnBJzMZ5F+
	Qo3XTUdmfJoU2A6s4spZWPM2LeEfneAwthdzb5JKMYRWZaVXIQh84JCpcU7KLWev4Bq02Feqgm3
	giOCB
X-Gm-Gg: ASbGncvCDlQy9wQWcheZ/GJu07cgAx4ZPiqarzEd8wKS2YYBhEemO0Yk/Js2LIMDa9l
	G1kd5agQep2ZuZKM58vOkRqR5cokFb/Ytghx8AcO61XboePTekIaufH8WWKNwwriWMmKlswWtuh
	MHPS1DmJH4yWceYs2fjZ5vv5tUgGgit/On3TnEbrfhHYiijxAt5wQkjFijChYv3B7mBRBG7AT7X
	fe4Op7gQlMdWPl9FFelZnOD48p/8aDLTO4mAfGrcx9taFQNlteztDMlL7HulnlMKv9qK258E2ld
	QZrHD3v1F+XmbHCVDhV9NTcpvtKpzdt7mqlToNFXgAOhjmf+fPD09nq8UdgMKTIaKeDE6xFslur
	uGv+/UmHB6M8kLHTwBf0RcVVo6Z/IRqM19ymvEKXasw0tyFz7YbauaNIqjjRqFnTyRpDmp/gbn/
	xK2Sd89g==
X-Google-Smtp-Source: AGHT+IHTMdM53JxT5mbRrB/df/8148lrYpgmBufghOqk/tj4eesUFtAgikytzGYIeyYeUAUMaIogTA==
X-Received: by 2002:a5d:5d87:0:b0:3ec:8c8:7b79 with SMTP id ffacd0b85a97d-4299075d0d3mr1809575f8f.61.1761305163789;
        Fri, 24 Oct 2025 04:26:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4298d4a49ffsm4962650f8f.13.2025.10.24.04.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:26:03 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:26:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/9p: delete unnnecessary condition
Message-ID: <aPtiSJl8EwSfVvqN@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We already know that "retval" is negative, so there is no need to check
again.  Also the statement is not indented far enough.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/9p/vfs_dentry.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/9p/vfs_dentry.c b/fs/9p/vfs_dentry.c
index c1acbc98465d..c5bf74d547e8 100644
--- a/fs/9p/vfs_dentry.c
+++ b/fs/9p/vfs_dentry.c
@@ -109,7 +109,6 @@ static int __v9fs_lookup_revalidate(struct dentry *dentry, unsigned int flags)
 			p9_debug(P9_DEBUG_VFS,
 				"refresh inode: dentry = %pd (%p), got error %pe\n",
 				dentry, dentry, ERR_PTR(retval));
-		if (retval < 0)
 			return retval;
 		}
 	}
-- 
2.51.0

