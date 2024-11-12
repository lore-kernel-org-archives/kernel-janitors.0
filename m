Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54772123F0
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407009; cv=none; b=s8c9QGj86ZpA4IBNRGC3CiMS//8UF31QUF6rEU/PaQfn+t/f3oBPd33fZNBQkDrPgVsdFHpB64Z584Dstg9cz7cpS12LPNhTWfIbCwsET/fU86ElOJaaqk4IXLjnEv1JNbVgLDBM0TWfQ1SsMaV4Mi+iGBoohwf0fojyjwn2qMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407009; c=relaxed/simple;
	bh=5zn6QDm+5JONhM/X6FzXT+b3IMfiG4Yf/coEYQ5RTcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nizmHt5IiviBcB5ZmLyk09OYGJncTRHCWSbT2V6EpM2ZKzFQNga84usC+4JNDzvqsRp/Xxdz0d/C7v/kZLLtDfwFe77ZRcBc5YdaIIx+22lDLXcoBh2kIwT5yKab7pafoWSejGdw+xTRmmjYggd70GwuogZioLiRJJLZYEK2r4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVBXrdg8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVBXrdg8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so363945466b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 02:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407006; x=1732011806; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9UJLcVLjMsCGZ1NrOuqE4NTMM7+4VNPA65AdGe5Wz2E=;
        b=nVBXrdg8lXKc/uMws2ehN1+aM87Nrvvxax6EIWHy4Ro30tBeW8xo+74epQDOIClmnU
         5AQnCx80E0pJNDkeyx0JO9+IwcRQ3yLliJcpwv/i4jw87lr3PNNJVDKmc0Cbgm/pZbvk
         Q5w64jsl1nzK57BqbNUe4cQJnjZefxt5fqXNQSg1I3bWFcWIPIj3ZMmp+fZkTCydpwZR
         BF8m+hMtllWgRrOfb+vVxLiGMcNy6UnU8MS1LpctHmMEz8IbHmey6J0CSQFK0L9O6wOB
         aWu1K7rUFmJNhmDtE2XajzommiuWb/HjpXLKGfjlNCUfFb1mtYj7cUnj131t8khAk50O
         O/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407006; x=1732011806;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UJLcVLjMsCGZ1NrOuqE4NTMM7+4VNPA65AdGe5Wz2E=;
        b=T+vPW50pw4mXw3ZtDK8f/JC6Eo8VB4N+aTjhDhlbkjxZBkCtlMTQrv2ZzrqGBoFHPQ
         oPiFIXZ4SwSsWXkCULiqG8CZCR4oezRREas/Hi/nE2NyebYkpGvG6dqo5SoRUSuTnZm0
         LHz2LPf/qN/G/N8uklkryD/NM8pxmb2Tgjgam6S6a5u3JMLM7CtmaMl5EJ32vx49MYiO
         PU5LGY0phrdVZFzoGdFk+IxVnOGuaK3cTiQurnTmInTK7rGUAYE3pOJ/OUKT6XTSD8Ct
         N78MaAlRWQpZ3BeVEDskCgi5EW9K4+0ubz4wwAE3gMjlv/TiQPDUiV9+ep+h5e7DsjMG
         zzMw==
X-Forwarded-Encrypted: i=1; AJvYcCXXz+cS0Mf0AW4QvXeT9vmxNVvjOD7TmEjSsdL+piZ7febf6BcnqA9cMVi04lseeUwdyS7zojbszKm3rBlA+ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/J/Ileiqo4/OovcyzxPd79CtD3U953h2J/nqEZFcUuJYxqio
	Q0P7lhJW0teyh/RIWTeIQ3UX/siKXgRvL21H+3rPJutfvgrRGzwsM+tnLAyHpGWS+SVtlavSLuA
	f
X-Google-Smtp-Source: AGHT+IFT9TkjV97fDB0mBH8vI112tVWHpyJwXeKKCy8t3BAkylLtZW5YvoHNeLMzXihVqki276S4JQ==
X-Received: by 2002:a17:907:1b0e:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-aa1b10a45a5mr234361466b.31.1731407006255;
        Tue, 12 Nov 2024 02:23:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def900sm703662766b.147.2024.11.12.02.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:23:25 -0800 (PST)
Date: Tue, 12 Nov 2024 13:23:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: [bug report] scftorture: Use a lock-less list to free memory.
Message-ID: <2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Sebastian Andrzej Siewior,

Commit 4788c861ad7e ("scftorture: Use a lock-less list to free
memory.") from Nov 8, 2024 (linux-next), leads to the following
Smatch static checker warning:

	kernel/scftorture.c:393 scftorture_invoke_one()
	error: we previously assumed 'scfcp' could be null (see line 382)

kernel/scftorture.c
    342 static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_random_state *trsp)
    343 {
    344         bool allocfail = false;
    345         uintptr_t cpu;
    346         int ret = 0;
    347         struct scf_check *scfcp = NULL;
    348         struct scf_selector *scfsp = scf_sel_rand(trsp);
    349 
    350         if (scfsp->scfs_prim == SCF_PRIM_SINGLE || scfsp->scfs_wait) {
    351                 scfcp = kmalloc(sizeof(*scfcp), GFP_ATOMIC);
    352                 if (!scfcp) {
    353                         WARN_ON_ONCE(!IS_ENABLED(CONFIG_KASAN));
    354                         atomic_inc(&n_alloc_errs);
    355                         allocfail = true;
    356                 } else {
    357                         scfcp->scfc_cpu = -1;
    358                         scfcp->scfc_wait = scfsp->scfs_wait;
    359                         scfcp->scfc_out = false;
    360                         scfcp->scfc_rpc = false;
    361                 }
    362         }
    363         if (use_cpus_read_lock)
    364                 cpus_read_lock();
    365         else
    366                 preempt_disable();
    367         switch (scfsp->scfs_prim) {
    368         case SCF_PRIM_RESCHED:
    369                 if (IS_BUILTIN(CONFIG_SCF_TORTURE_TEST)) {
    370                         cpu = torture_random(trsp) % nr_cpu_ids;
    371                         scfp->n_resched++;
    372                         resched_cpu(cpu);
    373                         this_cpu_inc(scf_invoked_count);
    374                 }
    375                 break;
    376         case SCF_PRIM_SINGLE:
    377                 cpu = torture_random(trsp) % nr_cpu_ids;
    378                 if (scfsp->scfs_wait)
    379                         scfp->n_single_wait++;
    380                 else
    381                         scfp->n_single++;
    382                 if (scfcp) {

This code assumes that scfcp can be NULL.

    383                         scfcp->scfc_cpu = cpu;
    384                         barrier(); // Prevent race-reduction compiler optimizations.
    385                         scfcp->scfc_in = true;
    386                 }
    387                 ret = smp_call_function_single(cpu, scf_handler_1, (void *)scfcp, scfsp->scfs_wait);
    388                 if (ret) {
    389                         if (scfsp->scfs_wait)
    390                                 scfp->n_single_wait_ofl++;
    391                         else
    392                                 scfp->n_single_ofl++;
--> 393                         scf_add_to_free_list(scfcp);

Originally this was a kfree(scfcp) which can accept a NULL, but
scf_add_to_free_list() can't handle a NULL parameter.

    394                         scfcp = NULL;
    395                 }
    396                 break;
    397         case SCF_PRIM_SINGLE_RPC:

regards,
dan carpenter
