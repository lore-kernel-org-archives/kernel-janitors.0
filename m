From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 15 Nov 2007 12:42:28 +0000
Subject: Re: [PATCH 1/4] drivers/i2c: Drop redundant includes of
Message-Id: <alpine.LFD.0.9999.0711150739490.9736@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711132231080.18337@ask.diku.dk> <alpine.LFD.0.9999.0711131632490.26111@localhost.localdomain> <Pine.LNX.4.64.0711140707120.25487@ask.diku.dk> <alpine.LFD.0.9999.0711140416160.4673@localhost.localdomain>
 <20071115131915.0eb34c98@hyperion.delvare>
In-Reply-To: <20071115131915.0eb34c98@hyperion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: Julia Lawall <julia@diku.dk>, i2c@lm-sensors.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 15 Nov 2007, Jean Delvare wrote:

... snip ...

> I share Robert's point of view here. Relying on header files
> including each other is usually not a good idea, as build then
> breaks when the headers are cleaned up or reorganized.

... more snip ...

> If there's a fundamental reason why module.h has to include
> moduleparam.h, then both headers should be merged in a single file.
> If not, then both header files should be clearly split and drivers
> should include each of them as needed. Either way, header files must
> be fixed first, and drivers adjusted in consequence. So, I'm not
> taking this patch, sorry.

keeping this short and sweet, i updated my wiki page on this topic:

http://www.crashcourse.ca/wiki/index.php/Module.h_and_moduleparam.h

i think the fundamental question here is whether this is even
cleanable without massive disruption.

rday

--
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
