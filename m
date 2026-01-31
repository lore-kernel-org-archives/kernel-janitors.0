Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C76B2F0673
	for <kernel-janitors@vger.kernel.org>; Sat, 31 Jan 2026 00:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769819750; cv=none; b=B217dMR3RiubQB3ahWsQhxDSUJ141dBNKDw50WUeBMnWzhMEx33QNgSkGxa4dpsmt1Y0b6js9mliclxb59cBhEa3JFSLJyYzUvAqhGFtaSs965aUtx1RH83BZnF1MS10owQHrEvc+DsmVfuoj+jURvOO25EllPkbpMy3DBBY8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769819750; c=relaxed/simple;
	bh=vshrLvV91S+zrl6td2gzfaeTmwAFhDuKqDfF8rXkw8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=nU3G4LJcT+XtuHnPnkyHhPiUbIYUC9/wUcONXTWt30pzDTGAyZGr8ZuQyMCsXv4HqNaDQP1qaww2M/RFvp01YgL4lQ6d9G+tID5uAbGe4CDgICeIOSgvwlS+73rU6jlvl3UvZOGyOkcccPU87LloXebcVuta/P+H80IreaZypU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJzB+Q0o; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJzB+Q0o"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6498401cfb4so2657942d50.2
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jan 2026 16:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769819748; x=1770424548; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/eT5/43Cj80ucaxjKfc2lWt8DTy9XJeYDLPtnm4SYk=;
        b=ZJzB+Q0oIVaRq0gi3bRp08jsJySUacglR87rR3oJRejFqQK47Y+hEW+psjbBSKJj6h
         y6UR4b8G/5eYQeuvNsFyAQEMv58BQEfeVHFFVqYB3WAJhKCZUx5PxsMOrs05eUDbKYoE
         9VCrutWM8YSq1jmh8mV8hsrvytuVK5Hr+d/gv+DnCXJTbDpni7rtevDOb2lQQqKVUy0u
         ZHTQ0zV9hECo5jyyjCOHZkegn9Jcs9k+y+H07TaAfACE7N+9kjCFaH8qCBqk2rXU/PyV
         s+xni9aCiTupmFuP/IBLDZnsLiZhczuPoJE+ZyboicOGsSLOrGuQ6G9JoQLPEL4WhfXN
         0Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769819748; x=1770424548;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/eT5/43Cj80ucaxjKfc2lWt8DTy9XJeYDLPtnm4SYk=;
        b=kORhhLx7AUzyLTN/23jbX0qltC3DkYHSIpWLMozTaHaHkY8gOhtZ9rJNH8M5HooxgL
         uQ5ipYROul517DBIHohlpyxWrle/hlO2Ur+f0ZT8LEX2A5fknEmyRJJqtHcDIoiQm3FV
         ru4O1yaX3d6FdeJi2PokhuUNzAz3rnwsMolh4FIoyGBKGU+3tH3oHK6aDRxgefmkMEqr
         dKPNRzgp8zZ576XERQFX+kjOzLygp/GJvPZt5vA6zACTzxAJSeFYbYkO0IlZxa0NxDw6
         IyCyiuMBoxW7TKhAMI2FqemDyuhGB0qAdA4VLYuVOhupJJz7tPIBSGE1onuyaJfGqUCy
         atAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUEP6jAlgYGTz6OLOEP6DPFdlEG0Nixn5doflVi+00COYAAWmkGfooPxWUN/JG+B3kyLlIHKyv80oq2kgeBkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrrB3fRH3J/BKIqTdBhuUWgBrMlNEI46U52WQ5yfbwpu5/4KDM
	j+tS3JF4Vo91sXpMc9i/tOBiqNxEXK84hkC561EePq2g6gD319Slpj/z
X-Gm-Gg: AZuq6aIJWPH6uhH3T91ea/fiM8K6q5bQMiUEJRgihOU/JwgeNRnt4hA++l7FEt7yZDS
	1gF93zR8U0Mky7Nr5u9o1dt3tfwREyByqh970UEw2Ub7EGx2GIG4A674UIizHr8fkmH+H+qjOSV
	BGevfGTI3PLRyCN55ZAjdlg8S7tzFLNtYGfYD32Pg4fzwa4Indxf67yN5tNRHErDatU3KPKUFTl
	mBFHPNCwtJGZpyq/r/iM+a2hWcBB7H6GOYdQQPCyg850BbIXybLlwGcN45fhctqyoT3H6E0reQW
	OjVAEO4fIynlqO5RFJf7ODf5GergojQ5fCAvGO3zeef8+b/eZf5WtLmP0Lin4HhG6axUKjwAGC5
	LWGo3b51D/VcfgMKFyr0YqM6c+EKm/EihF2hZkv78DCRgvs2onzH723ELFxbBx/wZUviNCASc0s
	1oa1RMV74SelQ+jMBSxJSZIe+E0viOZkY=
X-Received: by 2002:a05:690c:39b:b0:793:ac88:2a49 with SMTP id 00721157ae682-7949e060e19mr87497897b3.49.1769819748067;
        Fri, 30 Jan 2026 16:35:48 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7949be04d80sm18676747b3.34.2026.01.30.16.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 16:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 18:35:33 -0600
Message-Id: <DG2CQH8X0893.34H3EQWUNCSYM@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "SAJJA EASWAR SAI" <eshwarsajja20@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <iryuken@duck.com>, <kernel-janitors@vger.kernel.org>, "kernel test robot"
 <lkp@intel.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove hardcoded dead debug code
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260130172632.130898-1-eshwarsajja20@gmail.com>
In-Reply-To: <20260130172632.130898-1-eshwarsajja20@gmail.com>

On Fri Jan 30, 2026 at 11:26 AM CST, SAJJA EASWAR SAI wrote:
>  	default:
>  		break;
>  	}
> -	if (0) {
> -		int pp;
> -
> -		netdev_dbg(padapter->pnetdev, "pattrib->pktlen =3D %d =3D>", pattrib->=
pkt_len);
> -		for (pp =3D 0; pp < pattrib->pkt_len; pp++)
> -			pr_cont(" %02x ", pframe[pp]);
> -		pr_cont("\n");
> -	}
> -
>  	return _SUCCESS;
>  }

Please keep a blank line between the } and the return statement to
comply with kernel coding style.

ET
