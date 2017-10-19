From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Oct 2017 11:35:07 +0000
Subject: Re: kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <1dee801c-37b5-4d72-b33f-ebdc135b4f25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
 <20171019110824.wqkep7bpcx3dcw5w@redbean>
 <43c71898-82c3-215a-3176-e1a6d56ef10a@users.sourceforge.net>
 <1508412567.6806.36.camel@perches.com>
In-Reply-To: <1508412567.6806.36.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>

>>>> Omit an extra message for a memory allocation failure in this function.
>>>>
>>>> This issue was detected by using the Coccinelle software.
>>>>
>>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>>
>>> Applied to modules-next, thanks.
>>
>> Thanks for your acceptance of this update suggestion after a bit of clar=
ification.
>>
>> Do you see any need that I should extend subsequent commit messages
>> for this software transformation pattern?
>=20
> Add=C2=A0a description of _why_ this is being done.
>=20
> Something like:
>=20
> "because there is a dump_stack() done on allocation failures
>  without __GFP_JNOWARN"

How do you think about to convert such a description into a special format
for further reference documentation?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
