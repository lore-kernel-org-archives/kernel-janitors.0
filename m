Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUGcXBq4"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDA41BE
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:56:38 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b40423df8so11970405e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089796; x=1701694596; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIYOB2eU2H+bluz3T89WDZtEixLUpIjEWJSjNBKPfQM=;
        b=rUGcXBq4iWK8F4iT3UXDeOE+1d7jzILvB4lK63tR0pE5q/4YF+ZjKUujXhzk+WzjKv
         idBY7rjdQOprsQMkXwkwcGvCHWTrJk12RcyMKWQckCJge8Gqdj+66rRR9nOm7cHSCTA+
         6tx4tMguBvzBS/x8dHKppM/e7AJ0Vgl9zJp+V/kVhgQ8icgshehTgYrztwG+GLjKhYFp
         pBy9fzYeDf5VgLcHyBF4y5s8aJlPXib5RcX327uwNDiIlnMJGrnDFkBrFnTkNrXG9isd
         b2eneETAf5NvesTrJFcfXfeV4TMzR5Eku2lTNEWrba7UhA55nu+oG3I4KXipafw+7Mga
         Jigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089796; x=1701694596;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIYOB2eU2H+bluz3T89WDZtEixLUpIjEWJSjNBKPfQM=;
        b=tTjZIEDdPpciJLAIm39+6KeQW1lD+NADnD+mSFrA56ekc+MGXdX1dg8+dgf7q7j2cJ
         e6edaFissvcEsTyqDkY+oZ8cTBaCpF+8xoSTYqxsanMx3hjG0OoKdhY1Ynty62aRb9ZB
         gHubdgwK//6Hi/Ea94L5DQ6b0PdYvBKrCc5VusaqNnOjumwBQXCj5tmwbEjt09z3IjPY
         66FcIxcrQ/Z2CFgkV49zB9x1ZUxbckZejwcEiYX3Fr7TR0TKlOsVU73Ob5Ixxb9FKi7K
         KNz4dSJ5/lnqlNcbrm80TMcbtXiCJm2li80NUC5JR5cDGE9GdkTYxt5AHvilWIhLZXT2
         bmgw==
X-Gm-Message-State: AOJu0YxYbdCQpwSGpvtRo2u3h23kUZh/QsP0qO1XHtNmQ0AXHujd0teX
	DHJ6zfWveOTu6qtZ+Ld/2DpwKw==
X-Google-Smtp-Source: AGHT+IFPPTGfLzqzJNgYs1IpQL1hsJuI8oapdRcXNEpwBLbJewMCagBAP3dI7Z2zilUHv4TqflpLPA==
X-Received: by 2002:a05:600c:45cf:b0:3f6:58ad:ed85 with SMTP id s15-20020a05600c45cf00b003f658aded85mr8311151wmo.10.1701089796257;
        Mon, 27 Nov 2023 04:56:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z15-20020a05600c220f00b003fe1fe56202sm13576241wml.33.2023.11.27.04.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:56:36 -0800 (PST)
Date: Mon, 27 Nov 2023 15:56:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] nouveau/gsp/r535: remove a stray unlock in
 r535_gsp_rpc_send()
Message-ID: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This unlock doesn't belong here and it leads to a double unlock in
the caller, r535_gsp_rpc_push().

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index dc44f5c7833f..818e5c73b7a6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -365,10 +365,8 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 	}
 
 	ret = r535_gsp_cmdq_push(gsp, rpc);
-	if (ret) {
-		mutex_unlock(&gsp->cmdq.mutex);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	if (wait) {
 		msg = r535_gsp_msg_recv(gsp, fn, repc);
-- 
2.42.0

