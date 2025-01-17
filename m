Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED881FF1D2
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737118533; cv=none; b=p72OfSi65lX3BmfhP9/dGRwBOcMmOhC9jW03LSz1qDWarcY1JN4TZ8QPXbnEOnmTWezXLjjelYdlgyBApgFQeV84DBmIPjjRipoAuChDb2o9egbOEc7BFJ24kumzI8POeDfEhACYWGMZfUlBLK76sfPlq7YUPK29+KBu8yAgB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737118533; c=relaxed/simple;
	bh=X8anZV27FZCgXW3F5EqnL5fY9LwcbNE90sBSOU25nzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWoDnCISGC6hovAXL8FHbVYXP6DPkV8Ergc6jNDVBSQQ7jlq5vF/+yAxd1iareomX5K4+m5aTyEKLQvt5j9ZhE/K8tGXJVtvzQblzl7h5ccEWziZ50X9j4kukU6dwQJ1aSapNgp8zhqZnnsHGjJ8frSe3JGAGYtHOdE1HVuBL/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7oXRpmw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7oXRpmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737118530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i/Ub09OUl9RsJ71owNWlOANuCEZ1Ov31/V75zShlIM0=;
	b=i7oXRpmwBPKpdhKCyXTycdCROr+nIQMYuu+ISObq0F1Ru7D89ePiyUhhHk7d6XUrvMZ8I4
	LFYTzLPuUgAPatQHP9stufDEeVHo0myREfjVlTQpU7VsvaI6Aa2Zkw6x+SFzP2Nb1yVfTp
	gRpEbRyl5n1WDKb0O5XLw+O307f0yt4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313--WO4HCZdO2y0HDHpfanktg-1; Fri, 17 Jan 2025 07:55:29 -0500
X-MC-Unique: -WO4HCZdO2y0HDHpfanktg-1
X-Mimecast-MFC-AGG-ID: -WO4HCZdO2y0HDHpfanktg
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4678b42cbfeso39471321cf.3
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 04:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737118529; x=1737723329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/Ub09OUl9RsJ71owNWlOANuCEZ1Ov31/V75zShlIM0=;
        b=RClCabk4Dp75m/0uMivsxTL3+bB799lU5qMsGdiCIaP7nlKTw08apjJdTb6DOQyzoV
         aO/2W8AIRgwf7xwPLCVx/4Kkc7uqpuv3CPlBGRpWSPpl0iovSe7CTBfqGcQXufRHqxiB
         t4qq5ReK4jiEZ7DYXDImzgg2o7KPWM6fqdY/lWf/cKq7m5o3THi4GnpbuYxA7luKX5Xp
         n07ARH5bfFkfpoZBpnafGhSpoU4EDAcyJrbAJenJKTo1GaaNBGLn9dtfNk4aWhzdfsnN
         ORC3h9kmBvFQ1cmGKlNfbQgrIJKKI0Ul99Y4qgi6dXPJqqqp+h9m1srGcWeDvBN/c5Hl
         vZwA==
X-Forwarded-Encrypted: i=1; AJvYcCWWHr3qIu77m9DOhpGIil1R1bVC4ElSrygde5Ak4W4mFBwhpiOECCJ2ggAZSIfWkiHoEZ3TfR8IK2l5+VZtXl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpNh3nFh6rmYPzm/DQ8kpM+BtdM/nnd3HdVF8dLU1yey6mz1B
	U11xtXRPVZYfm7zqxXAkACIyLvTtOnZhPvKUX/sidsu/sF8KEYuMZfPgChUtIcHh73lf3USDUZh
	OmJ9zgMgNqCRNi2NjS6lAQ9hMzKAv56S7PZebYDKfS6nedGDmawt3zVj6oJ+/IbBsBw==
X-Gm-Gg: ASbGncubi5ZfoV0s4FNx7T4tA19QMebIeVERS5jb1ibxa9VdQfW6PNNh2q685BriVZK
	13ZZcgwUQkIID32Am6C52jOr//bbHuDnOWccLLi7xvCEfshiW5CvbLI/68LpXOximfR+NiDz8qd
	SYaxelLhWbFqpmXmBRoasdmaoec/JD1Pe7MQaPGAAf0dzlPHBRR7nIrbNKGN8+iXCNWi/g40t8g
	gOunBKX7dShT6KuL+rm9fZHrUCZUvDm4UmjwIY0eb218MyPCT2VE5U4kYx5pzAwW6vTH7s2oevO
	+XtTqYhVUfL+ULzNn4gxWYM=
X-Received: by 2002:a05:6214:3197:b0:6d8:8a01:64e2 with SMTP id 6a1803df08f44-6e1b21e2e0emr39493926d6.43.1737118528988;
        Fri, 17 Jan 2025 04:55:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx3VOtr4krB36MByyqD5emK2TbJbOECiK3nFAsHVkyKtYlRN7uMRhrwZIBRHacmF4EwSlKuw==
X-Received: by 2002:a05:6214:3197:b0:6d8:8a01:64e2 with SMTP id 6a1803df08f44-6e1b21e2e0emr39493606d6.43.1737118528701;
        Fri, 17 Jan 2025 04:55:28 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([66.187.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc22d3bsm11032406d6.55.2025.01.17.04.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 04:55:28 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
Date: Fri, 17 Jan 2025 07:55:22 -0500
Message-ID: <20250117125522.99071-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in the
various architecture Kconfig files. In the arm64 architecture, the commit
adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
config.

Remove selecting the replaced config. No functional change, just cleanup.

Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fcdd0ed3eca8..940343beb3d4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -225,7 +225,6 @@ config ARM64
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_GRAPH_RETVAL
 	select HAVE_GCC_PLUGINS
 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
 		HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
-- 
2.47.1

