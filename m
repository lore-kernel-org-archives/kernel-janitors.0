From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 30 Jun 2005 18:39:29 +0000
Subject: Re: [KJ] fs/smbfs/proc.c -> replace direct assignment with
Message-Id: <20050630183929.GC2583@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53380182197928217=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1120126573.24539.6.camel@localhost>
In-Reply-To: <1120126573.24539.6.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============53380182197928217==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 30.06.2005 [21:48:56 +0200], aLeJ wrote:
> > the memory barrier is really necessary (as pointed out earlier in the list
> > by Nishanth Aravamudan)?  if not, __set_current_state does the job.
> > 
> > I'd appreciate some notes/thoughts/tips/whatever on which conditions a
> > memory barrier is really needed, or, more clearly, when the absence of a
> > memory barrier breaks stuff.
> > 
> > TIA :)
> 
> As said in the TODO:
> 
> "...
> Don't forget to set_current_state(TASK_{,UN}INTERRUPTIBLE); before
> schedule*().
> ..."
> 
> And in this case, it is just before schedule, so I considered to change it.
> Maybe the use of __set_current is for places where there is not schedule?
> (Just a try :p)

So, when you are adding yourself to a wait-queue, you have to be set in
the appropriate state to make sure you receive the appropriate wake-up
events.

When removing yourself, though, it is less critical, so you are able to
use __set_current_state() [which is the same as direct assignment].

I had a mail from Oliver Neukum which discussed these issues, but am
having some trouble locating it. Once I do, I'll send it back out in
reply to this thread.

In any case, this patch is not necessary, as I already have a patch in
the -KJ tree which replaces the state change and timeout with msleep().
Please make sure your fixes don't collide with existing -kj fixes (or
-mm ones, if possible).

Thanks,
Nish

--===============53380182197928217==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53380182197928217==--
