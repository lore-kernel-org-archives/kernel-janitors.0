Received: from msa.smtpout.orange.fr (msa-217.smtpout.orange.fr [193.252.23.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF034778C
	for <kernel-janitors@vger.kernel.org>; Tue,  6 Aug 2024 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722949275; cv=none; b=ToaN5mXfevnKBz6uVn9IrH2Ajo1IGBJwpRNi3kECYZYJRZjBZFQlPYZeGsDLWLj459BLlD7cF+jiWDPp5eDtMHpsulORXjrmhQUeILT4u9ZYm7szgR8gzJ/aTdiuPcOp5GEzl1kdfj7aC/7S91CJcELoBGgh41XcK8dMXh6QjoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722949275; c=relaxed/simple;
	bh=4KmLtLBnvDikI9Rip9vpoXE1FdlAAl+VZX5fVPpaU68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/n+tgSChJ+RZUw4lKJjMsAHRBq6OHRw0txyGScozR+FBcT2Lzwy/BLqEdEFUqoCYlbh8jTYlS+cmt7WoAbwOYTqwntXtHS5Mzt4PIT2EsvtgCQN+41EyurpVgTOXTUkwaRIY3GF3pAtIVT7h5KWgCU+7uHC63+45rkXIaKsWjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mo9pXGxS; arc=none smtp.client-ip=193.252.23.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mo9pXGxS"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bJoKs9q28nYGvbJoKs7vs0; Tue, 06 Aug 2024 15:01:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722949270;
	bh=fd+q0vZYHuoCmsWlgBR8lxVgdxoOXK0jnBOTKPNn9Xc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mo9pXGxS+gqtuzKDrWPpyw/kEW6r/rvJsspVcw04pq4CRZS2ncTSi7yBGLKgnWOFI
	 xrSbcRZwU9ksX+wqJbyIf8/Bs106av0y2k2odjLAEze59wROp1RFAoAMYAlofzOoAb
	 ut/35XpV/NycEaDAm/DyITxb2IdQ3HZ+oSh98HfCHxQLv565E8hwciqcg5UstTqZeZ
	 3/yCaCAt33G0FVHiRb8RiYkLmalr9+ssxBzQtGmpOHCmJkAEF/H3c6R5ZJoLKLySKC
	 cZhaUfB+LjG1TbqbV9w/LVyLigcnmtzMQsqKkJpVTtUEzOREXKWCP4UK0AvELnF9J1
	 0avidKzcY4NJA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 06 Aug 2024 15:01:10 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] regulator: bd9576: Constify struct linear_range
Date: Tue,  6 Aug 2024 15:01:04 +0200
Message-ID: <a4e37991ea7b47145ab033128c8dd49f73a983e6.1722949232.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct linear_range' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security.

This is also more consistent with the other struct linear_range declaration
above.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  20767	   4544	      0	  25311	   62df	drivers/regulator/bd9576-regulator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  21023	   4288	      0	  25311	   62df	drivers/regulator/bd9576-regulator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/regulator/bd9576-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index d4ca7b3f4036..bf5f9c3f2c97 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -68,25 +68,25 @@ static const struct linear_range voutL1_xvd_ranges[] = {
 	REGULATOR_LINEAR_RANGE(220000, 0x6e, 0x7f, 0),
 };
 
-static struct linear_range voutS1_ocw_ranges_internal[] = {
+static const struct linear_range voutS1_ocw_ranges_internal[] = {
 	REGULATOR_LINEAR_RANGE(200000, 0x01, 0x04, 0),
 	REGULATOR_LINEAR_RANGE(250000, 0x05, 0x18, 50000),
 	REGULATOR_LINEAR_RANGE(1200000, 0x19, 0x3f, 0),
 };
 
-static struct linear_range voutS1_ocw_ranges[] = {
+static const struct linear_range voutS1_ocw_ranges[] = {
 	REGULATOR_LINEAR_RANGE(50000, 0x01, 0x04, 0),
 	REGULATOR_LINEAR_RANGE(60000, 0x05, 0x18, 10000),
 	REGULATOR_LINEAR_RANGE(250000, 0x19, 0x3f, 0),
 };
 
-static struct linear_range voutS1_ocp_ranges_internal[] = {
+static const struct linear_range voutS1_ocp_ranges_internal[] = {
 	REGULATOR_LINEAR_RANGE(300000, 0x01, 0x06, 0),
 	REGULATOR_LINEAR_RANGE(350000, 0x7, 0x1b, 50000),
 	REGULATOR_LINEAR_RANGE(1350000, 0x1c, 0x3f, 0),
 };
 
-static struct linear_range voutS1_ocp_ranges[] = {
+static const struct linear_range voutS1_ocp_ranges[] = {
 	REGULATOR_LINEAR_RANGE(70000, 0x01, 0x06, 0),
 	REGULATOR_LINEAR_RANGE(80000, 0x7, 0x1b, 10000),
 	REGULATOR_LINEAR_RANGE(280000, 0x1c, 0x3f, 0),
-- 
2.45.2

