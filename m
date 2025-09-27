Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758302D73AD
	for <kernel-janitors@vger.kernel.org>; Sat, 27 Sep 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975941; cv=none; b=mmdoOvILwTgni83jNtL4LUt0ZL3BNLp2ZXhbxGQ+2tcCrNcCoFmlJRnCKhCrTqP0wjwdMLekW1FFvCv3FNn2htxOnEN5OPb1kUTvE4NAsKUg6krIKNphj5UtTC0eahS7RctW3FULNH2Vh8PPhHP++N91rsAwtUBOOAVTcx6qkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975941; c=relaxed/simple;
	bh=Cz0upPHZk9fGBVcjG//ILHjl/qglp8+Tm6tLew6P7q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/52Q82GN5sNmhSOXl/gMBWFwijbkD9ewZzBFwllZMaaPJMzN8xPo6jt83vwTvJM5cbjvdX6F3NFAvXgC7Drn2kjKBan398amrBJrsuXSilgfUUewq71+ojnTN3KjE8lyckBvljCUDoQYEml4IpXBIE0Yu/qHCrIyV9kMNXha3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=to8Drjo/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="to8Drjo/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso21694245e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 27 Sep 2025 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758975938; x=1759580738; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVhumFC8qskWIHg2JamV1kuMQedk4HSzKMYaXz2FDxs=;
        b=to8Drjo/JhFxv+tld4alYbgBdCEEm7/fkjY7h9bW15GsawpgkvDMn5lj+kutvhqqxO
         dCer/i9CHp6V9Kmb59WuPjeMAn9ufcZeJ0cd57Bl1e7JsefhPyMx7266kprebbY+Bg0o
         f0258PZ6Qi3mVOviarG4UrEY0RvX+8i0Oi/4KlEhNiTbx/0UL3Nx7OBAdUl2eWOTu2p8
         JdLG8L7GylbtAMxrzPTtLioHxDDnJcEdmYGoqwzoUspFvyEiZKQ1tyjDg9bTJDX6Empf
         yLm+d/RC/L7JgNON7B93IRCL+k6EmlUZgmNwgPy+gvOD0XJ0A6uKbju5HdqtdlbugRVR
         55lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975938; x=1759580738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVhumFC8qskWIHg2JamV1kuMQedk4HSzKMYaXz2FDxs=;
        b=X6N+h9F2NaCAbOSVKCNhDCeiIusfybkI8GmLOo2/pw6UATSNDzRZGLBks+Lx7ya3UF
         4KwuUs+v+cs7Uz3tZQumUIihsH8YlahBFo9hQrOyXf3fFP0+R6KQuwtBIndNcb+qVJvf
         4pEcex2yP5CdCGPbminRoVGzLZYRnUQTkvOYQ+g7j5gcfp7HjdLD1NAZ2ltQaddx0TvI
         AOTtgnLsK/hbuHb6AjYmNtXb99guPh8LwHiJdL4+RYIdHILI9bzNStsGGMJdlm0aXmci
         uQY0cuTHECFwAeTr74/f3abgVyRIfYPV7c4scDC8RFzS4JaedhZBL5oofOldSTgKSZrq
         Unpg==
X-Forwarded-Encrypted: i=1; AJvYcCVcGqzhmeN7R9vzbkxqT5SGkDSQsX/HqPeJazPWfUusoDPsPekYNl8/5ijCpdbWJlkpJb5uzg06RdRLeTagiHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pL61rHYOIH9ddSH6IUCqJ7KBthCZmqvY6uNkUj1p89lJSWda
	C8LeE+mozi0jph3+p4NJq4wZ7RJqcQ6YDooI5UkovVUOTtkiZgXfxv07RX+fin5Ad78=
X-Gm-Gg: ASbGncu4fW8PyVO436FiT9MUW3rOXiLQ681tgsZSPW4DmbBCytN2DN5LqUPhgj/gtTt
	Em94VawWCGGh+7AbT8tfBOZj9xMoXYLBen/V9t4fChRoslaAC0GkhOoFb3o1C5Xg0G5Yevsx7rr
	NNXLQTupHl7kpRlh4bYG8xK/j9DFutyhnKzV5vhrx1DzCDgNTqsGrUw+r4pR2asIzjmPsqt2By6
	7erq1/dlxcUZ8skERAU5AyTnVrjL2NcWapFuc1vnzUXXQox75ALzt7p3c9x4UXEtJa3ih6v4pCv
	1GkXxTSyyLZVzSIZTBAJeuLSYayvvWnMlWrpm2D7spqM6FUeRrRm8kEsdOS9lLOvdDCyCsRWeQg
	he60CyOmPQSRd51JeaURUoxruIXAmOrwvwWuLIP0=
X-Google-Smtp-Source: AGHT+IH/fs4tI3yUr2ZaBw2ReWMi5Di+AwUxDHPsiDLmiEELtqX2JAh0B0XFiB/cSRsTRtqy4tVX2A==
X-Received: by 2002:a05:600c:4694:b0:45d:e5ff:e38c with SMTP id 5b1f17b1804b1-46e32a1393cmr95976155e9.32.1758975937784;
        Sat, 27 Sep 2025 05:25:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb72fb017sm10713558f8f.3.2025.09.27.05.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:25:37 -0700 (PDT)
Date: Sat, 27 Sep 2025 15:25:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] vhost-vdpa: Set s.num in GET_VRING_GROUP
Message-ID: <aNfXvrK5EWIL3avR@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The group is supposed to be copied to the user, but it wasn't assigned
until after the copy_to_user().  Move the "s.num = group;" earlier.

Fixes: ffc3634b6696 ("vduse: add vq group support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This goes through the kvm tree I think.

 drivers/vhost/vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 6305382eacbb..25ab4d06e559 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -667,9 +667,9 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
 		group = ops->get_vq_group(vdpa, idx);
 		if (group >= vdpa->ngroups || group > U32_MAX || group < 0)
 			return -EIO;
-		else if (copy_to_user(argp, &s, sizeof(s)))
-			return -EFAULT;
 		s.num = group;
+		if (copy_to_user(argp, &s, sizeof(s)))
+			return -EFAULT;
 		return 0;
 	}
 	case VHOST_VDPA_GET_VRING_DESC_GROUP:
-- 
2.51.0

