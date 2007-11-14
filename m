From: Julia Lawall <julia@diku.dk>
Date: Wed, 14 Nov 2007 06:09:40 +0000
Subject: Re: [PATCH 1/4] drivers/i2c: Drop redundant includes of moduleparam.h
Message-Id: <Pine.LNX.4.64.0711140707120.25487@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711132231080.18337@ask.diku.dk>
 <alpine.LFD.0.9999.0711131632490.26111@localhost.localdomain>
In-Reply-To: <alpine.LFD.0.9999.0711131632490.26111@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: khali@linux-fr.org, i2c@lm-sensors.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>> From: Julia Lawall <julia@diku.dk>
>>
>> Drop #include <linux/moduleparam.h> in files that also include #include
>> <linux/module.h>.  module.h includes moduleparam.h already.
>
> i'm not convinced that's a good idea.  while module.h does currently
> (and unfortunately) include moduleparam.h, there may come a day when
> those header files are refactored to actually make sense, at which
> point all those missing moduleparam.h inclusions will cause all sorts
> of bad things to happen.

They were removed from the drivers/media files in August:
9c12224a607a4b22ab86784e3394b52810b9507c
Perhaps they should be put back there then?

julia

