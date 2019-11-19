From: Namjae Jeon <linkinjeon@gmail.com>
Date: Tue, 19 Nov 2019 12:43:52 +0000
Subject: Re: [PATCH v3 00/13] add the latest exfat driver
Message-Id: <CAKYAXd86mEc7fFO6TzaUm7V=dXS4HG4mMWziz_Nq=SNQ-9RWQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20191119094019epcas1p298d14fcf6e7a24bee431238279961c5b@epcas1p2.samsung.com>
 <20191119093718.3501-1-namjae.jeon@samsung.com> <2cc05215-3b44-06f0-b34a-eb841476b329@web.de>
In-Reply-To: <2cc05215-3b44-06f0-b34a-eb841476b329@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>

2019-11-19 21:15 GMT+09:00, Markus Elfring <Markus.Elfring@web.de>:
>> =E2=80=A6, an a random previous
>
> Does this wording contain a typo?
Yes, Will fix it on next series.

>
>
>> We plan to treat this version as the future upstream for the code base
>> once merged, and all new features and bug fixes will go upstream first.
>
> Were the following mentioned issues occasionally reviewed already
> by other developers before?
https://marc.info/?l=3Dlinux-fsdevel&m=3D156985252507812&w=3D2

>
>
>> v3:
>>  - fix wrong sbi->s_dirt set.
>>
>> v2:
>>  - Check the bitmap count up to the total clusters.
>>  - Rename proper goto labels in seveal place.
>
> Would you like to avoid further typos in such change descriptions?
Will fix on next series.
>
>
>>  - Change time mode type with enumeration.
>
> How do you think about to increase the usage of enumerations
> at any more source code places?
I will check.
>
>
>>  - Directly return error instead of goto at first error check.
>>  - Combine seq_printfs calls into a single one.
>
> Please refer to the correct function name.
Okay:)
>
>
> Thanks for your positive feedback.
Thanks for your review!
>
> Regards,
> Markus
>
