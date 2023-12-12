Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bcXT1ZyN"
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F72B11D
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Dec 2023 01:20:33 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c671acd2eso7201991a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Dec 2023 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702372832; x=1702977632; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7/FCALzJMBC/rKEcJ3A2AOybQwAx21cZLAPfuxjI6U=;
        b=bcXT1ZyNsRHuSJ/Z5ybzzkK1GK1fqAjvw9qONP+OvUhUH2rWkmQ1vAHFHqgMj8B4N6
         Dfl3yeNt9QoqEgQggg5XVhGx0GiCk4rRY/3t8T9NnKuYsYZ84M0ex8YBt5DbFr2bzCbr
         udqXVy/Dw3YRz3qwL48ZddBBR5mAqx/cipZ0tFcqmyiSi8gD8dqwYw0SswBGKZfE9Mak
         KqOzj6zXOpwMz/UKt1Js9r72/NEf5C/MJU6E6G2UmLw9W/wQsJEoueDNU1VawueeYs8v
         S0ZGo02hwtOGpvR2VY71W0hwjEcD9nqHT6uAbdHc4s09NmlwYu1U8V424mDNSgm900JT
         n1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372832; x=1702977632;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7/FCALzJMBC/rKEcJ3A2AOybQwAx21cZLAPfuxjI6U=;
        b=Q8El8Wd8JcX1jEWNLj/YnXPYyfKQc4cpgX6MasGBtC+fGK4xbozYBqzT5uDLQ6xhmq
         yrICIrMSpOoROQinWXqyAt7BJXnabUIqKYfjB+VmlXKDDrKexPC2lv0OT/KxjZZdnHOA
         1RuBlhddrUbgdv6KOmNSPqX6PbGQ/ILc7QtR7/E6ziTbybPhCskmrpxm3iSDaP7/z3pj
         SRy0HF7COLvkyjlMhDvdXg9Eklv4nk+v7c9Njv7m00Ue+3NzAoVrRL5X3rZSoO0ZyuSV
         M39qP9knCdmX5PHo3FAF7zK4s2khRiTElMI1X3Bc5IwjdiIUWzu0iciYSSIOzLnAXC3Q
         Kmvw==
X-Gm-Message-State: AOJu0Yw0yjiJXI7bOFWuxzDOY1UqamUC0fKRbAyaREyIQy5qbUr1ipIU
	MaDuBASD149KebSCDD0gyvN+YA==
X-Google-Smtp-Source: AGHT+IFviJpWOCS2ssWh7zDgND69LD8jG/YfNIrMpCFmrBkCDDGz77dPhXaS+p3xsgkjLM3lofoN/w==
X-Received: by 2002:a50:85ca:0:b0:551:14c0:7325 with SMTP id q10-20020a5085ca000000b0055114c07325mr1998415edh.40.1702372831751;
        Tue, 12 Dec 2023 01:20:31 -0800 (PST)
Received: from localhost (h3220.n1.ips.mtn.co.ug. [41.210.178.32])
        by smtp.gmail.com with ESMTPSA id h28-20020a056402095c00b0054c21d1fda7sm4525402edz.1.2023.12.12.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:20:31 -0800 (PST)
Date: Tue, 12 Dec 2023 12:20:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhijit Gangurde <abhijit.gangurde@amd.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cdx: Unlock on error path in rescan_store()
Message-ID: <8c79956b-bf8c-4511-97cc-a16833a0630f@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We added locking to this function but these two error paths were
accidentally overlooked.

Fixes: f0af81683466 ("cdx: Introduce lock to protect controller ops")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cdx/cdx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index d84d153078d7..f4f9f0c88c09 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -572,12 +572,16 @@ static ssize_t rescan_store(const struct bus_type *bus,
 
 	/* Rescan all the devices */
 	for_each_compatible_node(np, NULL, compat_node_name) {
-		if (!np)
-			return -EINVAL;
+		if (!np) {
+			count = -EINVAL;
+			goto unlock;
+		}
 
 		pd = of_find_device_by_node(np);
-		if (!pd)
-			return -EINVAL;
+		if (!pd) {
+			count = -EINVAL;
+			goto unlock;
+		}
 
 		cdx = platform_get_drvdata(pd);
 		if (cdx && cdx->controller_registered && cdx->ops->scan)
@@ -585,7 +589,7 @@ static ssize_t rescan_store(const struct bus_type *bus,
 
 		put_device(&pd->dev);
 	}
-
+unlock:
 	mutex_unlock(&cdx_controller_lock);
 
 	return count;
-- 
2.42.0

