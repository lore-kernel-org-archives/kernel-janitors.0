Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE9E1AAC9
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734100099; cv=none; b=aqI4n/zklTqqPCe5tGENFNFZFJGPUROZlcXGj2t88EIJwnigkAnMuDGJewn/TCaZ/6XznCPRiAAGGmQ8Qa6kPch3KtQNWyOLUI8MrHvLCK4NWmPw/6d2uJcXpbAB1aiG6vzNemQOsBuz3mhEezd+ioGAFx/Als81xtcZEUk+LwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734100099; c=relaxed/simple;
	bh=ycSL9pobM2GhQ8mh8TcgkFJoZAB71btUIwZlSI8OBQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XoWngV7A/G2monGO5I4PHEV1hjH6FFBbjMcuSDInyBj6q08qSF75MPYNtRzOWbBh4rPAfnzGY/gf7xvi9p9vKhGzMVbRy+s52b//KlR3S4cv2WW92wA4bPiZQ0gv7BOwkLTkHnmGHoCmpp0vrWIVuJG968dfsQLLbpwcPuRJuto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GykInT51; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GykInT51"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso2672365a12.3
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 06:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734100095; x=1734704895; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HgAV16YkdRGlFfEMnvEaWjST0Bhl3h+Wb8WzngoB54=;
        b=GykInT51SChvGiDEfeYGzIpfxjxZnSLyHN6saQXW62tSB3pMMm2Y2Xhc7LGknP+bzC
         BiBTo5GyCes6qwTWuBbzekG1bi8FWoAGKd7gGL564zQh2QMU16FTlQ5ROWLPlLh1Vi9u
         pdcO1rnWcxJ8Lk8CHe+/2m8PXgaJI1nqvNix/EEKiuGLugc+yFC/3WIH+84G6hleQkfh
         /Zcc5wH1X3FjPr23RVnt559R6Jd22E6oe+d2NlobGQBVC23HKgGtubwkNA/cM28ShEYI
         w3pOScruyWraGjM2xnhQQOK4DqQY6R9f5ybfuWjaGoSDJQb2Zqk8SfTPgxFrdttq031Z
         5NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100095; x=1734704895;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HgAV16YkdRGlFfEMnvEaWjST0Bhl3h+Wb8WzngoB54=;
        b=J+BhheGXMrKcL0Z29ee440meao2p7In1kvPWVKJjOiZ6uy31LwSdLP0YUqSqIDQByU
         vU6eS3qXgwy8CF92tJTZtBnsiahDRN8yQXiIZrtg48eTEw6U4IHz9Fnqu8T8MiVnv1Cv
         nDXzJNOlrGL4J7zOEsvsMaVSjzPfy6J3IUF30xEIQ39FqPXp4eDaUiYs9HIMhor7Ex41
         SENBKRlF2xO7/T33UiotxZumDkTvXaTEPn6FUPGXrt8QlNisTHaNU60drfDMejE8+XOp
         LXsPURx1sKKBIgqp4e9D6sgLaMISW49T2VEzIrwVy4fHqyiyWq2z9lx4npsqb10PP5D0
         e3zA==
X-Forwarded-Encrypted: i=1; AJvYcCVqlh+9rqorsFS6CVPeNQDxJNuy/06N7zAekq0pZvztDw/ztz4dImNLdoyrtzBD31Bd04hTAc94sDjBYNE736Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJXwZ3WvyKLHIf9A0vM9URJHCyAWwzGrio1C9RfraxouywbzN
	jfpZCrC+rWev8fKAOMY3OyCU42lTqHv2k4K6EDclqhYYX79tUGhG8oThbDxyz4o=
X-Gm-Gg: ASbGnctScTetC+27KTia/qifCfOHU0VG4NL5AORUr+a5TChSkYjgwBPvzoHssYGp2bx
	QSUXpEMLwnGnUKWxx3nDFKXjj4hrQ9PMYHKMBHNwAGMIfYN1dQqzVZqstCb++dbQmroZqIkD7tx
	mbl0oAgq+phgwjAsO1ak10uVb2sOx5kB6wqotBprMLFHbLHgBUqOoi0A+XWckkMe+mDv1OS/TY0
	1ZxINgo1CWJM3vGd1uh+5QL6CRmq01E2Eo4D4RyE4mJTW1/NolUFe+6hWcRKA==
X-Google-Smtp-Source: AGHT+IGJkag4RDJORMNjsRd1byODIzZaljb10SMvh4Y3I8u2YSlY83WcCmGpoYoRVmZz3xf2h0z1zQ==
X-Received: by 2002:a17:906:7944:b0:aa6:6e04:eef6 with SMTP id a640c23a62f3a-aab77f07a24mr319003966b.61.1734100095261;
        Fri, 13 Dec 2024 06:28:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6773936c8sm808925466b.85.2024.12.13.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:28:14 -0800 (PST)
Date: Fri, 13 Dec 2024 17:28:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aviad Krawczyk <aviad.krawczyk@huawei.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Zhao Chen <zhaochen6@huawei.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: hinic: Fix cleanup in create_rxqs/txqs()
Message-ID: <0cc98faf-a0ed-4565-a55b-0fa2734bc205@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a check for NULL at the start of create_txqs() and
create_rxqs() which tess if "nic_dev->txqs" is non-NULL.  The
intention is that if the device is already open and the queues
are already created then we don't create them a second time.

However, the bug is that if we have an error in the create_txqs()
then the pointer doesn't get set back to NULL.  The NULL check
at the start of the function will say that it's already open when
it's not and the device can't be used.

Set ->txqs back to NULL on cleanup on error.

Fixes: c3e79baf1b03 ("net-next/hinic: Add logical Txq and Rxq")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/huawei/hinic/hinic_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_main.c b/drivers/net/ethernet/huawei/hinic/hinic_main.c
index 890f213da8d1..ae1f523d6841 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_main.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_main.c
@@ -172,6 +172,7 @@ static int create_txqs(struct hinic_dev *nic_dev)
 	hinic_sq_dbgfs_uninit(nic_dev);
 
 	devm_kfree(&netdev->dev, nic_dev->txqs);
+	nic_dev->txqs = NULL;
 	return err;
 }
 
@@ -268,6 +269,7 @@ static int create_rxqs(struct hinic_dev *nic_dev)
 	hinic_rq_dbgfs_uninit(nic_dev);
 
 	devm_kfree(&netdev->dev, nic_dev->rxqs);
+	nic_dev->rxqs = NULL;
 	return err;
 }
 
-- 
2.45.2

