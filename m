Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DF1581EE
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713945032; cv=none; b=Vs4Ajcyeu9DqYhR6j1vC/3T0NIaCVy2PXZ+WRKX90qutRj+H/e5GF+0wJ3aCwYnoxUMoA87RIKTq4LRejnSbOVX+5M/WNZrYvtMeOoRgaSI3e+UIzgLYOBhE66j4R+r7ENGjJU9NLxKQZD9xzmMF7FoD09NsJreugiucbRhCd50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713945032; c=relaxed/simple;
	bh=g/Er6GYXVGaNH7JDBFXh3LSSvzcGk3gWsJG0AOM4CTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfrNygCd0ZH/C9V1uc5wNVRlYofp+IAXHVvGbL7RTY8k6eIsULmh+J5z4mJEKrLrRuqI50iY7puVs4D20ZT4usXckCHx7vSL3cxp8Zg3SkDPZL3QSGC1O4Emi7mzZtOQEfY/z/bpuCwlBvvnts6FK197a+LSN4k4TKhV/VUtPAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Hptc5V2+; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Hptc5V2+"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so112273881fa.2
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713945029; x=1714549829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Er6GYXVGaNH7JDBFXh3LSSvzcGk3gWsJG0AOM4CTw=;
        b=Hptc5V2+rnXXJTqWm5x2+cw4imBiLFVePvUqflhfHQ8cZF1sfv395V+XBa/xs7y3kg
         v+7r8jKZXa/hoyWrRl+ROXH9O6LWDyCtWBnKlIBSVJ0gv4VxlPuxf/g/xHoUXOEgX3iT
         y2wqeV74cy0r/R8GD5JSO4qHrwoIMWsYv032SHQwkahIXm9mMf9aoFcvzmXI6QmglkZP
         EHTsTrQnqxKFdbXj3AJmv2kboJUQlPkb6t5c5GHQ7OgZsb1d45HdAlLcjRVMVhiZqvgl
         NK1sJTr/yYf6K0Xn+GpyY/07ebCkkurUSMkF5GQd38vS8FPC/oUzOCQFuTPaza+Qto+v
         znOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713945029; x=1714549829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/Er6GYXVGaNH7JDBFXh3LSSvzcGk3gWsJG0AOM4CTw=;
        b=AtOVNzqRAtjs2Xp0NhPZ3Gp67vYCgGKfDghDO3fQcif4YBGkXDj6xysJ2w2/GjcTl8
         SLUyiYk98Z7wYTD42zGs9e3vPwzZpeGDBuXPZoJAispXmMVOuXXz4vQKeFBBvD34HJkh
         Bh5O2CyZeWfWUodtqfWcsCV9h2yd1gsvjYE1srgFN3azzL4SZT4JFx7C84xuREI6UKy2
         3toLehNNnb6DVypzZzY4MUFWwAdsv0U2ywNKIkl3x2oiIEgJjktpKAgNXVfDV+/p90UR
         o4FmdSsEHrsc1MT//dvqr4URFbRi+zllMo/Qt96iLIVCT95vTMRi1dUkgnuMy4PQySro
         J/0A==
X-Forwarded-Encrypted: i=1; AJvYcCWpNI239fQcn9TxgW2e49KWKqMd8JroMR7C/BCRGTRdJYoFlgpH/vhcEeR+xvxSI6q7TApKQAjN1k0dFj3n5hNqL7pQgl1gPoyFsJDq1i2o
X-Gm-Message-State: AOJu0YzXV3DkvFTp6D7KCBsdveGKvivCnoK8T1cvKYfR2OwzctDjXcY2
	1iuheXc/XQctsd0/EMdRCAZi5sDRL2K7KgsEhTYSQ3GMPlCL7C5v0Tpwhv68DfM=
X-Google-Smtp-Source: AGHT+IHIgFIs/HtMioD9CZgIp71sOpN4oVb9nF69ng3WYESdlcm1/4O4CiXzS4QWI0WKmvheznXTlQ==
X-Received: by 2002:a19:7413:0:b0:516:d09b:cbe4 with SMTP id v19-20020a197413000000b00516d09bcbe4mr1517679lfe.53.1713945029369;
        Wed, 24 Apr 2024 00:50:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q26-20020a1709066b1a00b00a53c746b499sm7957520ejr.137.2024.04.24.00.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 00:50:28 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:50:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	Kunwu Chan <chentao@kylinos.cn>, linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Anup Patel <anup@brainfault.org>, Thomas Huth <thuth@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH] KVM: selftests: Add 'malloc' failure check in
 test_vmx_nested_state
Message-ID: <20240424-e31c64bda7872b0be52e4c16@orel>
References: <20240423073952.2001989-1-chentao@kylinos.cn>
 <878bf83c-cd5b-48d0-8b4e-77223f1806dc@web.de>
 <ZifMAWn32tZBQHs0@google.com>
 <20240423-0db9024011213dcffe815c5c@orel>
 <ZigI48_cI7Twb9gD@google.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZigI48_cI7Twb9gD@google.com>

On Tue, Apr 23, 2024 at 12:15:47PM -0700, Sean Christopherson wrote:
...
> I almost wonder if we should just pick a prefix that's less obviously connected
> to KVM and/or selftests, but unique and short.
>

How about kvmsft_ ? It's based on the ksft_ prefix of kselftest.h. Maybe
it's too close to ksft though and would be confusing when using both in
the same test? I'm not a huge fan of capital letters, but we could also
do something like MALLOC()/CALLOC(). Eh, I don't know. Naming is hard.

Thanks,
drew
