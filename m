From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 16 Feb 2019 08:41:45 +0000
Subject: Re: [v5] coccinelle: semantic code search for missingput_device()
Message-Id: <alpine.DEB.2.21.1902160939540.3212@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: 201902161504357846572@zte.com.cn,
 10281c5d-8b32-0a02-17ae-20bf86f8dc65@web.de
 <201902161633004137519@zte.com.cn>
 <alpine.DEB.2.21.1902160934400.3212@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902160934400.3212@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wen.yang99@zte.com.cn
Cc: wang.yi59@zte.com.cn, kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, yellowriver2010@hotmail.com, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, cheng.shengyu@zte.com.cn, cocci@systeme.lip6.fr

Actually, upon reflection, I don't like the if (...) solution.  if (id !NULL) would be better.  This will also check for if (id).  If having such
an explicit test results in false positives, the semantic patch can be
revised.  But it is better than if (...), which allow anything at all, and
could miss cases where the free should happen, but does not.

julia
