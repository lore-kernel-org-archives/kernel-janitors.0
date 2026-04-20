Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06935F16C;
	Mon, 20 Apr 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703413; cv=none; b=YGP0dDecEdPvUTJD2UsuQYt6dtN6gDEE4Ee0jL6ppNyt+5hjtEklW9G/65PIuaE0Uwx/pxDa57pGoLqdLDYkYuR5eyZuL0OIjpgLEhJ8AlD5yiq6IokTWhMLJR9/LcImpxg+DfY20/PQX/Xd//8CiS7PjUOEKJSZ+mIEus6IsIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703413; c=relaxed/simple;
	bh=E4bRTQ3aK44yLjKyfT1OH4NindW495kH0SG3yICneSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvtJhwyv10pAoDK3YDP8vUeUnzmtiUBoaqzCZAc0Vw1o8ArOvMTcmAX9Db6JCFYAyGl9Tli3Qa0kbIncuB6P9vYldDN74oomZbZUb2ibZvl8Py45zJcZgvD2qF3Vm9TQ6zVCFUwlb3Uz4FgVQPeDc2d6vmalS2bk13/p/I+Itzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g1nxdP3F; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l66Lx/2Q; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g1nxdP3F";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l66Lx/2Q"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fzrs61f01z9tNn;
	Mon, 20 Apr 2026 18:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776703402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4bRTQ3aK44yLjKyfT1OH4NindW495kH0SG3yICneSc=;
	b=g1nxdP3F3SoElj9Ayc9Nc/T4mAYRfzpoI05B1P/p3/gXGVlNhoyLLjlnDXRylDmH3tBkLn
	Y2H+5tEik5LUebWdvayvZ8ipDqgoOfIbY+z4ayfiBQchdxdlAIwss1cyEnc/nUbuG40ZPS
	t9pSP4E/W+gMWi3IcN8IVRz81VwqHFhhPbvmL+pqGFTphuKMmDP+E8B6I6badCEihMLb8r
	Panj7egUNk8qcjV1ewvgP412bi1wgrU/FxNWBOIGvT5jjdidozYMV8YaaCM1iVRV3UkBhQ
	E5NJi9mjQRqxw2YiUIjfhOJJ+0tP9BiiQfqXCH6MIirqoNMffNC9N9v6xOvvXw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="l66Lx/2Q";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776703400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4bRTQ3aK44yLjKyfT1OH4NindW495kH0SG3yICneSc=;
	b=l66Lx/2Qrl/eMTXr6hun+WbH8oY57tfs91xU5A/uWq3Wc/+vK7IhoTkZVs6N1mw0WUbLUY
	WNKxjsyL+qF+cb3ZuS9ui7K8RKpPwEbaVvlunDuVq9WDXdVZHl1tz7Q+e45lmcKUizJC0j
	MXyq2xomcgdDXD88hakO502O6r/icAUHpptpD0F19BCUudm+WXX09LW/M2Bj5+UEbI31LH
	XuesZuTnhrgKOEn+5gn2R8Fs0QXM/VgU8Xii5FNBPu9LXB5Zqla+hf/gPo2atfqlOT7t4K
	dRsA2nL2+oQ5CpsCURIDY/W6dnyfdj9yQ5vG76DmdPSoqmCFEDl0yVE76eRzJA==
To: kernel-janitors@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 0/3] Documentation: adopt new coding style of type-aware kmalloc-family
Date: Mon, 20 Apr 2026 18:42:35 +0200
Message-ID: <20260420164234.217133-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9btyoubag4po9sx5b9bsh3dwebya8o1h
X-MBO-RS-ID: faa2ffa49eb93135954
X-Rspamd-Queue-Id: 4fzrs61f01z9tNn

Update the documentation to reflect new type-aware kmalloc-family as
suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")

ptr = kmalloc(sizeof(*ptr), gfp);
 -> ptr = kmalloc_obj(*ptr);
ptr = kmalloc(sizeof(struct some_obj_name), gfp);
 -> ptr = kmalloc_obj(*ptr);
ptr = kzalloc(sizeof(*ptr), gfp);
 -> ptr = kzalloc_obj(*ptr);
ptr = kmalloc_array(count, sizeof(*ptr), gfp);
 -> ptr = kmalloc_objs(*ptr, count);
ptr = kcalloc(count, sizeof(*ptr), gfp);
 -> ptr = kzalloc_objs(*ptr, count);

I have also thought about adding a few cases to checkpatch.pl, but this
will take me more time, and i want to get this series finished.

 [v1] -> [v2]:
put RCU/* in a seperate patch [Patch 2/3]
Remove GFP_KERNEL as suggested by https://lwn.net/Articles/1062856/
deprecated.rst: change the argument gfp to optional [Patch 3/3]

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
