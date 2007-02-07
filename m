From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Wed, 07 Feb 2007 15:30:26 +0000
Subject: [KJ]  BIT macro cleanup
Message-Id: <3b44d3fb0702070718k60cbb0a9h63b3e7b736ffa2fd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all

I would like to take up the BIT macro cleanup.
http://www.fsdev.net/wiki/index.php?title=BIT

I think include/linux/bitops.h would be the best place to add the BIT macro.
Let me know if this is fine.

There are different variants of BIT using (long|unsigned
long|unsigned|unsigned char) etc.
Do we need to create different macros for each type
Or a single one which takes type as input?
Thoughts.

Milind A Choudhary
Pune-India
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
