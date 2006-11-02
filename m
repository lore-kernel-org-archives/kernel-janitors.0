From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Thu, 02 Nov 2006 00:11:55 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <20061101161155.d7b30258.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	<1161660875.10524.535.camel@localhost.localdomain>
	<20061024125306.GA1608@hmsreliant.homelinux.net>
	<1161729762.10524.660.camel@localhost.localdomain>
	<20061101135619.GA3459@hmsreliant.homelinux.net>
	<9a8748490611011605u55ccdcaeob99700d6e1a813a4@mail.gmail.com>
In-Reply-To: <9a8748490611011605u55ccdcaeob99700d6e1a813a4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Neil Horman <nhorman@tuxdriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, akpm@osdl.org, kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, maxk@qualcomm.com, linux-kernel@vger.kernel.org

On Thu, 2 Nov 2006 01:05:49 +0100 Jesper Juhl wrote:

> On 01/11/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> > Hey all-
> >         Since Andrew hasn't incorporated this patch yet, and I had the time, I
> > redid the patch taking Benjamin's INIT_LIST_HEAD and Joes mmtimer cleanup into
> > account.  New patch attached, replacing the old one, everything except the
> > aforementioned cleanups is identical.
> >
> > Thanks & Regards
> > Neil
> >
> > Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
> >
> > +out4:
> > +       for_each_online_node(node) {
> > +               kfree(timers[node]);
> > +       }
> > +out3:
> > +       misc_deregister(&mmtimer_miscdev);
> > +out2:
> > +       free_irq(SGI_MMTIMER_VECTOR, NULL);
> > +out1:
> > +       return -1;
> 
> Very nitpicky little thing, but shouldn't the labels start at column
> 1, not column 0 ?
> I thought that was standard practice (apparently labels at column 0
> can confuse 'patch').
> 
> Hmm, I guess that should be defined once and for all in
> Documentation/CodingStyle

I have some other CodingStyle changes to submit, but feel free
to write this one up.

However, I didn't know that we had a known style for this, other
than "not indented so far that it's hidden".

If a label in column 0 [0-based :] confuses patch, then that's
a reason, I suppose.  I wasn't aware of that one...
In a case like that, we usually say "fix the tool then."

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
