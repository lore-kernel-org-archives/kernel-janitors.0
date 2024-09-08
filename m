Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87F38F9C
	for <kernel-janitors@vger.kernel.org>; Sun,  8 Sep 2024 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725795659; cv=none; b=aC9miapIfztkFy00szXLmAz3hMlsqTsQo/EVTIvyG7vcomL856f6E6FHHezubrTXYPSwbTAZilF3GH5beuNWrDS2nLhmqkRUQyesF6FZLQcU0AdkldH0DnkzH9grIFTkzHIgTseA2b8a087y9LXCgyho48RBrunmO2RDLm0G1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725795659; c=relaxed/simple;
	bh=KbKh2FVELoj3kuLJ9cKpEqvKQqfPVt/zOcMMrPzjzDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K6tZvOXqDilhM1gW+eQRzaKfTWla/tptil/JTeKvQIcCjVHxe5zPAX/c4ozTiiRiF1VgN3BNqSOHw8rz5/lojntam9+yR8DdkXN9/kqkHH76nGq6p0nWWRLVBhXWwXEyP1gvo2KD0RNLr6tN9Uu0hyUkCBii9vGl8R2DdPdOyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mJqZFoWE; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mJqZFoWE"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nGHgsexU2GrBenGHgswgj8; Sun, 08 Sep 2024 13:40:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725795648;
	bh=VhSkXI3EnkqnwlJ/f665rfBPl1jI/zqhPe1XKWN080M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mJqZFoWEvLTLsmHgQ6N/AetnOHTIqCYi22cTzawW3fz0qKy/xv8+Ts9W+UL9cW0UU
	 12wvKCPwwL+wk5Xd1YiggdmytY40cYdpD0PbAUl5MykMXwDZKz99aGZz/CbK9yL5s5
	 jTYnBkZ0BrWdqGE96zaQVNRGsPDF/BCxee7UTjTkiON8UADptwbowm1Cth6dCGeYaA
	 YDxMJ5nDaTMICRZepPP0p1PJnOu3GBEqeBacSyZcgsvq1Q3ndGAzDkBqno6mzAc3o1
	 WgSiFR7p99tXnKKo7y7Htt3ZgBEo1NY5Qb5pFPkW2NvosCpp1w/rEJ2pHC4u00xuft
	 YghkVDbJZkJwA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Sep 2024 13:40:48 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com,
	iskren.chernev@gmail.com
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] regulator: max77826: Constify and simplify
Date: Sun,  8 Sep 2024 13:40:43 +0200
Message-ID: <cover.1725791361.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 is just a constification path. It should be straighforward.


Patch 2 is COMPLETELY SPECULATIVE. Some code and memory allocation
*LOOK* useless. So review with care!
Looking are lore does not give any information about this code to me.
v1: https://lore.kernel.org/all/20200413164440.1138178-1-iskren.chernev@gmail.com/
v2: https://lore.kernel.org/all/20200414172250.2363235-1-iskren.chernev@gmail.com/

It *looks* like code written to release some resources in a .remove()
function, maybe used before switchwing to devm_ function.

Christophe JAILLET (2):
  regulator: max77826: Constify struct regulator_desc
  regulator: max77826: Simplify max77826_i2c_probe()

 drivers/regulator/max77826-regulator.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

-- 
2.46.0

