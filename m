From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 09 Aug 2013 08:15:20 +0000
Subject: Re: rfc: ARRAY_AND_SIZE
Message-Id: <alpine.DEB.2.02.1308091013390.2295@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5204A345.5060605@bfs.de>
In-Reply-To: <5204A345.5060605@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 9 Aug 2013, walter harms wrote:

> hi list,
> while looking at Julias nice patch. i notice the ARRAY_AND_SIZE macro
> it looks like that:
>
> #define ARRAY_AND_SIZE(x)       (x), ARRAY_SIZE(x)
>
> I see problem: hiding an argument in function calls is bad.
> (personally i hate hiding arguments in function calls therefore i am not objective)
>
> the next problem is that it is defined 6 times in different locations.
> (see:http://lxr.free-electrons.com/ident?i=ARRAY_AND_SIZE)
>
> But so far it is used in the ARM tree mostly.
>
> Is there any policy on that ?

It is indeed quite disconcerting.  For example, I found the following:

arch/arm/mach-pxa/stargate2.c

991         i2c_register_board_info(0, ARRAY_AND_SIZE(stargate2_i2c_board_info));
992         i2c_register_board_info(1, stargate2_pwr_i2c_board_info,
993                                 ARRAY_SIZE(stargate2_pwr_i2c_board_info));

On the other hand, with ARRAY_AND_SIZE, one is sure that the two arguments
are the same...

julia
