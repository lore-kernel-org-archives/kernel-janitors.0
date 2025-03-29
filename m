Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986EA14AA9
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Mar 2025 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234434; cv=none; b=gv8+PWmkbwLedyowvmkEQeksmSqG4V79OhHltveUa7vXCjhATdVFxDDVWssOxiByu3OnH2qyo9Jup/TgGkDOnDaEYK43Dti1uzSEWjUcujTw0pT/ve4nI7NyuOF2jkXJO8bn4EGyFhDgw5fTeZSk1GO8vKT+xnibjftHuacuDIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234434; c=relaxed/simple;
	bh=KUq+S/t4WrAFvMZFqMNpOggywnaeM8gzImkObNF9H1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FuQ1C5SVPJiB6LJvYjBV1+QZicWIwIC2w/nsP69v4gT+s04WnHqNHkojyBLjv27ehHMOG0FB1vLJ/y2ehnoEkgubd+J7HSfCM2UXuEBhgYsnT1eb3J1t/NYYbPH1DG99vZkG22Oq9JStFfAYyz80OYnHhDNAVkIuAKelA7ZUzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=gy4O+eYw; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gy4O+eYw"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtDteVKf; Sat, 29 Mar 2025 08:46:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234361;
	bh=LRG0jHcVlijLslM+LJD/Jnii6JM0NbQiCR69GjeZ8mg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gy4O+eYwmJf9m3g7OtbpyC6UcHKkCQR4bB/LtTj48AIu+zl4DBhclguesg3S/JgCw
	 hUSmuc2k9UrmFGIV0MuEXVOf1DgbAoY3I5qkcD4TJgBwew6gCAS4dFdI0JHrb1EQ7o
	 FVep+OfD2SKaeN5Kq5Ulk1gnD57ZRrKM1fGiPucQqLxZwGD8JgwAU91JK6RSydbSkP
	 vmnFVB4AuwKVgeB153oeaYhj+Mbfx2VIH9I8ZY+kHczuLfsrGeBhcpbkSuDv/t8Fcw
	 gknMYgJewt1OTViCw7LLmQcik+IEbfA2LIKI3teQe1BOf2irs/3y+QSgIkyrIJTruR
	 2T3dbBYQH0Zlg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:01 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	beomho.seo@samsung.com,
	ideal.song@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4] mfd: exynos-lpass: Fix some error handling paths
Date: Sat, 29 Mar 2025 08:45:44 +0100
Message-ID: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie fixes several issues related to error handling paths in
drivers/mfd/exynos-lpass.c.

I've split it in 4 patches to ease review, but could be merge in only
1 patch. Or only (3 and 4) could be merged, as they are related.

Patch 1: Fix a leak in the error handling path of the probe. It Should
be straighforward.

Patch 2: Slighly unsure of the order of the code. In the probe, we
enable pm, then lpass, so should we disable lpass, then pm?

Patch 3: Is just a preparation for patch 4. It makes patch 4 more
readable.

Patch 4: Fix a leak in the error handling path of the probe. It Should
be straighforward.


All these patches are compile tested only.

Christophe JAILLET (4):
  mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
  mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in
    exynos_lpass_remove()
  mfd: exynos-lpass: Move exynos_lpass_remove()
  mfd: exynos-lpass: Fix another error handling path in
    exynos_lpass_probe()

 drivers/mfd/exynos-lpass.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

-- 
2.49.0

