From: Rudy Matela <rudy.matela@gmail.com>
Date: Wed, 09 Dec 2009 21:09:54 +0000
Subject: Re: [PATCH] Coding style correction on some drivers that use Generic
Message-Id: <235c15c10912091309q6c20b417y3f80dbac0be2a073@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091209143540.GA9620@vacuum.larces.uece.br>
	 <20091209145554.GQ6070@fi.muni.cz> <4B1FC5A4.9030300@bfs.de>
In-Reply-To: <4B1FC5A4.9030300@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: wharms@bfs.de
Cc: Jan Yenya Kasprzak <kas@fi.muni.cz>, Krzysztof Halasa <khc@pm.waw.pl>, trivial@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 9, 2009 at 12:43, walter harms <wharms@bfs.de> wrote:
>
>
> Jan Yenya Kasprzak schrieb:
>> Rudy Matela wrote:
>> : Added a space separating some if/switch/while keywords from the follow=
ing
>> : parenthesis to conform to the CodingStyle.
>>
>> =A0 =A0 =A0 Hello,
>>
>> =A0 =A0 =A0 I am not sure whether it is necessary to fix formating mista=
kes in
>> a driver which is in deep freeze and the hardware is not produced anymor=
e,
>> but whatever.
>>
>
> It is ok until the driver is removed, if this "issue" is not fixed it will
> trigger any check-coding-style and generate new patches. Since it involves
> no code changes it is harmless.
>
> re,
> =A0wh
>
>

Hello to all,

  Sould I keep sending coding style corrections to the Linux Kernel?
I'm trying to help, but if i'm just being annoying, please tell me and
I can try to contribute in a better way.  :-)

  Regards,
  Rudy
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
