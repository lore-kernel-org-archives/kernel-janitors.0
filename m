Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380813C3D5
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712824184; cv=none; b=mVS0RewNhpVgDZC9pH1Hl2GMMqZ6Fs3ZFX0srKHNiDcqTTEgfnRQ8WmL3VWRzn+pg6lqjcAbsDjSEgzG/JK5tmf2jsEn+pvsHs6MovxAhDCZdIjgPoxGsIEJ9Cm/lKt8GXPgyMurtin2pwrCitXYbj22Ayi7OoyywS/mPKHpvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712824184; c=relaxed/simple;
	bh=jUEd61ZFpptZ5KtCvlfoBSHaTCEbZsxcbpzfL6Ny9wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=srMDTX9b2O3WWgNHNQNae/E93d5ztQVArLo41fClatYtTg6QiTpUHCP8JyU+D2oaXdq8gdj5oOKbOgjJqlw7SR6AYJEfXpiLBAmlHEik+Hxxa0Z/MTuUfiZvL9G2dasVtHPyyl6iLHEYQKKvorXWQ8Zh9RV6SwZ3UT8aQO7gf8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FjrTnkyr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FjrTnkyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712824181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kr8yZ/39CaZL7/MdJLoFtWvQBJY7UICTTRAwrtIhMhU=;
	b=FjrTnkyrH5rVJFKzv+1QH2v+HblFxjgwpJ/wHT0W3mZJ6VMncVrX+1RClxkiYH70oLmvTr
	6DnNOKru2SJ9a+32GIGRpxVOmQKAkFS4x6a87Cpc4aAtMcpYWqunyBxa/EOU4oKL8cOInn
	KGqyk1ZKJwLXi5YQC539LM35sCdFS6Y=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-ShNHxvfUPz63cEWPZqYjJA-1; Thu, 11 Apr 2024 04:29:39 -0400
X-MC-Unique: ShNHxvfUPz63cEWPZqYjJA-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7db9dbebcb2so4522508241.1
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 01:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712824179; x=1713428979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr8yZ/39CaZL7/MdJLoFtWvQBJY7UICTTRAwrtIhMhU=;
        b=h3WheEsh7Rle5MqmdEEzfsnAgQlK5jqKzYoAbYv+ASdZt6ddxEkDLHf6og2wJZSI4k
         OHhHHyPbQBoROK514mKXtEDYkizc/zxeQgoqmJStU/Rj9ecZQbFODLd4kVNiMxK2LWaG
         39VoqJpZwRitLp/QTIhMq/2QVOGK5aYF0lZCKSlYtPv8ZY50vV1QPJGWyT72FxoNuvqq
         9R5WiX4fIIE6bn4FU8RJMbZnII0AX0v5taRI67q/A9eFzVtnBdaV/yJDkT/9uQ9aj2Vg
         kFZYd7LAgCjO1rpZ7Y/55LRw75+GNVGrTCamIyFen2Cc0TZq0/SABRgzaWkVKvgo7+I3
         cAew==
X-Gm-Message-State: AOJu0Yzcv0xRKzbhkjKGQaPemvQSJXbueMqiZW4yUTAyEJIVMhHMhlO7
	mRNTuQv6AhC3t4oFatYBexhskZ0G+ZTYbi5CFT6xCB52/N7PP9FSWT/vkaqzJDCT+j8JsWCjI5C
	TnXpAcoQSuFdVcPE3bBH99o4HS6pPmj8CZsElIrJx6fWtJk6i10jxMX8zUM4zzK9WPg==
X-Received: by 2002:a05:6102:3594:b0:47a:3a6d:4d4d with SMTP id h20-20020a056102359400b0047a3a6d4d4dmr533853vsu.10.1712824179107;
        Thu, 11 Apr 2024 01:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5GnC0mBUTHupeuCkWYsDJWKGEPm++wTV8jzZf8vaD4JQ9NdRD7MvBPp53DY/6Bg4JWsv9Ng==
X-Received: by 2002:a05:6102:3594:b0:47a:3a6d:4d4d with SMTP id h20-20020a056102359400b0047a3a6d4d4dmr533810vsu.10.1712824177361;
        Thu, 11 Apr 2024 01:29:37 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id f16-20020ac86ed0000000b004348d54a873sm632760qtv.57.2024.04.11.01.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 01:29:36 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Kent Overstreet <kent.overstreet@linux.dev>,
	Brian Foster <bfoster@redhat.com>,
	linux-bcachefs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] bcachefs: fix typo in reference to BCACHEFS_DEBUG
Date: Thu, 11 Apr 2024 10:29:31 +0200
Message-ID: <20240411082931.56362-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ec9cc18fc2e6 ("bcachefs: Add checks for invalid snapshot IDs")
intends to check the sanity of a snapshot and panic when
BCACHEFS_DEBUG is set, but that conditional has a typo.

Fix the typo to refer to the actual existing Kconfig symbol.

This was found with ./scripts/checkkconfigsymbols.py.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 fs/bcachefs/snapshot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/snapshot.h b/fs/bcachefs/snapshot.h
index b7d2fed37c4f..3fdb41b33d2d 100644
--- a/fs/bcachefs/snapshot.h
+++ b/fs/bcachefs/snapshot.h
@@ -77,7 +77,7 @@ static inline u32 __bch2_snapshot_parent(struct bch_fs *c, u32 id)
 		return 0;
 
 	u32 parent = s->parent;
-	if (IS_ENABLED(CONFIG_BCACHEFS_DEBU) &&
+	if (IS_ENABLED(CONFIG_BCACHEFS_DEBUG) &&
 	    parent &&
 	    s->depth != snapshot_t(c, parent)->depth + 1)
 		panic("id %u depth=%u parent %u depth=%u\n",
-- 
2.44.0

