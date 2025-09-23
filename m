Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04242A80
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626359; cv=none; b=osRi0uhG2NLjBwzjmrbG4yDrGs/FUQgZthhq7VLjJy+TGcVppGSzyFP4AWzYwmoLBPeL97tkb2b8YjSGmlXtTcjcnNEB5EMxAJSP6WNM2c2N92+5rfZuF3pj03JiLMznWW8aALHwR820AwWJAnQup/O2qMPDr4+8qf50GbgdZzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626359; c=relaxed/simple;
	bh=FhrQh8wlJhkiGsJ13lu3sPHpZl+KsdORpiUvpf3eogg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vch1pmEiyTXg/l42rM3/u2INyjccPt2QxfUuh31sSe39wYaXfiG85OJQ25+9bcHdXEX+7AcY+M7qpCgOAPrBnTO+3K/CdRIEpHsp59fIW5hh+OC1x0hX5Oti0DxJeC7WqKAWBg4KuE6TFBtw7IEGamtR/jFppoO8NH/sLwSw+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D37FU1jK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D37FU1jK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f1153f4254so1790977f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626356; x=1759231156; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vLuVuYkRxMOaPm/QX7PGxaAYbQhLbxbW+ekIalkme8=;
        b=D37FU1jKSGczue9Dgn4zjh9Q/9VOAh+Yxhv0mQl+5nKSGCDiXZGY3pGN4lWAI7UK+K
         Sr3m8eynRP4a1FkciFF9zEdU7/0a/CSr/F/zJXyewRCuD+KRCdsshMRGIbppC1JiklEU
         i7gokirPy7078/H9d1e8jgklpRF3/NWc2xfPDSMUAT3kQzMpnQAiMPR59f1BS11i2EFW
         L2xv5ldWrCMIdDNTg6lFyBIc/HcTjXomjswdeA0ENkpgQmwCyF6nNq2RUDaxXa/Z7ntJ
         i7qeX4ioCj5dFUh6oPzktQjEn+3HFg+DoAdoqewsIrGAuCWKqUMb0lSkZIfQV92btOo3
         h+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626356; x=1759231156;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vLuVuYkRxMOaPm/QX7PGxaAYbQhLbxbW+ekIalkme8=;
        b=R5pWhBbLSTltakNkj4ElR8v+3fezCqnkdl2VSCrX3Rd6gfRkd8KOhy9DxDJpH9PFx7
         FwRH9EeQGtdu7rSGxZxyyZyn0qw1EWVmLD8VKlWz+j5V7SfmteqmXB8nBvR2CYFcWUhE
         CqxFfRzmrl6qsTQ0GEfuZ4VyuR7IPwX/DfO1xofSijarENPvL3/x70GkUacmMDc1pRGP
         XZTuxtqSVlOstrB9h9bf7V4Z8ePCNdZTP+gg6o88fDXTnlXQ6FUMRq5e//r0xVm2f6B1
         5zcjJ3a8oUmrilPnF9AfcOLeYpQ2Rehnj/jF0mzdsmGPisOVywRLryj541aNhR5lD0o2
         YZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCVAtNQL2qjDoIsysP72YDEz1/3/2+hngcDVEQdGlLKzMv3xBpEVRlw2X6JJ3eiJeolP9fkJ0ecQihLnbEauvig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1VHDU9wcDgzfkseut2SkiLw7gRzPPPuFZ91t6HRY3edTD34Z
	ZDyzY9Z58ZrnOMxVvpqGMkmMxNKUmBZjc6IMB3ZIYBQkf7pXiYFFnl7rkWrTrbtkdfA=
X-Gm-Gg: ASbGncuQPqb3ZOBADpee6UdL3xq7uUWhwseg4pdtESai5gDSwHiWBkYk4Pp1vMtwyY/
	rL8kOMdYKDDTVm58U+Ql0av0rTyNtiu3rYy6MGyq20W+kr5JX85oJQx6hjtlLOsfoORqiNOtzb9
	vps/ClByPmDhWrVaqMhMtbX1l0bo8ZQWEeK3M1477ixX2xOIgDZcNWst0D1RH1smcBvdAHD11dP
	6iifre42siVNW4Ir6kFayE/BynqwnjFkhZ0vf6Wqo+jEUEa+9DgHAV6HW0PSHJuBS6nIAtdyozB
	G0dEYaerEJD9CRiErHYalz3AUR3jtNwqXC9zp7mvhn9glVIcQlTML0vdSV9XPIE0EYWBcbkcbwM
	Z7ZCpEhhxo05+BOVeOlNFDgrPG2LF
X-Google-Smtp-Source: AGHT+IESbMFQk6ILiLYUPMLicqqy9m7l+w2rx4L3CO/8J2ovvY0DfEOMfixD2agK3xBqmlyogy/9iQ==
X-Received: by 2002:a05:6000:25c1:b0:3ee:15b4:846c with SMTP id ffacd0b85a97d-405c5ccd2bdmr1761131f8f.28.1758626355940;
        Tue, 23 Sep 2025 04:19:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee073f53c4sm24050430f8f.3.2025.09.23.04.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:19:15 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:19:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Subbaraya Sundeep <sbhatta@marvell.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] octeontx2-pf: Fix potential use after free in
 otx2_tc_add_flow()
Message-ID: <aNKCL1jKwK8GRJHh@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code calls kfree_rcu(new_node, rcu) and then dereferences "new_node"
and then dereferences it on the next line.  Two lines later, we take
a mutex so I don't think this is an RCU safe region.  Re-order it to do
the dereferences before queuing up the free.

Fixes: 68fbff68dbea ("octeontx2-pf: Add police action for TC flower")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
index 5f80b23c5335..26a08d2cfbb1 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
@@ -1326,7 +1326,6 @@ static int otx2_tc_add_flow(struct otx2_nic *nic,
 
 free_leaf:
 	otx2_tc_del_from_flow_list(flow_cfg, new_node);
-	kfree_rcu(new_node, rcu);
 	if (new_node->is_act_police) {
 		mutex_lock(&nic->mbox.lock);
 
@@ -1346,6 +1345,7 @@ static int otx2_tc_add_flow(struct otx2_nic *nic,
 
 		mutex_unlock(&nic->mbox.lock);
 	}
+	kfree_rcu(new_node, rcu);
 
 	return rc;
 }
-- 
2.51.0

