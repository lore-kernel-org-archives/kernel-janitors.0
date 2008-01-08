From: "Paolo Ciarrocchi" <paolo.ciarrocchi@gmail.com>
Date: Tue, 08 Jan 2008 20:03:13 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <4d8e3fd30801081203l636c5923j7965efaa9c121c56@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org>
	 <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
	 <20080108200044.GI16309@parisc-linux.org>
In-Reply-To: <20080108200044.GI16309@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Jan 8, 2008 9:00 PM, Matthew Wilcox <matthew@wil.cx> wrote:
> On Tue, Jan 08, 2008 at 08:58:04PM +0100, Paolo Ciarrocchi wrote:
> > -static const struct file_operations rtc_fops = {
> > +static long rtc_fioctl(struct file_operations rtc_fops)
> > +{
> > +     lock_kernel();
> >       .owner          = THIS_MODULE,
>
> You should probably restrict yourself to files that you can at least
> compile ...

Yes of course, I've been silly in didn't verify whether the file compile
but I would appreciate to know whether I'm on the right track or not.

Switching to a different file now...

Thanks.

Ciao,
-- 
Paolo
http://paolo.ciarrocchi.googlepages.com/
