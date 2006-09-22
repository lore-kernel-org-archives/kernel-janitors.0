From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Date: Fri, 22 Sep 2006 12:03:26 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/block [sane version]
Message-Id: <84144f020609220503n4c495542x2130165e371ec85c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609202311t47038692x5627f51d69f28209@mail.gmail.com>
	 <20060921072017.GA27798@us.ibm.com>
	 <6b4e42d10609212240i3d02241djbdaa0176ab9bfb2b@mail.gmail.com>
	 <6b4e42d10609212304o52bbc9b4y434bbd7ef71281e3@mail.gmail.com>
	 <4513A21C.40704@gmail.com> <4513C9BF.7040706@grupopie.com>
In-Reply-To: <4513C9BF.7040706@grupopie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paulo Marques <pmarques@grupopie.com>
Cc: Jiri Slaby <jirislaby@gmail.com>, Om Narasimhan <om.turyx@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On 9/22/06, Paulo Marques <pmarques@grupopie.com> wrote:
> Agreed on every comment except this one. That complex expression is
> really just a constant in the end, so there is no point in using kcalloc.

The code is arguably easier to read with kcalloc.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
