Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853552;
	b=H4uo3yOeQ3FIrOT9O3zdtIFEI5X6CO1gX8t7rVhfzXnxmCbW+MymX5rpPokONByz9tSU
	 LLEjBCFLsSN1Ar62oCuNlpUv6djqjEmQyKEi1N75x3yvcg/rOX7nZNe032xTaWcmmD2g3
	 sWQUwSVK1V0TYBC4QTGkUQ87G8RhjLJpjX2vCWOhwp4VaUMkswmlGLSTG7N1tOSw/HF4c
	 UCxF2ETzaXc2UY2mtZ/G+LYPzCRYEBwHtdaC6K7w6xda3RiwBnylPqmMYsGUdFWCh/6le
	 SUKGoZu1EDEdCK1fLA2ztBTpsyRA6dav7MTGk1xv7mUVTekXj9tsGqgb0pBbEZzzCsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=57cgpKzuG8iviQVEnNlM9P5mTIL8ivtwm96zaTpUOVU=;
	b=obWKAYYsowjRB2Gswp5upa9HWKh892pyFpCvQzmR8aJtbHoq0WTw0lwgCQT1pPccJJqt
	 kxdQQexunpQ9Xm6NMGSSRR4A75VoKdnzs2hZlrp7og64//IE8T1UoY2Hd4KQ8CuPnkq6P
	 /RxOmquI0kGAmpkQgBvkI2+2wsN9Rom8mbNb45wtxTn8SO7/N31aw5dZONHzzKuFYiyr/
	 DJHkwg2XRWpE1UCngyd5pz1qKdh7azqXSpnLKsP79v+79V/7Y709oIQmfD9AZqp+Chy4W
	 +foSyIRi6HyN7460JaW62KCWkXuurfqDGqXFxZu6ilOaNJ7IKPo9Vr9NppwniynxQwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgcdehew;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFED606A31B
	for <kernel-janitors@vger.kernel.org>; Sat, 24 Oct 2026 14:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CFED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgcdehew
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1818990f8f.3
        for <kernel-janitors@vger.kernel.org>; Sat, 24 Oct 2026 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792853550; x=1793458350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57cgpKzuG8iviQVEnNlM9P5mTIL8ivtwm96zaTpUOVU=;
        b=jgcdehew+sr/+8V1Btu38dbiwFtLdTNE9TZ3tmU+N44ZSZTi1BxT8br4h6ahD8PhHU
         /QL/nEdevW0b4FCzIt9oIDWJOwnMg1pya4GMg/Zvx52SJ29vYNZS9RJ+l08+nHypgEVI
         fZjKxC4zrmhK5N5xwiPTtrMSBoUUYeIBC4ED6UlGypYopXyArmamPNgxZdJ51mylvYio
         j4LjHdMt5Z6ZDJSFXtZDUhiHXYDzcfzGyablfEdcIUnuAmqjAEjTZlZKSIJWcDdWxNBR
         VZ7D0JLH4E+vfSJ8ADHXT6EL1yzOZseuRuIwPzXHzFmDjcvwNxzGsXr8xOcNj6QwpLdU
         fteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792853550; x=1793458350;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=57cgpKzuG8iviQVEnNlM9P5mTIL8ivtwm96zaTpUOVU=;
        b=MJ8gDTUAf+vSdleYJznx2dpdBGul3MImSmzt+zfmSgGzuEnzEfW+fDDoSAZ1GpJUKA
         lG5NCCKmidfk8gfDUPZTcNB8RAC+Ku6QJLznnXf9XbRHIPksO2qV/7sOm9oaQk7yMMEB
         0qV7n5nq+fLy7V2Sr8bZG5EiTME1DDboC8yeCVnwR3ETl6n0ez/llvJsuwSmssfXOBsX
         ROwA5Z1iDShqXRssxMIJwWYTCmiwH5vwE9i38soqBKRtaCltwAL7jb65bUVlrVfjn/Bz
         B5ucYueINFri0J3X62m9PlR28wY80rp9ra1kTqthg63vqZX7ov4cDDKgVApsTP1DLmxa
         WjhA==
X-Gm-Message-State: AFq9FYJCoZJZUWQn2GDBarYwv6z2ITjt7+3Nf3jVrViuX43aaUpCDdG1
	WrzTUqE74GzBsGDumXdiDXKNaf9RckxJVRPph8LPp7Tv1RZbQ0FbYJUl
X-Gm-Gg: AYBFou1CBlxQGDyjDAeZDriTU9siIKxe6iIOkPtg/4UdBljmlbWiC06QoRXqrB73JbM
	W9dD3Vjmf3O1kpCJPsJKILfyMjaDUq6DEDkZ3yAQcCMJd6zXRsayPR6He8zr3c9yirMYAE76VNY
	cwYPdHvHwuaQc/cdt3qnw8xxHDr1xBYdx1/1uUf2jEAoyUaKKzZRG3MZ4J2/xZvHW2ceJUASH2b
	Qw5SMAhHAMA50aYmcIVhVFhpQFbO66n5bYIQt8c/JZvCrLCv2/FwVdi4tCif7zAwkJ3bqH6fmWw
	ikjijugpbvVzJrNs00KamTw2TlPcD9NjQIw77CJ/rZExOq/hq7w6GAVdcoynS0CfTluSisiah+e
	vIpCJF6gIv5YmPX0fAMusvSMH2LRsKrBBfNnOOy1GYXvL69lw5469qtCKinrRAAeIwaAkdVHRXl
	5msoYgg5+h/IhQNrlmQyfugwM/GYkLisNq0OYCTrfjuUk0CxDtuK8PvnG1aXGTOffGHzfXR1JoU
	Esdzt8w6tjgzmz94OeyeM075JgueuhaYjgzMdDRnIK0U47jenuXsg==
X-Received: by 2002:a05:6000:41cd:b0:48d:f36e:ccc0 with SMTP id ffacd0b85a97d-48e3eab5794mr3799228f8f.0.1792853549728;
        Sat, 24 Oct 2026 07:52:29 -0700 (PDT)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm4620940f8f.6.2026.10.24.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:52:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sti: hdmi: make char * const array en_di static const
Date: Sat, 24 Oct 2026 15:52:27 +0100
Message-ID: <20261024145227.1193775-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array en_di on the stack at run
time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 7ba9e0b7ba6c..63418732daaa 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -647,10 +647,12 @@ static void hdmi_dbg_sta(struct seq_file *s, int val)
 static void hdmi_dbg_sw_di_cfg(struct seq_file *s, int val)
 {
 	int tmp;
-	char *const en_di[] = {"no transmission",
-			       "single transmission",
-			       "once every field",
-			       "once every frame"};
+	static const char *const en_di[] = {
+		"no transmission",
+		"single transmission",
+		"once every field",
+		"once every frame"
+	};
 
 	seq_putc(s, '\t');
 	tmp = (val & HDMI_IFRAME_CFG_DI_N(HDMI_IFRAME_MASK, 1));
-- 
2.55.0

