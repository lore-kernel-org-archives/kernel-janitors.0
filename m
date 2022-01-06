Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB34FC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jan 2022 07:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236205AbiAFHtn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jan 2022 02:49:43 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:5604 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236198AbiAFHtm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jan 2022 02:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1641455382; x=1672991382;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2WDD+HaOLgup4B5fEQYLo+csY4qLmPnygvxXzcy18iQ=;
  b=OUficGyyNATVvETZflqH1X83WHSQPeDlyVeKFoutl94OC4VkqLtdvckN
   wrcaD/5hH/1J5j8C0ifRpRRAusha1TeW50QLahtNOJoZ2bjcgrqjBl8Do
   Fv+5m/cuTA/I4RfVqB6moEYtaszx0S3JHun/XWsmgSbXzlP9w6IPZ9nrZ
   TObxq/svfhUSuKfgfPbMbtLqHJjaIKjUrAtrsBD4lFZKE00KrMlnTIaos
   NCsUfMcilsNqRUNXqraTJ77RUTDW2yboF1tM/jBBhLrV+4ydI/U7JMxsS
   QvKLDld6Uqzkv6L4iwIPYk6V78ch4Vrc/ibGXbh2MEN/BYNYikjp8LQxx
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,266,1635177600"; 
   d="scan'208";a="188782112"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 15:49:36 +0800
IronPort-SDR: bO4XQF8/xxmNtULzXRPJVHnkV99Fnp+ea17+JhZgiMDeHXFUgWStzpnZK5PiWdkQy1D58CwDdb
 P90639W+JZFQ49ViDo4BJuPNS59xVOqGohud/LI2uhW9DMJrUXrnT9khW87qcYeuMwu/nt0+zB
 1b+VlzihLhkikHBM4Ktgv5hCiV2yksbHXvu99YaKuNIIOsNjcvJFgjUfl93dAbtlDOluvd9R8d
 oVkmThGuEN5jvE74xUiSlfVAKtUlxI7HIq42oyXTUdxCINj9U61svU3scHAHdSC22m10VdMngI
 HBS1FjWPqBz1GkgD2SAPVWBM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 23:22:06 -0800
IronPort-SDR: 08Hm5dPBcOjgT288qRSl7/nIz944WKrBNi+C6wbsO2NGAPGgkOeZ8zN8wSJBH6ixdQyBdhNGAi
 hi+a0y54D2qdA3Ajz7ui5uNy48gwUBznxyfSouZkQ4BFxiIsk+re+BKDkpDZthD6WZGP3Xbte5
 U+iJV3LR1RrPP14kv89PtaO03RxfqnS8R+6Z/gI5mXIPt9QcyYwreaEdJY8H7bD5PBnYcl1bAm
 Jd8O+80DEDE+kugOLFzJQKmQ52IU3gTdFJAbBig3FfQm/4z3ILnxgtPJDu+ncihJ1v1LLJWYMC
 Fhs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 23:49:37 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTz5X4GY8z1VSm2
        for <kernel-janitors@vger.kernel.org>; Wed,  5 Jan 2022 23:49:36 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1641455376; x=1644047377; bh=2WDD+HaOLgup4B5fEQYLo+csY4qLmPnygvx
        Xzcy18iQ=; b=uP4J5GAOC/i/fac34YK8PszLfeqTSzbT7NmYCFPHcJlXaqA2ro5
        xSWcvbMKn07EMVQFud+vxIR7gIiggdcg6x5Z5wM+zMV9LjIzRuSni+F7hcgJ+HM7
        h74Ws9HNuQQKlTld1chy3alkvaGYvvNQ1x0WJD77EOcz64TAgFcemtAuzTURrGgP
        ljCfBERpRsDYbTcC6kwvSfiTU/R5EnaBixBQUTjaWLPrpVbynujP52rpun+FgYWa
        6JsIOoViOVX1cyRbTWK3iJOO7DBe32qzojFz/pTFMfvSfUKeU4rcXpCgGijlPcjr
        dqXT0spSpjVeoMQxbTwfiat2/+jtzoLiSJQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id oTOZkwdBd77j for <kernel-janitors@vger.kernel.org>;
        Wed,  5 Jan 2022 23:49:36 -0800 (PST)
Received: from [10.225.163.43] (unknown [10.225.163.43])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTz5V0scwz1VSkV;
        Wed,  5 Jan 2022 23:49:33 -0800 (PST)
Message-ID: <974640be-a87e-5a46-3dcc-ba8dbf79c9cf@opensource.wdc.com>
Date:   Thu, 6 Jan 2022 16:49:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] null_blk: Use bitmap_zalloc() when applicable
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        axboe@kernel.dk, chaitanya.kulkarni@wdc.com, damien.lemoal@wdc.com,
        ming.lei@redhat.com, Johannes.Thumshirn@wdc.com,
        shinichiro.kawasaki@wdc.com, jiangguoqing@kylinos.cn,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <3e68598defed010efb864ea55887d88ed0da02cc.1640296433.git.christophe.jaillet@wanadoo.fr>
 <c60a1750-ccbb-1f7a-12be-ac331393be80@opensource.wdc.com>
 <20220106074423.GG7674@kadam>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220106074423.GG7674@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 1/6/22 16:44, Dan Carpenter wrote:
> On Thu, Dec 30, 2021 at 11:28:28AM +0900, Damien Le Moal wrote:
>>>  
>>> -	tag_size = ALIGN(nq->queue_depth, BITS_PER_LONG) / BITS_PER_LONG;
>>> -	nq->tag_map = kcalloc(tag_size, sizeof(unsigned long), GFP_KERNEL);
>>> +	nq->tag_map = bitmap_zalloc(nq->queue_depth, GFP_KERNEL);
>>>  	if (!nq->tag_map) {
>>>  		kfree(nq->cmds);
>>>  		return -ENOMEM;
>>
>> Before this patch, tag_size would always be a multiple of BITS_PER_LONG.
>> Using bitmap_zalloc(), that alignment goes away, but I think this is OK.
>>
> 
> It's still going to be a multiple of long.  Bitmaps are always stored
> in longs.

Yes, I understand that. I was referring to tag_size, which was rounded
before. But tag_size is only a local variable and not the actual queue
depth, which is not rounded. I got confused :)

> 
> regards,
> dan carpenter
> 


-- 
Damien Le Moal
Western Digital Research
