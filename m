Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63282286401
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Jun 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200894; cv=none; b=mYDc28Uh3gXAuzrH7nt4HhR53U2+nolsFbuyVnuCDsy8y0+qRHrEieC08m3ygOFhiH8aSMLZ312AqTuaklZ9ZBfa8ArmvKU2H1lIe4ff4NogBv4A3nKqJTxpgHLgIqnd5tUPGNA1GS+UBhWrO8MFBVsfEtrsGhkWa37ygaOX+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200894; c=relaxed/simple;
	bh=ZFnM3PDhFbSJjWsyk0zkU5H5rASBj60HHgmc53ZHy8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRDWcdDzLbFqWQnrXUa2k59Qy7gqdfEnArquFVe7FnOyCA6ciaCt29PLn+ss1svYPvDtMPSqBlntcHIpf5GEmRXlo1DYES/UCiIzRX6GskN5vsGUw3Rz7p6mSlBOrkfNaMc4XykbfvrgyPQXya2op06NfoU89ljedBqUHBWvDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEESVUea; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEESVUea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749200890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=;
	b=hEESVUeaznH0JxUOK+TKxspAkTxbnqyAS0j5WVhE+1A2OpMhECei2lwVSGSDfJwuYsYjIg
	d9lFNwiYGzYu2dD8itVrqTu0GgSFgcIqu+MdP3BQez8dl9uAT4XS1URimP3IjUw1pW8bCY
	r5H/e60QwPUpJtBRKuSdMlJUso3JoZI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-b3wYfhcoPT61873vvEqBtQ-1; Fri, 06 Jun 2025 05:08:09 -0400
X-MC-Unique: b3wYfhcoPT61873vvEqBtQ-1
X-Mimecast-MFC-AGG-ID: b3wYfhcoPT61873vvEqBtQ_1749200888
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450cb8ff0c6so8787215e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Jun 2025 02:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200888; x=1749805688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=;
        b=WWqgQIY7zvziXQJ7VIfB0d6dHToa//+qnhZVbWjsp2L6W9d9i0lRC2pY/KJ6Hy/3H5
         e/xX7kNzR+UURF3FQsnOWBb0itdPViYRyALLTsDWDafgoRKmvZUsBupxjZvE+PktMYub
         l0QwbOVFEJKZW5o+SBndqjG55GoDCz3bPAs2RkfjRLBFiO00SMfr4WEYf4M5eaf9hi5l
         8/dkhh+U67wrKptHiaaiNBuOk9bxLLUWQJy6z8BQDtL/hCMNwM8cZFCWkXDkpH3Ni5oV
         6sc5xbnanx3XhQgnrFkp7Gfp44U0mbr70R8S6OEuxeWlGX80w8BHgqe01GqVtmm/kClF
         pb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfr5VwopK83eC4E/UDlaqFQfaPg42KK+4hcbPc9dvfuR/0tQEVKhdH980UjTksi59+GAOAgTZDkV+VfYkm4GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXTjSg3uPk7JbSI9mpHfITphbNmxyNaUzMjjZ5Y9v0IRmtw9i
	gsWSSMAGu3xkvuzwKpCb1+UDkuVr/yhRTzrVVsYmh3idt2qB1wCp2oopxSia/o45hAxGYtb4Zwe
	UWsvVlU/7fUb8XwxDVCzZXo9+huIfDi3yHm0D97rIhD0qIFmUzSuyyJgw//g9rJ3h5cODNw==
X-Gm-Gg: ASbGncuApt3cRCgOaesjYrSeTXPQQrWogvYDQXckF9UT87qNo4MZjRd4YKiOWoZgXuo
	5DXwvfGvXhJ2/yCAvLmA29nwKTc3BYl+sG/7otR2aJtEtuvcX4v+QxW2CxwFLh8FPWRB2UdbOLy
	dAD0v0bZhBRrIrjKLtUik+1xoBX9VCfTDeEcxQH6GDr5RP1QFPxCQUA3GOVdkXN44xR1vSgP1cO
	ZNWs9hOMqRpnNbmEZX0zO/ejZJE2XfclGvq03WUQhvT9z9yRYBgfajz9CVMDy9Ss9rVoAbHA+Yp
	/v4GfCTJysOX5DW8y7Tz7VMLUe0kclGo6sIuRoKttm6mbV0omALWzWp1bB6aMS9znFJW
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877505e9.27.1749200887748;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFgCfJhv5D4WKiJLVPtf7WFxx5mFScPGVIDDWdSB4TB7uCI+iacBtSoT4d2UV7tlwIeLe0gg==
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877175e9.27.1749200887316;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137290b9sm17000835e9.34.2025.06.06.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:08:06 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
Date: Fri,  6 Jun 2025 11:08:02 +0200
Message-ID: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

There is no need to introduce the boolean power_on to select the constant
value for state. Simply pass the value for state as argument. Just remove
this code clutter.

No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 2a213c218126..8fe1c0a501c9 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -22,27 +22,21 @@ struct scmi_pm_domain {
 
 #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
 
-static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
+static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
 {
-	u32 state;
 	struct scmi_pm_domain *pd = to_scmi_pd(domain);
 
-	if (power_on)
-		state = SCMI_POWER_STATE_GENERIC_ON;
-	else
-		state = SCMI_POWER_STATE_GENERIC_OFF;
-
 	return power_ops->state_set(pd->ph, pd->domain, state);
 }
 
 static int scmi_pd_power_on(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, true);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
 }
 
 static int scmi_pd_power_off(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, false);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
 }
 
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
-- 
2.49.0

