From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 07:25:16 +0000
Subject: Re: [PATCH] atm/clip: Use seq_puts() in svc_addr()
Message-Id: <66a18243-90fc-73c6-200a-fbbfa782d501@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
 <CAHp75Vf-fNi-ATKd-EpkO3HDP2TZCWFc6EEU5a5r-zkZTcHQYg@mail.gmail.com>
In-Reply-To: <CAHp75Vf-fNi-ATKd-EpkO3HDP2TZCWFc6EEU5a5r-zkZTcHQYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andy Shevchenko <andy.shevchenko@gmail.com>, netdev <netdev@vger.kernel.org>
Cc: Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Kees Cook <keescook@chromium.org>, Roopa Prabhu <roopa@cumulusnetworks.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -708,11 +708,11 @@ static void svc_addr(struct seq_file *seq, struct =
sockaddr_atmsvc *addr)
>>         static int e164[] =3D { 1, 8, 4, 6, 1, 0 };
>>
>>         if (*addr->sas_addr.pub) {
>> -               seq_printf(seq, "%s", addr->sas_addr.pub);
>> +               seq_puts(seq, addr->sas_addr.pub);
>=20
> Which opens a lot of security concerns.

How? - The passed string is just copied into a buffer finally, isn't it?


> Never do this again.

Why do you not like such a small source code transformation at the moment?


> P.S. I'm wondering what would be first,

I am curious on how communication difficulties can be adjusted.


> Markus starts looking into the actual code,

I inspected the original source code to some degree.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs=
/seq_file.c?id=895c0dde398510a5b5ded60e5064c11b94bd30ca#n682
https://elixir.free-electrons.com/linux/v4.15-rc6/source/fs/seq_file.c#L660


> or most (all) of the maintainers just ban him.

The change acceptance is varying for various reasons by the involved contri=
butors.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
