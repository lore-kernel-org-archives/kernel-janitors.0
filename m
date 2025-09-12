Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA02C11C2
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Sep 2025 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663061; cv=none; b=VrxK9EdTGrGbN8wW+7coxG9sZyTutmO6FB7bywAWLZfY0/oT+D5jaR5FJt0wnM9qGbnFXMYRoV2pUQeDOq8CoZoMqFQ3izcufA2cTZSVQXCwLFYrhQyjWYGo2dcdeboJ6c4uAdggCjjjhu9+dylABj+bR1gMmsoBcXZaQ/115II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663061; c=relaxed/simple;
	bh=LspG41QjRVP1lr4pcJH/eUG6PUt7+aZBW6BR2m0+OFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lmhk+XwQnAa+vObktkGTs3KSJXPOoAOG1TEPDOC63vPxwRbnGtfiPbwAROsvrqJJi/VpHZTNFrL87E7JoNruKDIC4tirKlSwojOajwEb5E5X9FoATZNoBoy1QuAwispOoiKq0bf1alU9+AQp0ODWATgxeyk9BNB4YFZ7iHk4+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfsgLo4g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfsgLo4g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso10216255e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Sep 2025 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757663058; x=1758267858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vzS365Y8dpkhAzeZRdnCGhHbPvqCTNi/Gxyj9Ln0+k=;
        b=kfsgLo4gHsIqnMaeF7pNo80Xz1wvybHoYYJ5h+uma/CjrAskMmsyWxz+ItpLNEFJtY
         Rb7W0s/dTneRKMXfbW9PVpcd15kDSUukzyHlppxAF3FBsxtLpMZet0iTLHAu3Yk1ItRV
         w3mHufez57sfYTAswAuEWgC4BnB9Ci0Qv3QgMdQX137109VGbY117mRVzNL27EZgXA0c
         gljZvG/F1VH4TpM/O/BFp3hO4UuXj5AYA2YLCMgbWPawK4JZ67d7cwBa4lBIKhD4v87b
         o4JAz2P/L0vDwpRyiiZyPnDA3MQxrgCWoZrC7e/kv6v3IS8A5wu9PVqO/AW2cJMzlVgv
         Q6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663058; x=1758267858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vzS365Y8dpkhAzeZRdnCGhHbPvqCTNi/Gxyj9Ln0+k=;
        b=njWTZA0Q+emM9kd8/kx7eFxPPp8B0ZE4Ym5mmYEApDWbMpvxTV2N3GvMS/OManwCgQ
         yK+hGWrPlAqU65bGjPK2hSpfvoznSkfJegTNXddraC1ubq8G6+S8UzIh0NkKdN2ZuPDG
         y0GEfno95qCA13WT6aMH4U8IAYtSH1nKpn+NVfpjGnnAvWBKQC2WBCk5JwGCKVHhBSpp
         kgEcoxA5MMxRBSuZRf8mx5Q57Sv8ztb/c1UIk4VEMbQ+bLxxxznM7M9UnreAGP+QRSYH
         TYicoiQ6LS8PiMR2W1VO24z+MMWgc8cleGEYe1FZDNBQSx7TroC9nsdTYtdW6aTfKxLg
         a8+Q==
X-Gm-Message-State: AOJu0YxPCyb6a8x1moEmggNOfrd2cgbCikrue/UXPTfi0925B3sTRgQf
	k+3HhQ5SwMzhLYjYrlBFKRjn7Fs1vL1KCVE6z4vLwas1aEsyhRbY/EZ2
X-Gm-Gg: ASbGnctOpqsq0ay9sL6vrXVd+m7OWmHDwcTwKPQAzhNS9QlCqFIbcDaERSUeFlMp9pp
	YzwoBIIvtkvNLCeZcROv+lJCguNo+L/PDmYIOVxOrRMpPLydjxbIPEq2zXlSEH/kiD2neAZg4Fh
	9xMMYeqrLmDVMH+F2Qozz0Mn5ENeuRgH5UIXPNDgqItq9sh6N852mw4ufAm7PzQjo5OdIUa7ld0
	QgNJtbfWvQ8rkfalefe+344rM7J1GxgPv4yghficqcPq0rWUBzQbqVpHqRFmBY/s3RNzTbBPXoO
	LEhwGAATqM3cgKhXR7qlRE1tgYxXe53CUv//eQQPyG00j2+zGvm4DMxCKihW47ZoFsg3y8MfCy/
	cJL8CMOy5wSs2cGAF+KRn
X-Google-Smtp-Source: AGHT+IGcBRTRyBh6Cwu5iI4hTdWjgTJRmHmc3IyNU0i7I6eC8AyH4njMSzoX7KbtbrF08N3PuQ7bhQ==
X-Received: by 2002:a05:600c:3209:b0:45c:b55f:466a with SMTP id 5b1f17b1804b1-45f211efac2mr13603635e9.15.1757663058119;
        Fri, 12 Sep 2025 00:44:18 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e03719235sm51823045e9.1.2025.09.12.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:44:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/guc: Fix spelling mistake "sheduling" -> "scheduling"
Date: Fri, 12 Sep 2025 08:43:30 +0100
Message-ID: <20250912074330.1275279-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a xe_gt_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a465594b61dc..8cb8b93a37a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -355,7 +355,7 @@ static int guc_init_global_schedule_policy(struct xe_guc *guc)
 		ret = xe_guc_ct_send_block(&guc->ct, data, count);
 		if (ret < 0) {
 			xe_gt_err(guc_to_gt(guc),
-				  "failed to enable GuC sheduling policies: %pe\n",
+				  "failed to enable GuC scheduling policies: %pe\n",
 				  ERR_PTR(ret));
 			return ret;
 		}
-- 
2.51.0

