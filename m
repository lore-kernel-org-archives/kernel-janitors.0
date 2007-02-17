From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 17 Feb 2007 00:02:51 +0000
Subject: [KJ] [kj][RFC] roll macro's in bitops.h
Message-Id: <1171670571.7850.27.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel Janitors <kernel-janitors@lists.osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>

G'day people,

I was looking at bitops.h and noticed there were a couple of inline roll
functions to operate on 32bit variables. (left and right)

I think that is a little bit dumb as they are constant width (only
32bits) due to it being an inline function, and was wondering if anyone
thought it would be useful to have some (variable sized) roll macros
instead.

I whipped these twp up as examples, but have not tested them yet.

#define RollRight(Data, Distance) \
({      typeof(Data) __a = Data;   \
        typeof(Distance) __b = Distance%(sizeof(__a) * 8); \
	__a = ((__a>>__b) | (__a<<((sizeof(__a) * 8) - __b))) \
	__a; \
})

#define RollLeft(Data, Distance) \
({      typeof(Data) __a = Data;   \
        typeof(Distance) __b = Distance%(sizeof(__a) * 8); \
	__a = ((__a<<__b) | (__a>>((sizeof(__a) * 8) - __b))) \
	__a; \
})

Also if these are useful I was wondering how to handle the existing
functions ? #define them out for the time being ?

#define rol32(a, b) RollLeft(a, b)
#define ror32(a, b) RollRight(a, b)




Darren Jenkins


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
