From: bojan prtvar <prtvar.b@gmail.com>
Date: Thu, 04 Aug 2011 21:16:49 +0000
Subject: Re: [PATCH 1/2] HID: kfree() NULL pointer cleanup
Message-Id: <CAOmT4fThjOjBAcXmFqpqct3uzVOi3eQWknyD3TO+aC6CDXEnuQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312490574-14804-1-git-send-email-prtvar.b@gmail.com>
	<Pine.LNX.4.64.1108042247000.1424@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1108042247000.1424@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: jkosina@suse.cz, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 4, 2011 at 10:48 PM, Julia Lawall <julia@diku.dk> wrote:
> On Thu, 4 Aug 2011, Bojan Prtvar wrote:
>
> I would find it even nicer to just add a new lavel to skip over the kfree
> in the case where pm is NULL. =C2=A0It is statically apparent in the sour=
ce
> code.

Yes, it would be nicer. I'll send v2.

Regards,
Bojan
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
