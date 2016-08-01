From: Mike Waychison <mikew@google.com>
Date: Mon, 01 Aug 2016 16:33:08 +0000
Subject: Re: [PATCH] firmware-gsmi: Delete an unnecessary check before the function call "dma_pool_destroy"
Message-Id: <CAGTjWtA6zgRv=2BQ7wsO8eJxUKwg6SOh5zq+rqQkhFLYHvebkA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <c2e7a68c-0ee5-01e1-9da0-42602a48cf3d@users.sourceforge.net>
 <20160801120413.GF3636@codeblueprint.co.uk>
In-Reply-To: <20160801120413.GF3636@codeblueprint.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Fleming <matt@codeblueprint.co.uk>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michel Lespinasse <walken@google.com>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Matt Fleming <matt.fleming@intel.com>

On Mon, Aug 1, 2016 at 5:04 AM, Matt Fleming <matt@codeblueprint.co.uk> wrote:
>
> On Sun, 24 Jul, at 10:27:49AM, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 24 Jul 2016 10:16:56 +0200
> >
> > The dma_pool_destroy() function tests whether its argument is NULL
> > and then returns immediately. Thus the test around the call is not needed.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/firmware/google/gsmi.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>
> Looks fine to me. If Mike doesn't pick this up I'll take it through
> the EFI tree.

Yes please do.
