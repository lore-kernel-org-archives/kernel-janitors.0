From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 04 Apr 2008 15:28:05 +0000
Subject: Re: any value to numerous checks of "#ifdef __GNUC__"?
Message-Id: <alpine.LFD.1.00.0804041126500.25503@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 4 Apr 2008, walter harms wrote:

> hi, so far i know the intel compiler can compile a linux kernel.
> ntl. this is most likely crap since the compiler is checked much
> more early. (or at least should).

actually, those checks could be reasonable for content exported to
userspace, but if it's not exported, i don't see any value to those
tests.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
