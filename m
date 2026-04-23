Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107AC3DE434
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928213; cv=none; b=GthtFfgD9eeQTl7178EchMwFna92LoG2+3oc60MBd5zr2rrTms/8nyD5MuoGiDZHGqkybySqTN+7H6R+c9qHfAdF6Eks3WoUfYSP83niB7rH0sJalGG7TbAVIFoPQ9ivhdqSOGl3y87GYOKBe7TyyBBPz/YjM33O4MN3EJMvM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928213; c=relaxed/simple;
	bh=oj7GrHRmjs29INUhFGrdrkc4xKU3Ve/5HLGLk4ZEng8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7ePlt/xt1EMJbJmNQJcL0Ph36HnmGq2dvA4pxyam100bZdxCDfBNRGLWCNBleAClYyZEdSPJ07kQgqPk21jVkCFm84RXVRKTo0eFOYC1Hh6iawn6Zv4PXniOR1lU7KlYPgXfLgh0R4aSQgnVApGY5/1oiN5Eoqq79T3R6tOpt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3vwJE63; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3vwJE63"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7b23713eac9so62258497b3.2
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928211; x=1777533011; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dWClNakSEY5hBwD72lRuG1Vsfz+1unzwEOw8r3KM3M=;
        b=o3vwJE63VcRl8607IWjHCig74eV9NngfB9E1KGFeg3noDTAdL//rrbLtDfOZKpRd4U
         XuLlBP03ak6w1IAz2emC/OcYL5kiQ7njdPzZDV8M3Yzd4BmxeRGxtw0vLVz3TcOhimnr
         5LRMZht3UtxZh2a1xujmEb/UP6lEKjizG+E3xMUXEh8AKlOA403bmBpAc8rC1ePeuUgK
         wxnxxWMrIW+pH76QWGo4jZUVF6cmEygdEcXOtvs6EaNQGCW8xZLxaBBwW2+IKFU40mmW
         TJTJXtAd+rdYbIreUYr7peyEsswNEQnziExE+XkZhwGdM5EW/OkDgBTsGNmsbMQmcIgm
         rV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928211; x=1777533011;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dWClNakSEY5hBwD72lRuG1Vsfz+1unzwEOw8r3KM3M=;
        b=tE2kOUpfR9kbbJndpw8bPYDbNDUOV1R6uM4g5sbQbTT0ce1kxhzCHwg30CdUIcHTOp
         c6AAx+lfHeFlh/uh3YLW+N8NUrYGni1bNkeR6IxPN5IOqpGtYrrOe+NLkno+kWXIREiQ
         DBVDsyR6eerpMVGdVDZRddSp1Izj0DRjY+Zpn3vlv3iX1MytrHPQ0MfIobKI9eC6gvyE
         cn84noj4Bpv6VfDbCwq1/qkvx9iV+/ydV3keMMxcpR5mW0JYGPeUs7oWS4tC+4eoAyPm
         g1cGbinvtOfTEKqNkSLKlvUEAeSZGc2NRHYKXdIB72OMW20ZvOsgOOuqvjlUBznGysHp
         GDsw==
X-Forwarded-Encrypted: i=1; AFNElJ8a4ck5e7RLEmiiGQ8aBgPRLP3MieilYl8kIHeSPMaJ7wzYjWFoxi/kRYJAyx7xCd6EkdFxjpfzlVPKJ1R9MDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/zMzrkWrQTcfu46AHlnQSIN4iSHL73JYLKZh42BhPy+8NwKf
	RjW535c1L3r/876u3dE3w5XyGkvnJOjn4poKiDLeiDYQqDppyV0bTthI
X-Gm-Gg: AeBDiesmKZLXoDSB26GRR/ATCxXpFOvlX0xtrTt4mp7MF3vRuF/hVzZewEqBko3xRST
	FULyP10NT97LxDVeVwlsWF+TcgfRpIficbW678D6TLw/2HiRxMo+J4/3y22KC0TddPbPfaVEYgN
	EC24J4kZofakS/+AeIpqyFBhEqeMgcN5E05kNr1dY2wbzzjmpRux+H2erHkraIw7NlHYWkdJ1Xn
	NH92djIfmP+9GT7r468trUCT3Ht8pyIEg3bnfh8udAe6pg/q2ENI1PHtNiDnNGPuahBSCxa7Nra
	entRmrsba12l0RllyzzGJCr4G4kugXoXdOU1VYu/sLlf3uijoBYH06z1oT4BJAahRhnSXHFgMc5
	CzIklImkmwKN55GGSKrAnr6MCEzbHix1pAut7XxNHKa8VII2dponOaqy8wkkRK4y2Bib/3t0Td7
	ipE3vtXOepyg3vtNqSpkjfMvNvBps7WpBvpC2oQJs=
X-Received: by 2002:a05:690c:1e:b0:7b3:401f:2e45 with SMTP id 00721157ae682-7b9ecffdf2bmr300566197b3.44.1776928210850;
        Thu, 23 Apr 2026 00:10:10 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm80530277b3.14.2026.04.23.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:10:09 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:10:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Even Xu <even.xu@intel.com>
Cc: Xinpeng Sun <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: intel-thc-hid: Intel-quickspi: Fix some error codes
Message-ID: <aenFyk36rTnrD9s3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If we have a partial read that is supposed to be treated as failure but
in this code we forgot to set the error code.  Return -EINVAL.

Fixes: 9d8d51735a3a ("HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
index 16f780bc879b..cb19057f1191 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
@@ -94,7 +94,7 @@ static int quickspi_get_device_descriptor(struct quickspi_device *qsdev)
 		dev_err_once(qsdev->dev, "Read DEVICE_DESCRIPTOR failed, ret = %d\n", ret);
 		dev_err_once(qsdev->dev, "DEVICE_DESCRIPTOR expected len = %u, actual read = %u\n",
 			     input_len, read_len);
-		return ret;
+		return ret ?: -EINVAL;
 	}
 
 	input_rep_type = ((struct input_report_body_header *)read_buf)->input_report_type;
@@ -318,7 +318,7 @@ int reset_tic(struct quickspi_device *qsdev)
 		dev_err_once(qsdev->dev, "Read RESET_RESPONSE body failed, ret = %d\n", ret);
 		dev_err_once(qsdev->dev, "RESET_RESPONSE body expected len = %u, actual = %u\n",
 			     read_len, actual_read_len);
-		return ret;
+		return ret ?: -EINVAL;
 	}
 
 	input_rep_type = FIELD_GET(HIDSPI_IN_REP_BDY_HDR_REP_TYPE, reset_response);
-- 
2.53.0

