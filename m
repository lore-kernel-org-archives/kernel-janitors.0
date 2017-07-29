From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Date: Sat, 29 Jul 2017 09:16:11 +0000
Subject: Concerning [PATCH] staging: pi433: fix bugs in register abstraction of rf69 chip
Message-Id: <648573072.11146.1501319771774@ox.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Greg,

there is another patch from me (see subject). I sent it 19/07/2017.

Most probably, there is also something wrong with the patch, but maybe you can
get it to work. 

The patch would be important. It doesn't fix any warnings or errors of static
code analysis, but it fixes true implementation errors (wrong access of
registers). From my point of view, that is one of the most important changes to
the code, we had during the last weeks.

Thanks,

Marcus
