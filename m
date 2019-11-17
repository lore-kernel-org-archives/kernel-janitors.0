From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Nov 2019 12:25:30 +0000
Subject: Re: [PATCH 01/13] exfat: add in-memory and on-disk structures and headers
Message-Id: <a4bd8e3e-fcdc-9739-5407-5345743fb0b9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113081800.7672-2-namjae.jeon@samsung.com>
In-Reply-To: <20191113081800.7672-2-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/exfat_fs.h
> @@ -0,0 +1,533 @@
…
> +/* time modes */
> +#define TM_CREATE		0
> +#define TM_MODIFY		1
…

Will it be helpful to work with more enumerations (besides “exfat_error_mode”)
at such places?

Regards,
Markus
