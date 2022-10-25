Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA167C38A2D
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Oct 2022 17:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbiJYR3D (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Oct 2022 13:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbiJYR24 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Oct 2022 13:28:56 -0400
X-Greylist: delayed 1199 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Oct 2022 10:28:53 PDT
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net [46.105.79.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C200A1C92F
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Oct 2022 10:28:53 -0700 (PDT)
Received: from player760.ha.ovh.net (unknown [10.111.172.191])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id AEF5D251F1
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Oct 2022 16:51:33 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player760.ha.ovh.net (Postfix) with ESMTPSA id ACD8A3018BD99;
        Tue, 25 Oct 2022 16:51:26 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G002079fbee7-fcb3-42b0-9bc4-f38ab5b5d69a,
                    286C50AC0CAD31655747B25CE1A8824521F2DE70) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <79bcbfcb-cc9e-3293-0838-b912b858908a@milecki.pl>
Date:   Tue, 25 Oct 2022 18:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized
 variable bug
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <Y1gCALFWXYYwqV1P@kili>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <Y1gCALFWXYYwqV1P@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1447062855393782651
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepueeltedugfekveffgfegffevveeluedtkeekjeeukeevveethffhgeevgeeghfdunecukfhppeduvdejrddtrddtrddupdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 25.10.2022 17:34, Dan Carpenter wrote:
> On 64 bit systems, the highest 32 bits of the "offset" variable are
> not initialized.  Also the existing code is not endian safe (it will
> fail on big endian systems).  Change the type of "offset" to a u32.
> 
> Fixes: aec4d5f5ffd0 ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Rafał Miłecki <rafal@milecki.pl>

Thanks


> ---
>   drivers/mtd/parsers/tplink_safeloader.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
> index 23584a477391..f601e7bd8627 100644
> --- a/drivers/mtd/parsers/tplink_safeloader.c
> +++ b/drivers/mtd/parsers/tplink_safeloader.c
> @@ -23,8 +23,8 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
>   	struct safeloader_cmn_header hdr;
>   	struct device_node *np;
>   	size_t bytes_read;
> -	size_t offset;
>   	size_t size;
> +	u32 offset;
>   	char *buf;
>   	int err;
>   
> @@ -34,14 +34,14 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
>   	else
>   		np = of_get_child_by_name(np, "partitions");
>   
> -	if (of_property_read_u32(np, "partitions-table-offset", (u32 *)&offset)) {
> +	if (of_property_read_u32(np, "partitions-table-offset", &offset)) {
>   		pr_err("Failed to get partitions table offset\n");
>   		goto err_put;
>   	}
>   
>   	err = mtd_read(mtd, offset, sizeof(hdr), &bytes_read, (uint8_t *)&hdr);
>   	if (err && !mtd_is_bitflip(err)) {
> -		pr_err("Failed to read from %s at 0x%zx\n", mtd->name, offset);
> +		pr_err("Failed to read from %s at 0x%x\n", mtd->name, offset);
>   		goto err_put;
>   	}
>   
