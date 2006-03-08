From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Mar 2006 00:39:33 +0000
Subject: Re: [KJ][Patch] change for to while(1) in 3c515.c
Message-Id: <1141778373.8503.14.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============215782449601019=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141718301.8347.16.camel@localhost.localdomain>
In-Reply-To: <1141718301.8347.16.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============215782449601019==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-03-08 at 01:03 +0100, Bernd Petrovitsch wrote:
> On Wed, 2006-03-08 at 10:43 +1100, Darren Jenkins wrote:

> > 
> > I am not sure what the old solution was trying to do, wait for a
> > command to complete, or 20 loops checking ?
> 
> It seems to me that way.
> 
> > It seems more reasonable to me to simply wait for the command to
> > finish as a timeout would/should be checking against a time, not 20
> > iterations of a loop which could take any random time to complete.
> 
> That may be an even better solution.
> But that doesn't solve the problem of a potential infinite loop there
> with your patch and the impression I got before your patch (even if it
> is a suboptimal solution).

While there is the potential of an infinite loop here, I think this will
only happen on hardware failure, not sure. Also the old code worked in
the same manor so I imagine if this were going to happen, there would of
been reports of it, and the driver would have been fixed.(perhaps)



> > Also continuing on at that point before the command has finished my
> > cause problems, I don't know, but the code was waiting for it to
> > finish for a reason.
> 
> Yes, we need someone with knowledge about that
> driver/subsystem/concerned hardware to decide what is better and what is
> worse.

You are right. Additionally though I think if my patch is applied, and
this behaviour is a problem (and I admit I think it might be) someone is
more likely to see what is going on and fix the code, without the patch
it is not likely someone will see this problem at all. 



Darren J.


--===============215782449601019==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============215782449601019==--
