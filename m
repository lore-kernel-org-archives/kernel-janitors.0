From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 16 Feb 2007 18:02:39 +0000
Subject: Re: [KJ] how do config options disappear from the "defconfig" files?
Message-Id: <Pine.LNX.4.64.0702161259320.1337@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702160939220.29917@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702160939220.29917@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Feb 2007, Adrian Bunk wrote:

> On Fri, Feb 16, 2007 at 09:40:46AM -0500, Robert P. J. Day wrote:
> >
> >   i just want to clarify one point about all of the defconfig files in
> > the source tree.  if a CONFIG option is removed from the Kconfig
> > infrastructure, does that corresponding entry eventually disappear
> > from all of the defconfig files based on an automatic build at some
> > point?  thanks.
>
> Not automatically.
>
> Architecture maintainers sometimes [1] update the defconfig files
> for their architectures.
>
> But don't bother - a dead option in a defconfig file doesn't do any
> harm, and manually removing options from defconfig files only causes
> never ending patch conflicts.

oh, i had *no* intention of submitting patches to do any of that.  i
tried that once and was told politely but firmly that those options
would "eventually" disappear on their own so just leave them alone.

i was more interested in whether there was a process that would
eventually *automatically* remove them, or whether it was a manual
decision.  from what you say, it sounds like manual maintainer
intervention.  that's all i wanted to clarify.  thanks.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
