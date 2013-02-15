From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Feb 2013 09:21:21 +0000
Subject: Re: Kernel janitors website?
Message-Id: <20130215092121.GA6853@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d2w2u5qv.fsf@steelpick.2x.cz>
In-Reply-To: <87d2w2u5qv.fsf@steelpick.2x.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 15, 2013 at 09:50:08AM +0100, Julia Lawall wrote:
> On Fri, 15 Feb 2013, Dan Carpenter wrote:
> 
> > On Thu, Feb 14, 2013 at 07:09:44PM +0100, Michal Sojka wrote:
> > > Hello,
> > > 
> > > we are running a university course [1] (in Czech) about working with
> > > open source communities. We try to help students with finding tasks and
> > > projects to work on. Do you have a web site listing the possible tasks
> > > for students?
> > > 
> > > It used to be http://janitor.kernelnewbies.org/ but it seems to be dead.
> > > Other pages http://kernelnewbies.org/KernelJanitors/Todo,
> > > https://code.google.com/p/kernel-janitors/wiki/TODO seem to be outdated.
> > 
> > Most of these still apply.
> > 
> > There is always stuff to fix in staging.  The thing about staging
> > though is that fixing style issues are fairly boring for students.
> > Also kernel style guidelines are very involved and we tend to be
> > stricter about pure style fixes than we are about bug fixes.
> 
> Actually, I had thought that staging would be good for students,  They 
> could do simple things, and not run into the problem of annoying a 
> maintainer who is overwhelmed with real problems with trivial things.
> 

I guess my thing on staging is that students shouldn't just try to
fix a checkpatch.pl warning.  checkpatch shows bad code, and the
goal would be to make the code nicer which is slightly different
from just silencing the warning.

Another thing would be if students could pair up and review each
other's patches before sending it.  Does it apply, does it compile,
does it make the code nicer?  That's we check as well.

Also staging has so many bugs which are more interesting to fix than
checkpatch warnings.

You're right that staging is probably a good place to start.  We
are responsive.  We take trivial patches.  We're newbie friendly.

If you don't receive a response it means that we are probably going
to apply the patch.  I normally review staging patches within a day
or two.  Right now the merge window for staging is closed until
3.9-rc1 is released so Greg will let patches sit in his inbox until
then.  But I think I reject more about staging patches than Greg
does so if I don't complain, it probably will go in.

> The problem with staging though is that it is not so clear what files 
> people are actually interested in.  Because it would be very discouraging 
> for students to send patches and have them all ignored.  I had suggested 
> to just use git to see which files had received the most commits recently, 
> but perhaps there is a better strategy.

Everything in staging/ is supposed to be being developed with the
goal of getting out.  The exception would the android code.

regards,
dan carpenter

