From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 04 Jun 2014 09:38:13 +0000
Subject: Re: [PATCH 0/10] use safer test on the result of find_first_zero_bit
Message-Id: <alpine.DEB.2.10.1406041137270.2441@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401872880-23685-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAMuHMdXsoFUXj4jLMWN6NY7Um19KwWO9Rhx=9=gqWu_K5Ev2kQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXsoFUXj4jLMWN6NY7Um19KwWO9Rhx=9=gqWu_K5Ev2kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: driverdevel <devel@driverdev.osuosl.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux Fbdev development list <linux-fbdev@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, iss_storagedev@hp.com, Linux-sh list <linux-sh@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, adi-buildroot-devel@lists.sourceforge.net, Julia Lawall <Julia.Lawall@lip6.fr>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>



On Wed, 4 Jun 2014, Geert Uytterhoeven wrote:

> Hi Julia,
>
> On Wed, Jun 4, 2014 at 11:07 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> > Find_first_zero_bit considers BITS_PER_LONG bits at a time, and thus may
> > return a larger number than the maximum position argument if that position
> > is not a multiple of BITS_PER_LONG.
>
> Shouldn't this be fixed in find_first_zero_bit() instead?

OK, I could do that as well.  Most of the callers currently test with >=.
Should they be left as is, or changed to use =?

julia
