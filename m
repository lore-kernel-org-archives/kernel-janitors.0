From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 19 Nov 2019 12:15:17 +0000
Subject: Re: [PATCH v3 00/13] add the latest exfat driver
Message-Id: <2cc05215-3b44-06f0-b34a-eb841476b329@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20191119094019epcas1p298d14fcf6e7a24bee431238279961c5b@epcas1p2.samsung.com>
 <20191119093718.3501-1-namjae.jeon@samsung.com>
In-Reply-To: <20191119093718.3501-1-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

> =E2=80=A6, an a random previous

Does this wording contain a typo?


> We plan to treat this version as the future upstream for the code base
> once merged, and all new features and bug fixes will go upstream first.

Were the following mentioned issues occasionally reviewed already
by other developers before?


> v3:
>  - fix wrong sbi->s_dirt set.
>
> v2:
>  - Check the bitmap count up to the total clusters.
>  - Rename proper goto labels in seveal place.

Would you like to avoid further typos in such change descriptions?


>  - Change time mode type with enumeration.

How do you think about to increase the usage of enumerations
at any more source code places?


>  - Directly return error instead of goto at first error check.
>  - Combine seq_printfs calls into a single one.

Please refer to the correct function name.


Thanks for your positive feedback.

Regards,
Markus
