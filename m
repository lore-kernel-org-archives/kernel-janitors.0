Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qam/iOf5"
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194599B
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:57:42 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c87adce180so50703511fa.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089860; x=1701694660; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjt6k/8uh3hwCXXR7YydDVs4BIzvpxlypHixoFNvEN0=;
        b=Qam/iOf5sn2Jpz1G7HIwUCGVDKTg+tt0Anl37iGhFTkPVJnSmlWZGXli/9jseai4Vt
         Zp0C46/RQ+GauUp+cZd+gv/dg+NNrvr9Oik5Khgdq81ghhooDYs5yfYJpn9TdW06oGd2
         elwXCfCnGFWhAaNIOnjPcglk/BRv5PLErZevjQLN35MtL4ZPWx4hWBszhnGv99MDY8lC
         5FeQS3TfGu6XVYpky6fb2dFNpipj87bDxt9ZDNU9dftDziTUDltcMTAhZLtgnzDUnoe8
         2LOabckd7gI1j9hOsP4CHD9h/eTp+lsJwje0cuERWCkB0ed3FTlNmYUyei3gC2fjZ/IT
         ENvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089860; x=1701694660;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjt6k/8uh3hwCXXR7YydDVs4BIzvpxlypHixoFNvEN0=;
        b=Ww94dSLas/8si/5cuXMzKBkmwXVwBvRBJCOz3okiUxbnRVVU0WQdmJ7vouRNXhx5uZ
         qeo0uzaiDafKk8QPrEwtOv8E9UwX6tGbOilU+P6gp++AJqu6yzEDWWxxx3vmZdZa0sJ9
         IZGwqIvJ7kF3fbBagxFoqTIrYaT8AxUfjVDFhTkYnehtJlAqwI6G7e2sGD3IWlJtjeV0
         FAq8YsVP4D9GR4ZdlE9/WawZvl2/iIlugoX2sMtsTlA2iXNUZjUWXtRjEa5CbKE49KW0
         YXguHesmpNeZEuYXqC5i5bTkT4OAPek3w0Vcgudb2ExSyiVv97W7+6n7vMozaduqeskS
         7/bA==
X-Gm-Message-State: AOJu0YzZ9URAp4thkUH+BWvx6ocaHK7JEPcMfqEs3+SUgHLrE6dDxt1S
	TD7ts2m77Vdicunbhbqv1/JXnQ==
X-Google-Smtp-Source: AGHT+IH4FeHkACMbF03cjzsbK+N/epx+FNdWdYPGoXzsZlA+/Oqge/c/eDLnMpx/HFxScHtGL5JStg==
X-Received: by 2002:a2e:3207:0:b0:2c5:6cb:2e50 with SMTP id y7-20020a2e3207000000b002c506cb2e50mr7457759ljy.27.1701089860305;
        Mon, 27 Nov 2023 04:57:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e16-20020adffc50000000b00332cb561c8dsm11987442wrs.112.2023.11.27.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:57:39 -0800 (PST)
Date: Mon, 27 Nov 2023 15:57:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Julien Grall <jgrall@amazon.com>, Rahul Singh <rahul.singh@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	David Vrabel <david.vrabel@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xen/events: fix error codes in xen_bind_pirq_msi_to_irq()
Message-ID: <60028de8-a137-423d-91d8-00b2942bd73d@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error code needs to be set on these error paths.

Fixes: 5dd9ad32d775 ("xen/events: drop xen_allocate_irqs_dynamic()")
Fixes: d2ba3166f23b ("xen/events: move drivers/xen/events.c into drivers/xen/events/")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Are we going to backport these to stable?  Should I split this into two
patches?

 drivers/xen/events/events_base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index f5edb9e27e3c..aae62603b461 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1105,13 +1105,17 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 	mutex_lock(&irq_mapping_update_lock);
 
 	irq = irq_alloc_descs(-1, 0, nvec, -1);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = irq;
 		goto out;
+	}
 
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

