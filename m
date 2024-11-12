Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE35C20494F
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731428430; cv=none; b=WZN/K0YBZNe+JmuQ+Q/wIggF36mOxlBNcSqAoOCKCy+TjhqqivwgtpT/BHPSomLjY9RLrbm+zh3Uk0le48Td543sDkbuQUsbF45d0HAHx5wj3YVxiezcmjtvbeALAh+BafkjkxPWrLSmu0rZTkl2MJo6n2HCGcsiolqfpB4CfQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731428430; c=relaxed/simple;
	bh=kT/ta0BjrBum/OraAqfdb+N4Gy//ectNDOqvgMI46rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0r67I7RkB/qQz6nor1VrlhcrAkWKHNrQt5A2AgS04FPETGoyQUtRNdSbkst8iwoVrjMSCSrWA1aHBDoKataMBJP8Qrywb7noD/wlJKhfKHR719zsA0WHMtDx+uEBjxmSPj+XneI8F5f8C4kEVBP2Pk43sdjVrjIYDzA1gJG0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nhA9dOsY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oHT3w37J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nhA9dOsY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oHT3w37J"
Date: Tue, 12 Nov 2024 17:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731428424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q90bkERe6YhsoeONJXZvnBhmqp1lWJFNK9oSdTqjLZY=;
	b=nhA9dOsYMM3apDQF4XBzJ5szDo3ZVuM76jShmQJivXCH8J7rvMBrwBjHoUl/RVoz4osbwA
	trzkDDAMJnNkopqFyGn/vfUHfSt9pLVyLgAEOOk8aNsta3MkNI5KKY9pkl7eVGMOVSbYnT
	trC+D49AGbO4Tg+5hE35dfVGhCHV1vFM0gF5w2GMvzgfpGKCB7tPk6gWtwkGO38LGLIVDf
	dum2L2y1ggfILOEd+fi0jIP5s33IfhhEKmVNtUOALkOszdGNM2o4uyMg+Gwe/vMIXKyWsj
	06gIiJuVsyOfm0L90P71opUF/l8ern1rsBxo9txH5MrduEmGKOw/Hf7wAn0mYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731428424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q90bkERe6YhsoeONJXZvnBhmqp1lWJFNK9oSdTqjLZY=;
	b=oHT3w37JWwnx5bNMNq156la6gFK2XR3aTpeDoXUw/4sf0ofEAugeiFbJht8uqRD/LupVb9
	aLA57u68R/GHsLDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scftorture: Handle NULL argument passed to
 scf_add_to_free_list().
Message-ID: <20241112162023.glRj_YAz@linutronix.de>
References: <2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain>

Dan reported that after the rework the newly introduced
scf_add_to_free_list() may get a NULL pointer passed. This replaced
kfree() which was fine with a NULL pointer but scf_add_to_free_list()
isn't.

Let scf_add_to_free_list() handle NULL pointer.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain
Fixes: 4788c861ad7e9 ("scftorture: Use a lock-less list to free memory.")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Thank you Dan. I had to look twice, that `scfsp' above looked almost
identical.

 kernel/scftorture.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/scftorture.c b/kernel/scftorture.c
index eeafd3fc16820..d86d2d9c46248 100644
--- a/kernel/scftorture.c
+++ b/kernel/scftorture.c
@@ -155,6 +155,8 @@ static void scf_add_to_free_list(struct scf_check *scfcp)
 	struct llist_head *pool;
 	unsigned int cpu;
 
+	if (!scfcp)
+		return;
 	cpu = raw_smp_processor_id() % nthreads;
 	pool = &per_cpu(scf_free_pool, cpu);
 	llist_add(&scfcp->scf_node, pool);
-- 
2.45.2

