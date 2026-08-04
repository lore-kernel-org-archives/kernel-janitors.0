Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3BD439320
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Aug 2026 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837626; cv=none; b=IBSS9SEqjzlZz1EmuzjH2h6AGXNgZAteGs2DXe1om9YBTx7Pa+tV/1JoS/+XQUHdqsDug0zJwC4YYPrgTylDU0gG4taE6if2EEhU0JWa9HzMp0Dv5K4ei0hYWFLw61m9iqlIkyBSrMB6Px0Ggtq4LspOQGyyYyFUiRzIbHlCohY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837626; c=relaxed/simple;
	bh=AgJcqgW8tzD2mrEE54OJEywkDJ8ikvUc9koyQr7arf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l/xX3KZx029X1meEol6A6RpsOhyufO29iuWp62Rw6uhMNubcBl+ie32ujwWZKwi15txqVxkQ3fVEi10xV//30OaANF3BXkJENDMWfsXrdn8A1woOz6OVUH1els6AP3IgrWgqeWmyT8A4ifVJ1+kpncRRi3wZ1vgZmV0EvPGLE84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpxoHkiR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpxoHkiR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954aff6088so27309825e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Aug 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837623; x=1786442423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwR6eRQbLkyxYsbYNOQVC8KMkpYtEup1Txp4q+ZaTDQ=;
        b=FpxoHkiR4wFKaa5VFbmCjw5ve2Lvbb36i/GJTrzzXyw+GbGyT3fzWzV1oLEPF/Fkcg
         RinQEAdsvS79Ba9598i+se2Aw10IlXuVUc4NdYf7vCPPAGFE6/wa2tNFGGhEaRudDWn4
         BfHml/EHhS0U/ON6WvgfWv04UWwEbjXGCG3lIcTs0HkkPJksMnPhmVwZVAdBJKGezO3R
         eIu9J3ncrkQBL0+t9IZNtdTGb9k3+4BsdI0DPCB8JgSHOxGMjZjpyjVFNSAG9AWhG3cO
         /LfQ4uHdJC8MQLnuKh9KIPJuFtLWW7k2MNHPe1DL3DfsJz+CIcnQCEoO9sSvO2jwD60F
         ORLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837623; x=1786442423;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZwR6eRQbLkyxYsbYNOQVC8KMkpYtEup1Txp4q+ZaTDQ=;
        b=GqYgR36kfPo1q8dRXBtmaH6tbQx3mDzH/wN/8j4j1egkabwtkoxleiBszg1jizdo/H
         Is0Ba98e+3y1TEA5aW6cwiefvWZieh1M3FoRx7kOyyxnxZgnOEqIRu/HqfNuW9YUWuIs
         K3P24sSqbPVn9AhR9v5lgOz+PhHEQsfGzG8K+gLmC/Z53KilsUIxnCjhSD9B/BvlGZ3D
         3XNCJVAoJyZKPXeEa92xkQl5xUOWMRflA/iLtIA/cLkMYGRuhHv51SzU1Lw07wqpJjeh
         iXhne2n9ELWWqWAeqv9H4NIbHJ3345eVBKGKhW35THqNZoUVsuYTQXCsyacm71c/UXTd
         CSNA==
X-Gm-Message-State: AOJu0Yw6agPmhFAgegmuoU24bTesTMne5S4vPaVNNUmBpjYOE6JREZ6K
	x+aLlFlCKAvF/sc1vEmmDA326gV4BzaflUjJmmYnADT/1Qy1vQR/HSR6
X-Gm-Gg: AR+sD10jcQbCJ4EvYAkSbDNyKosr5gKUTMm2DKzTIOsviq1CGqx4IiLbiiv8F/yQwWi
	zlFzrjsX/Z2/fM3u8zwDyToUVveh47FS3wbIrS2yBB7bUnM89g6Zbhp3AhOblAL3qImNBXIfPsJ
	q2n0LYx3/kmJLV1UUT4HMM1+b+K0SkMk7GmCsksXOkH6rVo/8eHqCNjpZUbQpBkK9R0H0AhdlQk
	R3CtiUW+k76AoBEn7cOmFHeC2/e8ldJUhQsEbjYIPHwT9/haKzFNt+eJTb2dEFtQ7bEcrwnzD/j
	HcVieWq4DYWHbYP/jgWEguOQSpT3JPEL5fRxcTxdfJEEeGprK39HXil28pxcLmat1F2xuglvOyd
	PfzIiaRIloS7WcwmJTKnODSJEEgIdQ0aafHCPZWwQ8w86CWQbSoHFiNXBksrew9RGm51ThmrQC2
	hpMtp5EDqp118iNny5DM9Fh466NUT5jG0myHpz3ieOxOepCMzp4O/TCjJgFfAc
X-Received: by 2002:a05:600c:1d29:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4980c66c867mr318775455e9.2.1785837623196;
        Tue, 04 Aug 2026 03:00:23 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fef72esm87460135e9.15.2026.08.04.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:00:22 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: rtw89: coex: Fix spelling mistake "verseion" -> "version"
Date: Tue,  4 Aug 2026 10:58:32 +0100
Message-ID: <20260804095832.784121-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a rtw89_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/realtek/rtw89/coex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
index 5a9dc4d8a00b..84ae14f993e6 100644
--- a/drivers/net/wireless/realtek/rtw89/coex.c
+++ b/drivers/net/wireless/realtek/rtw89/coex.c
@@ -4086,7 +4086,7 @@ static void _set_rf_trx_para(struct rtw89_dev *rtwdev)
 		ul_para_num = chip->rf_para_ulink_num_v0;
 		dl_para_num = chip->rf_para_dlink_num_v0;
 	} else {
-		rtw89_warn(rtwdev, "[BTC]%s(), No rf_para for verseion %d\n",
+		rtw89_warn(rtwdev, "[BTC]%s(), No rf_para for version %d\n",
 			   __func__, ver->fcxtrx);
 		goto next;
 	}
-- 
2.53.0

