Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA51C4321E
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Nov 2022 04:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiK1E1h (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 27 Nov 2022 23:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiK1E1e (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Nov 2022 23:27:34 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EF023A
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Nov 2022 20:27:30 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 1so11863711ybl.7
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Nov 2022 20:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ws39PTNmPwbxTbyz+NZ+1IRaFpcGa/b8DQZvgCy0Os=;
        b=MfuJdPApib5HX4FiRYIJzVpijxkmjbf9E4PB7462t8A5qypTfnBa4E7tGrq0srHZAy
         wAUB6NdyCInAOE6IAzrzLKPzLlDF9bdpirD4Z23LJsv8Y/maCVVgKyyqwcwoC/LfyUPJ
         ELTA2v3Bv8ymPSaO90+vsIAlCfGpO4hUVpgms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ws39PTNmPwbxTbyz+NZ+1IRaFpcGa/b8DQZvgCy0Os=;
        b=CiJdTpzY1oVqgEKDmwjPJ6cyiDYZ8b+p7FDljjb3X4K+HJYfmi7zftWvLPl9mQppe2
         M4lrKz4F2en1/DPxc4UCyHQn/lP/UOtbc5h3elGdCAFtu0mPYJ9oz7FpqKML/qKkJ75c
         NfV+AmH5xvuAk2DZPsLEm3+q+By4MlFNtP7Jxxhj+Y292URUEy7sWnRQcCPotnCjhKeW
         0jqqXoBUvwuP48Cxo8wwfT1inH6t1/kMs7gkZjDqS/zux6XeUxb7U8XkCe53EN5C6LP/
         72gBFPzirSBURI1VepCpnL2PfD/4WoUDFnXFKBMQDPIceR0rTqmGfxzeR+CkrGlnjr07
         DhKQ==
X-Gm-Message-State: ANoB5plVvxPJfA0kLFBGW1qa8N2qChJAkBZ3XIN1g6IHoeRiisHOj5dz
        vTfRxE+FZZhdDNhqx3TR35fqsFfpLJOdTRrzXWfURVCe+/tQNA==
X-Google-Smtp-Source: AA0mqf59XMMMqkBWO5nHeMbYxZUC46G9klb7UZK5FyAbdczsaT+ZptSo3fPojjXk/O7e9XaQASx0nsKSOxhyXi7P3nk=
X-Received: by 2002:a25:9e8a:0:b0:6cc:54cb:71ff with SMTP id
 p10-20020a259e8a000000b006cc54cb71ffmr46817941ybq.339.1669609649937; Sun, 27
 Nov 2022 20:27:29 -0800 (PST)
MIME-Version: 1.0
References: <7779439b2678fffe7d3e4e0d94bbb1b1eb850f5e.1669565797.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <7779439b2678fffe7d3e4e0d94bbb1b1eb850f5e.1669565797.git.christophe.jaillet@wanadoo.fr>
From:   Pavan Chebbi <pavan.chebbi@broadcom.com>
Date:   Mon, 28 Nov 2022 09:57:18 +0530
Message-ID: <CALs4sv1x5kqHVu=q=kifSPXc=yhobowRvQhjkhG-3UwW2ZzbPg@mail.gmail.com>
Subject: Re: [PATCH] net/mlx5e: Remove unneeded io-mapping.h #include
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000001f5f1205ee804a33"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--0000000000001f5f1205ee804a33
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 27, 2022 at 9:47 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The mlx5 net files don't use io_mapping functionalities. So there is no
> point in including <linux/io-mapping.h>.
> Remove it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/cmd.c  | 1 -
>  drivers/net/ethernet/mellanox/mlx5/core/main.c | 1 -
>  drivers/net/ethernet/mellanox/mlx5/core/uar.c  | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/cmd.c b/drivers/net/ethernet/mellanox/mlx5/core/cmd.c
> index 74bd05e5dda2..597907fd63f5 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/cmd.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/cmd.c
> @@ -37,7 +37,6 @@
>  #include <linux/slab.h>
>  #include <linux/delay.h>
>  #include <linux/random.h>
> -#include <linux/io-mapping.h>
>  #include <linux/mlx5/driver.h>
>  #include <linux/mlx5/eq.h>
>  #include <linux/debugfs.h>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> index 70e8dc305bec..25e87e5d9270 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> @@ -37,7 +37,6 @@
>  #include <linux/pci.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
> -#include <linux/io-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/delay.h>
>  #include <linux/mlx5/driver.h>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/uar.c b/drivers/net/ethernet/mellanox/mlx5/core/uar.c
> index 8455e79bc44a..1513112ecec8 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/uar.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/uar.c
> @@ -31,7 +31,6 @@
>   */
>
>  #include <linux/kernel.h>
> -#include <linux/io-mapping.h>
>  #include <linux/mlx5/driver.h>
>  #include "mlx5_core.h"
>
> --
> 2.34.1
>

Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

--0000000000001f5f1205ee804a33
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
OltyqaGBuzv+bJTUL+bmV7E4QBLIqGt4jVr1R9hJdH6KxXwJdyfHZ9C6qXmoe2NQhiFUyBOJ0wgk
dB9Z1IU7nCwvNKYg2JMoJs93tIgbhPJg/D7pqW8gabkCAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUEV6y/89alKPoFbKUaJXsvWu5
fdowDQYJKoZIhvcNAQELBQADggEBAEHSIB6g652wVb+r2YCmfHW47Jo+5TuCBD99Hla8PYhaWGkd
9HIyD3NPhb6Vb6vtMWJW4MFGQF42xYRrAS4LZj072DuMotr79rI09pbOiWg0FlRRFt6R9vgUgebu
pWSH7kmwVXcPtY94XSMMak4b7RSKig2mKbHDpD4bC7eGlwl5RxzYkgrHtMNRmHmQor5Nvqe52cFJ
25Azqtwvjt5nbrEd81iBmboNTEnLaKuxbbCtLaMEP8xKeDjAKnNOqHUMps0AsQT8c0EGq39YHpjp
Wn1l67VU0rMShbEFsiUf9WYgE677oinpdm0t2mdCjxr35tryxptoTZXKHDxr/Yy6l6ExggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwV/XkICjVscn4SNZMw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIKv/x47NItwPlwgIsE0KKXI1tb3y5qpU
brO4wpgqn7h7MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMTEy
ODA0MjczMFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQCN6JV+ulzreKGAotqvQRu287Lc1aLKtN12oNXANxsN7E4A4ftY
ADz9dn5kYNrMhdt5ba0RdO5jBmsYNsx977zHLytsL3YyO0hko8GHFVfl71PYF1Bf80sOUHgSSmDa
f8vNxnyE8fdoLxbVsE54JNhAtmjhPElf5dqi/1vm65b/HMo2lbX6aGPARbjgqx5hgsam4g+lS9or
DMiII3drT2z+nw0Zqun4UDV4/nf/1mcrt3EdoAPEJZTKeE8WZ8xl+keo2e3T75zMXrT+y0XC+GzA
aFQJ0ZRkPgDlcY/7kDN2CCeJDmoh2sHOhxteNB4nP/dkRzRFxkZfZzqfLRPjIu7G
--0000000000001f5f1205ee804a33--
