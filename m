From: Domen Puncer <domen@coderock.org>
Date: Mon, 24 May 2004 14:05:29 +0000
Subject: [Kernel-janitors] Re: kjt patch-set for 2.6.7-rc1
Message-Id: <20040524140529.GA23877@nd47>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62001204479026706=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62001204479026706==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 24/05/04 12:00 +0200, maximilian attems wrote:
> hello!
> 
Hi.

...
> this patch is intended for further _testing_ of our work.
> i hope that it helps Acme releasing the official kj ones.
> i won't forward anything to maintainers or lkml.
> will try to release on weekly/10days base.
...

Great idea!

I have one suggestion, try egrep -n "^\+(.* $|        )", to see if
patches introduce trailing spaces or spaces instead of tabs.
This also bit me, so below are links to 2 updated patches.

> +remove-old-ifdefs-fasttimer
http://coderock.org/kernel/janitor/old_ifdefs-take3/arch-cris-arch-v10-kernel-fasttimer.c_take2
> +remove-old-ifdefs-mtdcore
http://coderock.org/kernel/janitor/old_ifdefs-take3/drivers-mtd-mtdcore.c_take2


> +yield-nicedelay-sb1000
> +yield-schedtmout-megaraid
> +yield-schedtmout-sonycd535

These are the other patches that contain spaces.


	Domen

--===============62001204479026706==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62001204479026706==--
