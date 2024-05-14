Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1BB17F397
	for <kernel-janitors@vger.kernel.org>; Tue, 14 May 2024 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715701152; cv=none; b=pzYRGomcb+NAhSaaIWVsHthzqot9hvdbKuU0C6SzXWLXKNpTF7dH2QI5IhHRrT3nvlK0VUTx5vvxajJ2iqgwgj8ZMBVnq9Ez8fnFILlhVvA2L9sUMy9axZEMorIDLfquNvpuyXhIPBdsBGSJFImOlRXABX7LVuAvstERPZgU4jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715701152; c=relaxed/simple;
	bh=iAbHNd7mgRq7oUO67Du6wjpeeQPoT8tIG4U0JNdY+v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTdPh4MPzeVjGo3TZTG7fTx9LZ8rVVxskvDzil7I/Ka6OeHHtU3/gnuVIH4a5eu8VYRtE0nbhPLINAQ/0aITZa8bCnT5Id4fO7iJ6NTgniGZRofK9vdjuxJW/gyYYmYb0SB0hpkmw21lmT5WPXHr3CvP9ICTHaSPkbx5W7JO3EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QEk1QxrB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QEk1QxrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715701149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbW4AqFrMaISOC2LX0H+2PlSbMomBOm3GeVdMfM6+Gc=;
	b=QEk1QxrBfAVq4Ri1ILLELuwLW1Ur4ht38Ssbn9WBb/zsqLL9jHJOft5M74GlVeZprHdnGy
	B0g29glpTOYs2Z2zuEg713/rD/esX9DpRGfDgnZwedygxQrb1RQCzpL0QflMvxlFRqtV5e
	d5tWYfO8PSeoIfUjktHfi9rMs2yfNcU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-z5Kh5iKXPxmRxz1bjJ0iBw-1; Tue, 14 May 2024 11:38:48 -0400
X-MC-Unique: z5Kh5iKXPxmRxz1bjJ0iBw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a5a8f3bc8e0so24310266b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 14 May 2024 08:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701126; x=1716305926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbW4AqFrMaISOC2LX0H+2PlSbMomBOm3GeVdMfM6+Gc=;
        b=LiymSCrZa2qnb2MUb2GE7bcKU1r/+F7xPKDut2eHToYAZRxuRH4dr7ZBbAy2mpmwE2
         86fBu1Dk3jmyPh2m6mLevJzTrGFwf7HMImpK4q70LoT1tjJckgpXd5O6vIK0FM9fBpNk
         v9WoUDwdHtKpveRCfY+5j/6wSi9082IzqIiJoOa3BJIS+sZzW2HUcYr0CRxsO5lS+ePj
         C6QPftwWYadILcO+9viGvn5kWOKVMK5rbjGZJWmJ9Gh66JReTAcdBzWjwGRcT/RwGOMm
         iMVVMFGWBqJwpDvgxnqXK+5P6Tq2fz4GTo4TZ+zmQ/knaPi2iQcAcMBgoAeFFAGdEh5k
         /EbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSmQJSVWNVtF5Z7jL+BS3r6VfnVej4VO3cTDmZmT8YSK2QlxwKbSlLALUlq969KmAFO487/09a1iPSf3l1f91Xt/Hs0aTi6YFWkAFOH9t
X-Gm-Message-State: AOJu0Yyz/ePhwZnl1JL/g18MG3gx83JEPX6KDV+JxdY+x1vSa7+Kw8CV
	P5TH2Ap0qNpOXHCCDJohFOZJbWD39wEJKgESpsCaQlYdBacWD5y6edubhHmuHLNQ8OPzA98oDDc
	jM5w8P5juGHeL/fqbCb7T0E7EM0MWYpgjJGSbkt5gx9cmjZV60AY7aba8E1M2LK2jFlJjkuicpA
	==
X-Received: by 2002:a17:906:8315:b0:a5a:d6c:a30b with SMTP id a640c23a62f3a-a5a2d65f265mr915834566b.58.1715701126604;
        Tue, 14 May 2024 08:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpzNVie/tGXiTgKB6/FpHbCOQeaspSL5sLUiSvss9/S6ulsnG3niwPgLtjnNrjiabiLgi7TA==
X-Received: by 2002:a17:906:8315:b0:a5a:d6c:a30b with SMTP id a640c23a62f3a-a5a2d65f265mr915833766b.58.1715701126281;
        Tue, 14 May 2024 08:38:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c80f4sm743539866b.142.2024.05.14.08.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 08:38:45 -0700 (PDT)
Message-ID: <d2d71851-691f-45cf-9d52-1d16ede09b2b@redhat.com>
Date: Tue, 14 May 2024 17:38:45 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Bingbu Cao <bingbu.cao@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
 <ZkN2Ow6hASmKvHlz@kekkonen.localdomain> <ZkOBaUW1uLw6ildS@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZkOBaUW1uLw6ildS@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/14/24 5:21 PM, Andy Shevchenko wrote:
> On Tue, May 14, 2024 at 02:33:31PM +0000, Sakari Ailus wrote:
>> On Fri, May 10, 2024 at 06:43:31PM +0300, Dan Carpenter wrote:
> 
> ...
> 
>> Neither IPU3-CIO2 or IPU6 ISYS drivers should be of any functional use
>> without sensors. But the power states of the devices could be affected by
>> this: the drivers should power off these devices but without drivers they
>> maybe left powered on. I haven't made any measurements though.
> 
> FWIW, Hans mentioned AtomISPv2 case with somewhat 7W consumption on top of
> the idling machine. That's why we have a stub driver in PDx86 exactly for
> the purpose of turning it off when not used.

I'm not sure if I ever mentioned the 7W, that seems a lot. But in
the atomisp case the SoC will never reach S0i3 when the ISP is not
properly turned off. And in this case the ISP is special and just letting
PCI / ACPI put it in D3 is not enough it needs some special writes on
the IO-Sideband-Fabric to be turned off.

I don't know if something similar applies to the IPU3 / IPU6, but
the bridge code is used by the atomisp code now too. So at a minimum
if an error gets returned when there are no sensors then this must be unique
enough that the atomisp code can check for it. Maybe -ENODEV ?

Regards,

Hans


