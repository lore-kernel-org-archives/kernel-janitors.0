From: Domen Puncer <domen@coderock.org>
Date: Mon, 17 May 2004 17:38:32 +0000
Subject: [Kernel-janitors] Re: remove old ifdef'd code from
Message-Id: <20040517173832.GB5034@nd47>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48067762235708567=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48067762235708567==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17/05/04 08:11 -0700, Randy.Dunlap wrote:
> On Mon, 17 May 2004 14:44:49 +0200 Domen Puncer wrote:
> 
> | Hi.
> | 
> | I'm not attaching this inline, it's 80k and might make someone unhappy.
> | 4 patches are at: http://coderock.org/kernel/janitor/old_ifdefs_scsi-gdth/
> | 
> | Comments?
> 
> They look OK to me.  A couple of small items:
> 
> If I were doing these (not saying that this is any kind of
> requirement :), I would add:
> 
> a.  'diffstat -p1' output

 drivers/scsi/gdth.c      |  736 ++++-------------------------------------------
 drivers/scsi/gdth.h      |   34 --
 drivers/scsi/gdth_proc.c |  208 ++-----------
 drivers/scsi/gdth_proc.h |   10 
 4 files changed, 103 insertions(+), 885 deletions(-)

> b.  comments like "I built and loaded it.  Don't have hardware
> 	to test it."

I usually just 'make ... .o', is that enough, or should i compile it as
module and/or in-kernel?

In this case... compiles as in-kernel and module, and loads as module.


> It might be a good idea to check the init and exit sections for
> mis-use with something like:
>   http://developer.osdl.org/rddunlap/scripts/reference_init26.pl
> and report that also.

Funny, gdth passes this, but lots of other stuff don't.


> Or in general just report what you have done in order to have
> some confidence in these (any) patches.  (This is meant to be a
> general comment, not directed at Domen in particular.)

Point taken, will try not to forget this in future.


> --
> ~Randy


	Domen

--===============48067762235708567==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48067762235708567==--
