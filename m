From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 17:20:53 +0000
Subject: Re: [PATCH 49/54] md/raid10: Replace printk() calls by the usage of higher level interfaces
Message-Id: <321cc4aa-679a-a2fe-be0b-96285b19e489@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
 <f9f16d1c-c50d-d4be-a6ba-2cb7081eb9b5@users.sourceforge.net>
 <1475771616.1914.9.camel@perches.com>
In-Reply-To: <1475771616.1914.9.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <coupons@perches.com>
Cc: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
>> index 5119846..0f2cb20 100644
>> --- a/drivers/md/raid10.c
>> +++ b/drivers/md/raid10.c
>> @@ -18,6 +18,8 @@
>>   * Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>>   */
>> =20
>> +#define MY_LOG_PREFIX KBUILD_MODNAME ": "
>> +#define pr_fmt(fmt) MY_LOG_PREFIX fmt
>=20
> Please just use
>=20
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>=20
> like the more than thousand other uses in the kernel.

Thanks for your suggestion.

I got the impression that the omission of a macro like "MY_LOG_PREFIX"
would not really work for the suggested source code transformation so far.

How should a multiline log message be achieved as it was constructed
in the function "raid10_error" (for example)?
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drive=
rs/md/raid10.c?id=C802e87fbe2d4dd58982d01b3c39bc5a781223aa#n1589

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
