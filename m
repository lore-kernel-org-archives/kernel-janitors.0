From: Fengguang Wu <wfg@linux.intel.com>
Date: Fri, 15 Jun 2012 01:48:35 +0000
Subject: Re: automated warning notifications
Message-Id: <20120615014835.GA5695@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120614172523.GB4400@mwanda>
In-Reply-To: <20120614172523.GB4400@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, Jun 14, 2012 at 08:25:23PM +0300, Dan Carpenter wrote:
> Hi Fengguang,
> 
> I also check new static checker warnings and sometimes email people.

That would be nice!

> I wonder if we are duplicating each others work.  For example, did
> you send an email asking about the following Sparse warning:
> 
> sound/soc/codecs/ab8500-codec.c:1959:53: warning: cast truncates bits from constant value (1013 becomes 13)

I did try sending out sparse warnings to people, some time ago...

> Quite often those messages are false positive and the value is
> truncated deliberately.  In this case it looks suspicious and I
> would maybe email about it.  If I knew what kind of messages you
> check and which you ignore that would help me.

The lots of false warnings are a big problem. It makes the automated
notification more noises than signals to people. So I end up disabling
the sparse check totally..

These days I only send out gcc errors/warnings to the commit author,
committer, signers and relevant mailing lists reported by
scripts/get_maintainer.pl (but minus LKML).

> Perhaps there is an email list I could subscribe to to see if you
> had already sent a message.

In an average working day, 1-2 build errors will be caught and email
notified. I guess there will be more sparse warnings if it's turned
on.

Perhaps the sparse warnings can be enabled, but only sent to the patch
author. If you and anyone else are interested, they could be sent to
some mailing list, too. One thing I'm sure is, we probably never want
to disturb the busy maintainers with these warnings.

Thanks,
Fengguang
