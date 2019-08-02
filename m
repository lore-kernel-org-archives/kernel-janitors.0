From: Joe Perches <joe@perches.com>
Date: Fri, 02 Aug 2019 04:23:39 +0000
Subject: linux kernel sources: more misspellings/tyops of <foo>iton words
Message-Id: <7a06b8e9acf87a871642166370ac50ec6c734ce8.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors <kernel-janitors@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Colin King <colin.king@canonical.com>

If any feels like it, here are some more typos from:

$ git grep -P '\b\w+itons?' | grep -ohP '\b\w+itons?' | sort | uniq -c | sort -rn
      7 additon
      6 definitons
      5 Prediciton
      5 instruciton
      4 conditon
      3 partititon
      3 notificaiton
      3 implementaiton
      3 definiton
      3 Additon
      2 veriton
      2 unconditon
      2 poriton
      2 parititon
      2 initializaiton
      2 defininitons
      2 conneciton
      2 configuraiton
      1 translaiton
      1 Transisitons
      1 traditon
      1 quesiton
      1 positon
      1 posiiton
      1 partiton
      1 moniton
      1 inspeciton
      1 infomraiton
      1 implicaitons
      1 identificaiton
      1 generaiton
      1 encrypiton
      1 destinaiton
      1 declariton
      1 confirmaiton
      1 Configuraiton
      1 conditons
      1 calculaiton
      1 applicaiton
      1 allocaiton
