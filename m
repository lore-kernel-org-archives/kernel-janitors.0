From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 29 Mar 2008 13:54:51 +0000
Subject: Re: [PATCH] jiffies.h: Better error message and add "const" where
Message-Id: <alpine.LFD.1.00.0803290951420.20292@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803290930110.20145@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803290930110.20145@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 29 Mar 2008, Matthew Wilcox wrote:

> On Sat, Mar 29, 2008 at 09:32:39AM -0400, Robert P. J. Day wrote:
> > Add a more informative error message for bad values of HZ, and add
> > "const" argument qualification for a couple routines for which
> > it's appropriate.
>
> What effect do you think adding the 'const' has?  Remember, C is
> pass-by-value.

simple consistency -- "const" is used elsewhere on prototypes in
jiffies.h:

...
extern unsigned int jiffies_to_msecs(const unsigned long j);
extern unsigned int jiffies_to_usecs(const unsigned long j);
extern unsigned long msecs_to_jiffies(const unsigned int m);
extern unsigned long usecs_to_jiffies(const unsigned int u);
... etc etc ...

> More useful might be to mark the functions with __attribute_const__.

good point ... under the circumstances, then, what's worth doing in
that header file?  adding __attribute_const__ where appropriate?  or
just leaving things as they are?  i'm good either way, i just happen
to like consistency.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
