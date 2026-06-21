Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF09B40D596
	for <kernel-janitors@vger.kernel.org>; Sun, 21 Jun 2026 05:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782021012; cv=none; b=Y+zvOR6v6KfBgFlXoQAybpMMvI+U76kKK8Rm0yA6dDhGKYN9kPmUfqdJ00OYUew89fFMny8q3hU8L1rXdVGwywbdHJixeI0aM1XH445BcTBrdG4QHtSdYBy7Hal8EypBxwEuRAnW1PUmfnkDZlc1anitaa1VvdGXwR8WX19pLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782021012; c=relaxed/simple;
	bh=ESDmob5IHwgRagGfP88IZLFQ4Lb1M13h98VMBxSsOgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QeDSWSAAYTVw53dOBHrIfxvsdrHUD4QzClOnfvO6m7/LCKoN7FdhnGNHd3Xj3G5xIHr3BIiCRkIm0C3mULEFAztQOCPAjuxAFepj64M0FfpJErC6i8GxhUtg3FVCCAOaQFAx2zzu9PHwILqih/XMxaq24m9EUAxzV6nDCBu5peA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=muWP06bm; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="muWP06bm"
Received: from fedora.home ([10.64.95.101])
	by smtp.orange.fr with ESMTP
	id bB4IwbDt7CvapbB4IwsfzZ; Sun, 21 Jun 2026 07:50:06 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id bB49wrc71HUYObB49wLXKq; Sun, 21 Jun 2026 07:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1782020998;
	bh=YBaqYNu0FHmuVhQvCPfkjTuwNSTkz/7PU8BfjEhnDOI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=muWP06bmu31/zvox/WA4NM6BmkK9m6WRSPJI1DY+g/NI6B26+hg0gCQRL4bbGTkO7
	 LOB/XsdAn/ZzkA7+aVmi95fWv5hOsZYDsazGYD5JT6Y2M7UA7ECSpdBoOVRBJsPU7K
	 MWd79d4RMKw5OwrotDqBlUov9iwnZ89F5tV/5tmX6KMGe5wLZpPMz5JVWDAuiQy7pd
	 aLM2qBhbVmfOJwJKB3TEYrQMxUD9j4soRW84vzXSQ14/Xrpt3K8Yk5oximQDj/vF/V
	 RPG1+fBkU7S3KhALN46nk7JQuRL2jaByeLRE6vZR5YdFmTdTUQHd7Ewvyiyw8HB0Au
	 B6d3Q7YMLYRHw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jun 2026 07:49:58 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Linlin Zhang <linlin.zhang@oss.qualcomm.com>,
	Eric Biggers <ebiggers@google.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Eric Biggers <ebiggers@kernel.org>,
	dm-devel@lists.linux.dev
Subject: [PATCH v2] dm-inlinecrypt: Fix some error handling paths in inlinecrypt_ctr()
Date: Sun, 21 Jun 2026 07:49:46 +0200
Message-ID: <714aaad163237e33157408c31c4b71796d20c133.1782020965.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All error handling paths, except these ones, branch to the 'bad' label in
the error handling path.

If not done, there is a memory leak and some sensitive data may be kept
around.

So, fix these error handling paths and also do the needed clean-up.

Fixes: e7f57d2c47e2 ("dm-inlinecrypt: add target for inline block device encryption")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
---
Compile tested only

Changes in v2:
  - Fix another missing goto   [Eric Biggers]
  - Add R-b tag (received privately)

v1: https://lore.kernel.org/all/2b6e6b71e66fbe90c75791669a9e16a36b48f7f6.1781983971.git.christophe.jaillet@wanadoo.fr/
---
 drivers/md/dm-inlinecrypt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-inlinecrypt.c b/drivers/md/dm-inlinecrypt.c
index be1b4aa8f28b..41293c18d10f 100644
--- a/drivers/md/dm-inlinecrypt.c
+++ b/drivers/md/dm-inlinecrypt.c
@@ -347,7 +347,8 @@ static int inlinecrypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	err = get_key_size(&argv[1]);
 	if (err < 0) {
 		ti->error = "Cannot parse key size";
-		return -EINVAL;
+		err = -EINVAL;
+		goto bad;
 	}
 	ctx->key_size = err;
 
@@ -398,6 +399,7 @@ static int inlinecrypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	if (ctx->iv_offset & ((ctx->sector_size >> SECTOR_SHIFT) - 1)) {
 		ti->error = "Wrong alignment of iv_offset sector";
 		err = -EINVAL;
+		goto bad;
 	}
 
 	ctx->max_dun = (ctx->iv_offset + ti->len - 1) >>
-- 
2.54.0

