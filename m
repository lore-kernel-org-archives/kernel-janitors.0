From: Thomas Petazzoni <thomas.petazzoni@enix.org>
Date: Tue, 07 Aug 2007 07:05:48 +0000
Subject: Re: A change of approach
Message-Id: <20070807090548.3e9213e2@thomas.toulouse>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070731220505.GT21219@parisc-linux.org>
In-Reply-To: <20070731220505.GT21219@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

Le Mon, 6 Aug 2007 16:59:06 -0600,
Matthew Wilcox <matthew@wil.cx> a =E9crit :

> Better is to find drivers with no entry in the MAINTAINERS file at all
> ... though that's hard to do reliably.  If you announce to K-J that
> you intend to take on a driver, someone with a bit more experience
> such as Randy or myself can probably let you know if that driver has
> a maintainer.

The problem with drivers is that (except for trivial janitorial tasks),
you need the hardware to hack on the driver. However, for most of the
common hardware today, there are working drivers, correctly maintained.
The unmainainted drivers are drivers for specific hardware, or hardware
that has become uncommon.

By saying that, I realize that I'm the owner of a SCSI card handled by
the advansys driver, which is marked as BROKEN since quite a long time,
and I never did anything for the driver. I tried a bit, but it was an
awful piece of code, very hard to grasp for someone with absolutely no
knowledge of the SCSI stuff.

I saw your recent cleanup and improvements patches, I hope I'll find
the time to give them a try. The SCSI card is still in my box,
connected to a 10 years old 4x CD burner, which I almost no longer use,
since it's so slow compared to more recent CD burners.

> That's going to vary by maintainer -- people are funny that way.
> Definitely have a thick skin if you're going to do this.  I know how
> frustrating it is if you've put in a lot of work cleaning up a driver,
> only to have the maintainer reject it because "this driver has to work
> on $otheros too, and they don't have a $foo".
>=20
> I'm glad you two have taken my frustrated comment in such a positive
> way.  Thanks.

Thank you for your comment, I think it's a good idea. Like you, I'm not
sure that doing mechanical and repetitive changes to the kernel is
likely to allow the people doing it to really learn enough to be able
to do more serious changes. Working on a specific area is maybe a
better idea, as you suggest.

Sincerly,

Thomas
--=20
Thomas Petazzoni - thomas.petazzoni@enix.org
http://{thomas,sos,kos}.enix.org - http://www.toulibre.org
http://www.{livret,agenda}dulibre.org
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
