From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 25 Apr 2008 21:27:10 +0000
Subject: Re: [PATCH] Documentation:  Explain 4K stacks in slightly more
Message-Id: <alpine.LFD.1.10.0804251724290.21716@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0804251549050.20250@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 25 Apr 2008, Matthew Wilcox wrote:

> I just ran a grep for 4KSTACKS ... this text appears to have been
> duplicated into three other architectures, so should be updated on
> all of them together.  Except for the bit about the interrupt
> stacks; as far as I can tell, they don't do that.

all right, that's just confusing.  for one thing, 4K stacks are still
classified as a "debug" feature under x86, but apparently a regular
feature under m68knommu and back to being a debug feature under SH.
grrrrr.

i'm going to look at this more closely.  carry on.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
