Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67233688E
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775803652; cv=none; b=i5QKSaPjcUe0zySh/Nngen2dkspZxPco4G09G8wkrVIRwiSpO47D8Gtqzcv1cxMjmsUzz+KMtl8J2T+w2PkblPT9gidbvMl8QMbqzZ4zKZ9x2IFfgs1iJkF42ycEcWluNFyJQjRIG+GXO/xakd+xlpspwjapAMGqMz7pcANDVFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775803652; c=relaxed/simple;
	bh=/L3Yr3WtdME08eFDokOvv+OIuRTq1D8alGBG+OpvfnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0y8EQV+T8G432qJuoT4xMwzJsZU4c5+/SsWCYUpDMBIM54H+C5vYiB7tYRUHq1hGo6+gvIV+ewbkwjxhyoOeDZzYv/esTcdDIZHmIPoumBpMsgJD+IQPG9TQ8s/2yABLFajdFKf/R15Kvg7IHQT8Ob3FHtmDStyAgRqJvCcX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5KTtNff; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5KTtNff"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488971db0fdso16622945e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Apr 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775803649; x=1776408449; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ve11CbLQNCMgBVMcN6nptiQt0ephw118wuU0HiKP0c=;
        b=P5KTtNffHCMcU2TUMhLKiULQJOrqn8bOtQ0vAzcEXIdW0s0+BYzLvjf0weBOOnPSBp
         H1/rPEAsB1qIPSCbzS0ceAfXwsidqYLhzO4qGv8d5Xv7O05YAV5berTEJnxZkLlBUCEg
         yev16pOz9IBEomRpttp+ypx05P3dif9urqlstk266JHiT6/sYN/ZfFkJ59+PeRHbUoAm
         tRTX38uQvDUtAeoA0IuBW2Lm6/lKt0qKlHOkzv4GpRuoqg6DMlWtXlMShBex59VflLAA
         Hb4cJacRntLyctb5yvEJXRBli28khLIfKJfaJzxPN8THMSKnJRbmjXeWvHsvEVnaZszv
         lTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803649; x=1776408449;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ve11CbLQNCMgBVMcN6nptiQt0ephw118wuU0HiKP0c=;
        b=M0n4CcEb2ezA9es/IK2bI3bMIPa5ZC1qQBkpef1/3n9pqA7+43AFaud2bGGq5LxDmY
         9b1jd8qjU5xuFuO1g1vndmzyQh3i8bPkIB+XlZafa3L5NFnD86FoE2N0hqaxfakN8NpY
         fn+3H8JQkIRA3F/5eXcEXOkk3YFH/qAdFH1W6BvY6v4NVmeyVuYXiL6GuV1NAMXY8S/J
         b/OeypEToslcap+znrorZa9oQ/+NtwNwAOVLEGxVqKF9+lOqf1Wh+FD2sdEN1TLFkLJE
         s0cOQi2EvtEquVcrN7szvLn+sk7ZxwquRkrFmPmtcdHC0U2ncoJMhnwFTp5YRdOQ8ef4
         AAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7PODMPjwcSMy7WvqHhTfK0t3O6sgDskAJw5ZwdwH3zx7kFRDW4HScjr19GVHLMEOVItjB3qmQ3eG0rhdUXmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwT1P2SMLi7BFidI3nK5BVHmS+8bpTmS8nR67KYIEf+MSx56d
	qxpKhNjr36cdyd1ZkHAIyFjOUT1Ua9onXaRMjOrtYahKChHPvr9ioXSLgv0lco6Z
X-Gm-Gg: AeBDieu7YhndDzNLazWq80eZRA4exOboVimCXSFi8HCFw2iK4HDsiJwa2+0ueclgfgi
	52YAdmNa1l857TKPUquUZOoUgIDay/QoQslNv7KdYAM1AneDsGDA4ml0AWfgSercUH2JJQNxw7y
	De67bVWX9ZuDekOcv2mPAjhMLOZEoc7SLZ1nX/EcDCQRhZEgW37KBIkLucl9wgIaMWzERPVUhBx
	DbGeeL9ohclj2lHj2TQvxlUnOpgb3Ftq3QLK9YTN9lV7LTHbtDGiDFRAGybeF9r/6veLc/KMob3
	7QMU6327oXoUqzAsRZUBa5hJubIgfSXWwPg06sHn4+bNGqUH6Koy1y36hGfnyb+bj4upgf/48O7
	MS/UiDMcSn984HHjdYnQVSvxgMre+q2arRn6E0PLkPK4VcIi+E2AcoFP31nEXzGY4hmxnzgBVYx
	DcSCV62keXtFTU696C7h8=
X-Received: by 2002:a05:600c:4715:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-488d67e7dd4mr23459715e9.8.1775803649478;
        Thu, 09 Apr 2026 23:47:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec295sm4781790f8f.14.2026.04.09.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:47:28 -0700 (PDT)
Date: Fri, 10 Apr 2026 09:47:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ntfs: add missing error code in ntfs_mft_record_alloc()
Message-ID: <adic_St-SP3UONMV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if the kmalloc() fails.  Don't return success.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This email is a free service from the Smatch-CI project [smatch.sf.net].

I have wanted to avoid sending patches but it was easier to fix it than
explain the warning.  :P

    fs/ntfs/namei.c:677 __ntfs_create() error: uninitialized symbol 'ni_mrec'.

 fs/ntfs/mft.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index bf028c1aea26..0c545fd08b66 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2503,6 +2503,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 			folio_unlock(folio);
 			kunmap_local(m);
 			folio_put(folio);
+			err = -ENOMEM;
 			goto undo_mftbmp_alloc;
 		}
 
-- 
2.53.0

