From: Jim Nelson <james4765@verizon.net>
Date: Mon, 20 Dec 2004 21:35:19 +0000
Subject: Re: [KJ] Re: riscom8: replace cli()/sti()
Message-Id: <41C74597.5000109@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7401475128657049=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7401475128657049==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Domen Puncer wrote:
> On 15/12/04 23:45 -0600, james4765@verizon.net wrote:
> 
>>This is an attempt to get the riscom8 driver working on SMP.  I think I did it
>>properly (per what Documentation/cli-sti-removal.txt details).
> 
> 
> rc_interrupt also needs to protect data with locks (on UP it was ok,
> because interrupts were disabled).
> 
> Around line 1130 there are two msleep_interruptible calls under lock
> (this was wrong before too).
> 
> Some functions don't need to save flags, because you know they are
> never called from interrupt (all from riscom_ops?).
> 
> IMHO it would be nice to notice somewhere what is protected by lock
> (rc_board and rc_port structures); and it would probably be better to
> have a lock per board in riscom_board struct.
> 
> 
> 	Domen
> 

I had thought the same re putting the spinlock in the per-board structure (after 
submitting all of these - of course) - and got a lot of other pointers on how to 
make things SMP-correct.  Go ahead and disregard this set of patches - I'll have 
to take a more careful look at each one of them.

I thought I had seen some sleep-while-locked problems, but thought I was just 
reading it wrong.

--===============7401475128657049==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7401475128657049==--
