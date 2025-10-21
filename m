Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61422F2913
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Oct 2025 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761048444; cv=none; b=KHUdcxn7mPD/iGRXktokThqxjsqe17rLv1v6xuDT90NK3rDmJ1ddKWjikmuETptQg9SRtIJfwyNvGMpEE+sDoJBt2Ut+/97XR9N2PuFm/YhQJrjk/NmKK2lyno4bI3zAapByHhFZAj6PcSQXMkPD+r2v3mTSC3LZw20ZZZrh22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761048444; c=relaxed/simple;
	bh=Bm/W+StXUFT+ttWFbQJl7Ln7OHRm+FOEm6nVju8/ttk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=iGBUSk51e3iGtHNnYTQI80gkCUC5b2bguR8kCv6Zdd/Oge36VazaT6vFF6SRwcpVsbnG/DySoVAqVlCaMZ477VYuCjT20BLxTULiELbhGEWxvFKAi/hqU46n1RTkCbOS+wM80r1SZyVmbcOYKifZFTtDn8Xajbe4CRTyTu2BEuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVLv8JII; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVLv8JII"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8608f72582eso386578985a.2
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Oct 2025 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761048442; x=1761653242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UHJ36uQM4BVye2n0rKMF97O2VvnA9DN8xWFlKrecs64=;
        b=jVLv8JIIXDq7QhcX3AIMFwx2OteLfNFik8jgdFnAmIm5iKbSBAapv9b0tm/I7CF1+N
         7GSO5yV8j6k0GpWo3KTNRu1sJ0Qsr2cFYy5j3YFH5293rc4tvKNhsGOjmJ6MADCH5pWj
         p/S8h9n2M40fV76RnPbrFCg+L+fijcbYLSanyJZtEaBFbGZWKIf0trFgwuc42dj5mDr4
         kfhkHBC6gtwh/R7ST9HZyTpLaL6ODsPs8b2dlQSsNktCjM+BKROFgtn/tUxLSuM99yA5
         CNQdLkFeaeHTOCofASPuMyDsDnDOklRHx7HduOZfoixiNo2lj0ZEw+NokgRArVb0JerH
         sF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761048442; x=1761653242;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHJ36uQM4BVye2n0rKMF97O2VvnA9DN8xWFlKrecs64=;
        b=wEQO947acpx35mblO9T/PJg+M29XlJ4FUv1rXyVcoGPj6L4lhRu7eOou+8ysyfAT8Q
         YGx+T/Ub+INXK3Iu7akM2MEgcSToBzWV2+AkXI2AlJQjgnH1KMMRcf6i3d7LXJMORkJ7
         1IFsxC4fE1c/dwQopHIdkdbmeUDQrvLJLvbKBggMyq02VE2GsO9ukmGf2IvpKD6gWKk+
         MdHEHyOKt38b/1RDHDdt0znyAOoTR++uwTp6YMpyyCUmiU+pcj/VnaF/oq+/A+/dSze3
         m6ud+vHajzhFl3Grb3q2UyYQaCCkaBLNOyI5Pen5oW8BmkrJM3XFihlHEQTIGqHsMPc8
         tfQA==
X-Forwarded-Encrypted: i=1; AJvYcCWgo6ElOH733Wi70+7FzeyxWsv4ulJa/EaOvCd8+xouo/JWPOh+kg+TUecM929WW5e7Qub5zJhdmIhXDeUECA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBieSv/eqSEdWLaXLALbH+EnOtZbPv/mGQMo1SdIKrFML6Tejr
	1DKugjbkPIyHBrBAKkTqyLZz/3KfIKYrAWa9R2jP3MSkptCd22XOAKUYen8xHZY88DYGRB4ghQl
	iZl1kzUewepO9kjVIJhQEoLP1mTB2m4M=
X-Gm-Gg: ASbGncvNqcTI8d65x0zD/vpBm7/QW/019EQfiMmgGHBbyEgDzuZyWL3SVCB8jhS2Vd7
	bVQ555U7mImaCTX6RVZgetTKteKhMprLmK4DYqDqge3ICwYp9fFwpxL6aWT2YLm+EeBOfDF8v4V
	M9KKD8HaV07FRg4LjCW0kbcfTs7bk9a1BSjw/ybsuokGCllKNT1Y59xVtAI+mrzOOZRh5obM2ka
	rZsWyVNUfnHbAwXxsfNg/KvLYEwvbjgZ5a5s47p5lcUDrBb6jHsLgSXkA==
X-Google-Smtp-Source: AGHT+IFniqagYl059GJ4F0LH327CzdGmdoBLR8BN97FTS2ik4AEeLGWNALLr5XlbvFVagLt6oYzuHdBfT2zvGKtG+9M=
X-Received: by 2002:a05:620a:17a1:b0:892:7dd2:9f0f with SMTP id
 af79cd13be357-8927dd2a495mr1146935485a.19.1761048441705; Tue, 21 Oct 2025
 05:07:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Oct 2025 07:07:20 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Oct 2025 07:07:20 -0500
From: Amit Dhingra <mechanicalamit@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 07:07:20 -0500
X-Gm-Features: AS18NWCwACwLpluCYEij6JfBz929toQrYWwcMAuq_j2Cw1No2YmWqnAa0KXuJQ8
Message-ID: <CAO=gReGBaUiodShe-Dmir=XVkjOoP0rdvx=BGP79URrZOOmNyA@mail.gmail.com>
Subject: [PATCH] fix IS_ERR() vs NULL Check in btrfs_build_ref_tree()
To: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

btrfs_extent_root()/btrfs_global_root() does not return error pointers,
it returns NULL on error.

Fixes : ed4e6b5d644c ("btrfs: ref-verify: handle damaged extent root tree")
Signed-off-by: Amit Dhingra <mechanicalamit@gmail.com>
---
Compile tested only
---
 fs/btrfs/ref-verify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/ref-verify.c b/fs/btrfs/ref-verify.c
index de4cb0f3fbd0..e9224145d754 100644
--- a/fs/btrfs/ref-verify.c
+++ b/fs/btrfs/ref-verify.c
@@ -982,7 +982,7 @@ int btrfs_build_ref_tree(struct btrfs_fs_info *fs_info)

 	extent_root = btrfs_extent_root(fs_info, 0);
 	/* If the extent tree is damaged we cannot ignore it (IGNOREBADROOTS). */
-	if (IS_ERR(extent_root)) {
+	if (!extent_root) {
 		btrfs_warn(fs_info, "ref-verify: extent tree not available, disabling");
 		btrfs_clear_opt(fs_info->mount_opt, REF_VERIFY);
 		return 0;
-- 
2.51.1
