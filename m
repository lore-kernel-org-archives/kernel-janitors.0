Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53813C19F28
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Aug 2022 11:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235594AbiHCLNb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Aug 2022 07:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235819AbiHCLNa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Aug 2022 07:13:30 -0400
Received: from mail-sz.amlogic.com (mail-sz.amlogic.com [211.162.65.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1B418E0E
        for <kernel-janitors@vger.kernel.org>; Wed,  3 Aug 2022 04:13:28 -0700 (PDT)
Received: from [10.28.39.72] (10.28.39.72) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2507.6; Wed, 3 Aug 2022 19:13:26 +0800
Message-ID: <e954f248-614b-5f59-b6c3-13d67575c416@amlogic.com>
Date:   Wed, 3 Aug 2022 19:13:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: rawnand: meson: fix bit map use in
 meson_nfc_ecc_correct()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yixun Lan <yixun.lan@amlogic.com>,
        <linux-mtd@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <YuI2zF1hP65+LE7r@kili>
From:   Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <YuI2zF1hP65+LE7r@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.39.72]
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks.

On 2022/7/28 15:12, Dan Carpenter wrote:
> [ EXTERNAL EMAIL ]
> 
> The meson_nfc_ecc_correct() function accidentally does a right shift
> instead of a left shift so it only works for BIT(0).  Also use
> BIT_ULL() because "correct_bitmap" is a u64 and we want to avoid
> shift wrapping bugs.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>>From review.  Untested.
> 
>   drivers/mtd/nand/raw/meson_nand.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 829b76b303aa..ad2ffd0ca800 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -454,7 +454,7 @@ static int meson_nfc_ecc_correct(struct nand_chip *nand, u32 *bitflips,
>   		if (ECC_ERR_CNT(*info) != ECC_UNCORRECTABLE) {
>   			mtd->ecc_stats.corrected += ECC_ERR_CNT(*info);
>   			*bitflips = max_t(u32, *bitflips, ECC_ERR_CNT(*info));
> -			*correct_bitmap |= 1 >> i;
> +			*correct_bitmap |= BIT_ULL(i);
>   			continue;
>   		}
>   		if ((nand->options & NAND_NEED_SCRAMBLING) &&
> @@ -800,7 +800,7 @@ static int meson_nfc_read_page_hwecc(struct nand_chip *nand, u8 *buf,
>   			u8 *data = buf + i * ecc->size;
>   			u8 *oob = nand->oob_poi + i * (ecc->bytes + 2);
>   
> -			if (correct_bitmap & (1 << i))
> +			if (correct_bitmap & BIT_ULL(i))
>   				continue;
>   			ret = nand_check_erased_ecc_chunk(data,	ecc->size,
>   							  oob, ecc->bytes + 2,

Acked-by: Liang Yang <liang.yang@amlogic.com>

Thanks,
Liang
