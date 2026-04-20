Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5420C2AD20;
	Mon, 20 Apr 2026 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703906; cv=none; b=L2xK+FGXiwBxAdoyryYz+x4XuaRjVMAQ7OGwDbej8Vyfo6Q+IqyEVrP5O/pAysnlgdW6mtmLtJW4zk+ENhfY2zQlYLTjoYY25KLdtuZhi5ph02kOFVcj27x2iWZvfHXR0iz81tbxD/ekptLFSOnE3DnsraDOenVt3jnQNMWKZ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703906; c=relaxed/simple;
	bh=YyAT2nSoOpWYijPC49OnL88+Z6Jjp7YCuHQ0kvJ3LwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShhwXyur2kzHy4VOhyhCTGFEXlFjrSbOwzP/hGu1EpEaNfCTwdK63dFrDN+y1qqm+oZCNJ1Gz+RDLqzajT1XXHgaeZUwcAlxsz9l03Ve5tR2jPDZbssuFkmqAv4inF4jcxP37CD96/uUgWKJAB9ap13bTMLy42/OJic454z0wGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nrPlqEtY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jjR3P8xW; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nrPlqEtY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jjR3P8xW"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fzs2l47cGz9spF;
	Mon, 20 Apr 2026 18:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776703903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/kiXnOT8WKo2A1b51FrTnCoza6nY7VThaSoPWPoS88=;
	b=nrPlqEtYzTv+GaQ8Bbt9YGFIko+aJMkX0rf06rj3glJ/UWRjy5zfPnOnhbZzGnbO546bsm
	pWpKnlYsbshLcWrgNcUWuMBXLF0pISwT90sf4ZynDXA/S38XgdU/NpLv34fMKswwmEDpMv
	fQyTgwnhSOsxi4xM5tHhRSru4arPKodxkPyLBDEkNr7jfNPjnsKCYj1raxtbS812ulAXh+
	8QHvdZ3MXaPDm+j3m/AatvwBf6rRez0idHYsiNfiNy32o35FC7KK6i+xDIl23bQkrDv6c6
	+d1ryZdR5mr2d5boS9Qcr/wXcYxvzC5Jalz+RlNs6c1zMMtH7R6w73DvfpZcvg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776703901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/kiXnOT8WKo2A1b51FrTnCoza6nY7VThaSoPWPoS88=;
	b=jjR3P8xWeguCzM3jOLFn82Zk9AJ40VDeVtdisImW7Rf8Da371vP16xXRvNsD9bMHTR+7ou
	frF0BYQdOsmKjL7HOTG35X8BC+1TTOmUm+Kr9Jc4e7muht61+uT3g/Vqik8L1m0QCzFCrF
	sghub7cLJKAE68dFgbGUsyG3p8pKebazo7+9g/1rEzYF+MUf5Ygqgenw0qwBvOejs4SZqO
	/XUDt0uDMqlp2TSgoR/4M3HG2gadg5lBiZzE7l/J72vgullvZo0IRBZZa+MfcWSaBBLcqu
	fikZdjO6XPllTSH2ljQPwWTG2fudnyR2gB4g/oh4XJFLsuBlhKeFT18ApSB4ow==
To: 
Cc: manuelebner@mailbox.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Subject: [PATCH v2 3/3] Documentation: deprecated.rst: type-aware kmalloc-family: mark optional argument as such
Date: Mon, 20 Apr 2026 18:50:37 +0200
Message-ID: <20260420165038.217550-2-manuelebner@mailbox.org>
In-Reply-To: <20260420164234.217133-2-manuelebner@mailbox.org>
References: <20260420164234.217133-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yohrsjzbdzpk7m5eyoycjfh747ash641
X-MBO-RS-ID: 036050eb2fdad0a384f

put the optional argument (gfp) in square brackets

eg. ptr = kmalloc_obj(*ptr, gfp);
 -> ptr = kmalloc_obj(*ptr, [gfp]);

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/deprecated.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..b431993fd08e 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -392,12 +392,12 @@ allocations. For example, these open coded assignments::
 
 become, respectively::
 
-	ptr = kmalloc_obj(*ptr, gfp);
-	ptr = kzalloc_obj(*ptr, gfp);
-	ptr = kmalloc_objs(*ptr, count, gfp);
-	ptr = kzalloc_objs(*ptr, count, gfp);
-	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
-	__auto_type ptr = kmalloc_obj(struct foo, gfp);
+	ptr = kmalloc_obj(*ptr, [gfp]);
+	ptr = kzalloc_obj(*ptr, [gfp]);
+	ptr = kmalloc_objs(*ptr, count, [gfp]);
+	ptr = kzalloc_objs(*ptr, count, [gfp]);
+	ptr = kmalloc_flex(*ptr, flex_member, count, [gfp]);
+	__auto_type ptr = kmalloc_obj(struct foo, [gfp]);
 
 If `ptr->flex_member` is annotated with __counted_by(), the allocation
 will automatically fail if `count` is larger than the maximum
-- 
2.53.0

