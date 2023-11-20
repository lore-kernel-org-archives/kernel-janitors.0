Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880671709;
	Mon, 20 Nov 2023 05:52:42 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32f8246103cso1193133f8f.1;
        Mon, 20 Nov 2023 05:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488361; x=1701093161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxba1kYMA1eupI9Avrj6/S3g58MdFYbeVhsqFUI7604=;
        b=YFyemUCIgt4BDePZ2hWYh3NoYS4ly2fSqtuEcFwvxvFXco31YXyxR0mz/n6VbPHpdH
         PgEz9F8Gknhj2z0nI3MKQwWDFU/x2QE4AwZ0zqAynvWemL4D03brw8jZJmpjO2ZW+pxt
         CHUGr8LiqltPIhZe7gm4WT4+qoMls1M7m94T5CsPpslxwng0CrGwB7yh6yB5hvP3bcye
         Jh2KNRpzCRleZUA3Cbr//qWmMZSLyzo7upnk6L/ATM04JR7UTQsXJZuJ9ivYqI3l9t51
         UhZasYG3jtvITqRaWNklmSJVrh9DBeAteXeZZCclqiNIo77C/ylQ1+pjCLEN31kOpghC
         PrMg==
X-Gm-Message-State: AOJu0Yy/RG7pyvs1stVdjqox9Mrobou1Zf0YyyYcbPpM2pqnnwoIEq7Z
	BADzjFsiM9U/i+brPAiaZ9KPyyy1X6E=
X-Google-Smtp-Source: AGHT+IEy8NttNiWl2hs/0iIXCgz1D94GnYvZjoMwY7xOM9iulbhxahfrXi1Qdv8nCTj6zfHToFZGdQ==
X-Received: by 2002:adf:e7c3:0:b0:32d:d932:5848 with SMTP id e3-20020adfe7c3000000b0032dd9325848mr5111777wrn.2.1700488360967;
        Mon, 20 Nov 2023 05:52:40 -0800 (PST)
Received: from [192.168.64.177] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d4c92000000b00331424a1266sm11249805wrs.84.2023.11.20.05.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 05:52:40 -0800 (PST)
Message-ID: <3a304aea-23a3-4ac7-beca-f814624a466d@grimberg.me>
Date: Mon, 20 Nov 2023 15:52:39 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvme-tcp: Fix a memory leak
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org
References: <7f132cc47e627d63ddb084f3d0fcad10956d1e35.1698677322.git.christophe.jaillet@wanadoo.fr>
 <20231030145220.GA28484@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20231030145220.GA28484@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
>> Personally I prefer v1. Pick the one you prefer :)
> 
> I think we should be consistent with one style or another in a
> given function.  Otherwise I wouldn't even have mentioned it.

This looks good too:
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
