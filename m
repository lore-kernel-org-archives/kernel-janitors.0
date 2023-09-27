Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AD1E810DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjI0Mhe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjI0Mhd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:37:33 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165F0C0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:37:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so101352195e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818250; x=1696423050; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSvSjPBwBbpaP5Mr40QQhbIUu3AL4PWGVIl5zKwP4Ko=;
        b=vqSN7EoAlxbuq316KtnPtrkiBXOGVi80pIVPzAvZgfQJ69/fF/dWZD0qPZUw8XkTg6
         Q2DwZuQPN5gObvrPR04Xf9xuHoexcQkjBjlEe958czpDUNFmxgzjlJwRu7DByWljJA59
         TZy9HdPGoa5Ek//1VeQlbiUwPyuNTw9XysqMIiwmc4HKZDCd8qMG6otb4I4y2MrvAdpZ
         JgkIOq9GODyhXxql8z4tIkrYvxprPU8Q9c3/NTGK+Th6bZAm+FqSMFtg7UmlIWMa5Hpz
         6fPMt4RFYIJgKTI4JdKTOXmO2qIwvmX/pj2j/YmzI4mqsjWo1tc4MbxkkJ344QmFyQGy
         I0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818250; x=1696423050;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSvSjPBwBbpaP5Mr40QQhbIUu3AL4PWGVIl5zKwP4Ko=;
        b=Kcs+dh+rU2G9vxXq7lQC/rTTL2rqxqqJwhUlMIl6U5oy6AQ9EyGaGEXgj+sA3oRbGR
         V9kZuica6y1zkNKjlZwRdJnwcbPOqY4H9vlpDXiLKSUsqUqTZalfr7Lt0EuyIrR+mir+
         DVR54Dmwyn+zRSnNkm9ruEEiObQQRY3RUPmfKBzFTJpAIxrHqtiqsnhvc4bCI6w+9zVz
         aQk97lBv22Gw6QG+ohm70GjlVcFyaRaoBsc6GW+7ZBqXeUf5RZKADL3AySn0oqr4wBGN
         X9ddXkdOjS6ab9yaTYhh6UyZxz7ePcjc49yTXJmYSmT6YDTtfcNaHLweQ1+Cr1Ae2xeC
         9kvA==
X-Gm-Message-State: AOJu0Yz57IntxQvrRWvpc+nVRitt6CSHOf07vJoccm0uJiW02zTqRuvf
        WNjpPgnlAKLoZ/BFRdUXgeLfmw==
X-Google-Smtp-Source: AGHT+IGMNwZeZVMjHYbbFlIN0HffM3gIJdpZbL37AcIUk1gPy81JzbFuqU5EaISKNrPJieFYqvUpNQ==
X-Received: by 2002:a05:600c:2308:b0:401:bd2e:49fc with SMTP id 8-20020a05600c230800b00401bd2e49fcmr1921153wmo.24.1695818250434;
        Wed, 27 Sep 2023 05:37:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d49d0000000b0031c5b380291sm17074203wrs.110.2023.09.27.05.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:37:30 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:37:26 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ACPI: thermal: Fix a small leak in acpi_thermal_add()
Message-ID: <37eb30ba-1dc9-42e7-a22e-af44f6270e67@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Free "tz" if the "trip" allocation fails.

Fixes: 5fc2189f9335 ("ACPI: thermal: Create and populate trip points table earlier")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/acpi/thermal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 10720a038846..f8a95939c88d 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -928,8 +928,10 @@ static int acpi_thermal_add(struct acpi_device *device)
 	acpi_thermal_guess_offset(tz, crit_temp);
 
 	trip = kcalloc(trip_count, sizeof(*trip), GFP_KERNEL);
-	if (!trip)
-		return -ENOMEM;
+	if (!trip) {
+		result = -ENOMEM;
+		goto free_memory;
+	}
 
 	tz->trip_table = trip;
 
-- 
2.39.2

