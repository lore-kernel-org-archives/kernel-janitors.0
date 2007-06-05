From: "Kevin Jackson" <foamdino@gmail.com>
Date: Tue, 05 Jun 2007 11:22:40 +0000
Subject: [KJ] for loops and variable declarations...
Message-Id: <ab8e556c0706050422y1cf091a8n34313317a92a5afd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

I'm just looking at kernel code for basically the first time - so
please be patient :)

I'm seeing this style of code:

uchar a
...
...
...
...
...
...(many lines later...)
for(a=2; a< VALUE; a++)


Why are loop variables declared so far away from where they are used?
Is this advantageous in some way?  It seems that the scope of the
variables is much larger than having them declared just as they are to
be used eg:

for(uchar a=2; a<VALUE; a++)

Sorry if this is a totally stupid question.

Kev
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
