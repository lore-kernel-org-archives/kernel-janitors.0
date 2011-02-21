From: "Luis R. Rodriguez" <mcgrof@gmail.com>
Date: Mon, 21 Feb 2011 04:45:44 +0000
Subject: Re: [patch 1/2] staging: ath6kl: cleanup in SEND_FRAME ioctl
Message-Id: <AANLkTi=HjKGC+vsRT1wAjyK7qwzD-3rnjKggx4HmbmA5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124832.GA1898@bicker>
In-Reply-To: <20110220124832.GA1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 8:14 PM, Greg KH <greg@kroah.com> wrote:
> On Sun, Feb 20, 2011 at 08:00:38PM -0800, Luis R. Rodriguez wrote:
>> On Sun, Feb 20, 2011 at 7:18 AM, Vipin Mehta <vmehta@atheros.com> wrote:
>> > On Sun, Feb 20, 2011 at 04:49:08AM -0800, Dan Carpenter wrote:
>> >> The original code was written in a funny way where every statement was
>> >> part of else if blocks. =C2=A0I broke them up into separate statement=
s by
>> >> adding breaks on failure conditions.
>> >>
>> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
>>
>> Can you guys please join IRC? ...
>
> That is not a requirement for kernel development, sorry.

No, but I'm not asking you, I'm asking Vipin and other developers,
using IRC is a good idea for internal coordination. I see no way Vipin
checking with Joe if he had his first set of patches ready. We need to
do major cleanup on the driver *now* and these sort of
miscommunication is just irritating. How do you recommend we
coordinate cleanup with random patches being ACKed in the process
without proper coordination?

> email works best, especially when there are time zone differences, and
> travel issues.

Sure, I understand this.

  Luis
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
