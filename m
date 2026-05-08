Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6157374E57
	for <kernel-janitors@vger.kernel.org>; Fri,  8 May 2026 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226726; cv=none; b=TEsFh+EQ3TOvfItn+/wE1gAfsrmWP6RamnvDrN+o9BZwB5AqFEoMNqr3YBvD9zmdqtEzzcCr8kAiKy75U6MPHyDFlvxdpUqkxvILkFgiF4Kiv6IafbaqjODLowkS0ECWgnzBAy4hdmRuBAeBf2ZSRInNRs2/UNCsiXrFoEHBUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226726; c=relaxed/simple;
	bh=+hGFEzL83JRjm/4SymQAvrLQcOvD7wmAyNC0O9gabE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kc0PW7BxV9l9Of/49Ex/GPEAXOifFqGJjT++FqBBRIxH1QPaJSINBwGc86A8mNYEBIlYgVYovUyAP1t2W+ugMdA5a/XS13LI9SLWSSKxxbK98JG8NZv2K7T8qQTbFwV70FxJXugcarL/Oj676NJC9OpBMShiBij7rsBWmUQz47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkFWzna8; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkFWzna8"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso19401576d6.1
        for <kernel-janitors@vger.kernel.org>; Fri, 08 May 2026 00:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778226723; x=1778831523; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDoE2rE1SAE6iZmEWNqg67hZIZXJqKOJm3oC+rNyc8Q=;
        b=ZkFWzna8VD5A/DFCXeIVzbULEPAFh6KKNSV4/xsrkHWgXn8cxgwbVv1WTuogc3l38E
         IRVw7WmOtAJCF9Na8iQ5Bj+jO01SJjoJAlPoLZa6ZVDtbLqHk+oe7AluYQcM+O5K+rtA
         W4zEykc9+m+EiqqGgcKX4T6/Nm5qQQ+IZiu2XVY6GtN6v3dprbGy7t4UJ7jDQZlqus9R
         j6UsAuDHF3QZ4fYSksBHUYbTU0Q+C03xZKnRICCYaGXtisYWuXdYtiDcqpFw3ptf6N4u
         k6QuNKWhvy4gZdYSs+RYMOITh+ensIMRX7eRJ7vTPTBXM4xZAqoeUmw9dnCpzXvm2+QB
         O61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226723; x=1778831523;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDoE2rE1SAE6iZmEWNqg67hZIZXJqKOJm3oC+rNyc8Q=;
        b=sD+rrJfahiP+6inm6H7nXfhDOt95SQveXZUvUmghmnXICJmZO6JNoOBayAVzO8tSkE
         0WNBjB9gbTNCyPTCHIvNmFRdw22fBPEfLLetWl+8Slat8YvPrbAPWd3ZoNQUR1XsMkMR
         LXkaoQA3LuNj7DXrOAP5gfWzl/pChbi/9IE2wRhB3MzGTLlpbFk6HX1RLTJqW/Z/HK8+
         Qp0EDa3FlCYaiiHTuwCRvk9vAxSBGbrIF7WN8qcAmRt1KRqO9POr0W0xpYdec5yonWBr
         eqBnmkUlAMmlTKHUw9UfiAf1gHgtsWUEZvETT7/dCCOdrA1MQ1CuBYD8Lvvlo9w1JsOY
         Mlxg==
X-Forwarded-Encrypted: i=1; AFNElJ/eU+Cq1dq3xiCj5xogB3hUWgKA36nNf6OFYrg+GQ56+5vD7B6nx1A/MXUDBswrPMx6OKqWorUyAtRwasU4z0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhrAQYrspS8zXT7p3moFlHwZSblsCUnFu6OCilgMxced/UvJ7
	Qa0lRE+z4HXPwaldKOknOlfTia78OHovCl38RJ5IGXYoz19IzjphuMbv
X-Gm-Gg: Acq92OGa5YZ74yIm0K/Qzg6p2cuWNT1BcoVyomB0cPkWn8sbhzsl+I9r2nEOAD5JNGl
	R2foTxURjsk2g3TLLRgPUyJcUIkmZWY+kRcVeVHMO2ao9q915RcCiNir5IP1IRubW55lLQVoTFj
	fnDkY0tToAy6CBcDoX6L0DkjdWxQhj3mtkGWMmWspH+00Q7vIfj6TRhm/CqabVgkKi+u4RNMGX+
	QtgDMSHP6aqPdBmXblq1fE1C0ehIaC6vhXruWhWY9bMAC1oVihYaR+RAmY1jgmVRZh5e5KAAUHX
	5k6j+LLt8osp5MsmQPpFXN2H4zhM63k5yNI6EsEZ0Jhk1YoMqNN/6xUa+nXjUGONluBSbpg0sEE
	4YpZuYlj1RWTzFsNMYyxZMwutUSV0eFG/xgSVWexYAL/D/sLJxacic0k9Lb9fSIwdYL9XzK3sY/
	6RAeIrEx7IaDI69w1P9wbCi8zBUyvV
X-Received: by 2002:ad4:5aa5:0:b0:8ac:a266:ce34 with SMTP id 6a1803df08f44-8bdb6ec5e9dmr92649186d6.3.1778226722878;
        Fri, 08 May 2026 00:52:02 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3addb413sm11845026d6.9.2026.05.08.00.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:52:02 -0700 (PDT)
Date: Fri, 8 May 2026 10:51:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandre Bounine <alexandre.bounine@idt.com>
Cc: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Chul Kim <chul.kim@idt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rapidio/tsi721: Prevent a bad dereference in tsi721_db_dpc()
Message-ID: <af2WHMZiqMwdYveO@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

With a list_for_each() loop, if we don't find the item we are looking
for in the list, then the loop exits with the iterator, which is "dbell"
in this loop, pointing to invalid memory.

This code uses the "found" variable to determine if we have found the
doorbell we are looking for or not.  However, the problem that the
"found" variable needs to be set to false at the start of each iteration,
otherwise after the first correct doorbell, then everything is marked as
found.

Reset the "found" to false at the start of the iteration and move the
variable inside the loop.

Fixes: 48618fb4e522 ("RapidIO: add mport driver for Tsi721 bridge")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/rapidio/devices/tsi721.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
index 66331e67cf4e..71b87bf8c31d 100644
--- a/drivers/rapidio/devices/tsi721.c
+++ b/drivers/rapidio/devices/tsi721.c
@@ -394,7 +394,6 @@ static void tsi721_db_dpc(struct work_struct *work)
 						    idb_work);
 	struct rio_mport *mport;
 	struct rio_dbell *dbell;
-	int found = 0;
 	u32 wr_ptr, rd_ptr;
 	u64 *idb_entry;
 	u32 regval;
@@ -412,6 +411,8 @@ static void tsi721_db_dpc(struct work_struct *work)
 	rd_ptr = ioread32(priv->regs + TSI721_IDQ_RP(IDB_QUEUE)) % IDB_QSIZE;
 
 	while (wr_ptr != rd_ptr) {
+		int found = 0;
+
 		idb_entry = (u64 *)(priv->idb_base +
 					(TSI721_IDB_ENTRY_SIZE * rd_ptr));
 		rd_ptr++;
-- 
2.53.0

