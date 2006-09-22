From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Fri, 22 Sep 2006 22:55:10 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/block [sane version]
Message-Id: <6b4e42d10609221555i721bef48m847a4d85ec0a080c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609202311t47038692x5627f51d69f28209@mail.gmail.com>
	 <20060921072017.GA27798@us.ibm.com>
	 <6b4e42d10609212240i3d02241djbdaa0176ab9bfb2b@mail.gmail.com>
	 <6b4e42d10609212304o52bbc9b4y434bbd7ef71281e3@mail.gmail.com>
	 <4513A21C.40704@gmail.com> <4513C9BF.7040706@grupopie.com>
	 <84144f020609220503n4c495542x2130165e371ec85c@mail.gmail.com>
	 <4513DF11.802@grupopie.com>
	 <d120d5000609220645h3bdd2941p711c7419b50c6ea4@mail.gmail.com>
In-Reply-To: <d120d5000609220645h3bdd2941p711c7419b50c6ea4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paulo Marques <pmarques@grupopie.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

> I think the we should follow a rule like this: when allocating several
> separate objects of the same type at the same time (like 10 "card"
> structures) kcalloc should be used. When allocating one object (even
> consisting of "several ints") kmalloc/kzalloc should be used. As far
> as I can see the code just tries to allocate longish bitmap and so
> kzalloc is better.
>
> Better yet, why don't you DECLARE_BITMAP(cmd_pool_bits) and embed it
> right into struct ctrl_info instead of dynamically allocating it?
hba is decalred as
static ctlr_info_t *hba[MAX_CTLR]
So if I change the cmd_pool_bits to embed the DECLARE_BITMAP
statement, while compiling this file as a module, is there not a
chance of cmd_pool_bits cross a page boundary and allocated in two non
contiguous (physical) pages? Would it cause a problem with
__find_fist_zero_bit() and friends?
Regards,
Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
