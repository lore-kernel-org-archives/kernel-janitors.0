Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38631FCFFC
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Feb 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771606366; cv=none; b=NnwdamHrqICWY0sEPM1cxjTY18emL05qBXe8m9846kve25MOEjePSGVjIV18bEviOm5UU1UJ2hWzLkUiVOAqjeiunxtBYMz/ZrSohORIaTLpKhPP7/6NohW+CMGPV8AgF5XgnEIyUp+vRyp9rrEAN8FBCph3NL2VHQ41LNNxPuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771606366; c=relaxed/simple;
	bh=IqPQ11TxVNwfGfAE21ETJ/ooX/oPSydMfPJi4pktBiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhnmovCq5swpzDbMzx+HgFMBckEoXOD1LeK+oTIOiKJUluOCz4WAWWFsOi1cshkMOXsLdhLNSsSJstQ389FCdikO9dLiQr7czuvZ15VO1nSYxpzNuvIQz+P9rW1t7rvET8kvzbiLIWtNBHk6f41bBkZ0CTuwAUbSBdLdCNo/l04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WevBewtO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WevBewtO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48371bb515eso29802815e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Feb 2026 08:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771606364; x=1772211164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quHTn17dpdrYevLKDusB6NpnopISHyw9U38mQUOhUW0=;
        b=WevBewtODdrPNJyOWFJoUbyVKfBeQE84vfmYsOWXngULM2wb4NDRL/bV2laE3Z8dQt
         XKDGNC8MxXLHBDfEDOBHLh1FMtzj4LfOpPj7CZOB7ND4GZUXcttWvL5lxVn+XQPNT/H1
         1lMeMz9Hn9fdP6mefckPQr7qkR6JuhuEQ7aM5JjwIJnIEOTxKeyCB3fb7T7/bpl14Ufx
         esGnmRjU5ahXgxMCE5betvVdpWQ3wbwdyrAyNyetMLpNwLj+Bt2vv5TRoe0okFx07JA6
         u0zkc1iehPhKXPfCR9PJ4LPT3WY7cJK5N+34m8nO8T7lMGxnjuoyqbmcDq6ENt1+CG6G
         DsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771606364; x=1772211164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quHTn17dpdrYevLKDusB6NpnopISHyw9U38mQUOhUW0=;
        b=U/GOc3BBOvsnm/bkJPaFdeoRYxDhSO8pLZ8vHApOJ5osDCL1vquGmnMPr+4bVJ2ays
         Fw43Crb54EhbY1o958tXZ9tV9WFZKrJ9qwpJIGT6S5T/2gV5pzRwEuPFpLgw9HifVbYu
         tVwBuETASRrlZy18GJGyI3JSf/I52n7DNddR709r4VmWo2C/SZj3mUQHJdX96fsxBf5g
         O6dLheJmCYeSLPv9+WXYhB6UjgmqH19O9+U+1ydDTZqVXR5/8j9XQtCOGJxrAvZA0JDC
         xV2PN8kfZ53z60D6T2zwOlNU3bPyB0o59Q2iMGjjVVkd7OF7xTz6sWFTycFDCMVIdz+c
         BQjg==
X-Forwarded-Encrypted: i=1; AJvYcCU16iNv3AohrmuTTdT61psctpjz05yX727BwOdlANwZFPotvSGJJyEXkhJjkxmFAguJiAqnSpj0LUOoUA0O0aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0xU7iCih1pMZq8ileE3aLGms9fLZkkTAs0xwFMPu0oyjLmdZh
	8mtMI9QkVa/dhoki0osqT5aGNJtDTAag+kSDqtw7Qabk5uVJwedTshLP
X-Gm-Gg: AZuq6aKze95xpt+mJsqmtp3emo6I4QtM8LUjgSN0i9pscjAi9EgnuldoB7M92gJoj/7
	8pazfcy+AbKPD64TXyVrLL9NDXMrF5HqUVksGT9zUS++3Vj1SngU1eicIGd3FgiTWBVSXMvfiu2
	KZ4yYm/WwYd8NbIGs49YGiwEGKJWxT7GKzW1+4vsqOdmA15fCy8wwBpaR1FGCRuoLlkFi8/m6Vu
	RWcpCnGjhB4CYMTzc12ns+UjsgCATzWEVcegXf28XlYAIk+9AXLEHoD4uH72uRYpZrqZKaYFjrl
	+Vhz8MC/6FB89dbDoPSHDE5k3fAalPrKFh8DoacYLmubKOsOEKJcGJbyCb540P4R8UBCBQsdnkt
	i4m3CaWogLwz6C0EK5xNRmnJlALhIxubYy9M4ag1OM1WP087Kddl0rEAFuw34g18MwBLVHuYuAz
	oiLvGVH7LosZVUnnqQ8Tw=
X-Received: by 2002:a05:600d:640f:20b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-483a9607e3cmr2232775e9.14.1771606363708;
        Fri, 20 Feb 2026 08:52:43 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-483a3dfd902sm21265095e9.7.2026.02.20.08.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 08:52:43 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] doc: early_userspace_support.rst: trivial fix: directory -> file
Date: Fri, 20 Feb 2026 16:52:38 +0000
Message-ID: <20260220165238.4162735-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial fix.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../driver-api/early-userspace/early_userspace_support.rst      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/early-userspace/early_userspace_support.rst b/Documentation/driver-api/early-userspace/early_userspace_support.rst
index 61bdeac1b..60d1e1bc9 100644
--- a/Documentation/driver-api/early-userspace/early_userspace_support.rst
+++ b/Documentation/driver-api/early-userspace/early_userspace_support.rst
@@ -73,7 +73,7 @@ usr/gen_initramfs.sh.  This means that CONFIG_INITRAMFS_SOURCE
 can really be interpreted as any legal argument to
 gen_initramfs.sh.  If a directory is specified as an argument then
 the contents are scanned, uid/gid translation is performed, and
-usr/gen_init_cpio file directives are output.  If a directory is
+usr/gen_init_cpio file directives are output.  If a file is
 specified as an argument to usr/gen_initramfs.sh then the
 contents of the file are simply copied to the output.  All of the output
 directives from directory scanning and file contents copying are

base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba (mainline)
-- 
2.47.3

