Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893C3E6DD4;
	Fri, 24 Apr 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777055844; cv=none; b=B4/M4XjcYBKnWiol7PzNcg28iV/h+f/xr8tGxnAqOpdq1T0OfgsmO8CO87sHElxPR7H+wydnylQtZ+t+qQ/l8aW9mgiu3X5La5muW5jPbzS0QJhK6iOpS5wjQcFz0FbL7HQufhMVFt6Q+iVSg385RbY4C/ZcqM5dCfBCR76Z1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777055844; c=relaxed/simple;
	bh=n1N0NJ6lmEMVSMqOlxf0BjcHpMztbSLy+lwT4MHNJow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdAboMBlzaLTtVn/M6SCKwLVl6bxN6HsjVFpi/A+y2L38jknytYbHMxRnGg8E4s8C6vluuCx3881fjHgk2X0G7OoLP2DKVUbA+Uj1Pf2YpEtw4nMUa4uf8adHnCDwqA14gmE3PgAr5YmYbOFEoo6TRZkg2Xff8c8957KNLsFL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eduardovasconcelos.com; spf=pass smtp.mailfrom=eduardovasconcelos.com; dkim=pass (2048-bit key) header.d=eduardovasconcelos.com header.i=@eduardovasconcelos.com header.b=S61+402l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WtFGhbt1; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eduardovasconcelos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eduardovasconcelos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=eduardovasconcelos.com header.i=@eduardovasconcelos.com header.b="S61+402l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WtFGhbt1"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 8FBA51300F21;
	Fri, 24 Apr 2026 14:37:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 24 Apr 2026 14:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	eduardovasconcelos.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1777055840; x=1777059440; bh=GBeKdNWDoF51ljz6w1e1jZ+m8hi43b3guSB
	l3uJssuU=; b=S61+402lGna3vQnHn9DSS6v197g7TkTCKVGlfPh9I15PuL9LHJM
	5fRTqtOlypsTzHduC3wnzc0Tst1SfuebfTKhkvNIy7GmfP9cJ0wVpHPao6S+ZYL1
	kPknQHEN9FoOMlV+7iVgSKKqlgg3Bmo5ydXwrlcKwNA58SYxHX09xRIzIS8tHSHv
	XSXdYykr3RaJuHvcwLwyF6T+tx3k5rNMvEDhnb1DkS1TiAY+WwI+nY4slSK3wq/g
	ve0EbqNtrUN3sddcOA899qAXmHdPufXmbuPhy66RpHKmdrqNY/QHP/dLroE3qiEX
	9PomA0vYB/FFAkK9KiDIcjDmNtcEln6THRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777055840; x=1777059440; bh=GBeKdNWDoF51ljz6w1e1jZ+m8hi43b3guSB
	l3uJssuU=; b=WtFGhbt1dPekyZ+jhL5OzW2VMK4+FB8rFFr1mWnUp2YICGze1h3
	lM18CuZ/Fmcrch/Dj/i3NV0PsR+uz1N6AszvH+GyRmt618JtKnzs7Nf/Ectk8If/
	fV1Ayzj7w5LeGN5mEph2fJuvOlz5U2BMRRMFI7wGeQlaabpHMcNIDISnGQqKlsGJ
	SlNBctv/utSI+zq0hNUQYqbkE3DOoJvKcpqFq1Q9/rOllfV+Bnd2UCDGC6vntkP8
	kufOVtrSLZO9fUP0xmQT+lCNj9nWXoAaOz26XzgW3BPl6JVik4f0zhyX3qX42JR0
	avQ1T6s1/qJa8R09qy0ijljgwqa3XOz6tvQ==
X-ME-Sender: <xms:X7jraRo3kh7_A9R1YlAylVtKTP0YpHPmlkIkJaHe9kBwNJJBH24bMw>
    <xme:X7jraQO5hjF28ca8aV1ZiXIAsyZZH5Cs6pq-uDE0NYkqxqwYlQUgZE51Mvl03yraz
    k7r3AggF_lpQpmbF6IwTuPwwkjqn09Nw49OU50g-nYV5FKJZEDhNjCS>
X-ME-Received: <xmr:X7jraSqx_7y_fO78oJ4xDLS8trZAAhwQfNa48IAPlpYdPTxE4pVEbvcllx0rww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejtdejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomhepgfguuhgrrhguohcugggrshgtohhntggvlhhoshcuoegvughurghrugho
    segvughurghrughovhgrshgtohhntggvlhhoshdrtghomheqnecuggftrfgrthhtvghrnh
    epveffteffgeekteeljeefveekiefhffeuiedtkeekkeekvddugeejiedvueethfeinecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegvughurghrughosegvughurghrughovhgrshgtohhn
    tggvlhhoshdrtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
    hhpdhrtghpthhtohepvgguuhgrrhguohesvgguuhgrrhguohhvrghstghonhgtvghlohhs
    rdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvsh
    hkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:X7jraTssNyHcfZR4TQ2tKuAa5D6CK_qRiFbv8ZvtkahzaWGDyhR55g>
    <xmx:X7jraR2vvAJU6j2z86mV73GJxTOiLgpyuZcR6UM1xJ4clEja5DgvQA>
    <xmx:X7jraeEUaR0LnO1S6PNlHsQgykjhncyPDZLUWH2M5Sw2BEVJqfA8rw>
    <xmx:X7jractyrN_bR4dv402JPFxjUtSFuI1L-c73EaF4me-qQHPufujYOQ>
    <xmx:YLjraX2Xh8SKaXov9VdGx2Wh0R1IWY0vSG27qcBAxT8nNrLr5ZCuGEYk>
Feedback-ID: iac1e4b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Apr 2026 14:37:16 -0400 (EDT)
From: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/crc: Fix typo in doc for drm_crtc_crc
Date: Fri, 24 Apr 2026 15:36:29 -0300
Message-ID: <20260424183630.3764-1-eduardo@eduardovasconcelos.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the documentation for struct drm_crtc_crc
("occured." -> "occurred").

Signed-off-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
---
Changes in v2:
- Fix subject line and commit message formatting
- Link to v1: https://lore.kernel.org/dri-devel/20260424140515.2019-1-eduardo@eduardovasconcelos.com/T/#u

 include/drm/drm_debugfs_crc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_debugfs_crc.h b/include/drm/drm_debugfs_crc.h
index 1b4c98c2f838..1cb71c03bf44 100644
--- a/include/drm/drm_debugfs_crc.h
+++ b/include/drm/drm_debugfs_crc.h
@@ -49,7 +49,7 @@ struct drm_crtc_crc_entry {
  * @lock: protects the fields in this struct
  * @source: name of the currently configured source of CRCs
  * @opened: whether userspace has opened the data file for reading
- * @overflow: whether an overflow occured.
+ * @overflow: whether an overflow occurred
  * @entries: array of entries, with size of %DRM_CRC_ENTRIES_NR
  * @head: head of circular queue
  * @tail: tail of circular queue
-- 
2.54.0

