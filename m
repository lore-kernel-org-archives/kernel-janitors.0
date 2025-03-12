Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4023DE80
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776776; cv=none; b=OJUGApFyHvSLfealSdstjy8yxr1NUKc3kkWbmI8FxmAAFysFbz/9gPP0UWPXvT8blQP3feFSEIaSlrtHvUAYnJbNY4U1NZ1c7UGhIWt8T990SFDmIQ7DuiWu6HtNXSTuOU9WAdXy3+Teh7C1cBRl0/P9h9DvqD6w2iDLZS2+hwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776776; c=relaxed/simple;
	bh=g/scs/pN3Let8KEraGJIBQSC7SxJlkJiwmDbwWyJ1hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=toMaM2Sa/QUZmL6MDBLXsedygbGjbIhU1gR1FtqF5Nyj2LULfSqBMmegWlE1px6UjPWMa+wzETTmebOWPuqrTy6HDKCD5yYm7xQaIdtCkxqihOxJHeMel9RCfCJj+VhLwp0zNCwTEoXiXftG7N1R1iziBDwagvXdQqEjLwSTbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+lXqLt7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+lXqLt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741776772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zt2jIoMP95QFHC64XcBt2AaAmIniRQUF+dwuamUL77w=;
	b=L+lXqLt7ae+J8NkxQgepmVNPBHzES0nj2Hp5CmRIDVQmt2PfXIuHDloTLZaxy9pn7oP2kG
	erKuXtrhoJ9ybBiX+XLlID0+6VqvnZQXvovVoNk4t9MLrLxXi61NgvHgHK3lFBwjF2wNDF
	/fqZv3sSCCF6NaeR7h4mxgjJ/kfnR6U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-R45n4ZAANsCiuEalSE98lQ-1; Wed, 12 Mar 2025 06:52:51 -0400
X-MC-Unique: R45n4ZAANsCiuEalSE98lQ-1
X-Mimecast-MFC-AGG-ID: R45n4ZAANsCiuEalSE98lQ_1741776770
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43935e09897so45282865e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 03:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776770; x=1742381570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zt2jIoMP95QFHC64XcBt2AaAmIniRQUF+dwuamUL77w=;
        b=xLygHqe34DZjMMGi3J4MsLpoYe3B0u6jYn8sVRjTTnDtxUX2A9w4lwz12WN5ikIa3o
         DICWl0DP98dn7mvFEdrVs5nLu54CrIgPAa1oFUS5o5OHFtdRZvBje4OvSBQbXv4CaHH1
         mt77EEu0hGn51BIAqeCXERI2okk3tXo4BAdr/gNqG9DWR2A5Gm8uYZ7rTJ4wJn6r0WDv
         7Lhg4PdZuQ+XPqOjhLBdKw00dqDWdS21Vl9+JHHBB0DsUSJDdUE7Zu5VF/CxPP9pHbVM
         J3kRP5Xa/cmm+7woISofwcMA00f7MKhHSJWIlOpVbKr85DeJLeNO46doBaI16pYf5FvX
         5mSQ==
X-Gm-Message-State: AOJu0YyNP0lUdYHkn0bhes88gZg8P8T9rRN4g2ei/JlLq1SIIJXiJ6JX
	f1L6tR9LW7QfgEV615ELBHxH3qR/Q7Lc5AIpGpKXVtVpiA7nbQFdL1recg8C2mtl0u/eYag7Lu1
	HEg1lDyjTv/OPaG77TJlXs4/b7/AcQK/8pUZziXyHFg1xWDdclJ7cf27gNQ1wuBj1Nw==
X-Gm-Gg: ASbGncv3yCJuX8UPpOtDGeMUg3vCwmh8RZPYSFOPA3vXhBRWiPtvrYZfdAkNI8zWaGe
	tYstdvilLYIWoUdg677ihJXP8DPjkioN6GtGEIlzcHeuEuI5+oety0QWFIweAbXrCgVK8WvRGNv
	P/VFtrWXWwV/s+SMD8UDd04ueCTyqC9v4houYdZRicRJ4rsvVcSNbnPsM9pLsuOI5mgug9KIW1Q
	+UcIOZbe6Kc0bdOl0tSHTmPYjHh2Ez02Ad9Yne5Cv4SEM55sCOtcPQkcmOtY3s2oaRuUrl8Acrp
	0KBdnveyWJtEzZHCAFvqpXeWShvI9CmPvR61wlCUse21lNWYier86ObEdP6/c30=
X-Received: by 2002:a05:600c:4f90:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-43cfad6fe22mr81540045e9.24.1741776770141;
        Wed, 12 Mar 2025 03:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6uqPVmMPsyJoxPmFKLAy4usaZoIJd+/VqyaxpL8A36an+EVc9YTROv1eG/no43mSDucSFSw==
X-Received: by 2002:a05:600c:4f90:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-43cfad6fe22mr81539915e9.24.1741776769695;
        Wed, 12 Mar 2025 03:52:49 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c11e9desm20403712f8f.101.2025.03.12.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:52:49 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>
Subject: [PATCH RESEND] MAINTAINERS: adjust file entry in MAPLE TREE
Date: Wed, 12 Mar 2025 11:52:45 +0100
Message-ID: <20250312105245.216302-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 0f3b602e1bad ("tools: separate out shared radix-tree components")
moves files from radix-tree/linux to shared/linux in the
./tools/testing/ directory, but misses to adjust a file entry in MAPLE
TREE. Hence, ./scripts/get_maintainer.pl --self-test=patterns complains
about a broken reference.

Adjust the file entry in MAPLE TREE.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
Andrew, please pick this minor non-urgent patch. Thanks.

v1:
  https://lore.kernel.org/lkml/20240826110215.19894-1-lukas.bulwahn@redhat.com/

Patch was sent six months ago, but was not yet applied. Issue still
exists.

v1 to v1-resend:
  - added Acked-by and Reviewed-by tags from v1

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6609b78998d..96ae7f628da4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14129,8 +14129,8 @@ F:	include/linux/maple_tree.h
 F:	include/trace/events/maple_tree.h
 F:	lib/maple_tree.c
 F:	lib/test_maple_tree.c
-F:	tools/testing/radix-tree/linux/maple_tree.h
 F:	tools/testing/radix-tree/maple.c
+F:	tools/testing/shared/linux/maple_tree.h
 
 MARDUK (CREATOR CI40) DEVICE TREE SUPPORT
 M:	Rahul Bedarkar <rahulbedarkar89@gmail.com>
-- 
2.48.1

