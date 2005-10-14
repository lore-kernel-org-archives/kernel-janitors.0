From: Masoud Sharbiani <masouds@masoud.ir>
Date: Fri, 14 Oct 2005 14:16:14 +0000
Subject: Re: [KJ] [PATCH] Get rid of yield()
Message-Id: <20051014141614.GA5205@masoud.ir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93806638222131555=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051013191321.GA22138@masoud.ir>
In-Reply-To: <20051013191321.GA22138@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============93806638222131555==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 13, 2005 at 04:30:46PM -0700, Nish Aravamudan wrote:
> On 10/13/05, Masoud Sharbiani <masouds@masoud.ir> wrote:
> > Hello,
> > the following patch removes yield() from all drivers. They have been replaced
> > by schedule_timeout() or cond_resched(). Please verify and comment.
> 
> Which entry in the TODO is this in reference to?
> 
> schedule_timeout() should either be schedule_interruptible_timeout()
> or schedule_uninterruptible_timeout() now. Calling just
> schedule_timeout() without setting the state is a noop and will cause
> loops to busy wait.

D'oh! Will correct and resend.
cheers,
Masoud 

--===============93806638222131555==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93806638222131555==--
