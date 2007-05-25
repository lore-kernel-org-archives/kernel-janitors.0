From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 25 May 2007 20:07:46 +0000
Subject: Re: [KJ] looking for a project? (ARRAY_SIZE)
Message-Id: <Pine.LNX.4.64.0705251606060.14291@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705250636220.11199@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705250636220.11199@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 25 May 2007, Andi Drebes wrote:

> OK. I think I can prepare my patches ("what I've got so far")
> tomorrow and send them directly to the mailing list. How do you
> propose the patches should be organized? One subdirectory of drivers
> per patch? One per module? Things might end up in too many patches
> or big patches that don't affect the same subsystem...

if you can do a chunk at a time that is under the authority of a
single maintainer in the MAINTAINERS file, and Cc that maintainer each
time you post to the list, that's the easiest way to do it.

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
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
