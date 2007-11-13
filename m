From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 13 Nov 2007 21:34:58 +0000
Subject: Re: [PATCH 1/4] drivers/i2c: Drop redundant includes of
Message-Id: <alpine.LFD.0.9999.0711131632490.26111@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711132231080.18337@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711132231080.18337@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: khali@linux-fr.org, i2c@lm-sensors.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 13 Nov 2007, Julia Lawall wrote:

> Send to:
> khali@linux-fr.org,
> i2c@lm-sensors.org,
> linux-kernel@vger.kernel.org,
> kernel-janitors@vger.kernel.org
>
> Subject: [PATCH 1/4] drivers/i2c: Drop redundant includes of moduleparam.h
>
>
> ------------------------------------------------------
>
> From: Julia Lawall <julia@diku.dk>
>
> Drop #include <linux/moduleparam.h> in files that also include #include
> <linux/module.h>.  module.h includes moduleparam.h already.

i'm not convinced that's a good idea.  while module.h does currently
(and unfortunately) include moduleparam.h, there may come a day when
those header files are refactored to actually make sense, at which
point all those missing moduleparam.h inclusions will cause all sorts
of bad things to happen.

rday

p.s.  i tried that cleanup once.  it got ugly in a hurry.

--
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
