Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E29436342
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Jun 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604802; cv=none; b=ZGAZnkYAOH+TU5JNvNwB3nHjdJW2A5b9tuU881T07k+zIfcT6IdktMcbsAUtOfLO6IzvMkaWKd9GcA5qyeuFmzfpWXUixZpRDF0vRoI6g3GKRlhAzPAHPVwOCn0f2DJH/EwbUAXPflU2KI11rTJkvLXUDMrdSinoJtFb+zGPdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604802; c=relaxed/simple;
	bh=xfrZmesiSEPynX9YX7U8MOnPvnmdik4XXr5qgkOwJik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FruvXW2FfRbMny6pTFdAAF8ptGyfzwLWguPBqT9yzL0FDNWiyEk3GFiOu/6agES3RlYjYXvwK1TKZ25YdgYpiKrFIapBtAaOyqcAOrLupTum26Rzbmj6Kctwf4jDwRcNGVv5HgRGoobuuSsNKVzJunrnyehaaLufl4s0s6DPWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLgsjCAM; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLgsjCAM"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9157d3f2098so508524385a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Jun 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604800; x=1782209600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+M/4BfCg4kebp/5c+3KqKstn3ZcQMD8Dq5coTSVGSOk=;
        b=KLgsjCAMl/E+ge90HpDPWTRdL6NiLZJPLEzQfmfhtIkntwdp7wIOzz8AxvCcO7nuPo
         sR73631XjK2B+MwpcCKNi+Acg4lp/JjMFJXvrkh3F8tvusXReG6eUIZbZLEcjp+UfMuJ
         3hc+6N0yUnoSf01CRLikIRemZlXkfI7rCJJVwqDTL+HZ49kT/220xHUxYueSS6C1mD76
         6+A7cEM5S/XFULzDPcP4e04UHQTfYGDRCz/jjkquJrUQ4GblPvpP2sHEwTRLBRQ10yI/
         ejlYsva3MpuiwzO68A4twhs/7CdewbuoV14SIF1jr1dAjucFjqKraZGOQqZ1XEaNot4+
         2HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604800; x=1782209600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M/4BfCg4kebp/5c+3KqKstn3ZcQMD8Dq5coTSVGSOk=;
        b=GANDdkfopWVQ0YV4ZcNFJhRrg3vdA7GLEafUvPFsDDKodA1nQwISTdmp/FcnynyCB0
         DhSZYvgez8SJiNc3eVVOdcVVcEe4dX9+NDaLfjsqjpUAIsVlKq7Vrjb0mDZqQcN3mlKZ
         B+uF9rSnR1OY5ANfnweFenrcC/2kFulAT6R2XbCC65cNjvjv2emRzMyDJqurtqmvSsxs
         bzRT3NiFAkrUkUOBBcYnZAAmsA9A1U3e+mV2YgsWnkmp6QH/F3jdm6FdPjebEAqoJwZf
         Kkr1WTHzuCbx5ibTW8o44TPum1pP7OJjDXf4TF5ucuZEUn5scLe0vdjv+5q1X4AKc1Nd
         s4fw==
X-Forwarded-Encrypted: i=1; AFNElJ+qEVynkjP1Hd+m0eTkLm8/m1Z2czpHlEKyWZR6hu8jpGxvIuHHE1c2ci0YJQiG1sWnioijgySRsCMMJAPlT+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj1LgnSp2MA7IiUXtjYBmfDX+3k+q/jJsNUDJ5PVkjGyrQoD9w
	xaZDf2HjwpXoIKw4KGHpbDQTOoy/nNtRfEU6YD+7VhzTjDiMvS6ncJj8
X-Gm-Gg: Acq92OHaIYqEBI7qWFiVRDX8zZS6DW6CpNiHX9JM9Vxb4R1v4KUlv4ngwfQZdSj4900
	SngN4yzA4lgnBR1lWwfTkRYbECdLRugwZX00qRlXEatnC8l8DdvqFtfAk7d19jvIJ2o5JB6lzzx
	FzJ2MsQfgCB5TbEQYYcEYP4axblz9DB/+KndIhnbFM83i9r7oyzYazVN+3acifkpzxTq55g6VAW
	fuErGwDA00y/IQyDAY4c53uErdx1hFsdUZP/wBNGwFd+jm3gQ65/qXZMbA7PKueWLfJwlD3gLjF
	AYSl/Ehe6sZYBbb3EE/TJd/X3zZlEK94lMzn5m+7Q0DYbkuUzjVkbdwFDFf/xwr9L9fFfZVwGJ/
	WtBQMUQKVrxKf428UNdBZoC1Pyb0mNu4EbAgYgBl8HoSh9gO3KdqgZ+UzvdruDRi3g88pDhwvZW
	FDLc2aXcPi2j02dWzU
X-Received: by 2002:a05:620a:628b:b0:915:86c6:8432 with SMTP id af79cd13be357-9161bc4aa09mr2765037285a.14.1781604800130;
        Tue, 16 Jun 2026 03:13:20 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a03bd31sm1425927085a.34.2026.06.16.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:13:19 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:13:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
Message-ID: <ajEhuS8xwcX1AA_I@stanley.mountain>
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
 <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>

On Tue, Jun 16, 2026 at 11:51:53AM +0200, Luca Ceresoli wrote:
> Issue 2: in mtd_virt_concat_destroy_joins():
> 
> 	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
> 		mtd = &item->concat->mtd; [0]
> 		if (item->concat) { [1]
> 
> At line [0] we dereference item->concat, but at line [1] we apparently
> handle the case where item->concat can be NULL. Either [1] is always true
> and we can remove the if(), or [1] can be false, so [0] is a bug and should
> probably be moved to inside the if().

That's not a dereference on line 0, it's pointer math.  So the code
works.  But a lot of people find the distinction confusing.

regards,
dan carpenter

