From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 31 Oct 2017 14:07:25 +0000
Subject: Re: [PATCH] platform: x86: dell-smo8800: remove redundant assignments to byte_data
Message-Id: <CAHp75VfAzk4n1HQETp+r5KGE5B_HmQ0JcsOwesvowuvt=wju5g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171031110318.20985-1-colin.king@canonical.com>
 <CAHp75Vec3Hjd_keMid-x6ub5ZJqUmq1nUFiHPsxuWt8V+vzrnQ@mail.gmail.com> <20171031135548.u5vtsxj7hbnuioz3@pali>
In-Reply-To: <20171031135548.u5vtsxj7hbnuioz3@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 31, 2017 at 3:55 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Tuesday 31 October 2017 15:47:58 Andy Shevchenko wrote:
>> On Tue, Oct 31, 2017 at 1:03 PM, Colin King <colin.king@canonical.com> w=
rote:
>> > From: Colin Ian King <colin.king@canonical.com>
>> >
>> > Variable byte_data is being initialized and re-assigned with values th=
at
>> > are never read. Remove these as these redundant assignments. Cleans up
>> > clang warning:
>> >
>> > drivers/platform/x86/dell-smo8800.c:106:2: warning: Value stored to 'b=
yte_data'
>> > is never read
>>
>> Thanks for the patch.
>>
>> As I read a code it was from the beginning like this. I dunno what was
>> a motivation of this pieces, thus I would like to hear Pali.
>
> IIRC this part of code comes from the lis3lv* driver which was used for
> HP EliteBook machines. As both drivers provides similar interface for
> userspace.

OK, though it doesn't clarify the intention of the byte_data
(useless?) assignments.

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
