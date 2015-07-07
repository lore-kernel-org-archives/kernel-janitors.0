From: Frans Klaver <fransklaver@gmail.com>
Date: Tue, 07 Jul 2015 14:13:12 +0000
Subject: Re: Clarification for the use of additional fields in the message body
Message-Id: <CAH6sp9O=NgJXOJzQaaA0o_yae+ae1oJa5Kcqmpo-WWBO_xUW+g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<558EB32E.6090003@users.sourceforge.net>
	<558EB4DE.3080406@users.sourceforge.net>
	<20150707023103.GA22043@kroah.com>
	<559B6FF8.9010704@users.sourceforge.net>
	<CAH6sp9Nn7LKdqT9E0bykY8jpEc-Ugxn8wby5yLcW+nsx=yG3NQ@mail.gmail.com>
	<559B85CD.6040200@users.sourceforge.net>
	<CAH6sp9Npqma18pj=ZsxYpCNDCm-AjjXvw61MGKBEKSYvg_LUBg@mail.gmail.com>
	<559BBDD6.7040808@users.sourceforge.net>
In-Reply-To: <559BBDD6.7040808@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chris Park <chris.park@atmel.com>, Dean Lee <dean.lee@atmel.com>, Johnny Kim <johnny.kim@atmel.com>, Rachel Kim <rachel.kim@atmel.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jul 7, 2015 at 1:53 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> I think that as far as these kernel mailing lists are concerned,
>> the date of the update suggestion is the date on which you submitted the patch,
>> rather than the date you originally committed it to your local tree.
>
> I imagine that there are committers who would like to keep
> corresponding software development history a bit more accurate.

I guess it depends on what your view on accurate is.


>> If you wish to keep track of this evolution for yourself, or
>> wish to share it, you're better off stashing it somewhere in a
>> (public) git repo that you control.
>
> Would it be nicer to preserve such data directly also
> by the usual mail interface?
>
>
>> If you insist on placing the date somewhere, you can also put the date
>> there if you wish. It'll be ignored by git when applied.
>
> This content management tool provides the capability to store
> the discussed information by the parameters "--author=" and "--date=",
> doesn't it?
> Is the environment variable "GIT_AUTHOR_DATE" also interesting occasionally?
>
> How often do you take extra care for passing appropriate data there?

I can't remember ever changing or explicitly preserving the commit
date. I don't think I care enough. I did change the author on botched
patches, but that's an exception. Remembering the author separately
from the committer is something git does by design anyway.

Frans
