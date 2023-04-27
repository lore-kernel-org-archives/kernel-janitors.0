Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA8BC77B61
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Apr 2023 10:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243466AbjD0Ktc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Apr 2023 06:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243331AbjD0Ktb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Apr 2023 06:49:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5A4E58
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Apr 2023 03:49:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2627663A58
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Apr 2023 10:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C726C433EF;
        Thu, 27 Apr 2023 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682592569;
        bh=mZ637pIwP+hEJVynAj9nOIBw5mm+scLPmLJpx2zjsjc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=QRIdzbXmsdL6FQdK+9wYYQcXhxw5Xe0lbmN/BlZxBURoQ7gXk+2P9nfkX3Ujx15xa
         6QzKFY0WJmsVzpuUbE2ZR9h6O3mExPDvh/E5PURYONhonLi3NnAC8Ybucjh9qeL9Te
         uT2ffIG+7OWV0M+6wBKwbuVmrh7uMXnf7ItyTRXlxtLyYcNbIcTr1CaNNkNKD4YYSX
         iguroDq0PNA3j5/ilYTmnYUlueCOCl6CJcOEtOyObhkhwt+d6fhdNeCUnGalGaCVSC
         yAuK1oJdwFAzfTkTW/Eq0K0gFhux2P17gvgkXxzwdv7VbG36N+zuTUwZhTXNCwIC4h
         6auG0jvkfMPug==
Message-ID: <a2e0f7031143ca60de906c4ff17c629631e124ca.camel@kernel.org>
Subject: Re: [PATCH] tpm: Remove unnecessary (void*) conversions
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Su Hui <suhui@nfschina.com>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     kernel-janitors@vger.kernel.org
Date:   Thu, 27 Apr 2023 13:49:26 +0300
In-Reply-To: <20230427013926.28873-1-suhui@nfschina.com>
References: <20230427013926.28873-1-suhui@nfschina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2023-04-27 at 09:39 +0800, Su Hui wrote:
> From: Suhui <suhui@nfschina.com>
>=20
> No need cast (void*) to (struct seq_file*) or (struct tpm_chip*).
>=20
> Signed-off-by: Suhui <suhui@nfschina.com>
> ---
>  drivers/char/tpm/eventlog/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/char/tpm/eventlog/common.c b/drivers/char/tpm/eventl=
og/common.c
> index 8512ec76d526..df6eb8167e30 100644
> --- a/drivers/char/tpm/eventlog/common.c
> +++ b/drivers/char/tpm/eventlog/common.c
> @@ -55,8 +55,8 @@ static int tpm_bios_measurements_open(struct inode *ino=
de,
>  static int tpm_bios_measurements_release(struct inode *inode,
>  					 struct file *file)
>  {
> -	struct seq_file *seq =3D (struct seq_file *)file->private_data;
> -	struct tpm_chip *chip =3D (struct tpm_chip *)seq->private;
> +	struct seq_file *seq =3D file->private_data;
> +	struct tpm_chip *chip =3D seq->private;
> =20
>  	put_device(&chip->dev);
> =20

And not enough value to remove casting as an independent change.

In future please check with scripts/get_maintainers.pl that you
have all the mailing lists required. In this case you are missing
linux-kernel and linux-integrity.

BR, Jarkko
