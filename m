Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF66261586
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Nov 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334678; cv=none; b=b1wefqyQGdok06GO3I6iHBxUYjI5L43mTaNUENCkKnJCS3q+ga8XUwKZh/homFxxBAiXNjYu75RYev61mwQJGEeBi4hXbWOikNh4J7j+GBX2Ct3w7gfKBaizF8qgxaP1ELtpqP+hHxiD3+f+9LXOyz1P/dScPl8vygFSYR+f/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334678; c=relaxed/simple;
	bh=WauXXc4vq9dc4m2YhCPTip3cxluiOfELkNgUqBfMKh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XX2AWvemwb9aRnSzAakBM4uRCOxFoO1c9terffWbOQPzSTPAMoyBKNrHjIIK0vaxo7A6O15VzpypNQ3sS6iY6kkXYe4lkav42Q0nmN7+T5SYPj9BfDJfz+FB5T+mCEiojVifOGQuP1XQL4MQmDBSr/t3P/jMxw2VGcrEWoBfs6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PDk6hTQO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y9Adqmma; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PDk6hTQO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y9Adqmma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762334675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g2LtK1WnukuglRDzUwFbcjJQDJY3v+csn/jdcjcqmx4=;
	b=PDk6hTQON5rKtxboLb441TPxgqEEtXaVApQvBixdLU9zbJ4ntK2hZOgdldedv6Y0hO5eVe
	IN+RTKdVaP0/EapUiqKJWAD3wk2J93qoY1m7GCOcMfl/Ha8GN6OwVzc7176AMauI7VWl+F
	wREND9/6xMC3sGTwbrJ9z2jpgws3xts=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-D1Odvd2-MeW8jq5kytE1Lw-1; Wed, 05 Nov 2025 04:24:34 -0500
X-MC-Unique: D1Odvd2-MeW8jq5kytE1Lw-1
X-Mimecast-MFC-AGG-ID: D1Odvd2-MeW8jq5kytE1Lw_1762334673
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47106a388cfso49425515e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Nov 2025 01:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762334673; x=1762939473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2LtK1WnukuglRDzUwFbcjJQDJY3v+csn/jdcjcqmx4=;
        b=Y9AdqmmayJwG1DNdsivkZEqOyP1cqh+UQz79IytjaXcjK83DTIRTLdDEpGCAN/QvHh
         iaCg37kuy9RwkKmwUR3fGxpC/DOR147rOiNHiRQlFmiB7ulSXZjPFTQ2s2RYrFAw51nQ
         v9qcgJsco2siVRi1BkNaBhGlRvRmwft3hQHZuC1V6zXYlMk5v+uwSrCQg4D6Dd+1SRbZ
         RX96OSC2x1SZks49Z9lhoemrW640tq3jHAgxWkRFdkXEi79KRdjx8Ee1WuEuv0omx4F1
         lRVoPP/rNvEMcg3yontKJ8zzuMlO6tiTBMgh1aJ21ML1RF8JIWSb8q/au3SMYdxpXqXP
         +FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334673; x=1762939473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2LtK1WnukuglRDzUwFbcjJQDJY3v+csn/jdcjcqmx4=;
        b=MuAuY3ruPgaoi1dUDg3w6CUlz9pbq2W76nZFs1sEYBdZG6zToVhAeP3+UVjXLvvSrU
         75JqrmGG/HOK/L/SPFmXEDb7ojArROy+llRV9Gv22dcc4GLcerUVLbVMMWZvne5Zg+cV
         focp85jlWDxgJDKe6PySJWNWDNs/1GPW7FOXqoX5IKU6BhJe9W8k1YNSCHdmBQsO94ly
         lZrri0j5tIaevXuKiIr0weVouTy+mZY38bNF/P5fT25Pl22gjTBNuUm1Yv9enTYaVwGa
         2g3rQW/5385Y1147laAo/dmFiZF5FJO3Egbn8TEOv2emj3djxKDwbNhAxx3/dolzBdd2
         wkDQ==
X-Gm-Message-State: AOJu0YzccY1ctfLTl1kEPY6QLhVXewO5a9nIHTvh2uBEKXjs+uM1Q1sQ
	JMRb5ClnCkrau6l7dqngm68ad2sqrzF1qfiJ77hWWuHnsjW/WyylCKeJ6La5qBEEurcEnuqx3gl
	+JAj0Ta1g5D47tNXQ38wmvxuzQVRGjLBVR19Pap7OlXZZ9HgN5f5HpjrJlg77EtH4nxT9zw==
X-Gm-Gg: ASbGncuK6yWQLMJRZXfLvqu1frjYH0ae0+9Aq4vDh/fKusRoe8xN8lYmeegjovlbKlr
	/5hMPwV9sSYg51SSs01MgizLLU/DCbiO7eD3JalkI8qY/MK82s2uleBySuao2Gb+gPRPvBw0oY5
	RH6MYNbSCD8EOTIoCfSwQAuqm/C3jWhy4M4N31xmPTls47BWDO7VLOGh8Ky1UNOpUqb47/xjoi+
	xDOUBwVRmeY4MuG0qD+euIKeso3wiRgsl2EtAG/0r23X3gFXD2Z/AzzMiUbnGPLcEE8vPN5F7De
	GOktqYTfMFyDwvUfNV38GU6K+IG3qQLfJc0k2CtO/7epyMd7oQBx5Nt4z5HfrfHl76UAzCWfTQc
	7D2o4kj4Dx5ZrX3hmZTLwrAg32/lc/rey7YTcT7pE3LUq69Bv
X-Received: by 2002:a05:600c:458d:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4775ce2b680mr18306655e9.28.1762334672792;
        Wed, 05 Nov 2025 01:24:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESJSYhewgGd1RuRz8Lw12CRAo4lDeH14xio5/jvFe4PBjGaxuU2eK1GZT9oVztYInMcPwNfA==
X-Received: by 2002:a05:600c:458d:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4775ce2b680mr18306425e9.28.1762334672276;
        Wed, 05 Nov 2025 01:24:32 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc2007afsm9389164f8f.44.2025.11.05.01.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:24:31 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: add tracepoint core-api doc files to TRACING
Date: Wed,  5 Nov 2025 10:24:28 +0100
Message-ID: <20251105092428.153378-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The files in Documentation/core-api/ are by virtue of their top-level
directory part of the Documentation section in MAINTAINERS. Each file in
Documentation/core-api/ should however also have a further section in
MAINTAINERS it belongs to, which fits to the technical area of the
documented API in that file.

The tracepoint.rst provides some explanation to tracepoints defined in
selected files under include/trace/events/, which itself is part of the
TRACING section.

So, add this core-api document to TRACING.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 499b52d7793f..297358d26bbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26197,6 +26197,7 @@ L:	linux-trace-kernel@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-trace-kernel/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
+F:	Documentation/core-api/tracepoint.rst
 F:	Documentation/trace/*
 F:	fs/tracefs/
 F:	include/linux/trace*.h
-- 
2.51.1

