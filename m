From: Paulo Marques <pmarques@grupopie.com>
Date: Fri, 22 Sep 2006 13:03:13 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/block [sane version]
Message-Id: <4513DF11.802@grupopie.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609202311t47038692x5627f51d69f28209@mail.gmail.com>	 <20060921072017.GA27798@us.ibm.com>	 <6b4e42d10609212240i3d02241djbdaa0176ab9bfb2b@mail.gmail.com>	 <6b4e42d10609212304o52bbc9b4y434bbd7ef71281e3@mail.gmail.com>	 <4513A21C.40704@gmail.com> <4513C9BF.7040706@grupopie.com> <84144f020609220503n4c495542x2130165e371ec85c@mail.gmail.com>
In-Reply-To: <84144f020609220503n4c495542x2130165e371ec85c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Jiri Slaby <jirislaby@gmail.com>, Om Narasimhan <om.turyx@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Pekka Enberg wrote:
> On 9/22/06, Paulo Marques <pmarques@grupopie.com> wrote:
>> Agreed on every comment except this one. That complex expression is
>> really just a constant in the end, so there is no point in using kcalloc.
> 
> The code is arguably easier to read with kcalloc.

I was afraid the kcalloc call would have the added overhead of an extra 
parameter and a multiplication, but since it is actually declared as a 
static inline, gcc should optimize everything away (because both 
parameters are constants) and give the same result in the end.

So, its fine by me either way.

-- 
Paulo Marques - www.grupopie.com

"The face of a child can say it all, especially the
mouth part of the face."
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
