Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB44C43217
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jan 2022 22:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380852AbiAXWEd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jan 2022 17:04:33 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:24581 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1456179AbiAXViC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jan 2022 16:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1643060280; x=1674596280;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F5+3j67uXN7JHs5qyLjKKTxi4sf5b94dbve5GHxpSjU=;
  b=nb83fhyLsr15J7delOVkpNZQdHAuSVmSxo2xBGXltAu3awjZX4Mdrmqu
   VtjZYUtUfTImMgEH/o2vahA5z2hztO2cARDM+libRaxbOImiTkRtNwJXq
   5MMTd9eCL5Zg6T1feFP77mG55d8WUVLe6X5VD0pD8Fth8ex84kS03n4Uf
   lp0Zw015a4h9ozlSH4MtQXDvJ8Q61e6SErZ4sigAw2963ROGzbzgrTgWi
   Tfj/EDBDuqv08XoQ6q0RcqtcGZJqc2hXFCRp5rmnrs3kp3g3TKd5rYytt
   /hJoByMIEI7M58csdIO9gRDFIti6o86WxFs99AUZ8dQbHUsDaXVyRoY7R
   g==;
X-IronPort-AV: E=Sophos;i="5.88,313,1635177600"; 
   d="scan'208";a="191259203"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 25 Jan 2022 05:37:58 +0800
IronPort-SDR: Sq3IVdlg0K7Kj8tHHZxncV2RVU442AmPGKIaCsgv9xEsaY1/tP0EGArqac0e39srHPgyQqSdMf
 Q1MnV1FwWwY4ooLTn2qqRzSg4Kt23VINT46/RFlCwPWDxgKjUXEduygC/sBAkVk4gVI9QnJWHm
 hXK51q0iBkiORD7biqLZRGequeuWF/Zb809jCaN9LoKD+jkoV2rz/Xn+55nEelvaJBMQcceu6o
 sHjwP6RNk+7HyIIEgzg9R3cRqXFr8nDUZA0S6idiwI+gvc/w2CJtx+Fjz+rlFyGa9GnVoAU5kI
 mpMTV7XSvCa6PZImjD2cd0ou
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 13:10:07 -0800
IronPort-SDR: 0t13Os4MTklCQtNVcqGvuwpjjVAtsuyHUHXyv27Gz4bkvU2dMVY+lV8KrCTxXaaeIcLBp8Blxg
 MXolkD5Q7ndn3R96/kKJQyqpTQyYFbqsaPn/dAXg0IeXpXEa3e25zrChoyBZowLDmpRDf0bQ81
 qRwTC087ZyxNgqMfXmwJtzSsFb8acEpFhuNIebXSud8sHr7PlTksi8dqsisu/Yn9VZ5HXbtL30
 Rp2Hgfqpb4WncnBQeh7SPRKnAoHPeC5OclsYUMgxqt8wXgl6P5L5Kp+fHpy5GhOeslbtvl2pUP
 RGA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 13:38:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JjNd35PVxz1Rwrw
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jan 2022 13:37:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1643060279; x=1645652280; bh=F5+3j67uXN7JHs5qyLjKKTxi4sf5b94dbve
        5GHxpSjU=; b=BCIpsK7p2fvT9O3TOFaD7RR+29qeA7JgABlnyi36h6z+9w5qCix
        +Y4+YPw8NpKLcWBwEW/miApDhbY8uBtmY0fXRTlq0Q/458R8cCPpmTr12RnZi9Cb
        h7uu2AOtBLxiz57YqdxdQCjG6YD7T3NCKhDkgPJZ3EvBeg89u0YVvgniddFXAY48
        IZKTzbl5qN/+8vCQ+Dcl9823srXhvzjd5HM2eZ3caJpePR2f517dbp3YRKBiWpeD
        ohAHDDQuDsUMsRZEOwtXsZMc9sepAJ+XDWpHJmuIM7ZR5vJg0RLo2LFEaqTHftB6
        S7Mq2fFeHqxWHdxWTfSl6W341wvwnjXXM+A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 8408wzP-6PU5 for <kernel-janitors@vger.kernel.org>;
        Mon, 24 Jan 2022 13:37:59 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JjNd23HlQz1RvlN;
        Mon, 24 Jan 2022 13:37:58 -0800 (PST)
Message-ID: <9a4c9ba0-00a3-eb1d-8cdd-f44d94f7c92a@opensource.wdc.com>
Date:   Tue, 25 Jan 2022 06:37:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] ata: pata_pdc202xx_old: make make static read-only array
 pio_timing const
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Colin Ian King <colin.i.king@gmail.com>,
        linux-ide@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
References: <20220123222246.5801-1-colin.i.king@gmail.com>
 <312af033-20f0-0288-94cc-e3fc9dd5d6b0@omp.ru>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <312af033-20f0-0288-94cc-e3fc9dd5d6b0@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2022/01/25 2:15, Sergey Shtylyov wrote:
> Hello!
> 
>    Too many verbs in the subject. :-)

Yep. I will fix that when applying. No need to resend !

> 
> On 1/24/22 1:22 AM, Colin Ian King wrote:
> 
>> The static array pio_timing is read-only so it make sense to make
>> it const.
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
>    With that fixed:
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Thanks for the review.

> 
> [...]
> 
> MBR, Sergey


-- 
Damien Le Moal
Western Digital Research
