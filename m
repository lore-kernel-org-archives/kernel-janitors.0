From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 08:12:32 +0000
Subject: Re: [PATCH 03/47] block-rbd: Adjust the position of a jump label in rbd_header_from_disk()
Message-Id: <121f05b0-ac94-4d81-289e-9dc3668eab95@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <57806eb1-10ed-582e-72d0-2975e1ee967a@users.sourceforge.net>
 <71b06567-1ea9-204d-d61b-2af4426d9cd1@users.sourceforge.net>
 <CAOi1vP9iQ6u7dm0dRMg4rs6tLaR5mv55yew0URTX00-y6C0S6g@mail.gmail.com>
In-Reply-To: <CAOi1vP9iQ6u7dm0dRMg4rs6tLaR5mv55yew0URTX00-y6C0S6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Ilya Dryomov <idryomov@gmail.com>
Cc: ceph-devel@vger.kernel.org, Alex Elder <elder@kernel.org>, Sage Weil <sage@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> @@ -1064,7 +1064,7 @@ static int rbd_header_from_disk(struct rbd_device =
*rbd_dev,
>>         header->snap_sizes =3D snap_sizes;
>>
>>         return 0;
>> -out_2big:
>> + out_2big:
>>         ret =3D -EIO;
>>         kfree(snap_sizes);
>>   free_names:
=E2=80=A6
> Can you point where this current convention is documented?

Yes.
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/Doc=
umentation/CodingStyle?id=865a1caa4b6b886babdd9d67e7c3608be4567a51

Do you find the software update "CodingStyle: Clarify and complete chapter =
7" interesting?


> Certainly not in CodingStyle, AFAICT...

I suggest to look at the current version once more.


> I know some people prefer a single space in there because it makes
> "diff -p" work better, but nowadays with "git diff" this argument is
> pretty moot.

Would you like to discuss the corresponding software evolution a bit more?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
