From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Fri, 23 Jul 2004 04:33:37 +0000
Subject: Re: Re: [Kernel-janitors] [PATCH] ieee/sbp2: replace
Message-Id: <29495f1d04072221335cc55321@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18167917031075009=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040722223527.GV2165@us.ibm.com>
In-Reply-To: <20040722223527.GV2165@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============18167917031075009==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jul 2004 21:53:05 -0400, Ben Collins <bcollins@debian.org> wrote:
> On Fri, Jul 23, 2004 at 02:04:03AM +0100, Matthew Wilcox wrote:
> > On Thu, Jul 22, 2004 at 07:26:53PM -0400, Ben Collins wrote:
> > > Doesn't msleep() block? If so, that's not what we want at all. We want
> > > other things to happen during that time (like maybe catch a bus reset).
> >
> > No, msleep sleeps (as its name suggests).  The code that implements it is:
> 
> In that case, I've got a few places that could use msleep().

The one thing is, it depends on what you mean by "like maybe catch a
bus reset" (I think), because msleep will sleep through all signals,
i.e. it provides a guaranteed minimum delay. In the case of my patch,
I didn't see you checking for any signals afterwards (or any comments
indicating you were expecting some) so I figured it would be safe to
use msleep(). Also, I think it's clearer what's going on if the time
units for delays are msecs.

-Nish

PS. Would these other places be in drivers as well?

--===============18167917031075009==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18167917031075009==--
