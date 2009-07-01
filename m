From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Date: Wed, 01 Jul 2009 08:54:59 +0000
Subject: Re: [PATCH] block: adding __init/__exit macros to DAC960.c
Message-Id: <200907011054.59988.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200906121307.29865.PeterHuewe@gmx.de> <200906230004.36995.PeterHuewe@gmx.de> <alpine.LNX.2.00.0906231048070.7457@wotan.suse.de>
In-Reply-To: <alpine.LNX.2.00.0906231048070.7457@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am Dienstag 23 Juni 2009 10:48:28 schrieb Jiri Kosina:
> On Tue, 23 Jun 2009, Peter H=C3=BCwe wrote:
> > > Trivial patch which adds the __init and __exit macros to the
> > > module_init / module_exit functions from drivers/block/DAC960.c
> > > linux version 2.6.30
> >
> > I was wondering if there is anything wrong with the patch or is it still
> > in the review phase ?
>
> I have applied it to trivial queue, thanks Peter.

Hi Jiri,

I just looked in your git tree - it still does not appear there :)
I'm sorry for bugging you with this trivial patch.

Peter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
