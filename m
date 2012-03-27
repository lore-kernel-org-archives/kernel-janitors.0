From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Date: Tue, 27 Mar 2012 20:53:31 +0000
Subject: Re: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <CALF0-+XzWXfFrHw-3xkRcgZXd2drM=udzCys2vLsHCV7ixGqgA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323095158.GB3181@mwanda>
In-Reply-To: <20120323095158.GB3181@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

On Fri, Mar 23, 2012 at 12:41 PM, Greg KH <gregkh@linuxfoundation.org> wrot=
e:
>
> And I bet they are used wrong there. =A0Again, unless you are in some very
> performance critical section of code, don't use unlikely().
>
> The big thing is that it just is not needed at all. =A0Don't try to be
> smarter than the compiler if you don't need it, _AND_ you haven't
> actually measured it.

Nice answer. I did a quick grep and I found this scary result:

~/devel/v4l-dvb $ grep -r -n "unlikely(" drivers/ | wc -l
5018

I wonder perhaps we could add a check for unlikely in checkpatch script?
Something like: "are you sure about this"?

Also, perhaps this quote from [1] should be somewhere in Documentation:

"How should I use it ?
You should use it only in cases when the likeliest branch is very very
very likely, or when the unlikeliest branch is very very very
unlikely."

[1] http://kernelnewbies.org/FAQ/LikelyUnlikely
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
