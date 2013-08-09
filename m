From: walter harms <wharms@bfs.de>
Date: Fri, 09 Aug 2013 08:07:33 +0000
Subject: rfc: ARRAY_AND_SIZE
Message-Id: <5204A345.5060605@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi list,
while looking at Julias nice patch. i notice the ARRAY_AND_SIZE macro
it looks like that:

#define ARRAY_AND_SIZE(x)       (x), ARRAY_SIZE(x)

I see problem: hiding an argument in function calls is bad.
(personally i hate hiding arguments in function calls therefore i am not objective)

the next problem is that it is defined 6 times in different locations.
(see:http://lxr.free-electrons.com/ident?i=ARRAY_AND_SIZE)

But so far it is used in the ARM tree mostly.

Is there any policy on that ?

re,
 wh
