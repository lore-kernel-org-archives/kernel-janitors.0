From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 07 Jul 2015 16:15:21 +0000
Subject: Re: Clarification for the use of additional fields in the message body
Message-Id: <559BFB19.2080700@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <558EB32E.6090003@users.sourceforge.net>
 <558EB4DE.3080406@users.sourceforge.net> <20150707023103.GA22043@kroah.com>
 <559B6FF8.9010704@users.sourceforge.net>
 <CAH6sp9Nn7LKdqT9E0bykY8jpEc-Ugxn8wby5yLcW+nsx=yG3NQ@mail.gmail.com>
 <559B85CD.6040200@users.sourceforge.net>
 <CAH6sp9Npqma18pj=ZsxYpCNDCm-AjjXvw61MGKBEKSYvg_LUBg@mail.gmail.com>
 <559BBDD6.7040808@users.sourceforge.net>
 <CAH6sp9O=NgJXOJzQaaA0o_yae+ae1oJa5Kcqmpo-WWBO_xUW+g@mail.gmail.com>
In-Reply-To: <CAH6sp9O=NgJXOJzQaaA0o_yae+ae1oJa5Kcqmpo-WWBO_xUW+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Frans Klaver <fransklaver@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chris Park <chris.park@atmel.com>, Dean Lee <dean.lee@atmel.com>, Johnny Kim <johnny.kim@atmel.com>, Rachel Kim <rachel.kim@atmel.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> I can't remember ever changing or explicitly preserving the commit date.
> I don't think I care enough.

Would any more software developers and maintainers like to share
their experiences around such details?

When do commit timestamps become relevant as a documentation item
for contribution authorship?


> Remembering the author separately from the committer is something
> git does by design anyway.

Do you usually just reuse a procedure from a well-known command
for which a description is provided like the following?
http://git-scm.com/docs/git-am
'…
"From: " and "Subject: " lines starting the body override
the respective commit author name and title values
taken from the headers.
…'

Will further fields be eventually mentioned there?

Regards,
Markus
