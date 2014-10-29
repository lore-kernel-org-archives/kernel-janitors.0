From: Raphael S Carvalho <raphael.scarv@gmail.com>
Date: Wed, 29 Oct 2014 23:25:32 +0000
Subject: Where's the current ToDo?
Message-Id: <CACz=WeeHhmOOJPQJz1zjGiG1hceTQQMzzj72DW0FbWh3UV=H=w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141026054124.GA30544@rho.novalocal>
In-Reply-To: <20141026054124.GA30544@rho.novalocal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 29, 2014 at 6:26 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sun, Oct 26, 2014 at 12:41:24AM -0500, Jose-Luis Rivas wrote:
> > Hi,
> >
> > I was checking out the ToDo list and AFAICS [0] seems to be pretty much
> > outdated. Don't know if there's a more up-to-date list of ToDos or I'm
> > supposed to check them all and see which ones are current. Just asking
> > since I want to be sure I'm checking at the right place.
> >
> > [0] http://kernelnewbies.org/KernelJanitors/Todo/ApiChanges
> >
>
> Sorry we don't have a current TODO list.  These days we normally just
> tell people to cleanup staging drivers or fix compile warnings and
> static checker issues.

Hi Jose, please keep in mind that the tasks Dan stated above are good
for beginners. As soon as you get used with the Linux way of doing
things, you should move on to more complex things. AFAICT, no one I
have heard of became a kernel hacker by doing cleanups or changing
code to silence the compiler. In addition, it's not enjoyable either,
meaning that you would soon get tired of doing cleanups and alike. I
would also recommend reading the Linux Device Drivers book, so as to
provide you with some background on how Linux works from a general
perspective and also how device drivers are written, then allowing you
to move on and do cool stuff.

Thanks in advance,
Raphael S. Carvalho
