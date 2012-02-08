From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 08 Feb 2012 12:39:29 +0000
Subject: Re: [alsa-devel] [PATCH 1/15] sound/soc/mxs/mxs-saif.c: add missing iounmap
Message-Id: <alpine.DEB.2.02.1202081339040.1833@localhost6.localdomain6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1673869226-1328704770=:1833"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-1-git-send-email-Julia.Lawall@lip6.fr>
	<7FE21149F4667147B645348EC605788508FBDB@039-SN2MPN1-013.039d.mgd.msft.net>
	<alpine.DEB.2.02.1201241828480.1779@localhost6.localdomain6>
	<20120124202203.GD1135@opensource.wolfsonmicro.com>
	<alpine.DEB.2.02.1201242144580.1998@hadrien>
	<20120126110506.GB2611@pengutronix.de>
	<alpine.DEB.2.02.1201261220460.1851@localhost6.localdomain6>
	<20120126112242.GA9401@opensource.wolfsonmicro.com>
	<alpine.DEB.2.02.1201280801230.2045@hadrien>
	<20120206162017.GM3070@opensource.wolfsonmicro.com>
	<CAA+hA=Qu0z15vkskBOZdnEMqxmOV5Dk-gmA1ZJtJtuY0e=MRFA@mail.gmail.com>
In-Reply-To: <CAA+hA=Qu0z15vkskBOZdnEMqxmOV5Dk-gmA1ZJtJtuY0e=MRFA@mail.gmail.com>
To: Dong Aisheng <dongas86@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Wolfram Sang <w.sang@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Dong Aisheng-B29396 <B29396@freescale.com>, Liam Girdwood <lrg@ti.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1673869226-1328704770=:1833
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Feb 2012, Dong Aisheng wrote:

> On Tue, Feb 7, 2012 at 12:20 AM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
>> On Sat, Jan 28, 2012 at 08:03:34AM +0100, Julia Lawall wrote:
>>
>>> patch against
>>> git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>>
>> Hrm, I know there had been some debate about what to generate against
>> but this now once again fails to apply against for-3.4... =A0No idea
>> what's going on there and I didn't investigate the conflicts, sorry.
>>
>> I had been waiting in the vauge hope that some of the mxs maintainers
>> would review.
>>
> I also failed to apply it against for-3.4.
> It seemed the conflicts are a lot.
>
> Hi Julia,
>
> Can you regenerate the patch based on Mark's for-3.4 branch?
>
> BTW, i wonder if this patch's title should be changed a bit
> since what this patch does is not adding missing iounmap anymore.
> Maybe like: ASoC: mxs-saif: convert to use devm_kmalloc and its friends.

Yes, thanks for the suggestions.  I will do both shortly (today or=20
tomorrow).

julia
--8323328-1673869226-1328704770=:1833--
