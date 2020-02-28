From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 28 Feb 2020 13:23:11 +0000
Subject: Re: [v2 0/1] Documentation: bootconfig: Documentation updates
Message-Id: <20200228222311.f5b9448027031b16a3be372a@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158287861133.18632.12035327305997207220.stgit@devnote2>
        <957cef56-04b0-3889-6c95-a8ed7606b68d@web.de>
In-Reply-To: <957cef56-04b0-3889-6c95-a8ed7606b68d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 28 Feb 2020 10:00:55 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> > I decided to drop EBNF (extended Backus=E2=80=93Naur form) patch
> > since the ISO/IEC 14977 EBNF seems not carefully defined
>=20
> Significant efforts happened also for this standard.
> Does its revision refer still to the year 1996?
>=20

Didn't you read the article I shared? I actually wrote up the EBNF
(ISO/IEC 14977) that was a good pazzle, but just a toy. I found
no one use it to define their data format, according to the
article, including ISO itself (lol!) and there are many local
extension, including W3C EBNF, and those say "I'm EBNF".
Well, to say the least, I feel it is quite confused.

So, if you are interested in it, I don't stop you to write it up.
I just keep away from it.

Thank you,

--=20
Masami Hiramatsu <mhiramat@kernel.org>
