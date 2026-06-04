Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82129E117;
	Thu,  4 Jun 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569014; cv=none; b=YnuLgP9SHH1tHA8QdODk9Fpm1mMgViq4SpdYlD30UQ68ckvh5mUyGXKQ3KCbxXQAGKK3J3Mhwrc/1hSKxBZlLti6A0GuItZacYpZx2f+3zrzToUFhOteO+liM0KXfIm97M4hw/CQxvJuoXcU+LZQyoTwHjy2ATAPYRkCUqn5CrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569014; c=relaxed/simple;
	bh=vYswXubELzRmgNe9b3hapeZFs2aXiICmyr5minHpNZo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lTn8yLGKGAYeiLpFHdNPonWyvV/uEiiFEZ+BiSgZfdGDHBGRbnuIuTMEXDzSIJuEmZrnEZA5gvcONVNTjw6jHsyhmgbUGuGojdqCzfD2sAAQOYpGXQwftpRiopBkcvLtqz4zs582BVLaQ/7z3weru5VEecxqHWcbPgfvdZUkNgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tvh6c0BQ; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tvh6c0BQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780569005; x=1781173805; i=markus.elfring@web.de;
	bh=r7rAMpDSDceaCAPQ08VLCgVs9VtjsEi/WQC9FYlKCw8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tvh6c0BQJAcJ/xU20pJA6MbH1J0m6Ex5d4U8Hzs1IelMKPKuOsfQOt/SHOZzAaeG
	 nIQoMwwEWan1FIEUWjSqydUzKx6zNYHvW8bECwVVC75RUtCr5Ue0HW45305uJj1dt
	 SBkBWHjFJ5NyLMI7WvbKoWlcbUffw1ZrCFEWt0h3eHHa/7KXNJ5M20/yQ9sROvY3D
	 pfUCPnvUSz5wY5YROYHG4Fa6nGwYp3TpKSW6Ep/OXDLaFoWolymYGNJSiff36fZLB
	 i0kdIp7i3isT0yqtPyzlibOWhr+DRwcV+V+Ux7W9NJkqZijPGfxkHWIbDMcgWnAjY
	 hwq2L94c1cGuiNRbWA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9IOj-1waqMs26rv-00EaMJ; Thu, 04
 Jun 2026 12:30:05 +0200
Message-ID: <73999e78-39c5-4d46-a787-ded4da25d243@web.de>
Date: Thu, 4 Jun 2026 12:30:03 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Boqun Feng <boqun@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Content-Language: en-GB, de-DE
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] locking/lockdep: Simplify data output in lockdep_stats_show()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5xGfatZoLJ0ThEnCL4DX/J8t+xba7txbVRQyeAoPIll7C6YxybV
 N3p20wRHlcMby8zJ9xbaN6iSqXmStKOX8XlWtyWxYt7C28cjqmTMt73OqSPYJBvyi7P796o
 nlVtpr/38orQ/6Qs05ghGjX1vE4Ahfdm86P8omgTn87WBXOg1f1EvvozwYUdWFpX944ZhOu
 zWTRQ5C8M5kPzH5nxaQww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dF4nDGJwOEw=;f7bIXjbvy1K0gebrdfJFTqa2TUe
 +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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 12:23:32 +0200

Move the specification for a line break from a seq_puts() call
to a seq_printf() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 kernel/locking/lockdep_proc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 1916db9aa46b..b376fbc81ac0 100644
=2D-- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -381,9 +381,7 @@ static int lockdep_stats_show(struct seq_file *m, void=
 *v)
 	/*
 	 * Zapped classes and lockdep data buffers reuse statistics.
 	 */
-	seq_puts(m, "\n");
-	seq_printf(m, " zapped classes:                %11lu\n",
-			nr_zapped_classes);
+	seq_printf(m, "\n zapped classes:                %11lu\n", nr_zapped_cla=
sses);
 #ifdef CONFIG_PROVE_LOCKING
 	seq_printf(m, " zapped lock chains:            %11lu\n",
 			nr_zapped_lock_chains);
=2D-=20
2.54.0

