From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Jan 2018 10:15:48 +0000
Subject: Re: mfd: Patch management?
Message-Id: <b201342a-3167-26d0-db20-cefaa6820a6c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180123130130.powyttapsx3djawx@dell>
 <f8900a77-eea4-d244-37e1-44d22484f826@users.sourceforge.net>
 <20180123151419.prwq62c7gpsnpbx3@dell>
 <ef7a4d25-d4f1-77e3-5489-bbc385de3e5d@users.sourceforge.net>
 <20180123163130.h6ygmzig7syafxbh@dell>
 <49873902-c947-468d-094a-4ac175850116@users.sourceforge.net>
 <20180126114514.dwhwwgcp4n6fayre@dell>
 <c6e799c3-e118-20a1-3a9f-72950a080d03@users.sourceforge.net>
 <20180126141255.7adgqjlonuvujp2x@dell>
 <856e9b19-2e42-a6b2-85c4-c89a81b071f8@users.sourceforge.net>
 <20180129093507.huxiai5yjbvg7vkf@dell>
In-Reply-To: <20180129093507.huxiai5yjbvg7vkf@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Lars_P=c3=b6schel?= <poeschel@lemonage.de>, Linus Walleij <linus.walleij@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>

>> I imagine that acceptance for these changes could be influenced
>> also by review comments from other contributors.
>=20
> Influenced yes, but I will also need to review them.

Yes. - This is the usual process.


> You can't 'go around' me, if that's what you're thinking.

I do not think this. - I hope somehow that additional review comments
(by other contributors) could make the handling of shown update candidates
more promising.


>> How are the chances that further update suggestions will be integrated
>> just because I sent them as small patch series in the threaded way?
>>
>> Examples:
>> * tps65910: Adjustments for four function implementations
>>   https://lkml.org/lkml/2018/1/16/313
>>
>> * abx500-core: Adjustments for eight function implementations
>>   https://lkml.org/lkml/2018/1/16/186
>=20
> In order to not make my life difficult,

There are more options to make it a bit easier, aren't there?


> I've kindly requested that you gather all of your MFD patches

Or the remaining ones =E2=80=A6?


> and send them as one single set.

Do you still insist to get these seven update steps in a bigger patch series
despite of their threaded structure?


> Is there a good reason why you're not willing to do so?

I am trying to find out if a few formal details are really hindering
progress on the clarification of affected implementation details.

I assume that additional hints could occur until I might rebase mentioned
change combinations on another recent commit.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
