From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 03 Nov 2004 17:56:50 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH] sound/cs4231_lib: replace
Message-Id: <20041103175650.GD2163@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61520036013097235=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.HPX.4.33n.0411031010440.25361-100000@studcom.urz.uni-halle.de>
In-Reply-To: <Pine.HPX.4.33n.0411031010440.25361-100000@studcom.urz.uni-halle.de>
To: kernel-janitors@vger.kernel.org

--===============61520036013097235==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 03, 2004 at 10:22:34AM +0100, Clemens Ladisch wrote:
> Nishanth Aravamudan wrote:
> > [...]
> > How about the following patch?
> 
> Applied, with some changes (see below).
> 
> > I used TASK_UNINTERRUPTIBLE (i.e. msleep()). This, though, will
> > guarantee that the task sleeps *at least* the requested time (20
> > ms per iteration). This may lead to a longer delay than desired,
> > for instance, if perhaps the condition should be checked after
> > each signal.
> 
> This code was never intended to handle signals; using
> TASK_INTERRUPTIBLE was a bug.
> 
> 20 ms happens to be the usual calibration time of the original CS4231
> chip (so it was expected to stop after the first iteration), but there
> are many clones that might need a slightly different time, so I
> changed it to 10 ms.  However, this doesn't really matter. :)
> 
> Finally, I removed the time variable because it wasn't used anymore.

Great,i

Acked-by: Nishanth Aravamudan <nacc@us.ibm.com>

I will resend the sparc patch now.

-Nish

--===============61520036013097235==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61520036013097235==--
