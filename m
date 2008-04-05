From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 05 Apr 2008 12:26:21 +0000
Subject: Re: any value to numerous checks of "#ifdef __GNUC__"?
Message-Id: <alpine.LFD.1.00.0804050822180.8326@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 5 Apr 2008, Darren Jenkins wrote:

> On Sat, Apr 5, 2008 at 12:18 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> > is it even remotely feasible that the kernel might someday support
> > a non-GNU C compiler, given the numerous gcc extensions that are
> > used?
>
> I think people are working on getting tinycc to compile an
> un-modified kernel, and I think LLVM is close-ish, also some BSD
> guys are working on PCC so it might be able to compile the kernel in
> the (distant?)future.
>
> It concerns me a little that GCC is the only OSS compiler that can
> compile the kernel.

well, as i mentioned earlier, the intel compiler is also officially
approved, but it defines __GNUC__ so it masquerades as gcc, anyway.

and, as a followup to my original question, once i looked closer, it
does look like most of that "#ifdef __GNUC__" checking does get
exported to userspace, quite possibly for exactly the reason darren
mentions -- to support *userspace* non-gcc compilation.  i'm sure
there are *some* superfluous in-kernel __GNUC__ tests, but probably
nowhere near as many as i first suspected.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
