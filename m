From: "Paolo Ciarrocchi" <paolo.ciarrocchi@gmail.com>
Date: Mon, 28 Jan 2008 00:08:13 +0000
Subject: Re: #if 0
Message-Id: <4d8e3fd30801271608teb74ce7na2384a718a593ad3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
In-Reply-To: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Jan 28, 2008 1:03 AM, Bert Wesarg <bert.wesarg@googlemail.com> wrote:
>
> On Jan 28, 2008 12:55 AM, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com> wrote:
> > On Jan 28, 2008 12:29 AM, Bert Wesarg <bert.wesarg@googlemail.com> wrote:
> > > Hi,
> > >
> > > On Jan 28, 2008 12:10 AM, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com> wrote:
> > > > Hi all,
> > > > I'm failing to understand why the following patch is changing the md5sum
> > > > of the relative .o file
> > > >
> > > > Isn't the code included in the #if 0 #endif section supposed to be
> > > > ignored by the compiler?
> > > Yes, but I think the line numbers changes too and are also in the .o file.
> >
> > Dunno, but stripping the file make md5sum as follow:
> > paolo@paolo-desktop:~/linux-2.6/kernel$ strip
> > /home/paolo/Desktop/File\ punto\ o/*
> > paolo@paolo-desktop:~/linux-2.6/kernel$ md5sum
> > /home/paolo/Desktop/File\ punto\ o/*
> > 2bf404e247edf33cf6fb99c37321cdb9  /home/paolo/Desktop/File punto o/error.o.after
> > 2bf404e247edf33cf6fb99c37321cdb9  /home/paolo/Desktop/File punto
> > o/error.o.before
> Perfect. What was your problem?

The problem was that I didn't expect to see different md5sum after removing
some dead code.

I'm working on a series of cleanup patches and I want to be sure that
I'm NOT changing
the .o file. I want to be sure that every single patch is just
cleaning the code.

What I wanted to do was:
make a/b/c.o
md5sum a/b/c.o
applying the first patch
make clean && make a/b/c.o
md5sum a/b/c.o
and so on.

Should I add the strip command to the procedure?
And if yes... why?

Thanks!

Ciao,
-- 
Paolo
http://paolo.ciarrocchi.googlepages.com/
