Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD119005A
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726131143; cv=none; b=KBBtLno7lbqicfIptAeq7OjMmISdbQHzzFfyfBrXtlv8EULqSsyd2FyC0PUaz60Zw9a/cVyTwRH9bnSgovrhvPRweI70RMjhPk0s1nlS34rbPY9V/+eB+sDaSDlNtTGEZnUS3ETF3fYtLsCXQr0wHD4QTYgi4T15H1c48y12N2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726131143; c=relaxed/simple;
	bh=+Uv1yRx1t/nh3AdvtaBsQpatvoFp9YWwQHVWraJdMZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E05XnsyxK+yOLOZivK+BQ7HzmDXdOZ+FVeNGrFsOsX+ysAlvEKI9hLRh6Kqw9ao9mkLcmXlhkzeR8/2Czs0Ja6hUEUZHDlzTbjhZCwTzOyi0cQlM0XZ7Ry3twbJpH72fM3NMds4Fl57kn0UIq7iITKBVPmFkYape0woV92nU6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHNnCAO4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHNnCAO4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so7445255e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726131140; x=1726735940; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jfx4IHYM/f9TvrOy+r/MT0ESdhaPDLWNq6uOUg30aAY=;
        b=dHNnCAO4zhZC+qsMBiIoDyxScRAY6ZFWHKAeJJZrHWQWIegYrqq7DZA4plol5xZALa
         oStXpSsG3TCBOAQ/5x2lXzz6rI5nIVc38cbamWqhS86GaxUyti4G9tXUh06gyKQrIdFT
         VidwLHdWyRDA88uZWxkCdU/Cc0W0AiPN2/VHGEIT3S03qJ1L3kNxM7JxH+RW7y8QmDf8
         bDryWOEcHgMATg54uRn1hWFWoMZ62eeG04nwQaA9+ULqWxffK20RaZhhA3gZXVqgU5Ac
         hZ8lFshApIV5bF5mqYUCbT05a6oPnD3+Wtl17D/8z5ti1gFNzEYY+eyO6CaeDqEc79Sq
         Bp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726131140; x=1726735940;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jfx4IHYM/f9TvrOy+r/MT0ESdhaPDLWNq6uOUg30aAY=;
        b=lS5vAU6m6cm1Jm6/5yu7Ma5PBECjCI8y/0k7ACjYM5ELlWJdp01BWO8hVt4HsIA2w2
         ezPKwHXPfCKy9CQF6E5INSq2h9lxmeuTru3l/Z2dESTQnUhewE30nV+HiINxfRSIonXR
         sLoyh0raKdCuo7Wn5VLA87lo0+WTyet0jrTCB8RP6n2RT426bqtRr/ZDJty1FSI07rOX
         k2VAp/xwv0v9141QPVP6Hf5Z5Gf/vfxTSTvTTvWKn+uOJl6tvD8Q5W+yhCR6HSwk/Wie
         lCRhF385w+Ou/mm9UQBr7+j6GW+81CCHwzv/mD+eXHBdH878zrUc2/b1z0/iu8tKVeoW
         zrPg==
X-Forwarded-Encrypted: i=1; AJvYcCW6r4lUkewQNvgMaErENuA8IWwcRl6DzS4B2ovORaYYTJ/ABxz3+pBz6Lq6BBErR280BqV4HZ0wuP52FyMsWaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxof87aLvSOdMH0LCmeOJPndM0gKh9PochGP77yQs1ck8OKm4cq
	NwpLuRTGWx5dtv0gSE/pXsOyCYV6P5Yl17DlimMbERTCWFTUkAEbgBDNb6lJ9Ik=
X-Google-Smtp-Source: AGHT+IE3JvQVI8H7Az2p7xH5qjI8YDyhtJ3aO9BUYYnl2AM0k/tr5zbW/XahZ19yePpZcAyKjxL+wA==
X-Received: by 2002:a05:600c:35d2:b0:42c:b555:43dd with SMTP id 5b1f17b1804b1-42cdb5112eamr20411895e9.3.1726131140394;
        Thu, 12 Sep 2024 01:52:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc01a8ee7sm86851825e9.0.2024.09.12.01.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 01:52:20 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:52:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>, netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] netfs: remove some unnecessary code in netfs_read_gaps()
Message-ID: <df691112-1114-431a-8c71-09d1656f0771@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We can remove the "sink" initialization and the check for NULL.  It was
already checked for NULL ealier.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/netfs/buffered_read.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index c40e226053cc..9f96844205b1 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -481,7 +481,7 @@ static int netfs_read_gaps(struct file *file, struct folio *folio)
 	struct address_space *mapping = folio->mapping;
 	struct netfs_folio *finfo = netfs_folio_info(folio);
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
-	struct folio *sink = NULL;
+	struct folio *sink;
 	struct bio_vec *bvec;
 	unsigned int from = finfo->dirty_offset;
 	unsigned int to = from + finfo->dirty_len;
@@ -540,8 +540,7 @@ static int netfs_read_gaps(struct file *file, struct folio *folio)
 
 	netfs_read_to_pagecache(rreq);
 
-	if (sink)
-		folio_put(sink);
+	folio_put(sink);
 
 	ret = netfs_wait_for_read(rreq);
 	if (ret == 0) {
-- 
2.45.2

