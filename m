From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 16:23:51 +0000
Subject: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout() with
Message-Id: <20040720162351.GB1983@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63114548128414527=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============63114548128414527==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2004 at 03:02:44PM +0200, Pavel Machek wrote:
> Hi!
> 
> > I would appreciate any comments from the janitors list.
> > 
> > 
> > Applys-to: 2.6.7
> > 
> > Description: Uses msleep() instead of schedule_timeout() to guarantee
> > the task delays at least the desired time amount.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> I'm not sure it makes sense.... so it will just spin once more? Exact
> timeout does not seem too critical here.

In this case, because the state was set to TASK_UNINTERRUPTIBLE, the
exact timeout was desired (also factoring in the comment). There are
cases, though, where TASK_UNINTERRUPTIBLE'd schedule_timeout()s will not
last the full duration. msleep(), in contrast, provides exactly this
guarantee by placing the schedule_timeout() in a tight while loop on the
time remaining in the timeout.

Does that make some more sense?

-Nish

--===============63114548128414527==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63114548128414527==--
