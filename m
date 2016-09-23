From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 07:36:17 +0000
Subject: Re: GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detection
Message-Id: <d9ce49fe-4aab-2138-3ecc-86fa825120fa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
 <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
 <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
 <b22e0060-503d-ac31-fe8c-8a356145bec8@ti.com>
In-Reply-To: <b22e0060-503d-ac31-fe8c-8a356145bec8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jyri Sarha <jsarha@ti.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>

> I think the "if (node)" in the of_node_put() is there on purpose,

Yes, of course.

Does such an implementation detail correspond to a general software design pattern?


> because it potentially saves the caller one extra if()-statement

This can occasionally happen.


> and keeps the caller code simpler.

A special view on software simplicity can also lead to questionable intermediate
function implementation, can't it?


> Keeping the goto labels in right order needs precision

I can agree to this view.


> and can lead to subtle errors.

The management of jump labels is just another software development challenge
as usual, isn't it?


> Sometimes there is no way to avoid that,

How do you think about to clarify the constraints which you imagine a bit more?


> but here there is.

I disagree to this conclusion.

Would you like to care a bit more for efficiency and software correctness
around the discussed exception handling?

Regards,
Markus
