From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Jul 2016 16:19:25 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <00489425-2450-b791-7f94-62816083c82f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <5f019748-0e67-6077-5abc-381725410b66@users.sourceforge.net>
 <20160720155216.GD1688@katana>
 <ca946880-bb63-b0a3-c9c8-e8233ce9656c@users.sourceforge.net>
 <20160720231044.4b4f2864@endymion>
 <8ef974f3-b4ce-ed2a-0697-b6c8c0c35fd8@users.sourceforge.net>
 <20160721211342.6711a272@endymion>
 <8f15564a-86c7-0c46-8fe6-1f823d4bdf4f@users.sourceforge.net>
 <20160725143933.5f3da07d@endymion>
In-Reply-To: <20160725143933.5f3da07d@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jean Delvare <jdelvare@suse.de>
Cc: Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Would you like to support the renaming of a label like "error_out1"
>> (in the function "ks7010_upload_firmware" for example)?
>=20
> They should be renamed too. Anything using numbers instead of explicit

Interesting =85


> Anything using numbers instead of explicit labels should be updated.

Would you dare to search for corresponding update candidates explicitly
by special semantic patch scripts?


> I included the reasons in the patch I just sent,
> hopefully the documentation is clearer now.

I am curious on how feedback will evolve for your suggestion
"CodingStyle: Clarify and complete chapter 7".
https://lkml.org/lkml/2016/7/25/207

How do you think about to show a shorter label like "free_bar"
(instead of "err_free_bar") as an example?


>> "Source code review around jump label usage"?
>> https://lkml.org/lkml/2015/12/11/378
>> http://article.gmane.org/gmane.linux.kernel/2106190
>=20
> Personally I see no value in such statistics.

Do they indicate any code smells eventually?


> Either labels are wrong (either wrong indentation or wrong name)
> and should be fixed, or they are correct and you should not touch them.

Do you find such changes worthwhile (without touching also any surrounding
source code)?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
