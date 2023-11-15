Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VKsHDqAZ"
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC451A1
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 13:26:51 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc316ccc38so1365455ad.1
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 13:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700083611; x=1700688411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPVyRrN1uRZs7Wz4idyzDBpkXVrVgQKZvwp5LF85yFM=;
        b=VKsHDqAZgBJA/hD42MObdrmrNLDkPQWr+5eDeZeDc7A0c7CIgEOSH5xS+orPGkaH05
         GPEbYOcftgTW/Bebwva9UDF0hc2oP6pZmFD8QzHqkPVmBzCxImJSlygYF/gJk+zJkByo
         9F49L9vpQhd4M3OpsEdS802A3AoC2NKaT7S+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700083611; x=1700688411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPVyRrN1uRZs7Wz4idyzDBpkXVrVgQKZvwp5LF85yFM=;
        b=Zpg3TygSjwG3iIyBSSrUObNzmRFL8gGqqoeHPpUWvef2O3F66w4dkKi4HdWhm5gZgs
         K/2mlAWqmO23wsce1F/Ato2/fmONZbEAPu9Nt6WNnFmBS2HCwrYnzARpfmkoXBDw82Wp
         FLmmZDsHJaIaC2RpuGlaAwIYCMYezuZjVi1Klcsmg65SQthSURmabP/LJ4lTwFejSQsZ
         yB8jHQb+3WNdH7KwGSMTxKgiW+3vTBba/smql7HbqUgHTuaMQjtGZIWEkIq5TMw+aYKl
         6rn3wp+ggaEhfR36GgSVvjPS1KBBAJlDR4NCLnC9tKdaDmboBPyCAerfJhAfoBnilTM4
         54iA==
X-Gm-Message-State: AOJu0Yzv7yUik7Amuf5FzTRwCh2ABFHMzOi2Bk8l8+wy+RRkKTAwGh0R
	JxzCb7Y81n++Q5L3ostLm4Grdw==
X-Google-Smtp-Source: AGHT+IFRKVgCfEa6Z+5pQ2Y0fxgccYlOkaOEmT5jf2DSAM02NTazA4S/MQNc/T6ApIjdrff/U85aKA==
X-Received: by 2002:a17:902:6b03:b0:1cc:40a4:9179 with SMTP id o3-20020a1709026b0300b001cc40a49179mr5793617plk.34.1700083610553;
        Wed, 15 Nov 2023 13:26:50 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:ff48:d9fc:165e:3caa])
        by smtp.gmail.com with UTF8SMTPSA id a13-20020a170902b58d00b001c61acd5bd2sm7808729pls.112.2023.11.15.13.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 13:26:50 -0800 (PST)
Date: Wed, 15 Nov 2023 13:26:48 -0800
From: Brian Norris <briannorris@chromium.org>
To: Su Hui <suhui@nfschina.com>
Cc: kvalo@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, lukas@wunner.de, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mwifiex: remove some useless code
Message-ID: <ZVU3mGzR_759WYAW@google.com>
References: <20231115092328.1048103-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115092328.1048103-1-suhui@nfschina.com>

On Wed, Nov 15, 2023 at 05:23:29PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'priv' is never read.
> 'priv' is useless, so remove it to save space.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/net/wireless/marvell/mwifiex/cmdevt.c | 8 --------
>  1 file changed, 8 deletions(-)

Acked-by: Brian Norris <briannorris@chromium.org>
