From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 10 Jul 2008 23:06:37 +0000
Subject: Re: ioctl conversion
Message-Id: <20080710160637.ee5eb1e6.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6d291e080807101427y47045935h909a6b20b3ee1b7e@mail.gmail.com>
In-Reply-To: <6d291e080807101427y47045935h909a6b20b3ee1b7e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 10 Jul 2008 17:35:58 -0500 Stoyan Gaydarov wrote:

> On Thu, Jul 10, 2008 at 4:27 PM, Stoyan Gaydarov <stoyboyker@gmail.com> wrote:
> > My question is based on the following: http://lkml.org/lkml/2008/1/8/213
> >
> > I have looked at that message and have also tried to create a patch
> > based on it, I have submitted it and I am not sure that anyone really
> > cared to apply it since no one really responded to it. My question is,
> > who do I send these patches to since I obviously got it wrong the
> > first time. Should I just send them to the kernel-list or the
> > kernel-janitors list? or the specific maintainers of the code I am
> > looking at? or maybe all of the above?
> >
> > -Stoyan G
> >
> 
> On the same note, where is lock_kernel() and unlock_kernel() defined.

lib/kernel_lock.c

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
