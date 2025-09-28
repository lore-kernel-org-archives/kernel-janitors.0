Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF961F8AC8
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 21:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759093581; cv=none; b=gDa/wnl1veou8vQ5p9c/Oe2ElngYEVQfBVcusm/O4a8MnqA+FO+jOl51SYJIhbkivsJtMBBuGcXqllV+xQglzkIrl+vhn5PcK9FM8w5B77tMmMax7m6BrLyRi54fjmbbvSqHhhls9UJD/UfCQJMcfFyiIjg765Jf9H1xAC6JIts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759093581; c=relaxed/simple;
	bh=hc97JYJrs85TwiA+5FAaYD0kUVXhjcggsmiNwZw/EdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fz/TPLkUBCLBryyKok2rYpuVz588VIQMkMvK1Pq7GIaoYs6Av8s2enUTBVchYp18NdH/VDqTTVvmp7uFCR2as+uruIFOi2n1M4aoilULIa631sTcbo0BYktZu69+VqpKnccNzGyzRMJEewRaBTs/naLGSTLzVX1YksCJHxF2sqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBCqQKly; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBCqQKly"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e542196c7so144025e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759093578; x=1759698378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7GOZxADKetbNWmP18yfkEj41q2tuf7F+8JZh0ODXm7w=;
        b=mBCqQKly4slaYiyaaV1gvqckYt4FbLHRi7Zlpsd8ogumnw0Mz58bV/UKsWH4l8Ou5m
         v5PzQwgLYgy+eXrUWtQgykYpprbfN45WSKZihOia92rtpjxfIX6lrNTTasK6jmnIpR2V
         SJlnM8/siObN+a3YMWq0rcgSpNlUXi+jOt46jtbXnRmF3KUpfijFxkx/9PyZbWINCl1f
         qS6P55HyT2v+IXA2pcNCN9WtrzcbnBdg2t1MNypXvBQ0ZJLqqkbPOyvtI9Dja3oU5y/m
         PVXOQA+OpoWrKzBmxnis5Uzz+MYalkEGWY29PMXDEgKxHKmdA7r7c/B1ufW7+rufZEiN
         tRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759093578; x=1759698378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GOZxADKetbNWmP18yfkEj41q2tuf7F+8JZh0ODXm7w=;
        b=JnNj/0hZQoyP6HeVQTWAIUiyblInzyzlDaTvFR4LuZfBXIwjubB5GLRsveoN7aPoDM
         kL/9RBoBZAfv1lqIg8AvVj+85r6gRhYsv+BhBVgTAvSo+9LF9rJqGU4FrNxM2VXTw2HS
         7zk8ZEDpcyq43wo/0X8E7GxOAMOY95foHQEoC10h32RFvqQtLxPQ0oV9yHH+1PMyd2u4
         Ga3m2KyjgVgdfZ4P09uWIs5NtQMtcev7lL8/gsgymESNW3m4NzZjHxBCvL+gkvC56quQ
         jfHlH8dXiyRH0wB476X9ULiqo6tZVSVmGzfNh4O4eyWsi3VFDGO+S0HFZxKi2xsODlgI
         RFEA==
X-Gm-Message-State: AOJu0YzERUcOFAdZ0oIQbI3AsrRfhjREILtoNA2WdZSroCfEsa74Vlkv
	ieRAKT74GUl7hhVuRD/LzNUGZHoZYWbdsdaRjalj8qvP0NeoD/mI1Hvl
X-Gm-Gg: ASbGncunWHjgYnxvuuJq77CnY1uJyBS9RpSu6Umu1Oyi++gI2wSPO9d9vddLWIymjZ7
	3CW6nu51bpIHLKWlsEMAouJVFWRweI0AXkkCiw3zvIJRxhrQZzOieLyD4efyDTaBpz+4p7Gb2SD
	SNfURMmmnzBASVrzfn5AN6VtD+VG3eS1ameIqmtACQq4ERBk2YH2AjGkwTrxVIBwJnWJ33XqEXK
	nNThGb1g+8G6Xg4LWAMiNTYGIbX5E1xo+X1OqwjqQjJqUWBLb+TU5Uq1IeIAVdyhrPH8SHJoPL9
	a7ZhNZg45o7udLzC7elWY9uRroWhMsvSdsVOWBHRw56K3HfFySWzzCikzURmtDzNvlwY11eaIa6
	k8AvRiufPEnWUcmVZGs/x9Q==
X-Google-Smtp-Source: AGHT+IHUTJAtPXtQmR3XeP0zOt9RmSQ9hMHtdnuAfVVnI2fiBfQPProKSkthhRtOdJndpA7ra6vBVA==
X-Received: by 2002:a05:6000:1847:b0:3fc:54ff:edbb with SMTP id ffacd0b85a97d-40f60fdfde1mr13463024f8f.9.1759093577811;
        Sun, 28 Sep 2025 14:06:17 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc5602dc2sm15520842f8f.32.2025.09.28.14.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 14:06:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] jffs2: Fix spelling mistake "Synching" -> "Syncing"
Date: Sun, 28 Sep 2025 22:05:28 +0100
Message-ID: <20250928210528.243027-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a jffs2_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/jffs2/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 1b833bbffcf5..116567899e23 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -83,7 +83,7 @@ static struct jffs2_eraseblock *jffs2_find_gc_block(struct jffs2_sb_info *c)
 		nextlist = &c->erasable_list;
 	} else if (!list_empty(&c->erasable_pending_wbuf_list)) {
 		/* There are blocks are waiting for the wbuf sync */
-		jffs2_dbg(1, "Synching wbuf in order to reuse erasable_pending_wbuf_list blocks\n");
+		jffs2_dbg(1, "Syncing wbuf in order to reuse erasable_pending_wbuf_list blocks\n");
 		spin_unlock(&c->erase_completion_lock);
 		jffs2_flush_wbuf_pad(c);
 		spin_lock(&c->erase_completion_lock);
-- 
2.51.0

