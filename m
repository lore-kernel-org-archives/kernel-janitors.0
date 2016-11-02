From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 02 Nov 2016 17:48:03 +0000
Subject: Re: scripts/basic/bin2c: Complete error handling in main()
Message-Id: <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
 <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
In-Reply-To: <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Is replacing printf("\"\n") with puts("\"") optimization?

Is the difference relevant if an =93ordinary=94 string is passed instead of
a format string?


> Frankly, the result of this patch seems extremely unreadable code.

Do you care for more complete error detection and corresponding exception h=
andling
in this source file?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
