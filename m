Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03C422171B
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016542; cv=none; b=YUApQBjwHXc+bedqU1FyV6CXKmM5Kjt8bAQOdNt8BwGsxVUzxlN+KYsmxW9KLecrP56pBAg3Szmvgmxr6MpAIvz1Rj/iUT1XA7G15csw8gUcejgOn6832jIiRSiubFgdUYJYxqD3mTg1nncJ83CUC+2EBP1VVWkImGGQFIjZnfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016542; c=relaxed/simple;
	bh=1Q3TcfmNzRDazBSppcZtg7wDQJTfh9folbD7FJfXyzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aXbG4IVZqn+VYk6/Gc08GwGd9LyUNuvHE3d7ddQi04fNMNfznKXu2dg2eGJjPyIbBUZllbsI9cNznTAjUT4/lD8wLI2LpRvfJfHsSxDo3KcXz/9RIDkXvohI4szJTQbD4KGlMRP/G0AxeX0aT9GecjAmRFvZAxEEHpHdCol/hFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJdeUy+l; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJdeUy+l"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acacb8743a7so12264766b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016539; x=1748621339; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8YOV9dsCJJ+cVkHK0vlh5ONGz8WQtP2+w3lfUiN9I0=;
        b=uJdeUy+lkeOx0//0MgcfC+3ktiME00Ljnnyfk4ED/+3ojkrLf/FytHrDPaff4ScKbX
         7lqVvTydhfNUfN8KzqcUDXjnFr4mTk98KaFL/lnpn6N0W4L67b9Mngoe1JROVRwp03mW
         yEDcZnAkqN2Wx53sZ7ULosQh6csRG0G0hNz7S1MvYACpJ3Arvw+msTbJZvl8nAoLdsS7
         tl1rr2sKr4sfVw06pAsvNH6esasjWyUqL0DQTqITkX+DDzpDTC3zxmpjyy7KinycOEGk
         2DSAaDyXll4sL7dDXhcfqomQoP6fK16/Nh1h7rynLEg/zJFeG3PpQpu6TKZzNe0y5wOy
         m3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016539; x=1748621339;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8YOV9dsCJJ+cVkHK0vlh5ONGz8WQtP2+w3lfUiN9I0=;
        b=dM7KsDsHaMmbQ+5KXY9d5yO1Xtf8WCjSjtRzR4DDsV8wvewJ1YNSnCWwnMO4AnHoN7
         TIK5MYLHHF+/snA6dwBpJi0ax6bf4shBnADvs4CH/teL27Pz76Hq7NbviPdystWw8zzn
         UjUd/ypT+WwgewF2BQTLG1bnfTb5RbEmUlv7cHdwW+PamE5yuYsF7YJpgJ7Apk29S8yM
         Pwuf3dyNP0cseu+tYSKuoDUS91+tQ9gfltKSCSaIe0ivTJqK3xwbqR4svlyP7AlJpHDK
         H5DgsWE59nnxlcK6u/fz82phdT48nHO9aZ9I0x7TRU/bailnOE7mICWJtRF+m2THHuKS
         ZaGg==
X-Forwarded-Encrypted: i=1; AJvYcCUlUrxEMNEnTBsG1y6AOV22d+0Bo6MqeRqSi3tx39Lpz78vLZmRuNAhFahGBB2vkym+Y8sO4nr/JTBXG1fLESA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsU3qpqFUOd2tmRW9V7ekG2huaAKbMC3bqOfFnlRbSVUiZCHb
	BvyuiTWK41UNkxbmYpM7q+aoZMpBRZFGC1dNzKOAsm2qBFK4RttPb/x1lIduRcIshAyYDn0yAax
	a5GL+
X-Gm-Gg: ASbGnctB+L0f74LCaC8ZjboCQ2gxpBMgNYtEgoShjwdsqVX6X5rRY/KA7jK/e4+Axdv
	FQrSnuquTKVG1nOlu39LZ/xjwWnRDKjy249I0uF4AJzDGsexGrGuTHjyP1Z+xAy3ql/SyP2xphP
	w18wg9BWs3NHPiQVpA/wzvkI8g7vTLYWAint871t20hmtltMHPcnpiMGMRYuaoZG06sROOfkJV/
	GiQNIvnpelP/AHHc259ywGuXmij9F4r/j2xBGSl1ijWR9ZjJo81SwgCUKmt1ygkkBXJOneKLmZw
	E/KLwK/tthMj7T3XIhIt0Lm/0VlfDa4pW/DlseulC1rL+xv9T7rTIRZO
X-Google-Smtp-Source: AGHT+IEChUpJRqifxtoHLs2XridRWAwu3U5O6UAsOP+uK971N/P8KY8xSeu1T4wchwPDHayN25tBWg==
X-Received: by 2002:a05:6000:1845:b0:3a3:6ae4:660c with SMTP id ffacd0b85a97d-3a4c153f70fmr4239821f8f.22.1748016528875;
        Fri, 23 May 2025 09:08:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a360b0b766sm26836366f8f.56.2025.05.23.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:08:48 -0700 (PDT)
Date: Fri, 23 May 2025 19:08:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ext4: remove unnecessary duplicate check in ext4_map_blocks()
Message-ID: <aDCdjUhpzxB64vkD@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The previous lines ensure that EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF is
set so remove this duplicate check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ext4/inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index be9a4cba35fd..014021019b22 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -757,8 +757,7 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
 				orig_mlen == map->m_len)
 			goto found;
 
-		if (flags & EXT4_GET_BLOCKS_QUERY_LAST_IN_LEAF)
-			map->m_len = orig_mlen;
+		map->m_len = orig_mlen;
 	}
 	/*
 	 * In the query cache no-wait mode, nothing we can do more if we
-- 
2.47.2

