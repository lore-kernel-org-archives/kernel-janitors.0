From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 22:07:37 +0000
Subject: [KJ] Re: block/pktcdvd: set_current_state() location
Message-Id: <20041022220737.GC11126@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23599902926919691=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0410222350230.6238@telia.com>
In-Reply-To: <Pine.LNX.4.58.0410222350230.6238@telia.com>
To: kernel-janitors@vger.kernel.org

--===============23599902926919691==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2004 at 11:55:39PM +0200, Peter Osterlund wrote:
> On Fri, 22 Oct 2004, Nishanth Aravamudan wrote:
> 
> > Jens & Peter,
> >
> > I was looking through 2.6.9-bk7 with the latest kjt (Kernel-Janitors
> > patchset) applied and noticed a new schedule_timeout() in the code. In
> > drivers/block/pktcdvd.c::kcdrwd(), the state is set at the head of the
> > for(;;)-loop, while the sleeping doesn't occur until nearly the end of
> > the same loop. Is there a reason for the code in-between to run in
> > TASK_INTERRUPTIBLE?
> 
> Yes, it's needed to avoid race conditions. The code avoids race conditions
> in the same way that __wait_event_timeout() does, but the "condition" is
> much more complicated, so it wouldn't make sense to use the
> __wait_event_timeout() macro directly.

Great! Thanks for the quick response and information. I just wanted to
make sure.

-Nish

--===============23599902926919691==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23599902926919691==--
