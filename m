From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 29 Aug 2019 14:08:54 +0000
Subject: Re: [PATCH] staging: exfat: add exfat filesystem code to staging
Message-Id: <60dbaf22-226d-a2dc-2fbd-547f29da6887@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190828160817.6250-1-gregkh@linuxfoundation.org>
In-Reply-To: <20190828160817.6250-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@driverdev.osuosl.org, linux-fsdevel@vger.kernel.org, Sasha Levin <alexander.levin@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> +++ b/drivers/staging/exfat/exfat.h
> @@ -0,0 +1,973 @@
…
> +/* file types */
> +#define TYPE_UNUSED		0x0000
> +#define TYPE_DELETED		0x0001
…
> +/* time modes */
> +#define TM_CREATE		0
> +#define TM_MODIFY		1

Will it be helpful to work with enumerations at such places?

Regards,
Markus
