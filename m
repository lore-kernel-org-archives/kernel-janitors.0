Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE264248DC
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750524; cv=none; b=k0G6URlbb4xQRx4gdreETAxngARQUG4JVob42liXsCzqRzNRwq43wDJF37CDQjLY8UA8eHDykKVGKH+rJ7WLzNlYFYGyVNlFp9l6Nqj/vCLcpLATjbHaXpx/GZJMHtQ+2Et8v1N6ParF4JK5XvatTtGbadOQEjEol2/3dARiJkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750524; c=relaxed/simple;
	bh=YfYeCCwljxs5fzIjYTOd0pysB6MB+g6pIQzXMIkWylw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H9dqDr7OenSwWPfhg1LXb7TtRTqZutnJq4eaWgsq4npIA/gMzDy00Qj7Bz6kfL1d+hAbAbnquSvm9miVfWssTaonfF0kSdWr5AqclVOJVtPMIZS69XU9E1xn4rTZ23VD9Ve5cNNb8I9yen2N43gfcM9GSzVrKqnJKzjITr0ZmbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4VZaFhq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4VZaFhq"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so476030f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Aug 2026 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750521; x=1788355321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Q4gA+nOdeWZSwsSNe0w4DOU8QZDN/9GWMD7TfqVftY=;
        b=J4VZaFhqNFNWUduzpYwKCKbL7ZQH7z0wsgUNDhD6qD7SbNs96/5fvt7wG8LFqfucyj
         qte1hUlArFn94Vwkz889qENs+jHM1T3C7qQS7j6EAnwa1m2PV4eyzaCgHJO0LVZ5E6Pp
         2AQw7tAsNELS6Z0TdkyJ2YZ+8WhLg+LDMiwDAFbcK7FcVWyGB23Rx3BfoEJEmAYwAa6s
         X+VYmynU7EKfvfl2mngumaHN/3QylAKLX57JWi4GRYySHjBaWKcHkzsKvivpHjrk/0hm
         fWK/XdnG76OFS78N0/2nTu/5387AXo2SJAQ2VrY6EP4NkeAp6NPLuokPsC5X1HmM187p
         xINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750521; x=1788355321;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Q4gA+nOdeWZSwsSNe0w4DOU8QZDN/9GWMD7TfqVftY=;
        b=EZvnoW5nQYpg5AINmEtuG7Kz8pqd05BwJhGi+AN0Ga27Upo0j+6OIqELEcxnguCTIF
         Rj1pwVTweeFWLCoAHUGejfV73C3NbxrAL7SUDd77de1dTIuiIhUe0QQiwv8+BfMsLmKQ
         3gJ4UhTJC13yonJtJHQzXgS7RbD/adwkXYJwZ0niiI1OaZTpu6LTPjVQUiFu6/0j5XQW
         ibX3JIdFmIFNSIhg7cN6GNZlkLBqNTd17x81LFKai3O4QG2TLcSEQLYi65xn8wHrLYmP
         o4tY/IKxCgqdpGaACCmnFQ54Jc4lftTZueSHramxQ14qDRm7+0znDlDxIzOW+XtWCbGV
         JZ/g==
X-Gm-Message-State: AFuF++kbCdu4lp1xjoFcajZUnS4tpSMx1g7Kztuwx0D0fuUNVNPavdQ0
	4Zq600n6P+4Yy75o4xki5TEXIH3e5h5tm2whZrWPrpoCUVDNnAaxP1Uo
X-Gm-Gg: AR+sD10wRaLBJLxV2OWgtmzTT+ZkTbc9GuO0oB02W/260ryuvDVgyg20KTdfqRzyacr
	gKy3uzKEeyOfIFbCYdajy2lZsUCnYCVscO4Dp/fvmrHyr503vesw19Et0Woe71KecVCmR0xMbOB
	BpvqjLe0hcKVUJdDXKS+aWH1RZ6dz8h0OB8BD2O4kxFqjRWgpNRLR5b3iRjjE7+piLdTWPikQLH
	OTDiChamW5Q0IaGXAtNAk8X5Z8ojeQuj4KpK5w9fEymHTPuokeVhPjLC3ZHbTSA7z64uGPSqJyJ
	Im4dXNf6oHWZXXZrcysqrIIm/uk//a4tDdTgPKpEjW/ok86CKfMroqtMrtrgqhd0SaF4RATyCPs
	KWRwho8GGjgkaUx+YnehnUsdvcDRzsWtILGRTcaGEohA9LHKt5vwDmhaf1JB9r2fQQVworGMm5Q
	L+huWcorDjUxa512R2rsV9kg5dhu9oOHIzc0utzi6iOIvLOYwYgRJt0W0G4xo=
X-Received: by 2002:a5d:5e01:0:b0:482:e173:9949 with SMTP id ffacd0b85a97d-482e26d9657mr8019447f8f.14.1787750521087;
        Wed, 26 Aug 2026 06:22:01 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm2036957f8f.27.2026.08.26.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:21:57 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <rob.herring@calxeda.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eli Gurvitz <egurvitz@nvidia.com>
Subject: [PATCH] OPP: of: Fix potential multiplication overflow when calculating freq
Date: Wed, 26 Aug 2026 14:19:57 +0100
Message-ID: <20260826131957.1063765-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The multiplication be32_to_cpup(val++) * 1000 is performed using 32 bit
unsigned integers and hence uses a 32 bit multiplication; this will
overflow if be32_to_cpup(val++) is greater than 4294967 (which is
very unlikely at present). The result is assigned to an unsigned long
(which is a 64 bit value on 64 bit systems), so fix this potential
overflow by casting the first operand of the multiplication to
an unsigned int.

Fixes: b496dfbc94ab ("PM / OPP: Initialize OPP table from device tree")

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/opp/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index c02e20632fa6..9c4fd1f0e944 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1039,7 +1039,7 @@ static int _of_add_opp_table_v1(struct device *dev, struct opp_table *opp_table)
 
 	val = prop->value;
 	while (nr) {
-		unsigned long freq = be32_to_cpup(val++) * 1000;
+		unsigned long freq = (unsigned long)be32_to_cpup(val++) * 1000;
 		unsigned long volt = be32_to_cpup(val++);
 		struct dev_pm_opp_data data = {
 			.freq = freq,
-- 
2.55.0

