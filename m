From: Suresh Jayaraman <sjayaraman@novell.com>
Date: Fri, 24 Aug 2007 08:29:54 +0000
Subject: Re: Ideas on column length in kernel "problem"?
Message-Id: <1187943467.3831.17.camel@blr-suresh.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
	 <20070823040504.GM30705@stusta.de>
In-Reply-To: <20070823040504.GM30705@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org

On Wed, Aug 22, 2007 at 11:54:41PM -0400, Scott Thompson wrote:

> > I haven't seen any recent solutions to this "problem"...
> > 
> > Many free (and not-free) mail clients wordwrap.  Hushmail wraps at 
> > 68 (verified), Yahoo has options to wrap at a max of 99, and Gmail 
> > was somewhere around 85-90 as I recall.  Not sure on other free / 
> > inexpensive clients.

I too had thought about this problem. I think email clients do wordwrap
to improve readability. But, in some cases we just might have to
override. ( I had an experience of sending a malformed patch just
because my wordwrap setting for vim and my email client were different)

What should be ideally expected out of a good email client?
Is it sufficient if the email client provides a facility to disable
wordwrap while inserting file alone and does wordwrap while typing text?
or is it expected to provide a configurable option to enable/disable
wordwrap. I don't think keeping wordwrap disabled all the time is a good
idea because it makes it difficult to read mails.

Do we have a suggested wordwrap setting w.r.t kernel code?

-- 
Suresh Jayaraman


