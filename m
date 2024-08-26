Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABBF14F9E9
	for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724670149; cv=none; b=cfhp+aoF6X2ZvbGl1TpjHZK3YAvMjqDRC0u9X0J5WGSzgWGAERGvw4csc8GzCe1RDcWFgpbc4wtupK6UFGej3mgacl5WIhYir7IjeWJfXB8Ce6+mWUz4ipKQ0M+uLMfVjZn+PHNVbVYrhX+9749AkISp1NwpVJwE8SbBbrEWEcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724670149; c=relaxed/simple;
	bh=48zlpe5eFHm/ZiSeAQ9sEmp91Iwec4F8M0gsPdR6/3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBFVGsTifVQTeBN4MuXyLyDSDFiktUDIWF3FZv2vggE0Rwhlg4PDyeFj7qEfavoW5HQQN1HpKzc+WhchF/FCFGWBX5fnrQZgSQoZfTucDmihvpI5La3zvC5QrATd0orD/QLA+/4HNK59BHLMI+kgwefQRDoTmFYCNg55KAUkYuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YihWjQlf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YihWjQlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724670147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pvr+QrG/pgMP2il+VVReD+O1xbfry5Yc87wG9Nb6Jew=;
	b=YihWjQlfdmU97L6rfHFSeOoSLGdabUYjzemKBih19sT9MP3b/IJD7xsTuM7MpWxjr7E4J4
	gEvZ8OnBvoheVbZ1UfKbDaisjwnlCO+rv0q9IGGReZbSQyo7l+lQ2YC2K7HyR73TndzKZZ
	+crhxMSXjF608WmWTS8qV15n+XOmVgA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-Y_VKy3WCPpSGl0SyeiWTLQ-1; Mon, 26 Aug 2024 07:02:26 -0400
X-MC-Unique: Y_VKy3WCPpSGl0SyeiWTLQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-371b187634fso2444103f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 04:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724670145; x=1725274945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvr+QrG/pgMP2il+VVReD+O1xbfry5Yc87wG9Nb6Jew=;
        b=Xghue9SXGxp2R9W5lSjLkROQ25WpTi72H3t0eN0GUa/kVs10yjlFBQr5IujU1pd3rI
         X3vW3lBPMyAvV4aPzDIsnCrzaAEN7b5XZpjyJhNhZdoR/J9tQbFkB6KX39UIMfdCnbzB
         B78kx8WBRlx1VuQ1a4HpksJ1UQHSm7eDhJcf21I4x7eyPDC6HnKlf870clSyLlhsYxlW
         dC8HyTBzzkxuxaqp6mx/pgCk+AI79y3rTCQjeT+DiYoKFRC+LBN1EHkNHxdy42YulCyz
         QNZxcxC5IlWDMJ13/QX8WlCWw7v5+ihkmxT29qy7z/XcP5QxGkKT0uQX/5/5OdAqAOOm
         KTpg==
X-Gm-Message-State: AOJu0Ywbx5TRFpdt6zuLJEO+Whabe6sw8MWmfSCcHb782IN2zRHCEUm9
	VB8poo3bMoe854DKEBYJRgUVUVeD8L8SvnKQ5JFq6tftU12v3Pq8+Rt7Ge3xMg6Z6aPhOWXh6u8
	GDyxa865jE8GznO+Gabd4/oid+AKBvM7ByEOcx72pbSRc2XDKNL5+/ZiOIM7DIk4M8w==
X-Received: by 2002:a05:6000:1802:b0:368:3562:7c76 with SMTP id ffacd0b85a97d-37310eb38d4mr6677367f8f.3.1724670144707;
        Mon, 26 Aug 2024 04:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkqciHYg56U090Duq/luQEyfQ7Qmal4dWjb8RsXPZ5dzvrj8LsBmXWoWLxusuMHSs98fNeuw==
X-Received: by 2002:a05:6000:1802:b0:368:3562:7c76 with SMTP id ffacd0b85a97d-37310eb38d4mr6677337f8f.3.1724670144187;
        Mon, 26 Aug 2024 04:02:24 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:833c:88f3:25a9:d641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ffb40sm10478776f8f.76.2024.08.26.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 04:02:23 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in MAPLE TREE
Date: Mon, 26 Aug 2024 13:02:15 +0200
Message-ID: <20240826110215.19894-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
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
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6aa85a43d8c1..2af37835c735 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13572,8 +13572,8 @@ F:	include/linux/maple_tree.h
 F:	include/trace/events/maple_tree.h
 F:	lib/maple_tree.c
 F:	lib/test_maple_tree.c
-F:	tools/testing/radix-tree/linux/maple_tree.h
 F:	tools/testing/radix-tree/maple.c
+F:	tools/testing/shared/linux/maple_tree.h
 
 MARDUK (CREATOR CI40) DEVICE TREE SUPPORT
 M:	Rahul Bedarkar <rahulbedarkar89@gmail.com>
-- 
2.45.2

