From: Will Newton <will.newton@gmail.com>
Date: Wed, 08 Apr 2009 14:18:22 +0000
Subject: Re: [PATCH 20/56] inflate: Remove void casts
Message-Id: <87a5b0800904080718y424776b2u6f505192408dbbbd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm>
	 <36ca99e90904080439u7098d2feka5dd39f8ab6a470c@mail.gmail.com>
	 <49DCAC88.7010500@fastmail.fm>
	 <87a5b0800904080705n74829b75l8becfd6e7d1a321f@mail.gmail.com>
	 <49DCB0BA.70606@fastmail.fm>
In-Reply-To: <49DCB0BA.70606@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jack Stone <jwjstone@fastmail.fm>
Cc: Bert Wesarg <bert.wesarg@googlemail.com>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 3:12 PM, Jack Stone <jwjstone@fastmail.fm> wrote:
> Will Newton wrote:
>> On Wed, Apr 8, 2009 at 2:54 PM, Jack Stone <jwjstone@fastmail.fm> wrote:
>>
>>> =A0lib/inflate.c | =A0 =A05 ++---
>>> =A01 files changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/lib/inflate.c b/lib/inflate.c
>>> index 1a8e8a9..1eb0cd8 100644
>>> --- a/lib/inflate.c
>>> +++ b/lib/inflate.c
>>> @@ -249,7 +249,7 @@ static void *malloc(int size)
>>>
>>> =A0 =A0 =A0 =A0malloc_ptr =3D (malloc_ptr + 3) & ~3; =A0 =A0 /* Align */
>>
>>> - =A0 =A0 =A0 p =3D (void *)malloc_ptr;
>>> + =A0 =A0 =A0 p =3D malloc_ptr;
>>> =A0 =A0 =A0 =A0malloc_ptr +=3D size;
>>>
>>
>> Won't this cause a "assignment makes pointer from integer without a
>> cast" warning?
> I don't think so. The cast had no effect as both malloc_ptr and p are
> declared as void *. The later +=3D size
> does pointer arithmetic.

static unsigned long malloc_ptr;

Please compile test your code.

> Thanks,
>
> Jack
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
