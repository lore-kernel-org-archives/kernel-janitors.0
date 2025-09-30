Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9B92D7805
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235897; cv=none; b=CNFB0a+EoV23QhCFx+dfTyhqG6/i2rtIr8wCW7VwhYys+VJjDh53EU2sHeerLRcp5qmUG2ioZJIR+txYiMydLZd22uwPcGuGXMjTRuJ1WTuac/gbehMLCCZggsY4p9TH26OQYJZmFixcfLmS6sMSxJKySNhky0CSzidM2veHokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235897; c=relaxed/simple;
	bh=TRuZEMG8YWoD7AC+4GOrUJfg5Kr9NAw2G8HZG37cXV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZilEg3eG9BNL0p41+3Lzgaq8Zvo56m2wfQDgJjrzUS8gWKyympZoET36K4ocHwHAOOIM09F7d3qpN4XLP6O+OiFR3Fy9RF0eyh8SM+vD84yEFOf+/eC/AYm5MLTmDie450HcPm+3qjq5YN8czamHwwmXn3YHzd0S7j6q92qdcA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTzF2xwq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTzF2xwq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so4063012f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235893; x=1759840693; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3qy5r7hvv1J3r6dinn0Sogr/iaDbB6XdxwCfFluXsU=;
        b=RTzF2xwqP5ucDaqwVyKuJCvbxjhr8lHVdMvDIHBUXvNEnw+CkJeDaSXZQqyi9kBB5W
         vemrsIb5U/uO3+kD7+zhkrwIzjB6hAvu9BJwCew6ZzteQwlM2Qo1fWf7Jn2Ut7l7Bc7Y
         Ck0Ffc2eVx0z5TgFqit3AR7O7kENCDcyKVWpUMoDbA9IeVF5EnHsqPPqe51o+9xqnBTX
         iJO9en09s1r3QhSo4l+EvSb1PVkh8HAcjBVI22V60MQxa6AGtsWLHQVePrY9KZsmuj7U
         /gtiLw1jaainPQ/tMx76iE9xp1ZqMsqMx/CgiC3ExlQQHkqqpxvPobSB/fFzjdPC8uut
         JV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235893; x=1759840693;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3qy5r7hvv1J3r6dinn0Sogr/iaDbB6XdxwCfFluXsU=;
        b=nVqYQ6AkIrxREWwv/U3OhxRU6ewOBJTkFEfWyBSn5SPCRAQZmMPj8Ba+xIQPNex/3n
         S/5M9ztgeZ6dxY1UwdcDIjxKzVZ6VUcDuMhUP3C6EsjYNGweQbCpZtnMzdeJzGJWs66J
         xJF2tzJTXIAdSu4UkqCXJec2sSq12sGtCchTb1fTkDanAPr1OIMY3sLJGJjiqIZ4QFTD
         7PndeLuHgYyq27mS0AtJGTUDjYd9prviFxVDQgkhpdViuwOlJGhQi+2YvhrqrM59Vz5E
         M6LiCYf1RoHDu+jgW7CYBA7M5f4FBUmQqlac9W3711lv1rb7wBX/CwVsf0QaRzSwniyF
         B8OA==
X-Forwarded-Encrypted: i=1; AJvYcCWQE7LRk9TrU6BEFCiB9Bv4FNmuGkIxTfPrgTwFzQQ59nFaJWFPPczoa9/Xsn30PlR64cn6mCeKoGtE8WmXvyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLuDop7FGVCsFoSaUWa1Umtn8h46tz0SRP0wvbsf++JUqJlyA
	l/r1lNifkBQs406tJwixOSkEDxBFVu0wg7aSbUeb0sMq+MgElkLWd+7l40HwIfWJJbMw0VXOi6T
	2SZdN
X-Gm-Gg: ASbGncvbB+NN8E2oGUArAPSLvvZOqcUS/DRSel7OvP96Z+Qy/Eoe8c9FS05nr+PlPxC
	tl+RjT5eWAiWUrcJ5XUbs58Cdl1j/uQXVDZ19IynSyeJXu87ALM9U7Mhs1g//4F88wNKZs/EVWP
	wJxd5qizeSs1xaC8v6DG1zT9qm8H4XrsYgVP6aNtn4T0O93uBi1fs1RJCKmZZrrxYfUwBtG/YUC
	2WvK/HPuXFIoLOjwwpQirD8rNe3zkKznCgfafvPDRTRVcYShk5dEEpjMqCoq63hplhLVJSB320K
	Do85kUvennyxi+9fNiJSi22NL4KaUaL+txzp2uI2rmI/yKg4UQT+LvbAXSRwUhIuDV6B/opxZ0V
	q7Xxxnwi/DzpWJk4ExaITifvVI/DqazgRKQK3ESZKn9pRRo89ZTb8
X-Google-Smtp-Source: AGHT+IF4ajsY7TSW0w2cltpeiR3Y44gTYcWo/2pv8CO+hAiKdk1ZuHmaFqdShvixe7b/cut30bzhRw==
X-Received: by 2002:a05:6000:2002:b0:3ee:126a:7aab with SMTP id ffacd0b85a97d-40e4dabf373mr19174181f8f.57.1759235893126;
        Tue, 30 Sep 2025 05:38:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc88b0779sm22291541f8f.58.2025.09.30.05.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:38:12 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:38:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Robert Love <robert.w.love@intel.com>
Cc: Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: libfc: Prevent integer overflow in fc_fcp_recv_data()
Message-ID: <aNvPMet7TPtM9CY1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "offset" comes from the skb->data that we received.  Here the code is
verifying that "offset + len" is within bounds however it does not take
integer overflows into account.  Use size_add() to be safe.

This would only be an issue on 32bit systems which are probably a very
small percent of the users.  Still, it's worth fixing just for
correctness sake.

Fixes: 42e9a92fe6a9 ("[SCSI] libfc: A modular Fibre Channel library")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/libfc/fc_fcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/libfc/fc_fcp.c b/drivers/scsi/libfc/fc_fcp.c
index 16d0f02af1e4..31d08c115521 100644
--- a/drivers/scsi/libfc/fc_fcp.c
+++ b/drivers/scsi/libfc/fc_fcp.c
@@ -503,7 +503,7 @@ static void fc_fcp_recv_data(struct fc_fcp_pkt *fsp, struct fc_frame *fp)
 		host_bcode = FC_ERROR;
 		goto err;
 	}
-	if (offset + len > fsp->data_len) {
+	if (size_add(offset, len) > fsp->data_len) {
 		/* this should never happen */
 		if ((fr_flags(fp) & FCPHF_CRC_UNCHECKED) &&
 		    fc_frame_crc_check(fp))
-- 
2.51.0

