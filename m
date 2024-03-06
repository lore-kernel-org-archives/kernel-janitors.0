Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD25FDDC
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Mar 2024 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709724691; cv=none; b=piNFgpQeEdyc5bMff57A/5t51hqM3cCxGHngRza3Isi8BxIL070Ds1IVGPisc46O2GhZhOPpPCgJ60+RqT7HZoohAPOyUbIW9HctW7VHbBMAe2uBU16ZxPfVsH45EK62uaYX+h7ma2PN2COyAUuKrs9ZYfkthq77G2NvSifN8Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709724691; c=relaxed/simple;
	bh=fZlrXGQZcBJVpo2ccv6AL4zCbzHtxKsMtf/+UQYBf7Q=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=tb1fy8L0/siQyvjtMDAj5/JjA4savzMuJDWnxpaCLLtr4mVINVNAtjx1G7/o/dHvdSsVsTya+jvUHD4f9KGXpAHSISCNK3bh31xDjBmt90Gph2kDJsV//mXANmJVAEB8grL8OTKm9k8fow15mWJ7G3DFQ3Nyf6Z9ZH1ZK7MbmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfQ2e8cW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfQ2e8cW"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dca1efad59so5734202a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Mar 2024 03:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709724689; x=1710329489; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fZlrXGQZcBJVpo2ccv6AL4zCbzHtxKsMtf/+UQYBf7Q=;
        b=OfQ2e8cW6aIr2UfzeqVtgsmRxIgeQp7cJMhzQEPNa9cI3scJuETMsnM5yMeqdMqJrr
         YzW88CycIyVZBVnI6HjVF0TEAZZyFkyblVe7cAv8ZCKKkYMIXtH3u0iE+H9hlWyg0e2H
         wijaW2FkEXGqYyov6vs+98iNOfrkx+UUQ78e+cEHTmfP6eS/Dq1b+QsoU8c269NDQDbe
         TAAq3vHWKZMYJO+6E9KvXNuLCt2H9Ujs243lX5HJj2XCmizxq5fR1llhd6aof9/rBNSQ
         47K3YJPut7lV4JVHWcNHqgusF0If08aYP5fAnvk7XJpx5rwJpQUI5tz7EIVaw4KwJPol
         WrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709724689; x=1710329489;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZlrXGQZcBJVpo2ccv6AL4zCbzHtxKsMtf/+UQYBf7Q=;
        b=iWZylIt7s2VYP93EfA0x7g14wQz02pIL1MgQTB/XC6DExtFhAY+sQDt3X9EPMMjQe/
         vgdjqlnN72/YT9hdGMy8WFWliExPPPhV2E3Qe4Ax1zsqMBNNp0nwuqTpOUa5pAK+oJAf
         VN76jOC8QMo82abDM9s0dUGvKDNe8DT9rpuiAG8gayA//ow3PXMuNl/0EOgLBccfk72c
         RQcFTlKS0Sg6swG5yxQQj/RDnDEIasnBkutL6gKZuG3V3nbATvW0LFbqKmw1uLjK2zza
         YFAqby794thFX5LHLSALXzTlCQ2zBCPahEFyJbOSpC8mI7MKPnGxw+GDgEUIZ/HOJfef
         Z8UA==
X-Gm-Message-State: AOJu0Yzg5xqsXrQWI6qlD8E+CuP1IqbF8Bwkn2YfmY37hnICNXzTJ+J7
	is+jUd57vMwqUw6+P8sbs0mqmWbDop2zkOS3VKHbsGFBtlkQJqttLOrgBNv1KdM=
X-Google-Smtp-Source: AGHT+IHYS/Dcjb4/nkZwdxdEuPjulwGebatISBF4Muudo0ROyIbP1uDVdwOGjVi0XV0iiPXdoLFI7A==
X-Received: by 2002:a17:90a:c914:b0:299:5a55:ef3a with SMTP id v20-20020a17090ac91400b002995a55ef3amr11534913pjt.4.1709724688647;
        Wed, 06 Mar 2024 03:31:28 -0800 (PST)
Received: from ?IPv6:2401:4900:1c3c:9b3c:7685:c6c9:539d:b4dd? ([2401:4900:1c3c:9b3c:7685:c6c9:539d:b4dd])
        by smtp.gmail.com with ESMTPSA id eu16-20020a17090af95000b00297138f0496sm13260116pjb.31.2024.03.06.03.31.27
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 03:31:28 -0800 (PST)
Message-ID: <ccb0f0b9b9f834177e830e44c4de44e72ef00a06.camel@gmail.com>
Subject: Introducing Myself To The Community
From: Ayaan Mirza Baig <ayaanmirza.788@gmail.com>
To: kernel-janitors@vger.kernel.org
Date: Wed, 06 Mar 2024 17:01:22 +0530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,I want to dive into the world of kernel development, but really
don't know much about how the community works, I have read the docs at
docs.kernel.org but couldn't grasp what was what. So I thought that
this is the best place to get where I want. I hope the community is
willing enough to help a complete beginner. I'm open to any and all
guidance from the community.
