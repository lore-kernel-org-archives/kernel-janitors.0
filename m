From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Mon, 18 Nov 2019 04:59:40 +0000
Subject: RE: [PATCH 01/13] exfat: add in-memory and on-disk structures and headers
Message-Id: <00ba01d59dcc$fc17e010$f447a030$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113081800.7672-2-namjae.jeon@samsung.com>
        <CGME20191117122540epcas4p2cd0e2b9658154c81ae9d2e46882efaa0@epcas4p2.samsung.com>
        <a4bd8e3e-fcdc-9739-5407-5345743fb0b9@web.de>
In-Reply-To: <a4bd8e3e-fcdc-9739-5407-5345743fb0b9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'Markus Elfring' <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?UTF-8?Q?'Valdis_Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org

> …
> > +++ b/fs/exfat/exfat_fs.h
> > @@ -0,0 +1,533 @@
> …
> > +/* time modes */
> > +#define TM_CREATE		0
> > +#define TM_MODIFY		1
> …
> 
> Will it be helpful to work with more enumerations (besides
> “exfat_error_mode”)
> at such places?
Yep, Will fix it on V2.
Thanks for your review!
> 
> Regards,
> Markus
