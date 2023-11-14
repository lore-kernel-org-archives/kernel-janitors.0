Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C03399A
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="enhAjkLM"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B04193
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699965845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ix8jzUm8kKsvjeA/9wvH9vgqBJk06pyG8tZ3W2P8ymo=;
	b=enhAjkLMHrS+RJ9L6OMiKgc+wI/evEVIfgpymOAlMOfG1y5lu6g4TK6y4vhqUqFJ2FUdKk
	uyE2Zdx6Q7U6mufijr4SdS5dfinzvkq3kt6DVqv2hnb4WcwK+Z1m1IFSTmwiub2QlGCopo
	TdVTJhX6yy5eyimc9GS59d+7f4uLVoA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-yhyUFoEJMha2fXD_TouRMg-1; Tue, 14 Nov 2023 07:44:02 -0500
X-MC-Unique: yhyUFoEJMha2fXD_TouRMg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9d4b8735f48so392120666b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 04:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699965841; x=1700570641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix8jzUm8kKsvjeA/9wvH9vgqBJk06pyG8tZ3W2P8ymo=;
        b=jq0aH++drz0ROyHby2HXPBM5vDG7bBwvhJgniEaeeZQ+mvfYp+yMT4WS3afOfXSB24
         dGjUzV1FZidMgo8DosUKrXx7kGHmn0WcgiHJl7ayjEgTel7Ptt81aHulTZ5uT78vconP
         rXxMHrf0Bl9ZxBPlFm7pPWfYUkU6vHVTOiyoMKKJtV4kCZYyzWbwd08AfOoDNh0T8wis
         Ii9B4lDX9YDLysNFbxZKliDB4uZ5CJ7B6IuZGA71nG5M2H66Th3OBYuf/xxgCrbaKUXI
         aJZDSrAMNkcl994MXvS3CqwF4XWPSBw9WqewEVm3AzB496MRNANrn5OGFYcizFlL3ErD
         N+mw==
X-Gm-Message-State: AOJu0Yx1JK+MEaPHylYxStxzYv1z3ky53rmz5JUukPK/5OrhO/nlc3Pl
	qndFqxRULSRNrMsWAg3NBrMl3N2yG4jdFzmRoncevwP0TRdPowPFPP6j5xSsKhvysN+bENifXOM
	MzmbCKg3APZOLyLrbBaD0EJw7PPWG
X-Received: by 2002:a17:907:98e:b0:9ba:fe6:225 with SMTP id bf14-20020a170907098e00b009ba0fe60225mr8852202ejc.55.1699965841452;
        Tue, 14 Nov 2023 04:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiiu2pOUMDooVpl8+wE4QxGVP90caAP8s/9uHkOVMA0bdTVHsINaHFoVvuXKygRp4mX3y3/A==
X-Received: by 2002:a17:907:98e:b0:9ba:fe6:225 with SMTP id bf14-20020a170907098e00b009ba0fe60225mr8852191ejc.55.1699965841178;
        Tue, 14 Nov 2023 04:44:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906168400b009aa292a2df2sm5465278ejd.217.2023.11.14.04.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 04:44:00 -0800 (PST)
Message-ID: <b3d2f6aa-4dc4-4570-9c00-54b7211fb851@redhat.com>
Date: Tue, 14 Nov 2023 13:43:59 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] platform/x86: hp-bioscfg: Fix error handling in
 hp_add_other_attributes()
Content-Language: en-US, nl
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Mark Gross <markgross@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, vegard.nossum@oracle.com,
 kernel test robot <lkp@intel.com>
References: <20231113200742.3593548-1-harshit.m.mogalapalli@oracle.com>
 <20231113200742.3593548-3-harshit.m.mogalapalli@oracle.com>
 <36e7a170-bd87-4462-fc6b-eec446fbb551@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <36e7a170-bd87-4462-fc6b-eec446fbb551@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 11/14/23 11:31, Ilpo Järvinen wrote:
> On Mon, 13 Nov 2023, Harshit Mogalapalli wrote:
> 
>> 'attr_name_kobj' is allocated using kzalloc, but on all the error paths
>> it is not freed, hence we have a memory leak.
>>
>> Fix the error path before kobject_init_and_add() by adding kfree().
>>
>> kobject_put() must be always called after passing the object to
>> kobject_init_and_add(). Only the error path which is immediately next
>> to kobject_init_and_add() calls kobject_put() and not any other error
>> path after it.
>>
>> Fix the error handling after kobject_init_and_add() by moving the
>> kobject_put() into the goto label err_other_attr_init that is already
>> used by all the error paths after kobject_init_and_add().
>>
>> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Closes: https://lore.kernel.org/r/202309201412.on0VXJGo-lkp@intel.com/
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> ---
>> This is based on static analysis, only compile tested.
>>
>> v3->v4: Add more explicit statement on how we are fixing it, suggested
>> by Ilpo
> 
> Thanks a lot, this looks fine too now.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you for reviewing this series. I believe that it is best
to submit this as fixes for the current cycle.

Under the assumption that you agree with this I've delegated
these 4 patches to you (Ilpo) in patchwork.

Regards,

Hans


