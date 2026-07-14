Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E6362133
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055493; cv=none; b=oKwqURs+EfoE1AJ9po7MWEI4UfpctkaF+G4qyLALwOTun1Tkw8DFNJbMKd9Xr5IeaG3/1WIXRYo2xi7Zocr7OlkFvW5V4DmmYRaXYFcLERvuXQ4LOMTLknJxExGeW3vYdsdQ80zk2raFp8DjcBweIDuaQrJh7o7cCp7Up2VW7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055493; c=relaxed/simple;
	bh=r7vO+6D+doHDQBycv6NEraWTa4C1zJkdxOJZtuZheBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F/bbNC3n3Y9PPTN7Q/FryjTDuD6O7ibbHRACjPV33/E+GuNEWs8WXcm5Xjc1aZb7Sb1CW4VdLiiTtwnUkwNO2QKxZGqCFJrgyzkEcq5U08CBKXLitsa0JPuk45mUloEKhxIIDKegfe5r73ZxPPKUcU1xOzR4p1kghN9brhbal/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ9MCTo/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ9MCTo/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so9239015e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055490; x=1784660290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGTEeSm5cUoly09bJoH7FY37/5lDoT4kE6vjdJNNP+g=;
        b=NZ9MCTo/IueBjGG70aJtlzBtiX/MGG6EftIzaTdx1aXIP3Kes48WU+JzAoOaT/ubAo
         Vwe6Zab1jzmoGcNzwemjVtIP0vARQl/MsxAbc/cqb9593/+ivxKYnIHzSwpKLo6XHQFq
         qSejhjupAwiTJ8+fU2lJgLqVEw4KwKahyQO8nsWYeKWWmQu7mGskgYhoygy9tL14euML
         ZM7FkH5OJjUGQhBdEKtpZA2yUx2Vaj2aTTEg41kz6DumEpyBVVYNjI4WTyjaX5bgdrnQ
         RrbiI3DPWZgoiZ7l0+Hmll4STWvNRvzzPA0UQy51HxXF9HnLtPar66I5QVpv1FAiz4sO
         NQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055490; x=1784660290;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGTEeSm5cUoly09bJoH7FY37/5lDoT4kE6vjdJNNP+g=;
        b=dk2HywNPtKHKG7aDPlJuAgfwJbgem1ixXYdnoxk1fFQswYilM5erqKe3f2eQj5goLY
         2jC+J+lD54qYFWL2bzxJWZiuS8MLXlMM6WzIYWuSq4UJXpQmYQnpH6G+nmj8VFdCRwbZ
         BojljEKpjkZYZZqo/ljXIb7wruAdyOrPf/X9mCWciGTiswZL8+YvGdegIw3DCu++6SZo
         JtP6cjK6TLCdRgKp9ATttljYgfoE5tq8P9ezToewUm+MjjEZKW+gpD+lrjEJJdg+03k1
         +tanIcW81lyS5rKTRdqtVpSgf7iBRhDA+XJ1GI5V6p9238sFQHcEl463tIlmLGO49m3x
         YBkQ==
X-Gm-Message-State: AOJu0YzeeEFPk+EbgoRysw+3Lt9fRlqZjk7EkOMF2Vb6hXfWL7TN+cZs
	fF+GqkJau7BfXY721toqzPwGYy2NhVsTZbgS0sGE5IO6yEH/4+AMUQp8
X-Gm-Gg: AfdE7cl0KGJwRfaw+KuNSNC9mUUIGAwkCBFJuhP5C9Ng6e1680zHEZ5p47T1o6SBbVJ
	slgbd2S58ARZCgGR/dyPExdDU+1zh7NLQ0VoH1TNUHIj+/PJLxAtjDOlAlB/ZR1P3iz9m/KwIK8
	vT9f3eZzoukzt1NfT/kODRwHdHXp9E4vFpIs2w1PYn7egH4avpJXGcx35pxBb6MRvu6pXOX9asY
	V+kuuVhduPsqNeeCMJGhpULxQMRT2XemqiBbYQawNwna0Vkf2PqPQ7LwalJrBSbtBh5QFopRZhg
	/1CSR7mJCYQSrhoM+7XwWoK6gPZX6+yBXyMGVRwA+vmcdudaF/zGuPToF9CjXbYGNPrQoZH7fz4
	oOQRmxAdK9z/xZXMDWs/4+72BlF+xPl3RO+9l0pMGf0PbhUi7CptCE8xooylc8f9rgIXHbLUimP
	TKkVannY/dKtQ8++g88j7TMQ==
X-Received: by 2002:a05:600c:8b52:b0:493:fa66:4839 with SMTP id 5b1f17b1804b1-493fa6649e4mr136950415e9.3.1784055490258;
        Tue, 14 Jul 2026 11:58:10 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c1780a3sm977215e9.1.2026.07.14.11.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:58:09 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] uio: make read-only const array porttypes static
Date: Tue, 14 Jul 2026 19:56:24 +0100
Message-ID: <20260714185624.192829-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array porttypes on the stack
at run time, instead make it static const char * const

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/uio/uio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index 1e4ade78ed84..981f8d21daad 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -150,7 +150,7 @@ static ssize_t portio_size_show(struct uio_port *port, char *buf)
 
 static ssize_t portio_porttype_show(struct uio_port *port, char *buf)
 {
-	const char *porttypes[] = {"none", "x86", "gpio", "other"};
+	static const char * const porttypes[] = {"none", "x86", "gpio", "other"};
 
 	if ((port->porttype < 0) || (port->porttype > UIO_PORT_OTHER))
 		return -EINVAL;
-- 
2.53.0

