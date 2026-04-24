Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50436C9E5;
	Fri, 24 Apr 2026 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039591; cv=none; b=IYMVue2BTMTX4yx0vn9VNyAmnLz4h46GOicTxttAw8/DycP2X62CEc+/D9aEokLAKRVLQdjHZKhtv0kYyZLsRKWpdmh026PxPgdXMGWik9FmiEZPxt0vnLjivczbD1CpHR4Ie1cGvERkw3EpF4qsC2DFR2KAMAQZScnozazSsnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039591; c=relaxed/simple;
	bh=HuqFQpihBSAjw9z0OmGnI4ll7+CE/EmLvtCHWVC1FtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SL6CVQ0fqkAO7Nf35lD5rwj5YshQMkV3nVB3yTDzk5I0EDldYdsEsDr5N+I1IEo72x9tGcdTxUIBp3e9/jJ/UT+uEx3F01Q9YkmVNUo6ahD3ehj+JB6EqfGoPGtLLgBaYpm0ihXooiV23vBLNXduN1mzBxg5HuO8ErJDtAEnnF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eduardovasconcelos.com; spf=pass smtp.mailfrom=eduardovasconcelos.com; dkim=pass (2048-bit key) header.d=eduardovasconcelos.com header.i=@eduardovasconcelos.com header.b=jyffZIM9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZP2e39kb; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eduardovasconcelos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eduardovasconcelos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=eduardovasconcelos.com header.i=@eduardovasconcelos.com header.b="jyffZIM9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZP2e39kb"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 287781300F6C;
	Fri, 24 Apr 2026 10:06:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 24 Apr 2026 10:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	eduardovasconcelos.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1777039587; x=1777043187; bh=oHuMOvtj1iezE1YeNuDLSCyrYSQUS/0Yz/m
	go3MwrYs=; b=jyffZIM9CAu7RLVGskBsOaknZ1Fb9Nj2OgVtx2v36VsXTKcrl+w
	oQRl7+Iq80V6drEjweeeI2MsCd3B6V148U6pBdj6xyBhEo8/RMRXz/mYSXS2kctQ
	V6Ikz+0Am9iiuLtNveDQ3iDzB5IS5PcNMLnlofz+9Xpm3EAgfrH0Y9fLJYJqVCbJ
	TN49CAiD2IcZgfyyuEYoPcT1o7enASVWuibrOg2mWxMcLX97ZG3QTRSD7WKhK35z
	QjioEaKc1+hf/2GmCeodL/voRzc6+PnJMkLU/BOMsBTBnY/C/4wEMle74eW0fc2K
	NW+07csFrW+Gume17Idji/7hLN23bkKusdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777039587; x=1777043187; bh=oHuMOvtj1iezE1YeNuDLSCyrYSQUS/0Yz/m
	go3MwrYs=; b=ZP2e39kbNb8sjWgt7gZLAqyvfkxjHPxs0c1j5qEKAoTpGATbWUP
	pCbuB2rvxegPdl3trSyAm+rUD7IEoRnMvnIUgIBvGijWvvREcQa25gZgFBW4nSh+
	GRavmn+i0BWZH+yqTWKv8jKLa5zgLqqqltN1sHteHh/KhE4v/L7CH+rcr0IGGsc2
	DJXWDE5UyDcUTQRVlZ4zKYFVFk6fAf8k5Mmr+nY3M8Mfhsl6x1TUbJXYCVVswf0I
	bLpwXYMYzusfdbugZEYbfwxdVEKNdI6xSGKo68ETruRM1TK1Kag6MFju6ysk9Llx
	tahEOkj6VTeZ670vVKJCJv9gg/Qa3gAhkFg==
X-ME-Sender: <xms:4njraQ4Xf8s23F1Yzd7x3ROe84cagSZv8-EJWot-BlQqeKzWmVhODg>
    <xme:4njraedLh7CMayWeGhfWPc1Tqfj62b67W0p-9EYjvagn6JbqDuF1u5OCpNoS7Q-Qx
    _cN_hIEHusqY6rI7s8LiAHpscinu4HQyVmC2O2dLGKW_vH3hWdOD-s>
X-ME-Received: <xmr:4njraT4UZ3ZrY-VP1dw9Uw7vG6o0tgaYYQtVsodw97P3o1puo5rE3ZANisLyRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejtddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomhepgfguuhgrrhguohcugggrshgtohhntggvlhhoshcuoegvughurghrugho
    segvughurghrughovhgrshgtohhntggvlhhoshdrtghomheqnecuggftrfgrthhtvghrnh
    epuddtueffheevgeduudegfeffjeevveeugeegjeeuvdelhefgkeeujefggffhffeunecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepvgguuhgrrh
    guohesvgguuhgrrhguohhvrghstghonhgtvghlohhsrdgtohhmpdhnsggprhgtphhtthho
    peelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkh
    hhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghr
    ugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhush
    gvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegvughurghrughosegvug
    hurghrughovhgrshgtohhntggvlhhoshdrtghomhdprhgtphhtthhopegurhhiqdguvghv
    vghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgv
    rhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4njrab9TsKMSzAGnmzBQBBxi3efbelVccmxMKWoBDHpTgRWVoPyB_w>
    <xmx:4njraVEag09JlgTu5x-w57cAApIYMboxkW4WL3Ibhwv-j4DdesnJ1w>
    <xmx:4njraQVyJf7RO_1gcnoXNX2sCBoX8_g08zkNuPBH0N5zhpkInxOQnQ>
    <xmx:4njraR9zvuBFUb41bE4E48dA2HjRqxj1kAJxg_Y9FlW93exVTWcDBQ>
    <xmx:43jradE5gVON7dWaMvPYhbM9bnGjfUVmxbSpg-5NejEiLKmGAqhNV8nf>
Feedback-ID: iac1e4b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Apr 2026 10:06:23 -0400 (EDT)
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
Subject: [PATCH] drm/crc: Fix typo in documentation for drm_crtc_crc
Date: Fri, 24 Apr 2026 11:05:13 -0300
Message-ID: <20260424140515.2019-1-eduardo@eduardovasconcelos.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a typo in the documentation for struct drm_crtc_crc ("occured." -> "occurred"). Fix it.

Signed-off-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
---
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

