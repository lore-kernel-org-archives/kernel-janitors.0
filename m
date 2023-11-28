Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FC5U5L1u"
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C9B113
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 22:52:46 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3330d64958aso228520f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 22:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701154365; x=1701759165; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3sn2wORbFiaGyfRVS1oXmiOhLph+AqLJL4TzSBHvg4=;
        b=FC5U5L1uv/sdLZHRMGHoN0yHT1qiJ9ZtwUQN4ua//Y3FdGYCBMeYzDzDQ6ADOT2331
         Zys6q9wWXuEcL+1E0bjE09J/mnmyQDhWApMMwNDEcgLuC6Q0nT06qhB39YGE0kGNSCNT
         Qac9611zm9lKS8rCiRiOx5+tlB0P/ZM/+/N1NL+ereqFHJWVKXxR5Hv7EMCWaAUV2mnQ
         2j68tVKTDi+2+gTdCL0QK7RxfMwsT+JlHxVqMXnhC3fvjoBFNq9w8UJAE6SEIuaqTD8T
         GIHzYwQ0qJz7YOzQ1MJfF5kqJL+Qc8FqR8WgclznI1eASvWt5rOVBAVDbsyNxzrxoRei
         Ql4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701154365; x=1701759165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3sn2wORbFiaGyfRVS1oXmiOhLph+AqLJL4TzSBHvg4=;
        b=XWnji0zEYYhZA2Y5PgLiCyrZuqFLMO1cY9bgJdtFynSmGg/2H1k02xzM/b8NTP0Ryg
         o59h8VhsQ+xjsAFMusw+nTY0HwiIGMU+QwWwPasYHWJJUqsSqr8tTsKQslqx+zFkhw9c
         tFAPdMRPMOVtbrwLepk5Malu/p7/I+9N5sBYITErv0GV6PNQCU0Kppa4GC5o09OnvDgL
         m97OsJPWTEsR2wJ5LpUQK1/tMgK4PMdRRbHwKa4cpQTcoSpGN6XnoWBZ6lhi//J0nGPu
         U8RL7M2sVzmvjXLLPllL1P8piBkNbQslR0MKolWOiamu0Ecm2VKYZHsoIb1Ap1ZO95Ct
         hX5g==
X-Gm-Message-State: AOJu0YwFKJWmuu1XbOqwMzevrm5iiSWHVCUIzPIJePfVRuO/PFJvHqtG
	jP6REiTk5UVBcRC2sIanukj3yg==
X-Google-Smtp-Source: AGHT+IGEUaFU4MSfpauTFFCq+x4ajOfRtDJqm1oTNru0X5DPLaYXn9F6bGF0vfjzYdULiiFEc3puDg==
X-Received: by 2002:adf:fd48:0:b0:332:e9f7:9a99 with SMTP id h8-20020adffd48000000b00332e9f79a99mr9121683wrs.43.1701154365307;
        Mon, 27 Nov 2023 22:52:45 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f8-20020adff988000000b00332e75eae4asm12065652wrr.85.2023.11.27.22.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 22:52:44 -0800 (PST)
Date: Tue, 28 Nov 2023 09:52:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rahul Singh <rahul.singh@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] xen/events: fix error code in xen_bind_pirq_msi_to_irq()
Message-ID: <3b9ab040-a92e-4e35-b687-3a95890a9ace@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if xen_irq_init() fails.  currently the code returns an
uninitialized variable or zero.

Fixes: 5dd9ad32d775 ("xen/events: drop xen_allocate_irqs_dynamic()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Part of v1 was bogus.  Delete that bit.

 drivers/xen/events/events_base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index f5edb9e27e3c..b8cfea7812d6 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1110,8 +1110,10 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 
 	for (i = 0; i < nvec; i++) {
 		info = xen_irq_init(irq + i);
-		if (!info)
+		if (!info) {
+			ret = -ENOMEM;
 			goto error_irq;
+		}
 
 		irq_set_chip_and_handler_name(irq + i, &xen_pirq_chip, handle_edge_irq, name);
 
-- 
2.42.0

