Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC92BE629
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755064289; cv=none; b=E39G+MUqxZIwuzkUhwMg7GwAKW5wByNaKY/TVd6dWazRNRryBxhER4w7nf24S4jdItHRkNJxLw6MNpQwNZ7tCp19Y+j9+1OJkMBZbxx12fiXXD2fZd96kQyx1+j+ATU3vEIsVeMKngcXVDpkF4/PFASPcdpxPlLWKn599H+KZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755064289; c=relaxed/simple;
	bh=lRxuv0qt4ISYZ4d5L7KaHZ2U9/6/GI12h89YfeucWLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBiNmNMDjA63dfDJmMsUal9Ct+XM73qbfECsOjOwK7hhYgWfaHa21URR8VDb0c5ZbFqD+ZPoZYSBuQUqxvFvr1mMG8lAVXnYASo+RE6D9rrd8vzFeB5+Mk3f0y1CkYmvMcp6ePfs1M93mIQmGGE0OcsZE+wbleZkoVa2F4bbVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GiDz8xCV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GiDz8xCV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b790dbb112so3780965f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 22:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755064286; x=1755669086; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrOyWBFP21dohGWxqS5PR6ISwURTsFLfxT85phMfX+M=;
        b=GiDz8xCVMi8EzbvXUojwrgp6kG6UCDdTvwMHFpQSsLJz/56aL0JGV0SVL5+89HndKb
         Z+TISc/MK81S0vzzd23LBvIvnvss5KtFOb5CrG/C2KvfRQn7vHDXScw9SItB5n009SEI
         s7/8hTNvvjhu59BM1+U8d2YbxJDIai6fPcReKFBtLeSR0Lt3sHrffDciq2PeMlqDXLIO
         kKW4stgiBU1YO2jxAs3EzXmHj9kO381dJotJOMz7zwYlyrYbTFlbS+W/n/B8dVUWhlRI
         iZZC/BFtGtEe+gpdLF7/+b34NaQK+2U5/YmzF0wSFYMNF/E51YsnrKiPOxIg7G/tOsld
         fmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755064286; x=1755669086;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrOyWBFP21dohGWxqS5PR6ISwURTsFLfxT85phMfX+M=;
        b=U4iOjmztBpMzeGgPhlBtyrk0n4MVLYFfeNAuovuyhPAE4HYTGSYpj5j0CgGKQ38H18
         b0g+/t6Ff/BYsXgnyNvOkjCh4UdXCfe3H70czcqIcY61y88nIDcDtS1pH8xtFsIeyLOO
         IgG9Gwt7LQ4gcYnC4ey7KQe1KvUH5SBoMShc7/SX51hMrQKt9vKWTyikaU9sbkJineuI
         oXRnKC9SIX95ND09Und8WNDpQDDVorllrkK+Qwp0wwvdVsSZQsI6OUyI0rBMt14H1LBU
         s+HgJ7daEPZ3v7Wt6rr3e4ztFiV4IRtGnltKX3exY/uuP2xivUGw0q679IfzJqxis7Ft
         MH8g==
X-Forwarded-Encrypted: i=1; AJvYcCUUwd0BQQWg9h+RM+SFEzZPMyU5BefqoARtnoantGtcFTQ3SQfTmUwy9Zn+YechFLLEi3JyEEr8W9POiKU/ehQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZmIOILad0OzRKuSOts9z/VFIb4E8lF3oVoeyBzuDKCXgysWSb
	t7DAhSHPWCIep9B6OFSyRN5kNNHRsWs5EtR88yaS9Snc0HeAMqA/FMhGuOB/68hIrkM=
X-Gm-Gg: ASbGncu0aL6Am81cpt8rNfNZS0+Boj2IxKnbQ5C2j5OqzB+bySLOFLI4y7b7mmiCscZ
	MNNxpOdLSzdZ/RYyI5/DmqDzPovwpMfxEu8KOJCybpTpvNyeUlXqsOTHvKIEftcoDXFfZmC9kN7
	JxzY6xDGRu29dxvnhOtqwjNNQcAqxbghJ9uomZ2MW6yW/Zvd+A9JTT68wcuiKnIwfA0BMoUNz7/
	+caTU3Pm5EPB/bLo/Gw6uQi5nf2TUHnnmlo70MgUikBl63HzNkZFbBtoeAPSuJ+qG1LjxTa1zYH
	h+pj/SljIyMZRih0dPWSuiAiQ/kIB1gm2IpbZi4pZG9AlIudz5ZbK0uMks+8q+70DwMTIrHsQJS
	m/ETBdnNwCYts7JzZtsGP/qoEWy0=
X-Google-Smtp-Source: AGHT+IFcKTFkpLXaLpQ8IyxiEG4h8H2fKINbMz/aPudLtlvebYChChfIWNlq56NuIvASiyNpkDoFVA==
X-Received: by 2002:a05:6000:4282:b0:3b9:15d7:8fd3 with SMTP id ffacd0b85a97d-3b917e37cf7mr963552f8f.16.1755064286473;
        Tue, 12 Aug 2025 22:51:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8e0bfc79fsm35965508f8f.56.2025.08.12.22.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:51:26 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:51:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Poeschel <poeschel@lemonage.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Aleksandr Mishin <amishin@t-argos.ru>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] nfc: pn533: Delete an unnecessary check
Message-ID: <aJwn2ox5g9WsD2Vx@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "rc" variable is set like this:

	if (IS_ERR(resp)) {
		rc = PTR_ERR(resp);

We know that "rc" is negative so there is no need to check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/nfc/pn533/pn533.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 14661249c690..2b043a9f9533 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1412,11 +1412,9 @@ static int pn533_autopoll_complete(struct pn533 *dev, void *arg,
 			if (dev->poll_mod_count != 0)
 				return rc;
 			goto stop_poll;
-		} else if (rc < 0) {
-			nfc_err(dev->dev,
-				"Error %d when running autopoll\n", rc);
-			goto stop_poll;
 		}
+		nfc_err(dev->dev, "Error %d when running autopoll\n", rc);
+		goto stop_poll;
 	}
 
 	nbtg = resp->data[0];
@@ -1505,11 +1503,9 @@ static int pn533_poll_complete(struct pn533 *dev, void *arg,
 			if (dev->poll_mod_count != 0)
 				return rc;
 			goto stop_poll;
-		} else if (rc < 0) {
-			nfc_err(dev->dev,
-				"Error %d when running poll\n", rc);
-			goto stop_poll;
 		}
+		nfc_err(dev->dev, "Error %d when running poll\n", rc);
+		goto stop_poll;
 	}
 
 	cur_mod = dev->poll_mod_active[dev->poll_mod_curr];
-- 
2.47.2

