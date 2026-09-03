Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EBF4BCAC9
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Sep 2026 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447241; cv=none; b=YxgBjufW9rwLqmiZBKo8yOZOHzN6ns27ioeaUedo8y/5grqmDTx+mNeJ9Wz8Ql1wfArUjXCHxYVd2AoTtnUr9DxWhh9e/GUoNMMi59J6yNPp2i1reY9a2p4wAIhSudVZykOjJf27DadCrwbdVhoMUGMrzmubG5nHwN63sYBFCiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447241; c=relaxed/simple;
	bh=YDztAxXFzz062DPQ0F0G4V3tU5HbxyJb7exw6We5bcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hl5KEgaoGTqWaHr0VfhN6HUqgxtbM0hRKxrlxCA01GGadGp5UAaXeNUnw5mxVNMmuygTYvjdmyyl0WWyP6DkrmsesBfV5T8fu3eex8gKgrb3VBffngs/2N9Yj01L7DslaP7/86zbkhZBGuvaNqYn7p3PA8w7457RvqNPBr/6z28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d20whh8c; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d20whh8c"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48584dc164fso428767f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Sep 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788447237; x=1789052037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1+XyfzZPIbCKw9YCkSkEQGbEGyUvErmvY4wjUX5mpM=;
        b=d20whh8ceppgQLEo7C6rIl5+6aoAZepQCAMfHc3UgS4HoCY5mNom7mQ80k2YDch+O1
         Vwl4IVhhM1aBV49zaES6SijTDq4pDM21uQVxfblxJ3btOe/4DkXP/kAGdaKD6Gz0sRRk
         4rFMIZRXsuekIF5NC5rYsis0rkNybeadAV5FYepsAd3qmBiFgo1aOB1aTwaAu799zu3Q
         z5EF47lRitaQjTdudm+/XL+QdJ8EkaEtq0tGHkJqWIqJotlXl+CkXg2q2FXXWBSwsXaG
         33ujLFtoMEIEbhme+Pq4cqtukcYa4gZMoxhCYHX3w6d7aIxVVBskElOQAvWNj845SvOc
         QtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447237; x=1789052037;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z1+XyfzZPIbCKw9YCkSkEQGbEGyUvErmvY4wjUX5mpM=;
        b=R5gvwMlgb3BTQydSN3t3rhHkQ/63xgbz4ud1cELDe8ZVQ2Qyi/d7mifB4be+WbBuz2
         Bn4QVYCR+JYIxsC1iSS5WcZGXBa2fjZMzYTheSGaaFhmODujI3fLAWIz5KK7Z924OnTr
         9FR3t64z7uyyqPrFmvX9wBMLppTxMgMIM0tevJZMQgcoV2StR44P3x8hE72bnZedSe4q
         XRCbXkr5otQXZcHiJrEpJcz1Lrc91sumkF8yp0lKcvPcYnnuEUBva21BOkc//8gqtWv+
         K9LsqBIc4DG1qOj+3kBOZcDa1e3Ms8LwDmF1k+C05DiDpYoev0RmJddIHlLnmjwZZ8x2
         yqeQ==
X-Gm-Message-State: AFuF++ky26uPjBHnFUXzOSdsI4Xl6SgemxFmAY1/fK1bA5xrbjCmoszP
	M/PRIDnpfyrlXK+Cr8ejIEzidwPmyoXkW52O3yosXCU7uzVlKVwJ9t3SfhcTog==
X-Gm-Gg: AYBFou0/49WFoRha3c1LNjlqSzR3xrHE6tt+xcs9r3bf6npAMlGmIwqwKjmzBlWlSkY
	xJvQx0wEbE0NHbkauZoN1KR8fDUlE4a0D53PgH2jaey7OGpELq14N2KIdLzlQ6DHAnyWT756/7z
	ZLsHseOnF9/ybrj1mRQfUDXx3gPi5EZX+vDqWEgqX7YO8eWe5W13VYybt3aAGSgZcwUGdhry0e/
	+8bb/drcwQUQlgKszdLiK34CyfBjgh7KvI6Cc+7qDZ//o6L0OipKt+1Mmow+7QuagFPPGscoREg
	/nTXF4+AUVxFkcM86K4q0EiHrEyKSXG4mSzQDDtNfUxhBa6tcWrGv8mashVrq64K/iET7Pm2xrx
	KqS/5LCsEYGyJi6TbOjCTZFtsk3oiK4xmBiwRehVCXhchAg4eTg9OOLo6SMJAeq0TknyjdGamLI
	eQtquHwZQfNc6wKvelMndFlKLnNkuo0g+7VhI685Ty1CaKjATwC+2EXlaGzcLLHdDq51y6
X-Received: by 2002:a05:6000:2381:b0:484:49f6:361e with SMTP id ffacd0b85a97d-48488f1b287mr22241291f8f.22.1788447237227;
        Thu, 03 Sep 2026 07:53:57 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3716sm15490761f8f.22.2026.09.03.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:53:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: "David E . Box" <david.e.box@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] tools/arch/x86/intel_sdsi: Fix spelling mistake "Licencse" -> "License"
Date: Thu,  3 Sep 2026 15:51:53 +0100
Message-ID: <20260903145153.11313-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/arch/x86/intel_sdsi/intel_sdsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/arch/x86/intel_sdsi/intel_sdsi.c b/tools/arch/x86/intel_sdsi/intel_sdsi.c
index 766a5d26f534..0e12b59976de 100644
--- a/tools/arch/x86/intel_sdsi/intel_sdsi.c
+++ b/tools/arch/x86/intel_sdsi/intel_sdsi.c
@@ -315,7 +315,7 @@ static char *content_type(uint32_t type)
 {
 	switch (type) {
 	case  CONTENT_TYPE_LK_ENC:
-		return "Licencse key encoding";
+		return "License key encoding";
 	case CONTENT_TYPE_LK_BLOB_ENC:
 		return "License key + Blob encoding";
 	default:
-- 
2.55.0

