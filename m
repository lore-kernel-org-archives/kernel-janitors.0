From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 14 Oct 2005 14:06:49 +0000
Subject: Re: [KJ] [PATCH] Get rid of yield()
Message-Id: <20051014140649.GE16113@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50905801774355153=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051013191321.GA22138@masoud.ir>
In-Reply-To: <20051013191321.GA22138@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============50905801774355153==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 14, 2005 at 06:35:16AM -0700, Nish Aravamudan wrote:
> And from a functional perspective, this is clearly a case where there
> is only one state that will match how the old code worked --
> TASK_UNINTERRUPTIBLE. If one were to use TASK_INTERRUPTIBLE, there is
> no guarantee that a single schedule_timeout(HZ/50) call would last the
> full request time, so you'd need to loop there as well.

Do you think it's worth putting a WARN_ON(current->state == TASK_RUNNING)
into schedule_timeout(), or are there legitimate reasons for occasionally
calling schedule_timeout() with the task in TASK_RUNNING?

--===============50905801774355153==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50905801774355153==--
