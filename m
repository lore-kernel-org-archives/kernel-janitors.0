Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C0AC77B75
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 May 2023 09:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbjESJwg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 May 2023 05:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjESJwf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 May 2023 05:52:35 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE2CE73
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 02:52:31 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f4ad71b00eso19100275e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 May 2023 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684489949; x=1687081949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPfHgNrM5MlvjCqiw/HF/XoF5b8L8wEkySYl5W6Wv6A=;
        b=PbDuiE6XmzMOq1wshTaKBVsBOYDYUmiGyFedMSL3K4n1b3KwigeY+TLFkUfwDMAZa2
         LAp5QBUHZH9nx1GNiVTKvoIt3ldbmnWpNtGlnD9L2X24fokUoGORST5rcrktwnVWWloh
         DVy5RBHYLjTruCWj42f8kIiLDrbUzU6jJd6AD0I4nWS5QhxwpUcP7wA2+c8F2wtXaP0i
         N1OebklRd2Ww60kYPs5NztO9i6Rm/yNcKDL3l6cBe4wK+qitSKs0wbx3vRodSMOS5Reo
         +cuZ54IbrN6ZRnHKNhkhST7Mo/zV8qQwzAokTdhcizRjvtpRO5JZK/ViEBv4R1eOpOeY
         6PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684489949; x=1687081949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPfHgNrM5MlvjCqiw/HF/XoF5b8L8wEkySYl5W6Wv6A=;
        b=MExxGzS+iwVhSohxEn0w6iisFt1CqO34IT84BqWidpP9nxdirvjWEL7/cu3Yiv/XzY
         k8ujiSGv9MTZPBIuaZTEa8BbxJDCPjg8QApc6rBFgOp591bXXlMaa9NI1hpcLRePNRb4
         4RW4rLWvaaQz32zQhwOMHVXHYT72qH0TNk0bc6H5tq2DYxlWMy0iYCRzt18FUcHfOf2u
         qIEvhf2NPe1SzD4LVbZcdno2A7ZSdsSeaDWcEfh2v92V7YuQ9CNtH5ClJdbxOo/3zGgu
         4toBkB1ODMQpgamTqVrnO4Z3ozgzpfTuk/are2DUpmiNHT1JUvPd75jw3OHxn2BZu0OR
         m7/w==
X-Gm-Message-State: AC+VfDx4J7HzUW99faug8zlNxpvw8LlrHQALNmSWeYfY0ERl6mreBFuy
        kQXRgPz4ZLKCkJBRNhFQwJeX3gSmtmBwFF45gRk=
X-Google-Smtp-Source: ACHHUZ5BDX+33LpPim0FnLDibDfS5ZQCg0PA5JaT7KujpbF8lYIWS/dS834pgmcgMwTZNEsnX6Q/hQ==
X-Received: by 2002:a05:600c:ac7:b0:3f5:1980:ad43 with SMTP id c7-20020a05600c0ac700b003f51980ad43mr849004wmr.31.1684489949316;
        Fri, 19 May 2023 02:52:29 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id z24-20020a05600c221800b003f31d44f0cbsm1802892wml.29.2023.05.19.02.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 02:52:28 -0700 (PDT)
Message-ID: <f47b17c1-1c02-2aa3-ba10-fcef70cb25a8@linaro.org>
Date:   Fri, 19 May 2023 10:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] misc: fastrpc: Fix double free of 'buf' in error path
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Sukrut Bellary <sukrut.bellary@linux.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230518100829.515143-1-sukrut.bellary@linux.com>
 <9194ebdf-f335-4cd6-bf89-bb4f86a57784@kili.mountain>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <9194ebdf-f335-4cd6-bf89-bb4f86a57784@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 18/05/2023 11:55, Dan Carpenter wrote:
> On Thu, May 18, 2023 at 03:08:29AM -0700, Sukrut Bellary wrote:
>> smatch warning:
>> drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
>>
>> In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
>> fastrpc_req_munmap_impl() if unmap is successful.
>>
>> But in the end, there is an unconditional call to fastrpc_buf_free().
>> So the above case triggers the double free of fastrpc buf.
>>
>> Fix this by avoiding the call to the second fastrpc_buf_free() if
>> fastrpc_req_munmap_impl() is successful.
>> 'err' is not updated as it needs to retain the err returned by
>> qcom_scm_assign_mem(), which is the starting point of this error path.
>>
>> This is based on static analysis only. Compilation tested.
> 
> Please don't put this in the commit message.  We want everyone reading
> the git log to believe everything is 100% rock solid.  :P
> 
> We need a Fixes tag.
> Fixes: 72fa6f7820c4 ("misc: fastrpc: Rework fastrpc_req_munmap")
> 
> Let's add Abel to the CC list.
> 
>>
>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
>> ---
>    ^^^
> Put testing caveats here instead, where it will be removed from the
> git log.
> 
>>   drivers/misc/fastrpc.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index f48466960f1b..1c3ab78f274f 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1921,7 +1921,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>   	return 0;
>>   
>>   err_assign:
>> -	fastrpc_req_munmap_impl(fl, buf);
>> +	if (!fastrpc_req_munmap_impl(fl, buf)) {
>> +		/* buf is freed */
>> +		return err;
>> +	}
>>   err_invoke:
>>   	fastrpc_buf_free(buf);

how about doing something like this:

----------------------->cut<---------------------------
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f60bbf99485c..3fdd326e1ae8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1891,7 +1891,8 @@ static int fastrpc_req_mmap(struct fastrpc_user 
*fl, char __user *argp)
                                       &args[0]);
         if (err) {
                 dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
-               goto err_invoke;
+               fastrpc_buf_free(buf);
+               return err;
         }

         /* update the buffer to be able to deallocate the memory on the 
DSP */
@@ -1930,11 +1931,7 @@ static int fastrpc_req_mmap(struct fastrpc_user 
*fl, char __user *argp)
         return 0;

  err_assign:
-       fastrpc_req_munmap_impl(fl, buf);
-err_invoke:
-       fastrpc_buf_free(buf);
-
-       return err;
+       return fastrpc_req_munmap_impl(fl, buf);
  }
----------------------->cut<---------------------------

> 
> This bug is real but the fix is not complete.
> 
Yes, there is a danger of freeing the buf while its added to the list.

Above change should address that, in err cases fd close should take care 
of deleting list and freeing buf.

--srini
> drivers/misc/fastrpc.c
>    1911                  if (err) {
>    1912                          dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
>    1913                                          buf->phys, buf->size, err);
>    1914                          goto err_assign;
>    1915                  }
>    1916          }
>    1917
>    1918          spin_lock(&fl->lock);
>    1919          list_add_tail(&buf->node, &fl->mmaps);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> buf needs to be removed from the list before we free it, otherwise it
> leads to a use after free.  The fastrpc_req_munmap_impl() function does
> that but here this function just calls fastrpc_buf_free().
> 
>    1920          spin_unlock(&fl->lock);
>    1921
>    1922          if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>    1923                  err = -EFAULT;
>    1924                  goto err_assign;
>    1925          }
>    1926
>    1927          dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>    1928                  buf->raddr, buf->size);
>    1929
>    1930          return 0;
>    1931
>    1932  err_assign:
>    1933          fastrpc_req_munmap_impl(fl, buf);
>    1934  err_invoke:
>    1935          fastrpc_buf_free(buf);
>    1936
>    1937          return err;
>    1938  }
> 
> regards,
> dan carpenter
