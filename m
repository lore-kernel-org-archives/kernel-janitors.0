From: Frans Klaver <fransklaver@gmail.com>
Date: Tue, 07 Jul 2015 06:40:08 +0000
Subject: Re: Clarification for the use of additional fields in the message body
Message-Id: <CAH6sp9Nn7LKdqT9E0bykY8jpEc-Ugxn8wby5yLcW+nsx=yG3NQ@mail.gmail.com>
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
In-Reply-To: <559B6FF8.9010704@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chris Park <chris.park@atmel.com>, Dean Lee <dean.lee@atmel.com>, Johnny Kim <johnny.kim@atmel.com>, Rachel Kim <rachel.kim@atmel.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jul 7, 2015 at 8:21 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Sat, 27 Jun 2015 15:56:57 +0200
>>
>> Why is this in the body of the email?
>
> Does the canonical patch format support to preserve
> specific details about a shown commit by specification
> of fields like "Date" and "From" in the message body?

Using "From:" in the body can be used to provide your properly spelled
name, or the name/e-mail of the actual author, if that happens not to
be the sender. git-send-email will do that automagically for you. If
"From:" is not specified in the message body, the e-mails sender will
be used as author.

The date, as far as I know, is ignored. It is the commit date, not the
authoring date, and once your patch is applied by a maintainer (i.e.
committed), the date gets reset anyway. No need to try and preserve
it.

Frans
