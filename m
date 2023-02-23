Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F443C61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 11:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbjBWLBH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Feb 2023 06:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbjBWLBF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Feb 2023 06:01:05 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2786054575
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 03:00:53 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h3so4400838lja.12
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBV6IRrxN3VN/ZSA66sX61wGKkCduWkockhozT33+KY=;
        b=kULhLw5XJhLHorFyD2DI1dHE5EQnm7h5ebqAmoBQMMruYW7UZ0v1k6LWzQvqCVds8P
         +cUqsoKmZAVBTI0y1cQ/aV0AuG0necYW8TWFHirFrDmPePhY/aVtfPz8zTpmxwULe1Sp
         Rz76asPLFRberyvvl0VFJ0Z59u92IYhgLLKhhwqjrHrRBTmY4lBN1+tXS1mhjXIndcgG
         9kSIzUq7S3qtTH6lOC8HPOf1CsPC3bVIbY/xjYp23E427ri2xCY6ugCGsSv0z8Kx2s0C
         vNx7RJD/5i5n+MaYUEaug3kUsVJ7dFCKdK5Pg8B3lluZ8DTDRcMcKfN76rUtdPg72Te3
         tVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBV6IRrxN3VN/ZSA66sX61wGKkCduWkockhozT33+KY=;
        b=XNnbEo90JQthcZKo3NnITHb5fRejCy3m9j9ufbWNJaGtzwFoDIfm4f4Y1bK3R9g7jX
         7n1FKcAtHGX3IR6dUoRLEVofXe+i2TrnKyDObgoTcAT6tGs6M5hvNd08mfRnJ6Bqyb/Z
         YLs6T/coTQExhy4wYWdJGu84bmaiAG7B1fBTApr26/jh1vVvDGOuHVO71X126DoWqoqU
         BHztCrE10XgP36WPis8Y4i6BXwJyJo/gEA6bCYgyrx4MkF2haC1pb2bdKBLh4mZ5LR4x
         /rFE0jR01FttCxzsC3VnAVwtxTwW4rAFufoR9ageUtZhQE+dxZWaBAK3A04NlSGHkeoB
         rBCA==
X-Gm-Message-State: AO0yUKXYCqCxUBDNRus6RS+1lIQtivHpqWlaodCVLwHOoJ9cSgpzzBJd
        3BIIJC8ldb2WwwQbxx/7qMU=
X-Google-Smtp-Source: AK7set8aekDIrj+ytho5X2EyBUJ2VE99LYwnTeorFs69a07rWd7tncQNMxeHahZ0hstu4TBFSfq4Vg==
X-Received: by 2002:a2e:a58c:0:b0:295:a2ae:c6f4 with SMTP id m12-20020a2ea58c000000b00295a2aec6f4mr14706ljp.28.1677150051106;
        Thu, 23 Feb 2023 03:00:51 -0800 (PST)
Received: from ?IPV6:2a00:1370:8180:6b00:a1a8:4887:1af4:637a? ([2a00:1370:8180:6b00:a1a8:4887:1af4:637a])
        by smtp.gmail.com with ESMTPSA id v1-20020a197401000000b004cb430b5b38sm571246lfe.185.2023.02.23.03.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 03:00:50 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------3Ov3d5LhmafcI0n0y0IXb9gu"
Message-ID: <62e57016-c3e3-795c-afa2-8bbdb8071db6@gmail.com>
Date:   Thu, 23 Feb 2023 14:00:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] staging: r8188eu: fix a potential integer underflow bug
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Phillip Potter <phil@philpotter.co.uk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Deepak R Varma <drv@mailo.com>,
        Charlie Sands <sandsch@northvilleschools.net>,
        Mahak Gupta <mahak_g@cs.iitr.ac.in>,
        Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <Y/YfzZeFCAPiZ6RV@kili>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <Y/YfzZeFCAPiZ6RV@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------3Ov3d5LhmafcI0n0y0IXb9gu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

Dan Carpenter <error27@gmail.com> says:
> Here the code is testing to see if skb->len meets a minimum size
> requirement.  However if skb->len is very small then the ETH_HLEN
> subtraction will result in a negative which is then type promoted
> to an unsigned int and the condition will be true.
> 
> Generally, when you have an untrusted variable like skb->len, you
> should move all the math to the other side of the comparison.
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Compile tested only.  This is basic algebra of moving parts of the
> equation from one side to the other and I am surprisingly bad at
> something that I was supposed to have learned in 9th grade.
> 
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a7c67014dde0..f49e32c33372 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -538,7 +538,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>   		/*------------------------------------------------*/
>   		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
>   
> -		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
> +		if (skb->len <= sizeof(*iph) + ETH_HLEN)
>   			return -1;


Thanks for the patch!

I am wondering, if it make sense to use generic skb APIs which will do 
error handling for us?

Like following (not even build-tested tho)



With regards,
Pavel Skripkin
--------------3Ov3d5LhmafcI0n0y0IXb9gu
Content-Type: text/plain; charset=UTF-8; name="ph1"
Content-Disposition: attachment; filename="ph1"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X2JyX2V4dC5j
IGIvZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvY29yZS9ydHdfYnJfZXh0LmMKaW5kZXggYTdj
NjcwMTRkZGUwLi44ZjVmMmVmMjYwNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9y
ODE4OGV1L2NvcmUvcnR3X2JyX2V4dC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9yODE4OGV1
L2NvcmUvcnR3X2JyX2V4dC5jCkBAIC01MzYsMjYgKzUzNiwyOSBAQCBpbnQgbmF0MjVfZGJf
aGFuZGxlKHN0cnVjdCBhZGFwdGVyICpwcml2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBpbnQg
bWV0aG9kKQogCQkvKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSovCiAJCS8qICAgICAgICAgSGFuZGxlIElQVjYgZnJhbWUJCQkgICovCiAJCS8q
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8KLQkJ
c3RydWN0IGlwdjZoZHIgKmlwaCA9IChzdHJ1Y3QgaXB2NmhkciAqKShza2ItPmRhdGEgKyBF
VEhfSExFTik7CisJCXU4IGhlYWRlciAqaCA9IHNrYi0+ZGF0YTsKKwkJc3RydWN0IGlwdjZo
ZHIgKmlwaCA9IHNrYl9wdWxsKHNrYiwgRVRIX0hMRU4pOwogCi0JCWlmIChzaXplb2YoKmlw
aCkgPj0gKHNrYi0+bGVuIC0gRVRIX0hMRU4pKQorCQlpZiAoIWlwaCkKIAkJCXJldHVybiAt
MTsKIAogCQlzd2l0Y2ggKG1ldGhvZCkgewogCQljYXNlIE5BVDI1X0NIRUNLOgotCQkJaWYg
KHNrYi0+ZGF0YVswXSAmIDEpCisJCQlpZiAoaFswXSAmIDEpCiAJCQkJcmV0dXJuIDA7CiAJ
CQlyZXR1cm4gLTE7CiAJCWNhc2UgTkFUMjVfSU5TRVJUOgogCQkJaWYgKG1lbWNtcCgmaXBo
LT5zYWRkciwgIlx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4MFx4
MFx4MCIsIDE2KSkgewogCQkJCV9fbmF0MjVfZ2VuZXJhdGVfaXB2Nl9uZXR3b3JrX2FkZHIo
YWRkciwgKHVuc2lnbmVkIGludCAqKSZpcGgtPnNhZGRyKTsKLQkJCQlfX25hdDI1X2RiX25l
dHdvcmtfaW5zZXJ0KHByaXYsIHNrYi0+ZGF0YSArIEVUSF9BTEVOLCBhZGRyKTsKKwkJCQlf
X25hdDI1X2RiX25ldHdvcmtfaW5zZXJ0KHByaXYsICh2b2lkICopaXBoLCBhZGRyKTsKKwor
CQkJCWlmIChpcGgtPm5leHRoZHIgPT0gSVBQUk9UT19JQ01QVjYpIHsKKwkJCQkJc3RydWN0
IGlwdjZoZHIgKmhkciA9IHNrYl9wdWxsKHNrYiwgc2l6ZW9mKCppcGgpKTsKKworCQkJCQlp
ZiAoIWlwaCkKKwkJCQkJCXJldHVybiAwOwogCi0JCQkJaWYgKGlwaC0+bmV4dGhkciA9PSBJ
UFBST1RPX0lDTVBWNiAmJgotCQkJCQkJc2tiLT5sZW4gPiAoRVRIX0hMRU4gKyAgc2l6ZW9m
KCppcGgpICsgNCkpIHsKLQkJCQkJaWYgKHVwZGF0ZV9uZF9saW5rX2xheWVyX2FkZHIoc2ti
LT5kYXRhICsgRVRIX0hMRU4gKyBzaXplb2YoKmlwaCksCi0JCQkJCQkJCSAgICAgIHNrYi0+
bGVuIC0gRVRIX0hMRU4gLSBzaXplb2YoKmlwaCksIEdFVF9NWV9IV0FERFIocHJpdikpKSB7
Ci0JCQkJCQlzdHJ1Y3QgaWNtcDZoZHIgICpoZHIgPSAoc3RydWN0IGljbXA2aGRyICopKHNr
Yi0+ZGF0YSArIEVUSF9ITEVOICsgc2l6ZW9mKCppcGgpKTsKKwkJCQkJaWYgKHVwZGF0ZV9u
ZF9saW5rX2xheWVyX2FkZHIoaGRyLCBza2JfbGVuKHNrYiksIEdFVF9NWV9IV0FERFIocHJp
dikpKSB7CiAJCQkJCQloZHItPmljbXA2X2Nrc3VtID0gMDsKIAkJCQkJCWhkci0+aWNtcDZf
Y2tzdW0gPSBjc3VtX2lwdjZfbWFnaWMoJmlwaC0+c2FkZHIsICZpcGgtPmRhZGRyLAogCQkJ
CQkJCQkJCWJlMTZfdG9fY3B1KGlwaC0+cGF5bG9hZF9sZW4pLAo=

--------------3Ov3d5LhmafcI0n0y0IXb9gu--
