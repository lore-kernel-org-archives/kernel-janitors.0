From: Asim <linkasim@gmail.com>
Date: Wed, 18 Jan 2012 17:48:12 +0000
Subject: Re: busy loops in kernel
Message-Id: <CAFTXMEJWDw7g9HVuysYfj0vPzdBpSy59GbyCXYo6hh5oHnFubQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

Yes we do static analysis. The txt file has a bit more information. It
is actually: count, line numbers and C file. In some cases, when
driver comprises of multiple files, line numbers may be shifted (since
all files are merged together for analysis).

Some cases are more insidious where drivers use hardware values for
array/pointer de-reference. They are way fewer than busy loops but I
have muted them for this iteration at least.

And, yes these are real infinite loops, about 1000 of them.

Thanks,
Asim

On Tue, Jan 17, 2012 at 11:37 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> Interesting stuff. =A0You guys are doing static analysis on the .o
> files? =A0I'm looking at the first line.
>
> ticks 25 What does the ticks count mean?
>
> Infinite Loop:142 =A0Ok. =A0I see this on drivers/atm/zatm.c line 142.
> It's a real infinite loop (if you're zatm hardware is broken).
>
> Dynamic array:393 =A0What's this? =A0I don't see any dynamic arrays in
> this driver.
>
> regards,
> dan carpenter
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
