From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 15 Dec 2011 16:38:01 +0000
Subject: Re: [patch -next] x86: dubious one-bit signed bitfields
Message-Id: <CALCETrVfybYamM-o4xJUxrfmBwpNKOtX_aX0NHLAysKh82tj8A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111207063848.GA14507@elgon.mountain>
In-Reply-To: <20111207063848.GA14507@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, Dec 15, 2011 at 5:45 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> Andy, this is your code from:
>
> commit 4fc3490114bb159bd4fff1b3c96f4320fe6fb08f
> Author: Andy Lutomirski <luto@amacapital.net>
> Date: =A0 Mon Nov 7 16:33:40 2011 -0800
>
> =A0 =A0x86-64: Set siginfo and context on vsyscall emulation faults
>
> Would you like to comment on what we should do here? =A0These warnings
> are spamming my build.

I'm fine with either, but I slightly prefer bool.

What compiler are you using?  I don't think I saw warnings.

--Andy
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
