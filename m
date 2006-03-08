From: Bernd Petrovitsch <bernd@firmix.at>
Date: Wed, 08 Mar 2006 00:03:21 +0000
Subject: Re: [KJ][Patch] change for to while(1) in 3c515.c
Message-Id: <1141776201.3535.34.camel@gimli.at.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61594089453873124=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141718301.8347.16.camel@localhost.localdomain>
In-Reply-To: <1141718301.8347.16.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============61594089453873124==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-03-08 at 10:43 +1100, Darren Jenkins wrote:
> On 3/8/06, Bernd Petrovitsch <bernd@firmix.at> wrote:
> 
> > Yes, but not endless. So s/>=/>/ should be more in spirit of the old
> > solution.
> 
> I am not sure what the old solution was trying to do, wait for a
> command to complete, or 20 loops checking ?

It seems to me that way.

> It seems more reasonable to me to simply wait for the command to
> finish as a timeout would/should be checking against a time, not 20
> iterations of a loop which could take any random time to complete.

That may be an even better solution.
But that doesn't solve the problem of a potential infinite loop there
with your patch and the impression I got before your patch (even if it
is a suboptimal solution).

> Also continuing on at that point before the command has finished my
> cause problems, I don't know, but the code was waiting for it to
> finish for a reason.

Yes, we need someone with knowledge about that
driver/subsystem/concerned hardware to decide what is better and what is
worse.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services




--===============61594089453873124==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61594089453873124==--
