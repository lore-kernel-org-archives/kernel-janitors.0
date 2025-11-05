Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820BF2E7BBB
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Nov 2025 10:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762340349; cv=none; b=a7BBI0xK0Yb31jgZlaxgiK7PAKHNY8nEziunuzmKRLYHwJYZR/B0tfxyGNWjvHzvBJWZswJc1NeCqk7D6qsaJaiwDF5yqW/d0G0yEqRKd7KP7U8cvDHphyPq2NciO0k0KuBJ4hXeiZ9bXIXiN+C6F2g0JMoOw6j3KX0btnc8rs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762340349; c=relaxed/simple;
	bh=mDYPQoa9g7C/yEpqbRIi6ESdyE1WLl8zUuyXg+ubNy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HkHOur/USDue/1ifgUQ/MH8y9WaSh0JraLCnu5OUnywoGjNNGjrk1bzD7GHMPfoJKgTu9daoj7jPAyoGxcCly6LlT/7zJaFtHN6kzn+eXumwyTJNs7Cj9Nc8xNNn2tOdD7vx2A9leU4jKd+Ubd8tMtBxGu+Ymrin+VEecATXwfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QZxPgpXg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LvatTV13; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QZxPgpXg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LvatTV13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762340346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fi6lMVZB+GdSzEqZmyJtwxQVO8YBPh6HS+ZyxPLOlA0=;
	b=QZxPgpXgK3LSIynb1WLcLHTv+ElxDDXG+TEM40KDhHiVqZH5auezuyd8ysZxWRF1mcVNmH
	b6COqa5TJyYHglsf8k35OJ3BTpvMKGu7eu1PRIxPkRbhyjlxZ/hrsxRphaR+j4mUyFeKqP
	d0VS+290s20Eu7Mn2TvhwcluytAmOK0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-sAjw5OHiO4WLkDeOmhR4-Q-1; Wed, 05 Nov 2025 05:59:05 -0500
X-MC-Unique: sAjw5OHiO4WLkDeOmhR4-Q-1
X-Mimecast-MFC-AGG-ID: sAjw5OHiO4WLkDeOmhR4-Q_1762340344
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so5536425e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Nov 2025 02:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762340344; x=1762945144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fi6lMVZB+GdSzEqZmyJtwxQVO8YBPh6HS+ZyxPLOlA0=;
        b=LvatTV13nKsR7HuD2OBSVSCbKiUnsb/3nZT3pBVig03ZtUzIoyWbQ5l+MNvlfzJLdu
         TllfZa51xrADveEhpvutdRd4q0clarkcAoQYBtJMdlJaagffDhpMPFEIIDmo747cLi0P
         3qCZ2OehMcrUl8vpuD/N+WJarCfesqkW9Xq/9oeWO4tLLJb06YnMEGBo0M/GQgTbR45O
         0KVL1bC/ZPnNEKd/wspgrLe4wdW8UrB1mzKuNnGHNcItX/Opn9+2DIeZAw6zmyGEEiRj
         EZIodFfJC/4CXfhkYjpqvegQJX5apkoWmmAE1wXlEAJRLBb3ov8sjBUbAgJI1Tnw9MXQ
         s1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762340344; x=1762945144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi6lMVZB+GdSzEqZmyJtwxQVO8YBPh6HS+ZyxPLOlA0=;
        b=IJQHA+ORVnMWt7GWWLn/e7SEYp1mHmKlRNPbxjavHgzn9YHI1bivp2XoMhUj7xFiha
         W25f12m7kPCW8PH/u7YfqPfhFxM9hedULFr9xX2kx7bsWDozia+WqA6qZNd7Hxq4pCY9
         0cGFev5/QCZ4y9VuJjSL9xFFlJk+vV/kCy+NeR2tsDVsjRjjqWNQTnNxm4l/MeSffC1N
         IZGvaioYAkdA8lxYpKULUYCsWF64zKu3SBC0TjH9O5GjvJ7Jc4kaygFRgrTZLA55npuh
         SsAJ2E9iYICzqRJB9DnB2UyJwelChjS1y0vHcX+uxrtaMLrhHtdsAj9lveadV8rGxArv
         xvgA==
X-Gm-Message-State: AOJu0YzQM+YCUxMjJY5Prk2qszaKtt+5kqKRwbPwVQERSrEftuWB6Y3s
	zDdC01/myVe0qlDEiPNsQeSdjvEbLabdyoCgppSfVGbABeXCDox06e02myJaid3hMy2K5xBksAF
	4O/jeyY20Ytts/nGt+Cl3CTSzyVhpmGxXtYh7l4hY4yWkjKQYQFlmRa8jXGuHNQjiQLS7D/Y4CW
	1gzQ==
X-Gm-Gg: ASbGncsW/pUmfE073KgJ2G0DwJx+J1wfJsqcV45gnMRNMaZV6VhrLXHZC2iPBNmDhPG
	7iNRMrZV9bhMEVRB0UVWlcg+vkb8yZEObz3Q9ozGOeRWsdO5zezxHOyhoJHFk0W8gV4VQ3Mtaxb
	GyWdsuveqdCBcHTUGsOjo+RWqiHz6KtuFaw+LT6Q6p3SFswLX3P9EszC+kNVGW2R+Qlw844DcIy
	NTCoySZOzMNpxSuo2ELbA2sy1u+IHs2HfhhA8DS2Hz7dvjw+jlPmTQ6c8F+wugk9mOLOLD6Gz/Q
	ALwKOb5fKRvz3UDj+iGFpCULllg+K/ubx9BJM2jAU9wm7IJcpe2G25HA+xIlJVOYFy0G+IwRuro
	AQaaizUt7fd+Q3m/HgkHdt5SbefG7JLira010ISs9ArU6tU+6
X-Received: by 2002:a05:600c:a00a:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-4775cdbf0bfmr23847075e9.10.1762340343920;
        Wed, 05 Nov 2025 02:59:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGMcjTBOz+Nu6wkEk+5mmod0huDiyH5V1WOUYLCdKWa9YhZHNUKUTSo1PqiQsOwaH+WwN8Vg==
X-Received: by 2002:a05:600c:a00a:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-4775cdbf0bfmr23846845e9.10.1762340343543;
        Wed, 05 Nov 2025 02:59:03 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c4edasm39000785e9.5.2025.11.05.02.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 02:59:02 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: add idr core-api doc file to XARRAY
Date: Wed,  5 Nov 2025 11:58:57 +0100
Message-ID: <20251105105857.156950-1-lukas.bulwahn@redhat.com>
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

The idr.rst provides some explanation to the ID allocation API defined in
lib/idr.c, which itself is part of the XARRAY section.

Add this core-api document to XARRAY.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b5f86dcf898..01e1668cac02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28010,6 +28010,7 @@ M:	Matthew Wilcox <willy@infradead.org>
 L:	linux-fsdevel@vger.kernel.org
 L:	linux-mm@kvack.org
 S:	Supported
+F:	Documentation/core-api/idr.rst
 F:	Documentation/core-api/xarray.rst
 F:	include/linux/idr.h
 F:	include/linux/xarray.h
-- 
2.51.1

