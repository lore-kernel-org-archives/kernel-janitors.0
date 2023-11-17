Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E061A8;
	Thu, 16 Nov 2023 18:54:02 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AH2rrHyB2827004, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AH2rrHyB2827004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Nov 2023 10:53:53 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 17 Nov 2023 10:53:53 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 17 Nov 2023 10:53:52 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 17 Nov 2023 10:53:52 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Su Hui <suhui@nfschina.com>,
        "Jes.Sorensen@gmail.com"
	<Jes.Sorensen@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH v2] wifi: rtl8xxxu: correct the error value of 'timeout'
Thread-Topic: [PATCH v2] wifi: rtl8xxxu: correct the error value of 'timeout'
Thread-Index: AQHaF4Do9v4vXgLKQEi53aoMdH/MCbB90spQ
Date: Fri, 17 Nov 2023 02:53:52 +0000
Message-ID: <ff8637fc05324c04a447ea505d8eba1b@realtek.com>
References: <20231115050123.951862-1-suhui@nfschina.com>
In-Reply-To: <20231115050123.951862-1-suhui@nfschina.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.69.94]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback



> -----Original Message-----
> From: Su Hui <suhui@nfschina.com>
> Sent: Wednesday, November 15, 2023 1:01 PM
> To: Ping-Ke Shih <pkshih@realtek.com>; Jes.Sorensen@gmail.com
> Cc: Su Hui <suhui@nfschina.com>; kvalo@kernel.org; linux-wireless@vger.ke=
rnel.org;
> linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH v2] wifi: rtl8xxxu: correct the error value of 'timeout'
>=20
> When 'rtl8xxxu_dma_agg_pages <=3D page_thresh', 'timeout' should equal to
> 'page_thresh' rather than '4'. Change the code order to fix this problem.
>=20
> Fixes: fd83f1227826 ("rtl8xxxu: gen1: Add module parameters to adjust DMA=
 aggregation parameters")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---

Checking logic of agg_pages and agg_timeout, I think we should correct it
by below changes. So, NACK this patch.=20

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c b/driver=
s/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
index 43ee7592bc6e..c9e227aed685 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
@@ -4760,7 +4760,7 @@ void rtl8xxxu_gen1_init_aggregation(struct rtl8xxxu_p=
riv *priv)
        page_thresh =3D (priv->fops->rx_agg_buf_size / 512);
        if (rtl8xxxu_dma_agg_pages >=3D 0) {
                if (rtl8xxxu_dma_agg_pages <=3D page_thresh)
-                       timeout =3D page_thresh;
+                       page_thresh =3D rtl8xxxu_dma_agg_pages;
                else if (rtl8xxxu_dma_agg_pages <=3D 6)
                        dev_err(&priv->udev->dev,
                                "%s: dma_agg_pages=3D%i too small, minimum =
is 6\n",



