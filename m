From: "Tharindu Rukshan Bamunuarachchi" <tharindunix@gmail.com>
Date: Mon, 18 Sep 2006 05:54:59 +0000
Subject: [KJ] Real Time Behaviour
Message-Id: <c49434130609172242n4335ad14jd68ad177bef0eeb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dear All,

I am going to achive some kind of rela time behaviour by increasing HZ
value in kernel.

I tried to change HZ value in include/asm/param.h.

1. HZ = 1000 --- Repsonse time <3ms
2. HZ = 1500 --- Response time <2ms

I could not go beyond 1500, SHIFT_HZ parameter failed to adjust for 2000.

How can i go beyond 1500 in HZ,

Are there any other way to fine tune kernel to achive real time
behaviour, other than changing HZ value??

Thank you! in  advance!!

-- 
Tharindu Rukshan Bamunuarachchi
all fabrications are subject to decay
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
