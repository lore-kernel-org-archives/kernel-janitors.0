From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 08 Jun 2020 05:59:29 +0000
Subject: Re: Forest Bond <forest@alittletooquiet.net>,Greg Kroah-Hartman <gregkh@linuxfoundation.org>,devel@d
Message-Id: <alpine.DEB.2.21.2006080758510.2430@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200607224156.GA24090@ip-172-31-24-31.ec2.internal> <20200608054614.GO23230@ZenIV.linux.org.uk>
In-Reply-To: <20200608054614.GO23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Rodolfo C. Villordo" <rodolfovillordo@gmail.com>, Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 8 Jun 2020, Al Viro wrote:

> On Sun, Jun 07, 2020 at 10:41:56PM +0000, Rodolfo C. Villordo wrote:
> > Multiple line over 80 characters fixes by splitting in multiple lines.
> > Warning found by checkpatch.pl
>
> I doubt that checkpatch.pl can catch the real problems there:
>
> * Hungarian Notation Sucks.  Really.
> * so does CamelCase, especially for wonders like s_uGetRTSCTSRsvTime

Rodolfo,

If you work hard with Coccinelle and python scripting, it can help with
the first two problems.

julia


> * local variables are useful
> * if a long expression keeps cropping up all over the place, you
> probably are missing an inline helper.
>
> PS: this
> > -			buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
> > -			buf->time_stamp_off_b = vnt_time_stamp_off(pDevice, pDevice->byTopCCKBasicRate);
> > +			buf->time_stamp_off_a > > +				vnt_time_stamp_off(pDevice, wCurrentRate);
> > +			buf->time_stamp_off_b > > +				vnt_time_stamp_off(pDevice,
> > +						   pDevice->byTopCCKBasicRate);
> is no improvement.
>
