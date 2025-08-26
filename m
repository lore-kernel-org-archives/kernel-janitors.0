Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206CA31987F
	for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756211353; cv=none; b=JT7ajckA4PXI2M04oQ7YvvkOX0RMNBzpWAACEu9DgpiY5LPY16DRrgVJHHcxiJj6THRH4AjJItyw8jntUsYZAMxahoEDPA6PnkVEVUtc4kZM0f+L4AUQt4BzGOOjyZiXp2mDTHs++PK8dA/d14PYnLj9HCShTXL7oJPTRCeqL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756211353; c=relaxed/simple;
	bh=078pPOc4+Mrq2GiBTcZLDoZe5iF+QRu+RYWcOLy3N5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MjZxvcoHao5elKDBOVkCZR68U2wkfElVZXmcsOalzuyRSa9bPgnIBhXc1+OlP0c9HE4KxLTgw9q9wYz9jWzXyrI2BV/EWJ33xE1NjAnGKZLZ8EcRbH4p3l77TffS40S1SNlR7l1LPJItEXFY/DBP003/xWQDaxgEQ7Z9zaavhiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=csSTlu0V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csSTlu0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756211351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QDSuqgH2PK79DxalD4iHZQ97YhSiJJlN/fNRNiH/3wE=;
	b=csSTlu0Vnr9I+ch1THOwn7QZzTqV1OPRO6tdUfoCBHA5axlnpulhlbWkqvOcmk3dQ+iVtR
	XX5k50SHZ0z3WyTdzI+miwfimIefUWh5UqnlYvd6ScYM4vc3XmJRWvnD39iG3fo+pTYS8k
	7pO79TTO/H3RMzhL3zex7t9d0jyYxFQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-D_n6hrsDObCtAMnNL2WW4g-1; Tue, 26 Aug 2025 08:29:09 -0400
X-MC-Unique: D_n6hrsDObCtAMnNL2WW4g-1
X-Mimecast-MFC-AGG-ID: D_n6hrsDObCtAMnNL2WW4g_1756211349
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9a65c355so89805296d6.1
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 05:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756211349; x=1756816149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDSuqgH2PK79DxalD4iHZQ97YhSiJJlN/fNRNiH/3wE=;
        b=S2+tTCuNymFbI766rdspCo0y1+18cqe1KEpcjWjOS2tBIBi/OXVlGewcInFBNJ7aat
         PAZlx+tKEyot3vVGdznLcqJfn1efhhr1WmOixkkf00UOmTdY/VV05f+i+dV16PvmcIR8
         CW/UD6aAaD0Gao3Fvpcu51j0/+vc8xPRMWwdij1L0xNIEz2xiGHgAJ0lZ/ss6bfuuH7h
         Wn++NdTAAZyIoS4arJf0Gvb56rvd1su1IPOiIWN4pltR0Mltay2jk9knLkaUrlRp+5fB
         VZfqKsfD36FzrxGgvDzqU0oLjrD8Z8DS20/7BxN070GMgD3dneI2tH277JXNSdTI9FzI
         Ftog==
X-Gm-Message-State: AOJu0YxsyBApeZgviHL5LjJWztw7rVgqxO2q4gbbXfEye44bU7RmEP9h
	9RTzHiFTEoHBrb/lJ3Q314UhyAN6QmGZCQxkXLTqWt75aoy4nYq6zakXwZ5kzUKCb8HkWtnMMQU
	S9b9Yik9CWcJJGM6tqfaaXROZaAmEVRMkjyLVP2HrRkQNVGzO1aj7wMzaDMlerEXo3Vk5Iw==
X-Gm-Gg: ASbGncu1KGJxecQmeSMW0Xk6Z9gGrr6HM+/JInlhuzfeG9Zuo/tNAefl4F0vN0Ddy2W
	qNiY6x/RhB2jzR32ARwzTIzMnn5A4QTECt9reCZs3BNbOfODcvGeptD5Sk79mxk9bo8quP5J89H
	QXhaIPZutjferzE/yuS4CAAVM9PJg8mqsktXN8lsnIG5WuuFhUrjACTw58V+UP3SOjn2GotO/eX
	eG54MBsz1PLyHQnjyXPWrIqK5cW31qQDd+3lFH3gU30jsQBFz+T3b9wzGjMqHtHM71MRm63IH+9
	wS1UL20fdH/WEJqK7BgpWGeRe/KOAB5fa1lZyTlKVgLj05YdbwAJjh/FOlsEY8t5TLbPAzQdzLG
	Nr4QTvK66qQ==
X-Received: by 2002:a05:6214:e4c:b0:70b:ca78:4f52 with SMTP id 6a1803df08f44-70dd59c1084mr12462996d6.14.1756211348864;
        Tue, 26 Aug 2025 05:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHohgBlgoi98YMsIeHajcZi5xUzGFlQJCfrBIsLeUqR6BIOUm9qjIn9QZofOTgx7sTd3jOHZg==
X-Received: by 2002:a05:6214:e4c:b0:70b:ca78:4f52 with SMTP id 6a1803df08f44-70dd59c1084mr12462676d6.14.1756211348313;
        Tue, 26 Aug 2025 05:29:08 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72b04a6sm63527046d6.52.2025.08.26.05.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:29:07 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Leo Martins <loemra.dev@gmail.com>,
	linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] btrfs: move ref-verify of btrfs_init_data_ref under CONFIG_BTRFS_DEBUG
Date: Tue, 26 Aug 2025 14:29:01 +0200
Message-ID: <20250826122901.49526-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit dc9025c1a4d8 ("btrfs: move ref-verify under CONFIG_BTRFS_DEBUG")
removes config BTRFS_FS_REF_VERIFY and adds its functionality under config
BTRFS_DEBUG. This change misses a reference to BTRFS_FS_REF_VERIFY in the
btrfs_init_data_ref() function, though.

Replace this reference to BTRFS_FS_REF_VERIFY in the btrfs_init_data_ref()
with BTRFS_DEBUG.

Fixes: dc9025c1a4d8 ("btrfs: move ref-verify under CONFIG_BTRFS_DEBUG")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 fs/btrfs/delayed-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/delayed-ref.c b/fs/btrfs/delayed-ref.c
index f91062fc1b0b..6170803d8a1b 100644
--- a/fs/btrfs/delayed-ref.c
+++ b/fs/btrfs/delayed-ref.c
@@ -969,7 +969,7 @@ void btrfs_init_tree_ref(struct btrfs_ref *generic_ref, int level, u64 mod_root,
 void btrfs_init_data_ref(struct btrfs_ref *generic_ref, u64 ino, u64 offset,
 			 u64 mod_root, bool skip_qgroup)
 {
-#ifdef CONFIG_BTRFS_FS_REF_VERIFY
+#ifdef CONFIG_BTRFS_DEBUG
 	/* If @real_root not set, use @root as fallback */
 	generic_ref->real_root = mod_root ?: generic_ref->ref_root;
 #endif
-- 
2.50.1

