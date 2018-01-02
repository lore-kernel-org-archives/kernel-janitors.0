From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 Jan 2018 15:00:48 +0000
Subject: =?UTF-8?Q?Re:_Rename_the_SmPL_script_=e2=80=9ckzalloc-=e2=80=a6.coc?= =?UTF-8?B?Y2nigJ0/?=
Message-Id: <6046ed93-71f0-7e2a-c02b-29783f2e4f4c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <ae67a02e-7257-c7e0-f4a1-bdf35a3bb2d0@users.sourceforge.net>
 <alpine.DEB.2.20.1801021528160.24055@hadrien>
 <96aee198-15b2-dc96-a349-d8a70d06dc67@users.sourceforge.net>
 <alpine.DEB.2.20.1801021541070.24055@hadrien>
In-Reply-To: <alpine.DEB.2.20.1801021541070.24055@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * I am unsure which name will be better finally.
>>   Would we like to achieve another permalink here?
> 
> Actually, according to th original name choice it is stillsimple,

The involved contributors have got different views if the available script
remains “simple” enough at the moment.


> becaue it doesn't account for the possibility of many statement between
> the alloc and the memset

* How close should these function call be kept together?
* Which additional statements would you tolerate between them?


> and it doesn't account for different ways of expressing the size between
> the two calls.

Would you like to get any extensions there?


> If you want to be more general than kzalloc, then perhaps
> zalloc-simple.cocci would be ok.

Will other suffixes be safer for a permanent file name so that confusion
could be avoided around different expectations for “simplicity”?

Regards,
Markus
