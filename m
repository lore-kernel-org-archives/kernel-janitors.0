Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5C372B52
	for <kernel-janitors@vger.kernel.org>; Fri, 30 Jan 2026 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774412; cv=pass; b=t+6Qm97ylTZsnBaImD2LMH/x/T6OvJDK96zDpQUM6QvswxYxnTYCgLVB3zGAD24883BJk35Kio/Fb7wRpBbyYEGdfzheMKI3N4XUS3F3rxlVex6VNCp98qtlp8egusNMRHyB9MuLplso/wddMM4K32kJSsX8zReslJXwKm4YdGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774412; c=relaxed/simple;
	bh=k3qqaDtXpCn/qVUAfEchxu7m3d39GYEosQP0iwek/nA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pKOyxep3Nk5lgmdS/52JILyEbFLm90DvTiKbCcMVRLKbdYcC5TnRaUELN67rUyZM7XA2YwtfU0WgW68JLymgmr3rsU+P7EuCFTG+C36FanJSv4KbgXdfNACGbxsC4Aog9OyLRA5FCaOnXviqyrj1de77pBGps6s+HG255UOPq4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1anzJxt; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1anzJxt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d2670932so1939796f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jan 2026 04:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769774409; cv=none;
        d=google.com; s=arc-20240605;
        b=BEvNnoXs27u83dgu4hwhYtbKHFEw6lED4CftalVfh/sImC1SASbyiGo8m5zQ3vPs+X
         kobzpLfQTUSR3amolH8GklygmoQdioHa96gEmXTCy9xFNVvR9ebSfOVQQ2t/rAdeffuy
         Bl+E6XK3ydFlyNREHIjN4/dgaUn2hXANIa2npG2XEqCyje5HhPZvkIrC1K/9ZyKqIocf
         0qqIXDcGts+uh/00z2n4JOS7vXTDUXQ0/v58l/nYtH55zBVCXo2vV3UzawnsHmkVT27X
         YneplcLt21UOe0wzCsb21LLxrQNyOMpW+OHbc9RWmZzlSTnN0lkbN90AxG2Ape8i9b7v
         VV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=k3qqaDtXpCn/qVUAfEchxu7m3d39GYEosQP0iwek/nA=;
        fh=Q6l3+RubHshejQRxLPX8TiOvrqlfI9pfnoNMiaQUZeE=;
        b=l0JKnPDSX5ZFawu19lxu7riypxLFipdUG4j4EtT52Y0Z4641K0EaGpKmjjWltPhCS5
         93+boV6ocpR5+LDoiRppT/wLLsi5EopNjNNu4Mw8D59szRrvhqHM4nLR+mJSBNlpQsX7
         eU03Ef7N3187z9UTb4EEu65mdT+hA5nuX4KsMwhBdbncv6hPuqBpauX3rMkGDr56Gl6w
         oXUYbdPvBskFkHNgBAZyASvUP97a0AZw+UEkG4H9INIOvwnYOZNm041stCUkSwZXVZlP
         Wr47CA7nWPNiUtOx3Fxii+caXu1VLxp58HPifFGC2GaWDTjxLXY2Yepxkwp7zsHf6EJ1
         RZOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774409; x=1770379209; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k3qqaDtXpCn/qVUAfEchxu7m3d39GYEosQP0iwek/nA=;
        b=U1anzJxtcnjWRQWYUa8vehw38vIQYN/r26llR7/BFQBvx+Uwa7Wq9ui4O1EI2388nL
         SCUfBbC9WXseNn4eagU8fAJvpPaaNoQV/DyOtJto2LDnwLjVTFdyoZVIVcN8TMGmyqIH
         kSsn9/tflV6meBa8xq65XiwXu0nAXAZRFmKhgkyuwl+gvGJjXCcJeBu5SjcwJ+pkz9as
         FB1kNja1DTSWKFNV5cgYcgMZQ1m3orGAQeSvtUiFlPpcxOqyPXkLqCBB1wEtQlH8s2/k
         ZeB5VwfgGZbe7IsVbz6IweTOFmIdoyLZy7LLhhxrDw1J4ED8uV2FI+kMlwMCDVdwG0uc
         SoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774409; x=1770379209;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3qqaDtXpCn/qVUAfEchxu7m3d39GYEosQP0iwek/nA=;
        b=oDG51QmpeEHoaFrJ5rYFV0y3Sl+9j/4VbR7Hhp5yN3bG2ZCfX4rZi1NOrF5dsKrNGZ
         6BL5NxJ7PlAsY02pwj9fHwUHc5tp8IPr2xmQBqVWdVD/daWaOC2l2awoJPZdm+IH+uQ8
         7g+njneEJIvKlxB+RNAxqlfHQzxcvSA8hq/7N9g1y5AKJSV1D7/1mwWLmOues6UZm/fe
         hSY9oRQ6sA9Mp6JOuFiI+WU+MERm19P/kKjGsWfyHZHCRnAnmEb1IKFRuTe/+J3bOHv3
         ZN51aOpef3fkiaaZkcH/CP4DNnnsHZBc8wtItU03YGzzYz1nh731O6hOk0FrPngX1Y+w
         Kf4Q==
X-Gm-Message-State: AOJu0YzshoVxafKFACko7j0rRR5dy/fRlpGUv1FYBlZs3/g7tpcCsBtk
	hj8bNh6HLC/CKt8a8ZhsRwq68xeV3+4SsWaD05Se6XwS0LB5A9dTxMjvu/FwDU9uOQAG8z+XzEg
	Bw3Z0EbEQk4UdwvhVH5Lp85psnwK04LuTLnqsMwf6gg==
X-Gm-Gg: AZuq6aK+/q8uP0hdII8aOK00Bwo/PXRhGd+BjHZu03Zb8LBfgRpFW0LsOlqtD+CCPvY
	Q6n9iyxkvus4tlZQIN/JsXruDxh9vQKAtFfOEgq1ZZMhm7iY0+cVF5P+9ELomJNA9ARg+g8XVja
	3f16hfLnzyNeEPOX279vsy2F068mwRfr+RQ3P/vIWES8MkhV8hJ+lYTyRZzk4DpeN74rstFM/kN
	bjUZXgvGbz8SjaPl8cD9unexe9CZvgVAGXeSMRhZ0t4de7f2vrQPT5dTdtnmN+obGRm9Tsyz9Dx
	ZvMAa6xngqU3QFa4Xi5v5vevAnQ0IA==
X-Received: by 2002:a05:6000:1a8d:b0:42b:41d3:daf1 with SMTP id
 ffacd0b85a97d-435f3aaa61fmr4528495f8f.38.1769774409107; Fri, 30 Jan 2026
 04:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kalyani patra <kalyanipatra2003@gmail.com>
Date: Fri, 30 Jan 2026 17:29:56 +0530
X-Gm-Features: AZwV_Qgg8chPZda7UaChhMTjOVGW0RSBbklUizPrckIrxDO3BHyIMt84J_sluJg
Message-ID: <CACjYBvhy53AmyEgdcxP33T10a7ag1b8dHdY1JgKWghrgpQSghg@mail.gmail.com>
Subject: Seeking janitor beginner tasks
To: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
I recently started learning Linux kernel development and would like to
contribute for the first time. I wanted to ask if there are any
beginner-friendly tasks, janitor issues, or recommended places where
junior/new contributors can find suitable work. I've been routed to
tools/testing/selftests by linux-newbie. While I'm looking into it, if
there are any cleaning tasks that I can take on, I'd be glad to
contribute to it and learn more progressively.
I apologize if this question has been asked before.
Thank you for your time and guidance.
Best regards,
Kalyani Patra
