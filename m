Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA2225B0BD
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014621; cv=none; b=ZEyfXdOjS/BzHAqMn9EzuWlYk4m8cmPCrwdZ8zFnZwp6U16IHd2Go0+gjDzcuvTycws1UfVsjSDoMmrmq1rVus4ukChbtiOYvdcjxbIXxttTcWd0z0n6EmpTh6Iw5xILJQmNl4OxI/LLuDTzLNuajF8H/fiSvfeOLs5tFfLkj9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014621; c=relaxed/simple;
	bh=XD8dmnDn9DEsDWuychVmn3KpB1RjOppHzuB5zqBo6ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Type; b=DxLzUJjFmPSABZa961xgML11twyUcII/BY4IUWVLZB4qkjTEvAJU9ZzH9WiCCVCagGb06HMHfm271A1LJIy3J4qvsKFxwyu7Xcsg+KBkRcq/C7g4CVxhKan9j1PtNPHSsueERsBMXI5ER7kkI/wgjtu12uNAXDLsPeiu2mDrxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knnFjUOL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knnFjUOL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4758bd3731bso481229f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 00:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784014616; x=1784619416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-type:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApZjn7xytwk2Zv5kSJldvGb4QFyiTuyC5Qq2jVIAl08=;
        b=knnFjUOLZLv9UPn8Wyxxs16/fxU7EumyjvuuukVqsIxjQP8l5+LgjF2GxAlKmiVoOU
         3Cp6Duk0uD62NPMa14ki0msnKaOvjDZGDGS/wpEJ/4rhfl6xvw/R9s4DRiGN2HMx0ksv
         lf1vJSxAHoyOiIf5RDvwP/tAKUMcpWv32PFN3IH4M7RQb7Bdps2heDLLFy9Um3vB0uds
         BVDs6eS4Ggw2fcMh53gM3xvSINcczlFnX7F1hXJ1TGFcTVR8eSMGCEE1Sa1MO0pB7Llm
         cXIEr2rACgviz0neS6TiJUHMO/3isu2Jdi/vBDf75K997upICZqZPY+PMnErDqyWvgpi
         lwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784014616; x=1784619416;
        h=content-transfer-encoding:content-type:content-type:mime-version
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApZjn7xytwk2Zv5kSJldvGb4QFyiTuyC5Qq2jVIAl08=;
        b=OwxI/9qJjQ/Di4W55q5WZQMtWnjAsICK+q54TDfQt2k68Cj8YgYiUPW6HTpyJBUdki
         NRVu+PP/9DedcVtCJrGw0+B5Tg2zs3RcPtb1bSfLWhgmB/DxFSMHdiKys7TZUsSiqa+/
         qrvMjeoBXkTL3Py5P+2vths4Ouy2zzRch1wmAMy9R+HIddktnS9bAN9MYoEE29LrEhwN
         6h1XxoaBmZaoe9W+k0BhatIseVb7wGa3MR/qPG+XHND5dxnwvUtXHsc3okXmlYOU52ek
         vtrvCAxPFMBNrQS6rmI2fj9a6RBZXo7ms1DrssACY9BBy3ubACko90LjRoHLRTnoketm
         HWFQ==
X-Gm-Message-State: AOJu0YzRo96XJz/oGymdn3ARSi4f3Lhl5i1ivn4VQ+CeKu/h9xnTFYLf
	u+5Oj/m6zsdvHB7xVxCUWY/fheGONnhZ5o1VRBAkiinJsCRz9fNWNeY3
X-Gm-Gg: AfdE7cnStrwBf9LFEn2jk6GpFJ1gc1IGns08q9252NrdLScTKkgb70oEk6gsqIwY3j+
	7GUZPRhRDuL5NPswOHwo2K/tfR2PNLLqc6xFE3FWRVeHrl8OgTmQUgnD0DHvWlze8QjqqEdZZOj
	cPTdJzBqN93tEuStXDQihn4aZ1LJ94Kf6OjWfsJNZFh7wNjpD5ZYWJAXVBtaUVbQSXcqiFmUB27
	jG4wMpFnRyAIcp7DzXPNLX9xeIu/bS3HDu7m8h5DsLzGbaaNrWMuBnCgh1zsbWixF3S1CUSqSVz
	CWqebG04ACUgWYpRelN0Ktui5x0N/jLUwXqS1uAQxQAeukcTFXaMgLEr43MFPUvj+gahrfR87vR
	Wp6acL/nnBsPe0VEJSVtzGvJB4tzy5T9cwxD0xNV+O8hWv6Bw5Dhy8N48CaP3t5fJMxVmuk6ZsI
	ll3rj0v/rHMD8=
X-Received: by 2002:a05:6000:22ca:b0:47e:4379:a4ed with SMTP id ffacd0b85a97d-47f2dcd9e36mr15046072f8f.30.1784014616041;
        Tue, 14 Jul 2026 00:36:56 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a96cfsm6344230f8f.20.2026.07.14.00.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:36:55 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oliver Neukum <oliver@neukum.org>,
	Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: dc395x: remove unused variable fact
Date: Tue, 14 Jul 2026 08:35:10 +0100
Message-ID: <20260714073510.43289-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable fact was used for debug but this was removed
in commit 62b434b0db2c ("scsi: dc395x: Remove DEBUG conditional
compilation"). The variable is now redundant and can be removed.

Cleans up clang scan build warning:
drivers/scsi/dc395x.c: In function ‘msgin_set_sync’:
drivers/scsi/dc395x.c:2185:13: warning: variable ‘fact’ set but not used [-Wunused-but-set-variable]
 2185 |         int fact;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/scsi/dc395x.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/scsi/dc395x.c b/drivers/scsi/dc395x.c
index 6183ce05d8cf..ba490174a417 100644
--- a/drivers/scsi/dc395x.c
+++ b/drivers/scsi/dc395x.c
@@ -2182,7 +2182,6 @@ static void msgin_set_sync(struct AdapterCtlBlk *acb, struct ScsiReqBlk *srb)
 {
 	struct DeviceCtlBlk *dcb = srb->dcb;
 	u8 bval;
-	int fact;
 
 	if (srb->msgin_buf[4] > 15)
 		srb->msgin_buf[4] = 15;
@@ -2205,11 +2204,6 @@ static void msgin_set_sync(struct AdapterCtlBlk *acb, struct ScsiReqBlk *srb)
 	dcb->sync_period |= ALT_SYNC | bval;
 	dcb->min_nego_period = srb->msgin_buf[3];
 
-	if (dcb->sync_period & WIDE_SYNC)
-		fact = 500;
-	else
-		fact = 250;
-
 	if (!(srb->state & SRB_DO_SYNC_NEGO)) {
 		/* Reply with corrected SDTR Message */
 
-- 
2.53.0

