From: Frans Klaver <fransklaver@gmail.com>
Date: Fri, 23 Jun 2017 22:29:49 +0000
Subject: Re: endian bitshift defects [ was: staging: fusb302: don't bitshift __le16 type ]
Message-Id: <CAH6sp9NMnVzBXZcaU=q4oBV5tAoSqyO6GEfmSgtA0U+N+ibK=w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170616174556.2358-1-fransklaver@gmail.com> <1497653077.10546.23.camel@perches.com>
In-Reply-To: <1497653077.10546.23.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, devel@driverdev.osuosl.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hm. For some reason the great mail filtering scheme decided to push
this past my inbox :-/

On Sat, Jun 17, 2017 at 12:44 AM, Joe Perches <joe@perches.com> wrote:
> On Fri, 2017-06-16 at 19:45 +0200, Frans Klaver wrote:
>> The header field in struct pd_message is declared as an __le16 type. The
>> data in the message is supposed to be little endian. This means we don't
>> have to go and shift the individual bytes into position when we're
>> filling the buffer, we can just copy the contents right away. As an
>> added benefit we don't get fishy results on big endian systems anymore.
>
> Thanks for pointing this out.
>
> There are several instances of this class of error.

There are other smells around __(le|be) types that show up in staging
that might be worth checking in the rest of the kernel as well. e.g.
converting to cpu and storing it back into itself (possibly with its
bytes reversed), direct assignments without conversion and what else
you might have. sparse obviously already flags anything fishy going on
with these types, but cannot distinguish between the classes of
errors. I'll need to acquaint myself with spatch a bit more to be able
to track that down.

Thanks,
Frans
