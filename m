Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FB011A;
	Mon, 20 Nov 2023 05:50:54 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3316db2c5c0so654881f8f.1;
        Mon, 20 Nov 2023 05:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488252; x=1701093052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=q4AE2CYzZOYoaZTSxWRa+ZWriZbj3J1cJf7dZsJpnN0FbPqaaGIFsvAxWnWJpyGQ6P
         AnqmKKqY8gMozfJOegoXfcU1gaDUi6cId10yq2v4CGUPxKAiSKPVyFp7F1SiUjGUafJZ
         eXHx31Z3jbLs9aMKVdAktGCcXk4fruIFgrtdMhHUJLGJcwIbpDRS0Sc3IjpEPLju6joW
         vKRsTU6qQUBXN+UksHgIB3rerFuU+GpuwX15EW6Bfg72wGyHcgSYsbeVd6C9DpDrA9eP
         nB7+TI9XKupiOLNBou3AiX7VbNVBoFrgtAtH21rgdXxA1yF3Snx7uwbyUKGwuUoP682L
         XQnQ==
X-Gm-Message-State: AOJu0Yzms+OFNTOc+cT0+LG8tKVFz/VOWn9wpz9q5t9b8XnMYfG+yy/g
	Pv0nIFn2QHzL6lhkFEDsrE0=
X-Google-Smtp-Source: AGHT+IHLPSueabiNz08RB5dCfgXFcSkq8b0MpGhtZO3fnKbRcNl/36SqwGMo819CZXRVkfeyAEMycQ==
X-Received: by 2002:a5d:5587:0:b0:32d:e445:a663 with SMTP id i7-20020a5d5587000000b0032de445a663mr5072463wrv.2.1700488252359;
        Mon, 20 Nov 2023 05:50:52 -0800 (PST)
Received: from [192.168.64.177] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d4c92000000b00331424a1266sm11249805wrs.84.2023.11.20.05.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 05:50:52 -0800 (PST)
Message-ID: <54cecdb8-22e1-4c90-929c-da9405ec3826@grimberg.me>
Date: Mon, 20 Nov 2023 15:50:50 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-tcp: Fix a memory leak
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
