Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66342C158D
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864939; cv=none; b=EEg45JVPDtuHy1CoyOcgP1vfaXpCdHq+pX7ohA+h0nBxulU2LxNMFjHqLEP8fnKrrdHcuXJSERpGaVUnNV10dzNbBkFN9eW/LYa5teBuk+/Y8HqrNnMrQLgyU5kKzes2dyjGHg4ceFTkS2Ns0zHDNyyxowD81SoL9tl2pDeYlNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864939; c=relaxed/simple;
	bh=5JYFEh/B1NhPLzWK+CJdykCD+u6h119UFbAkSy5RZmE=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=g93mBvyIcgdc1x3zIgeYUhV6ls7OLKOqX1frvQ4STNApzFabwpji9m0uLoq9nZUhzC3gxdWeu6AJgcIESiRBwY6N2zcUFQZfIaS5mS1OePhfOh4owz6bCDGZwxzPiwg7cYAVCZMhpggWiKePtBFblcYOO4XOhRmVPIw/O1nfiH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/OqBbMw; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/OqBbMw"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2ea08399ec8so28112fac.1
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864937; x=1751469737; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+WU1qicrpfWVxiSKMDNqBCOmYnFjqwgecK16bJOOCw=;
        b=w/OqBbMwHZOSNUVqi+Oi00ejnZH4Hgk3KZLyBAfsqABeI7u0R1/kUqG9wXPtnpH10E
         nWhwgVPkBNkbyXij5hrvpdQrcUmaYhgRRxV0ojB+r2gP69p/K+ztzZIYsxdFNmYgmQDU
         0qr53s1CuCK1V4cvA5h3AkRKxAmQPBIvr+CoBAsuagPghLF8GFL3RiX2dWbaWW+/PPrm
         QpOavzRlLrCJaGZ1B3uTEyvvtGC3nl1f+sNBhPJKC0RCDRgGJP45pXjBvZJDXx8LnCaU
         wdAUzDPZ16WdXQxCHmNoguYVFRum07XQvMiagHefKrm58IiRpEUdyWYva/Lxju3/U3aJ
         kvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864937; x=1751469737;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+WU1qicrpfWVxiSKMDNqBCOmYnFjqwgecK16bJOOCw=;
        b=T2822263tLusrKmRcM3QJ9NfjQ1wCBIG8b05fnTUEW7o8H8Zs+Cux/Xz6fOxK37VtQ
         1yPer5mAnjjG2ah9y0Pk/xAhDylMrmNrFwvPYNyYzPki9cHlw0/NPRIKMz+6yx+LGM4y
         o7emN5uAi1vIOh4RNCe96lSXXNpVgmpAlvEJ/f42DI3gx4TmqTr8ilvFCPPrgnF2urXy
         8yOtw9n/Ky9nbH4My1f89XYvBbQvhR6ZR1kXCMfZ5j/jE8LhBHBiKSbv95x33wvg/8hp
         MzcnsscscPGTNZTMVlN/xmnHGeBBxMxJ0K17VEixgkruvvpPyBS0N3DjzU+AXnzJgpeo
         xtMg==
X-Forwarded-Encrypted: i=1; AJvYcCW601S1sFwS2vwmy57mM7ld6jFOPB0kfpfKRuB8G9ohX0iSV4yEHT5yPX2gXhYXvIC/Y6YgxfXpcXXrv5c3WLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsdeKu0Gq5zlymR+OzdOND7fZ5KX+TqwCt+f3+jF+YV/fREFR2
	qwyMvRN0uni31Bd5y2gqpoKxTGwEwvArm8f0W/3hg3GAOXZrEXIGpSIGPX8QyiONbg4=
X-Gm-Gg: ASbGncvxC5OPyza+VHUBlT4uwnzG7mN216VKYXMbMNcz5f08JZX22eWF2+V8jo1B8EN
	0Zy9QuJuYe5JpHcr5IodQBP8N5UNk+7T+YG50nKzKnJdtWISW5rU3Ni2Cdgz3a1JFRg5oEXjTGR
	avt1CCeWCxssfM55PsCS8RX+IpY1dzvstswgZ/HVu/c6cH2HKUzhhFyPecXzThbtNYpbhZ6MlxB
	ZmD2Y+FkAmTzEyOvqY7TYzRNYAhuh9dM0EaYaMmDUHYx5hkJzpfj0GdPzViFI1fFKApQ3976nVI
	5DlfelEiR4iqYWH5jXQadSTNu2o6NoAX+1BLdza8Ao6CNBf9NQNZYhYMoZR1/dqnTOWSIA==
X-Google-Smtp-Source: AGHT+IErLXYfNY1HcYwO06oS9rTd+ujnf6KFvXKf60FWeDN2HmwrG9jFGq4oLf9AmCw0fBHgkeUDew==
X-Received: by 2002:a05:6870:e254:b0:2b7:f58d:6dcf with SMTP id 586e51a60fabf-2efce2d359amr92580fac.18.1750864936838;
        Wed, 25 Jun 2025 08:22:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ee8dd151d9sm2595012fac.33.2025.06.25.08.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:16 -0700 (PDT)
Message-ID: <685c1428.050a0220.346d5e.eafa@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:22:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mm,memory_hotplug: set failure reason in offline_pages()
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "reason" variable is uninitialized on this error path.  It's supposed
to explain why the function failed.

Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 mm/memory_hotplug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4d864b4fb891..e954f81b55a0 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1977,8 +1977,10 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 		node_arg.nid = node;
 		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
 		ret = notifier_to_errno(ret);
-		if (ret)
+		if (ret) {
+			reason = "nr_pages more than present_pages";
 			goto failed_removal_isolated;
+		}
 	}
 
 	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
