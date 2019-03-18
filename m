From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 18 Mar 2019 08:41:28 +0000
Subject: Re: [PATCH] hostfs: fix mismatch between link_file definition and declaration
Message-Id: <fa1378b0-3048-8309-a152-8fdf5696731d@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190317230909.7373-1-colin.king@canonical.com>
 <1760676.zAVrM27zAz@blindfold>
In-Reply-To: <1760676.zAVrM27zAz@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Richard Weinberger <richard@nod.at>
Cc: Jeff Dike <jdike@addtoit.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/03/2019 23:49, Richard Weinberger wrote:
> Am Montag, 18. M=C3=A4rz 2019, 00:09:09 CET schrieb Colin King:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The function link_file declaration in the header file has the order
>> of the two arguments (from, to) swapped when compared to the definition
>> arguments of (to, from).  Fix this by swapping them around to match
>> the definition.
>>
>> This error predates the git history, so no idea when this error
>> was introduced.
>=20
> commit bf4f804738544a95b8bc8d6a7e2629c3fc0240dd
> Author: jdike <jdike>
> Date:   Sat Dec 9 22:52:44 2000 +0000
>=20
>     hostfs now mostly works.  Almost all of the common operations are now
>     implemented, the main exceptions being mknod and executing files from
>     a hostfs filesystem.
>=20
> Enough archaeology for today. :-)

Nice. How do you find these ancient git commits?

>=20
> Thanks,
> //richard
>=20
>=20
