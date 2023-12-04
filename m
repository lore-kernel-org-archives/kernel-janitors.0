Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImfEshpV"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7B8D7
	for <kernel-janitors@vger.kernel.org>; Sun,  3 Dec 2023 23:37:11 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c09d62b70so10270315e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Dec 2023 23:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701675429; x=1702280229; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWQaFaPURZfKo4DnByfKYjDmLXxFeENVHoNHZWRHRNk=;
        b=ImfEshpVdq+BlLvBWqVN0dSGNp7AnyoWnjEpTEohn1QsYRpJd90+FMxxqorbPxCwkn
         xc534z0ypoZo6MvAJRhhTBI4F3JwmsIE5eaIrd+5izXITmJCwDOrZy2LXCxnEKBCkP2X
         1kG/8QWi3vrnkx53ppG1G1d9Y1dGOwx/v6mdl2rt9XeQerXD3ZMSLY4xvcKykzXVeGaR
         QcnwVW2Dh5aYGohgkATcyxATlxnjz8C5Kv4bjVhFZ8Hs1ODHZKCh9w9TANYUBAhB4Ivt
         wpRMHT+gKNf32Fy8jzkg54ncrNrFc/CViGpxa3MP6Aw+VcEUas+3LvKdhhT/dbOkj8oU
         Omuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701675429; x=1702280229;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWQaFaPURZfKo4DnByfKYjDmLXxFeENVHoNHZWRHRNk=;
        b=GrVZw+wIzdexgf6NQ04TZvibtwEXciCk//ZlLc/5+Xate5ZruccvlPJg7YAzLJSZF6
         8YAWBebVnzd8jCuDBZwHbm4B84y30JUZfUIa/9wH9wydmOm9p+CPCSs5LsdNiBcsDJ9f
         RZxc7RiVa0W6u/+esRWA4Y0o02uj0mTA5z/T76P+noscKN4WBjwXue/bEOojTKMyrcSv
         YNLWRLEK71HNBYwpg8ErGODuv4V74P3nLTh6epzxS+ZRhLc49gKhA+gY42rchCX+O/xI
         tUFtRh7m0DFhckl1jkzmpdURFKBpcIHLGwuSWJvKghtZsTxr6DRMN/c6Bwtz0c+xctc4
         9C+w==
X-Gm-Message-State: AOJu0Yx9vazZ9oLKB72OghjLwGkqLqq1mUo29xTeBDA7R8ljB3T99C4k
	iWPmySIIDl4S8L0qroZXhIQmig==
X-Google-Smtp-Source: AGHT+IHnVBhnjHjKG1BbFjAio5sJrfkXnGHKZuMpvorsOx9Xk4IXNJEZDSH5L6HNMB68UK21NV5XAg==
X-Received: by 2002:a7b:c5cb:0:b0:40b:5e59:99c8 with SMTP id n11-20020a7bc5cb000000b0040b5e5999c8mr1616736wmk.232.1701675429533;
        Sun, 03 Dec 2023 23:37:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e2-20020adf9bc2000000b003332fa77a0fsm8972192wrc.21.2023.12.03.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 23:37:09 -0800 (PST)
Date: Mon, 4 Dec 2023 10:37:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: graf@amazon.com
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] misc: Add Nitro Secure Module driver
Message-ID: <84b7cffa-0ff2-4802-a9bd-f38f59a63991@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexander Graf,

The patch b9873755a6c8: "misc: Add Nitro Secure Module driver" from
Oct 11, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/misc/nsm.c:137 cbor_object_get_array()
	warn: duplicate check 'cbor_object_size < array_offset' (previous on line 114)

drivers/misc/nsm.c
    97 static int cbor_object_get_array(u8 *cbor_object, size_t cbor_object_size, u8 **cbor_array)
    98 {
    99         u8 cbor_short_size;
    100         void *array_len_p;
    101         u64 array_len;
    102         u64 array_offset;
    103 
    104         if (!cbor_object_is_array(cbor_object, cbor_object_size))
    105                 return -EFAULT;
    106 
    107         cbor_short_size = (cbor_object[0] & 0x1F);
    108 
    109         /* Decoding byte array length */
    110         array_offset = CBOR_HEADER_SIZE_SHORT;
    111         if (cbor_short_size >= CBOR_LONG_SIZE_U8)
    112                 array_offset += BIT(cbor_short_size - CBOR_LONG_SIZE_U8);
    113 
    114         if (cbor_object_size < array_offset)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
checked here.

    115                 return -EFAULT;
    116 
    117         array_len_p = &cbor_object[1];
    118 
    119         switch (cbor_short_size) {
    120         case CBOR_SHORT_SIZE_MAX_VALUE: /* short encoding */
    121                 array_len = cbor_short_size;
    122                 break;
    123         case CBOR_LONG_SIZE_U8:
    124                 array_len = *(u8 *)array_len_p;
    125                 break;
    126         case CBOR_LONG_SIZE_U16:
    127                 array_len = be16_to_cpup((__be16 *)array_len_p);
    128                 break;
    129         case CBOR_LONG_SIZE_U32:
    130                 array_len = be32_to_cpup((__be32 *)array_len_p);
    131                 break;
    132         case CBOR_LONG_SIZE_U64:
    133                 array_len = be64_to_cpup((__be64 *)array_len_p);
    134                 break;
    135         }
    136 
--> 137         if (cbor_object_size < array_offset)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Checked again.

    138                 return -EFAULT;
    139 
    140         if (cbor_object_size - array_offset < array_len)
    141                 return -EFAULT;
    142 
    143         if (array_len > INT_MAX)
    144                 return -EFAULT;
    145 
    146         *cbor_array = cbor_object + array_offset;
    147         return array_len;
    148 }

regards,
dan carpenter
