Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901551E521
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Jan 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738056293; cv=none; b=Yip40xWVqTTvgDInxDcK/ko2C1AJFaogCedSxkLpKL9jW7bli/WKcsecWv7Rm3C5bmZBWHn3SKkWcyu9yUFqXUVOsmrXeeS/+lNzjwHTaZGWOHGPq+F6+wdVlO7vkGPQOR6CNAVNESgRD1KdykRW0cDU8myp4B20FIT9VV3EXx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738056293; c=relaxed/simple;
	bh=VIt82eoZNWpVRi39QUt00VTIlJRuh+8c0BStMvWCBTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRCFJC8ApKUHagjIGT10+CLRqf2YB1ao9pRKJIuNGIxqq8/d/In14dHmmDCTFZZoJI7TcKXUSjCcBBsE2yXMx0PSTWShEvmIVHruhsw263j4vE6XNIwwgxo+uNTy/09BpTq77cwucz6anNylaLrEPYxFEIq9XT6iRvHmTAtVhKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qfe50Vzz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qfe50Vzz"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab2e308a99bso1039271866b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Jan 2025 01:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738056290; x=1738661090; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3D5pqdu2mdyqLKvp3DYnfF8xqiFnuWUD81acNqTKKzg=;
        b=Qfe50Vzz0GkRLzDrP6PV7l9hyHp+dG7wDrTdCshnOZLfUEwA06GvMgqlDJdsRYOHFP
         zy9dwEeA0dWI/3SyAFOw4Mcs27ezvab6ptXS8y4P8NweKx1FRgnqNi3/8n/zfckw3uLS
         sK0gHl1w5mQ21wlevbY2jIJb4ecGYi7/LC7DFUWxPCjk0ZRJbzT5OUaJtj9CO/cz7lKs
         7hE5qL8bzWbScgvtrjwKRlJFlXKxgVXJn1TY53vQsaXEX/VIxLx/pbzTg0uhyQQCrsyn
         PTpFv4Ibk2Z7ywUn8FDlfV7QX2beSonYds1uPMgIJ9RBDVaqHGcPwvubUPK7MMpV7mfT
         4OwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738056290; x=1738661090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D5pqdu2mdyqLKvp3DYnfF8xqiFnuWUD81acNqTKKzg=;
        b=MqLGBnQXxrWzicvSjMdJ+ImKgJdpu8pMkLUBEL11duQ2HW5uVaPZfeULkTXy8OnjE3
         pj14a8q2DY2odNR3TQc5sUcjYmnbOFJUhKfzt7eIYzOMSoQGmsiOwRlA8LLo26W3xHOf
         VZkGg4EFmVhNZOuKpetwnX2A7SGJzCxpt1FTcR1Fi+lzwopA2jXKENB8OO66iTvPNt5V
         XqoX6bnyNAWhNzItgzqbtH/RfOnIciGSA8KfCW89PU2o7UMmzws6vbdEVnYDsioD517f
         zMc4XULvBEPgptZDM3yxihrcDPS/XbhnYbasOItEvurnsMEWPnnuVEdfuord3wT3M/Ba
         HFaw==
X-Forwarded-Encrypted: i=1; AJvYcCWmB1870LT3PcmIHq9lL38jZrr2IoBGS9+3ir5Cno6pN62HxbOoovqoj1xgkZEdZXmRp5wbVZ4fpaDiUYhLQsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyStAs2/jiIorLxCjmLTs3vo5AaL6PJUMGaxsrtvSfkWQn2OR5K
	NzVMuwheGOZWSu+s0yxgPh+ewzRrHsuXHZ6hlZ4eE07FUTrV6ajjGiKglYJZ0Fw=
X-Gm-Gg: ASbGncu5hPnh3ObusjKA8XjBReDkZPb3Ava0zdEQLFDTL+XP1c2ilt6zL89kj477h9u
	8NWsLuL8yE6im4Wq8kUsfJt/BU1vLGGyqSICIcjk4dCDjh7PPMgg1oZ0j72VJqpAw/0p7T7lrj9
	4FKzCF1gGNjcBhJyIHRISs3g7ZUYO5iY3wWi7kma+jIE7UiSMaYKllGdZOf8hotNgtbUXTO0zuL
	EObx1yXGcgb3ZfZhJeyuBoS8tZl0sbpC0vQQl+tnhdh+ZWE9xl3CQHEE7+P4dPJIoPMVxvyghv1
	ZbUbsMY1c04ff7nY2g==
X-Google-Smtp-Source: AGHT+IGrISwDFvM1xi0gD4SmyIWEd+WxPcD14LGgqhymD1O7Z9Zxg85xnHJpOfHVb6c9HPHvwaIKqw==
X-Received: by 2002:a17:907:d8a:b0:ab3:a515:c41 with SMTP id a640c23a62f3a-ab6bbac99a3mr269350766b.16.1738056289847;
        Tue, 28 Jan 2025 01:24:49 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69179d7c7sm511538866b.112.2025.01.28.01.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:24:49 -0800 (PST)
Date: Tue, 28 Jan 2025 10:24:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	Jeremy Dean Clifton <deaner92@yahoo.com>,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Ingo Molnar <mingo@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Raul Rangel <rrangel@chromium.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Yuntao Wang <ytcoode@gmail.com>
Subject: Re: init: Unnecessary braces around single line statement
Message-ID: <Z5iiX9clA62t8Llf@pathway.suse.cz>
References: <20250125154139.7565-1-deaner92@yahoo.com>
 <a0f58c66-2ea2-45ee-a426-5934846990a8@web.de>
 <Z5iHRSUPEQoI2Rfl@vmi2410184.contaboserver.net>
 <5033d386-0765-486d-bf5a-68fe790ee455@csgroup.eu>
 <2ee90f45-0ef2-4c9b-8b0b-79d8c6cde1de@web.de>
 <55498563-eb4d-4475-bf85-1543a59aed20@csgroup.eu>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55498563-eb4d-4475-bf85-1543a59aed20@csgroup.eu>

On Tue 2025-01-28 09:59:08, Christophe Leroy wrote:
> 
> 
> Le 28/01/2025 à 09:45, Markus Elfring a écrit :
> > > So ask yourself whether such a change is really worth it.
> > Some change combinations can occasionally become more worthwhile,
> > can't they?
> 
> Sure that change would be perfect as part of a series which modifies
> bootconfig_params(), but as a standalone change I can't see the benefit.

I agree here:

1. Cosmetic changes just complicate merging branches with really
   useful changes. They are complicate backporting fixes to
   stable kernels.

2. Cosmetic changes are material for bikeshedding. Some people might
   prefer the original code because it is better readable for them...

3. The authors of cosmetic changes will not learn much by this.
   Also it will also not help much to gain any reputation.

Best Regards,
Petr
