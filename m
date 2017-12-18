From: Joe Perches <joe@perches.com>
Date: Mon, 18 Dec 2017 18:46:15 +0000
Subject: Re: [PATCH] scripts/spelling.txt: add more spelling mistakes to spelling.txt
Message-Id: <1513622775.31581.119.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171218141904.7488-1-colin.king@canonical.com>
         <2cfeac9c-0592-3866-434f-f1dfc5dd33a9@infradead.org>
In-Reply-To: <2cfeac9c-0592-3866-434f-f1dfc5dd33a9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>, Colin King <colin.king@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2017-12-18 at 10:10 -0800, Randy Dunlap wrote:
> On 12/18/2017 06:19 AM, Colin King wrote:
> > Here are some of the more spelling mistakes and typos that I've found
> > while fixing up spelling mistakes in kernel error message text since
> > October 2017
[]
> > diff --git a/scripts/spelling.txt b/scripts/spelling.txt
[]
> Please add:
> assignement||assignment

and the plurals too

assignements||assignments

$ git grep -i -w assignement | wc -l
8
$ git grep -i -w assignements | wc -l
3


Some selected other trivial existing 'ement[s]'

     18 segement
     11 fragement
      8 adjustement
      7 meashorement
      6 mangement
      4 incremement
      4 environement
      3 impelement
      3 arragement
      3 arguement
      2 magement
      2 impement
      2 imlement
      1 requrement
      1 requiriement
      1 reqirement

