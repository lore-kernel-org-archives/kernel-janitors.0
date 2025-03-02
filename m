Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B1101C8
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Mar 2025 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932582; cv=none; b=mXkIOOmHPeo7/cUsfNsuCLvpQ9ictYD+bo8uwDUs6O2vE9c9Aq3k6yg3xRxLgIB1uFkN6uaaqaGCSeaROxq0pI6oqCtsePhswrIJQnJXJmUpiSJZnSeSFIObVO4r8zJbFzDn/68fYA6mgkt4oIx/9BtuP+dlS2dxiuJDpSDo5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932582; c=relaxed/simple;
	bh=IjiqYfOaFT/5bcZk8bWzCldlSR2W+8zYw0RxG3snBeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ONy64m3EfzuSApPzOTJW4jCygVrC6CGIa/kgqkEgnmlKdBXAjIMPTwzJjdQlLAJy/DHpqlXxzQzwsp7xotm6mbi+HsjDtBPoRQF+JGFH45MAJl+T2eoE5PVqeDNu3o76qgjoKRLOgBrd0mUjkMm+HcUYGI5tqgEqCHN+3oVZhjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FHv+LKRi; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FHv+LKRi"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id om4YtTJnYVX8Kom4btOvoD; Sun, 02 Mar 2025 17:21:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740932510;
	bh=iipt5Yn3YiPOXNMgfxQ8YWRnO9V/lrPEOyeJI1wMlbY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FHv+LKRiGR6lZ+NPxG9FsMoGQDc4hl+YDqaTSvO5ym240lMZXEu4ax7mz5cGl7FIC
	 UC40eL+bsSFicmSFH/DxOtIkjdPktO/02UssrVWWlgt7fb0N+rVKib1BXMKFrVRC/n
	 CTLwl1P3pRCMY52ndBh/TgcbFtjfObZUHZlxz9ft7/se4NPyDiJmp51QfsBPuTIrZQ
	 OkET8rq2EMnNjZWDjXVEXXJy6k9WX9ELhZRVvy6IAb+Mct2mc2Ovhao1MAZZGh8Ad9
	 Wtt0NLoKKPlZdtBGokikHSZRBbC2bKC4ppAk3Q+17p98n7puYLhvmug4OQvBnJ6WlC
	 6wS+NiJxWDrrg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 17:21:50 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andersson@kernel.org,
	Michael.Srba@seznam.cz,
	konradybcio@kernel.org,
	jeffrey.l.hugo@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] bus: qcom-ssc-block-bus:  Fix some error handling paths
Date: Sun,  2 Mar 2025 17:21:33 +0100
Message-ID: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 should be straight forward. It removes some ioumap() from
resources allocated with devm_ioremap_resource().

Patch 2 is more speculative. It releases some resources in the error
handling path of the probe, as done in the .remove() function.


Finally, the .remove() function also has some 
	pm_runtime_disable(&pdev->dev);
	pm_clk_destroy(&pdev->dev);
calls.

Usually pm_runtime_disable() is paired with pm_runtime_enable() and I
would expect some pm_clk_add(() calls related to pm_clk_destroy().
Neither exists.

So I wonder if these 2 calls are correct in the .remove() function.
Thought?

Christophe JAILLET (2):
  bus: qcom-ssc-block-bus: Remove some duplicated iounmap() calls
  bus: qcom-ssc-block-bus: Fix the error handling path of
    qcom_ssc_block_bus_probe()

 drivers/bus/qcom-ssc-block-bus.c | 34 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.48.1

