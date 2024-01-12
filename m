Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1EA32C62
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 06:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrjQh1wM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33765009941so4825657f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jan 2024 22:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705042588; x=1705647388; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9prXoTbAmkoR0CZO9d0SNqMhaDHqa31k4/WzflBN+f4=;
        b=IrjQh1wMctaMiqlMKDXXjr2CzSqAu3HFdYdyugt2MgNsDOmB0LNVorGBlYIFtLHqP5
         UD+lib05Tcym45i+C6gOKXF7WYMiZGQJVOAp0zzh+hnEb1O5Oo5O/KZW6CF8y4LYDmH5
         5M8xjEPAtIysW4FxEk/jQ2QKRXCcj26NxNX44hsuxzt6lgnc5SIbsnBvi1aUGWCDaTAx
         IEvGwEHyYCoF4uGpln/xlvy4BmkF6UbOrr+mky2xjaa0KDY9fOL6wTN6uWsNybXXPlI/
         A6aT8o9hihZzds2B3MfbMiIvn8P0/iQisYnaU+7Gsnmjcgr84GRiWR6lap0P4GDn+i+3
         4Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705042588; x=1705647388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9prXoTbAmkoR0CZO9d0SNqMhaDHqa31k4/WzflBN+f4=;
        b=CjPOhksmTkCUqhQfrJ6ANbN8tGnPuleKFlAIrZ8B2moayk3DmTSHJlDv+WTfPyG8F7
         JyLRmipYsq2vLpx7UQd21U10RurptISvF2q8WOhPaYUcla4HruuEhR+ejOL1/iXon6lC
         B6IWhay9ufuwv/MdMG5VA010EbHk5SNPMIyeqVGuAibrE/PG5reFCUx7O6dMpfbUsF5O
         wLrhsCL0w0P5U1AjDibMKYefEzGxP8qxPLANCHhlwBN5+O4ElGzH+z72W7/M9MYVQWpL
         bqaK16PqUcPEnz3qRDBBzotL6kXSr2X4M4cy7q1VtuWVnm1zhjM+Z9jwTzeLmGZkE0d5
         7zXQ==
X-Gm-Message-State: AOJu0Yw7pfrTFr3Ugqj5WFrV28F4fO34/lqitLkw+V9GlBijbfz+ZHuD
	BWcwZFvkzv/NUxbv9Gugecnia6h7SkVUvQ==
X-Google-Smtp-Source: AGHT+IH6gsHGVIynSC4gedvLtDCTO7G8G5VIZut2PGL0yCvFoPazVS5ii5HisQkORg+7Nmq9Qnuw5Q==
X-Received: by 2002:a05:6000:141:b0:337:404b:1d67 with SMTP id r1-20020a056000014100b00337404b1d67mr447985wrx.69.1705042588682;
        Thu, 11 Jan 2024 22:56:28 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id a7-20020adff7c7000000b0033660f75d08sm2983461wrq.116.2024.01.11.22.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 22:56:28 -0800 (PST)
Date: Fri, 12 Jan 2024 09:56:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>, Henry Shi <henryshi2018@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] platform/x86: silicom-platform: clean up a check
Message-ID: <a58bffb7-0a8b-4195-b273-f65a188ace7b@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error message in this code can't be reached because value is either
zero or non-zero.  There isn't a third option.  Really, it's nicer to
write this as a one liner.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/silicom-platform.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
index 6ce43ccb3112..c0910af16a3a 100644
--- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -256,12 +256,7 @@ static void silicom_gpio_set(struct gpio_chip *gc,
 	if (direction == GPIO_LINE_DIRECTION_IN)
 		return;
 
-	if (value)
-		silicom_mec_port_set(channel, 0);
-	else if (value == 0)
-		silicom_mec_port_set(channel, 1);
-	else
-		pr_err("Wrong argument value: %d\n", value);
+	silicom_mec_port_set(channel, !value);
 }
 
 static int silicom_gpio_direction_output(struct gpio_chip *gc,
-- 
2.43.0

