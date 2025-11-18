Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3152EF66E
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Nov 2025 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463140; cv=none; b=IGubdEBcW7+o87B/U9JAsOa/c2miZ5cIT8wciDI3FkDJtHONyOLAfZsl/PDW7ZuJqBb4c7fTIoqrLfAb0QdtaP9hbL4DN8RDkt1sWpnQgEQXV1w/6ISF+gihPkNBa4Wx0VhNTx1kIz1xEige2T/LKGuI6eiaHaHq1E+z94SwTZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463140; c=relaxed/simple;
	bh=AW5+d6KVs/jU1qw1fZdT24U/ZZM+94jgRm1QSjEBmb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhIwXYqOQTDr7UuEczG6ePPFaJOsG8EMXIrrQ0UFqILf0K2vllJuB8AkZPog4UA9jAP4j/NoI92B1dwUpvS7XAx1bQwtemWpvO++SIGn1Zv2LDppWThRRpYBvaJK97qNi00REQmfobnpdADfNTe31yRmvve5NGm0kZihpsM25Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcoO137T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcoO137T"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b2dc17965so4344129f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Nov 2025 02:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763463137; x=1764067937; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zscoEzxzpyUe8qPqbhispQ/2WF7eSYXb3vUOtEoYZYw=;
        b=pcoO137TxlICDtQggykYRQ7nLIEM1P6rDXgoCl9RPFpCT6otJEUOFNIpI3wQVGDOlr
         +KQy0/WQQbWoX2RxVlW8ZHvMlbA5KKkWBANlZlYInFjxSAa1f544AEynNJPIrisy+lGB
         PYohKNTkHcDk1BB+dTMEBOVyUZZ0cPpK3oHNkxAZdBEv9TVzD7xsW7VnpaZsokDWEkDU
         iVhkfxcqwIQ9l1kAOxxb8c38qZ2qqJDVTGJroLAhlqFJ3VVpW1cNmbkGL+TTqmJeoBaR
         ZmAqTnGfTlEyia0e0oZrx68P2UM6v6anJwFTKV8WDKYfXJS4aOgsqCunakZY0HcKQ1eG
         Iuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463137; x=1764067937;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zscoEzxzpyUe8qPqbhispQ/2WF7eSYXb3vUOtEoYZYw=;
        b=xAIF0extVQSra92fgX2t/THiZ7HqemxTnOI2otzyi4YiH1IDoEq+SSW1XHGhfiRvBH
         AJgDv+oLQeP8zjxYA5Dt15A2k+DAFfxUuQbgSQ9SOzeH7Qj7WRTByGC/ViLrLPTtjJmk
         L+gZlk/klIRFzWUTyXXXbnrWc8wIdO0lAw0ET+KqpQuVFjLzUs/QEbrIrL2s4ZHFXnQL
         pSMwGqn0aKjR69OdxN4R5waZjUjqzSsAnh2G/NwOQAbbhdu+oSlPrvRiWdkA8Df1oAGD
         y6YjeFADTgd/ahaSdXw1JsdL7zL53BHbsCdaYutEjgbFSD6k623rZy/EcY0mVGWUSK8V
         UFYA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Q15av5qO5YGTLYQIBLiU9LqgJDOttU5+1Lx+kg62FiHWy2thxoJvznBfh7t/Peqc5wqWZMcUN9zuxDiPCj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDyVYPnaELQs4YMGZq4ZFpRvEDOPeXmT/mwuPbNA+KIq3rc49
	ZiVyxb6JC057fkCvBbuXog+PqGpq2JE4vPlB6Y9Sj349iead30V/OhKTgepC/tv3RAY=
X-Gm-Gg: ASbGncvX/rGPasblAL0wVtWCmps6ANBIimlbRwRd3/6PdvvH386IFAJqTQ60tuz/w4O
	L4Nr3iAOjs1oQCQmF1C9hqrQIKqXdWG09MvmFsOu73bNE0eRKc/nT44WVirlzqK08zA1IYR3LHu
	9YXFLbGK+Kf+wU4ltUnn+Ho3LsXWeI3X0Wb3rfHkaPIqJuAFZ6cKXWfs2Ib1WkyE++2dm7Sw7TP
	3csiXKFMH1RDMLqDGVI9dTO9UXgYVb0ZulaEC17VAezrQOxVO9INVWNPhHDI9/yl7lnmI6uhbgv
	vxqPHiBbzxBoxyDqyeilz0utGPdIc7jJ2lFtdlZkqXE163mTfxzsBQ1+IeKOVvYFEwOJ+bQaqSF
	mOmmHaHuBd1H0QJQqh+ktXTxGRuA8/y0Ecmq2oAGeQND+HCKhK7cOlK1Sp35dmrDzSEgQMgieBC
	RemNb1SA==
X-Google-Smtp-Source: AGHT+IHNwyYTYLJgZi7N6YIaIizYeNVzG3FffpiHlLF3dnlal7Qh5mvZVG+uHjTWCBuIvAKscpesSw==
X-Received: by 2002:a05:6000:178c:b0:42b:3ed2:c08a with SMTP id ffacd0b85a97d-42b5933e40fmr16604689f8f.13.1763463136931;
        Tue, 18 Nov 2025 02:52:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53f0b8a0sm32003077f8f.25.2025.11.18.02.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:52:16 -0800 (PST)
Date: Tue, 18 Nov 2025 13:52:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rseq: Delete duplicate if statement in
 rseq_virt_userspace_exit()
Message-ID: <aRxP3YcwscrP1BU_@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This if statement is indented weirdly.  It's a duplicate and doesn't
affect runtime (beyond wasting a little time).  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This was introduced in commit 32034df66b5f ("rseq: Switch to TIF_RSEQ if
supported") but it doesn't cause a bug, so there is no Fixes tag.

 include/linux/rseq.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/rseq.h b/include/linux/rseq.h
index b5e4803c4ebe..bf8a6bf315f3 100644
--- a/include/linux/rseq.h
+++ b/include/linux/rseq.h
@@ -126,7 +126,6 @@ static inline void rseq_force_update(void)
  */
 static inline void rseq_virt_userspace_exit(void)
 {
-	if (current->rseq.event.sched_switch)
 	/*
 	 * The generic optimization for deferring RSEQ updates until the next
 	 * exit relies on having a dedicated TIF_RSEQ.
-- 
2.51.0

