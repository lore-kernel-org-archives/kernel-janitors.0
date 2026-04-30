Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41871925BC
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Apr 2026 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777577776; cv=none; b=MmQRhqHbIrZ+A4IDw52REMrOVUtTMZb9x2SjRHwLzG74v/ZHvSeMOON2hNzBnOfBM9Yak1yEshOymUEDbXZ8r0SGtwkdcFYYfQxx3R3qNIi+W1v8fW+yxfRcy0TnDtnXXUN4LWtqpn3uN4mdRAddAGSsUNyg+6V3oRVvz/6M7Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777577776; c=relaxed/simple;
	bh=g1DdlrMt/CkgIcA/T8HOsex0zj/lJDdO4s30iu/dasE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c9XJZncn68Z19z9f/o6xv4RbOSfj05QVhStzj1TELzWrmTb3PGi1ItoANva04CZK9t8VOxbktJfR+sadwBQy1mM8RvgHF9qgr67+0nxkgbMuugCjb++OevX+WYy901qWo116Pl7m3e8a9Y1EBka2EB8YlzgS414KE1BRLXKXafM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHL5BnBE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHL5BnBE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso16444725e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Apr 2026 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777577773; x=1778182573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+76ABm/WaUtbne2+7yg99KNFhUHJhiFPf1yo1/iOYY=;
        b=JHL5BnBEUV3GM6Nyf4Os4rZ+2pIe5WARyCABVgIu4aBXavttO0mL5QpsJcm99gneOC
         JBjcvFYFRN51S86hxQN4+i+rdi3U3oc1zOYiIV29YwAnx1EDQMPRjIBoblVokzC5Q6Xd
         T9JMPrsnffvpAOlmGW04+kZ7k9KVi9Y4C85DZXMzapcdA5iHYvI9HPxxkGCyX1Dv6CwA
         TfG+nbEcYC6spF2JBQTypPkn0cywHv9wiWwoQBSoptdwZKLMz3Z+fJ0y2mMvu3NRfsBL
         gHgJmr0Z7aqFb8HRCyf1IcFkKlf31p3yf18xc24jJ8fQx9SL/s0wkSUvDVCoHN4+L7OK
         lQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777577773; x=1778182573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+76ABm/WaUtbne2+7yg99KNFhUHJhiFPf1yo1/iOYY=;
        b=h8EomjlIzJVuBxBNqTpl8tmpLUvVwBdLbkE2vogDaonjGGgzFEvIjsowdvxi2WIA3F
         CMep83jcL+zmIBy208il3w0Ut5RwFKogc2v8DvgnFkJ7+fmjIChjVDPksjYjkWmUzoCo
         SQ+UciEZaBWv9SUdZiCruocMzx3Wwh3QXPGDXJdwSUixvYWbNBpK39b43RcJ8wNi7B9h
         kMN5on6XKpXk4uC8ToX6FjfQSb0GuQIWSO8sDU80X//gf0qfL8mcRJiaanrF+KfwZEPA
         opohZvYjNjqMS8yryOdU2AnG539ZajkSNrgY3DCzYK0S0q3ddcjWC0WsRx3GEc/YxykO
         cbUw==
X-Gm-Message-State: AOJu0YzFaM+Js2Rxx+MI5ukOzg7qAypU0LGs3jtlfAZwJh4Ktp1qbJY3
	gejF8wRCN/C+ffLs849mm85mV2ctxcetnneGDvveQ15zpwU0awR/Sv8U
X-Gm-Gg: AeBDievCws51OzCo2T6ig+Zqdp6TXqJjide5dBFGjpzFrvVRysLz0T7Izm9kjKum9PL
	tBe4PC6UDhs+r+pk8qGAmTlZAYCT6qIxLun7+BO0xB7ivOuhCy8zZtpEcEgVx2ehJg3wEL3tgPs
	RRUkeAtyWIhaZdacTq/L/j4X7y3gOhvvtPFTNbZIuSiZCzt3uSosLCrdPxcJvUvNAMAv1wFn1vw
	jP/IrRljPB8Ry5ljX9tbbk2s1L3VzCmTdtdnsI4mCL4r7uVw6fmPizWxYgU4skhAH23xyqz6pYn
	v0CV3Fou6VdcKMsUfU1WKrhXF3J+2pH9tHkRPZ4BYLnkMbaLn9ZSaukmrKIKXJwviZlBAGayHb4
	Urq1wzVr898gcyN9Yn5T4xAw7/fhDLkcjk297JodvdzV8wlc4lr9MruqOKR4ZxebUDgEIGY2Z/5
	RcxS4E8S3pMf/D/tH7UyF4d9ulSvv9+bjt
X-Received: by 2002:a05:600c:354d:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-48a8445e8bcmr71043215e9.28.1777577772997;
        Thu, 30 Apr 2026 12:36:12 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fe8sm2264485e9.8.2026.04.30.12.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:36:12 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nige?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/sched: Fix spelling mistake "sumission" -> "submission"
Date: Thu, 30 Apr 2026 20:34:46 +0100
Message-ID: <20260430193446.1062933-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/scheduler/tests/tests_scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
index 8b2e4ef9915f..4728e4605818 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
@@ -599,7 +599,7 @@ static void drm_sched_scheduler_two_clients_test(struct kunit *test)
 	 *  -  qd: Number of outstanding jobs in the client/entity
 	 */
 
-	pr_info(" [pct] - Job sumission progress\n"
+	pr_info(" [pct] - Job submission progress\n"
 " [cps] - Cycles per second\n"
 "  [qd] - Number of outstanding jobs in the client/entity\n");
 	pr_info("%s:\n\t            pct1 cps1 qd1;  pct2 cps2 qd2\n",
-- 
2.53.0

