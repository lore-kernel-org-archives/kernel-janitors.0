Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F56D1BC
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Feb 2024 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387534; cv=none; b=ZhiukVx+oJhOtisxlLB220vDBW9ZLGguKrNA91OphrfrK+AdWZUQ/H23dxq5h7mFNCQcom/zEUTXFIuPXVkCrGH/uEpfi5l09dzRpKW3UbS5TSWA12FTS9WJKUYQeFI9+sCMN2UH7dZ9szEv/nj0Laemanf38CV28CgXJ4kW210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387534; c=relaxed/simple;
	bh=+wnJqL+pqGvJcwEHa93fmS0oXb5TjuFDPjn/Uorknjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYDA13vr9Ma8Ur4BdGzI8qBaStz812sskqQRdCe9X/prbeLz+KAUCOlFpGvzZc7C/K+2sUtv+ZeYRI6PnlzP7F3j/tL1qfJeFEFZQtXGe0noznc69eXtfSjrqTLsX5ob166hDHVXqINysPOvNqJnHjBX1dU4KXkPYXmLdEQX3Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jB4/BiFb; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jB4/BiFb"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so218527266b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Feb 2024 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707387529; x=1707992329; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3l3rhYnvc20HMeICU1VJe+MdTxuoHKteQqL6qQ8unM=;
        b=jB4/BiFbDvXzCzynzmAuD5C6DIwNLQBrP3G1CpsI/F0VpIyiaADzlF4slsJIrvsSMw
         pzDlYynZDMe4/CK38whOh03tOL4I/ZeWJ0EGsdUB+8pcbUa2lEtKQet7G6XBa+dJ/Tp+
         9tOBpKjd4r/iua1FxG1B6i3Tx46sKtsEBdlZI/9hBZ6weLmiTql+yKSGJVFvleWZpWqa
         FTc4gPKqM6qBb+7BVPd/kxyE99xlARsXEdXTvTjxX0hzk7Klicd/d+kxUMeot9xl65FS
         UpVVQd7WVqtSwnztK/05g8CPDk+fJlcxVxZt2xAlCuiXXEpTO73O5jFVmiVNWc6bEY9m
         8v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707387529; x=1707992329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3l3rhYnvc20HMeICU1VJe+MdTxuoHKteQqL6qQ8unM=;
        b=PdDL2KJvJstjUUlUuIonnOlQYkgH7t/OCyo5603ozjyZbK1ul5tsh8AchBZf3tcgh6
         Z0L3YEHQ5XcsvMN3dtnrxt9G+ix0MnZBjf2YdR0J3Y8THm4xiRkjjRnl6FWZRLmHmk2/
         wvnCD0UFjdJlf5Z4hMqwdNa+e+M44IZREdgbmpkuw0Zcirlrj/3lRAtKOtOhSKJuqffJ
         0tSF4Cpyf+LGoe9UrVg/NqOWe+OpFX7OKXrRrCy817+m1VvBQBZpCSnOxNBNJxK20cEw
         Jmc+8BiVHuNAwJJja5KIkNRs1Ql17+JyUtgxQP/FGBXe82q0QdY8lhqivYoGHhpu1SPy
         zKKA==
X-Gm-Message-State: AOJu0YxZvXVe8ef8NXSM52M073oyBFQ4UOpvL2W6SdgEtiJFm8EnMOXM
	3P9SOwRojSVPygl3UNadtY594c5UmxeGMAqmBeamHYLVsh6OeKByIYC8VfIAzjg=
X-Google-Smtp-Source: AGHT+IE58kzQNKsgAZE7QzdfSsUOh1a2HwCrg81I60aaDwW7QliqB5Rtf2DpP5/iwu31bmTlV+6Qew==
X-Received: by 2002:a17:906:386:b0:a37:3b00:199b with SMTP id b6-20020a170906038600b00a373b00199bmr6727416eja.30.1707387529681;
        Thu, 08 Feb 2024 02:18:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnj0O9VjVBXDc9EkEsJ3HBmiZix7NO1jblKXDiOm1U0BHjdFpDjp3SJVaHoWpFWNli0Kt74isuuHqJVBtULNlTVxyshw92DSgDV6EoUgv2kQnnqDnMpxlugArvm2jsxuYn9h3Faz4AQUffrBdCto960O/HhVY/hhA+F5ZbmGjtCkRttyKq3t4ELUsrmOW0sSSa4f8chX043hiYVZP5gO+Ts/tiRUYRph6Wjy2ZkW6umKwYRnFi0my/gVhwF3+gIEG/qjwVak5YyJKA6cm9cEBngYeTah+VhqQ7gCQKe28OqzdNmgZKJWtaAQRr56XrXyfx9KcDTU7TZPPy7VfeNbRuU4sv0trFfsC71586wZrsAxh7YDLujH4=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hw19-20020a170907a0d300b00a376d1a18adsm1753615ejc.98.2024.02.08.02.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:18:49 -0800 (PST)
Date: Thu, 8 Feb 2024 13:18:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aurelien Aptel <aaptel@suse.com>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cifs: fix underflow in parse_server_interfaces()
Message-ID: <05c63e91-ce29-40aa-807c-ac730181c83e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In this loop, we step through the buffer and after each item we check
if the size_left is greater than the minimum size we need.  However,
the problem is that "bytes_left" is type ssize_t while sizeof() is type
size_t.  That means that because of type promotion, the comparison is
done as an unsigned and if we have negative bytes left the loop
continues instead of ending.

Fixes: fe856be475f7 ("CIFS: parse and store info on iface queries")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/smb2ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index b79b6bbd7103..bb3975dc9072 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -620,7 +620,7 @@ parse_server_interfaces(struct network_interface_info_ioctl_rsp *buf,
 		goto out;
 	}
 
-	while (bytes_left >= sizeof(*p)) {
+	while (bytes_left >= (ssize_t)sizeof(*p)) {
 		memset(&tmp_iface, 0, sizeof(tmp_iface));
 		tmp_iface.speed = le64_to_cpu(p->LinkSpeed);
 		tmp_iface.rdma_capable = le32_to_cpu(p->Capability & RDMA_CAPABLE) ? 1 : 0;
-- 
2.43.0

