From: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Date: Fri, 22 Sep 2006 13:45:30 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/block [sane version]
Message-Id: <d120d5000609220645h3bdd2941p711c7419b50c6ea4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609202311t47038692x5627f51d69f28209@mail.gmail.com>
	 <20060921072017.GA27798@us.ibm.com>
	 <6b4e42d10609212240i3d02241djbdaa0176ab9bfb2b@mail.gmail.com>
	 <6b4e42d10609212304o52bbc9b4y434bbd7ef71281e3@mail.gmail.com>
	 <4513A21C.40704@gmail.com> <4513C9BF.7040706@grupopie.com>
	 <84144f020609220503n4c495542x2130165e371ec85c@mail.gmail.com>
	 <4513DF11.802@grupopie.com>
In-Reply-To: <4513DF11.802@grupopie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paulo Marques <pmarques@grupopie.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Jiri Slaby <jirislaby@gmail.com>, Om Narasimhan <om.turyx@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On 9/22/06, Paulo Marques <pmarques@grupopie.com> wrote:
> Pekka Enberg wrote:
> > On 9/22/06, Paulo Marques <pmarques@grupopie.com> wrote:
> >> Agreed on every comment except this one. That complex expression is
> >> really just a constant in the end, so there is no point in using kcalloc.
> >
> > The code is arguably easier to read with kcalloc.
>
> I was afraid the kcalloc call would have the added overhead of an extra
> parameter and a multiplication, but since it is actually declared as a
> static inline, gcc should optimize everything away (because both
> parameters are constants) and give the same result in the end.
>

I think the we should follow a rule like this: when allocating several
separate objects of the same type at the same time (like 10 "card"
structures) kcalloc should be used. When allocating one object (even
consisting of "several ints") kmalloc/kzalloc should be used. As far
as I can see the code just tries to allocate longish bitmap and so
kzalloc is better.

Better yet, why don't you DECLARE_BITMAP(cmd_pool_bits) and embed it
right into struct ctrl_info instead of dynamically allocating it?

-- 
Dmitry
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
