From: Jyri Sarha <jsarha@ti.com>
Date: Fri, 23 Sep 2016 10:37:00 +0000
Subject: Re: GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detection
Message-Id: <cf250b58-8747-2d43-71ad-e211938cbcde@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
 <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
 <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
 <b22e0060-503d-ac31-fe8c-8a356145bec8@ti.com>
 <d9ce49fe-4aab-2138-3ecc-86fa825120fa@users.sourceforge.net>
In-Reply-To: <d9ce49fe-4aab-2138-3ecc-86fa825120fa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>

On 09/23/16 10:36, SF Markus Elfring wrote:
>> I think the "if (node)" in the of_node_put() is there on purpose,
> 
> Yes, of course.
> 
> Does such an implementation detail correspond to a general software design pattern?
> 

Yes it does. For instance standard malloc()/free() implementation [1].

> 
>> because it potentially saves the caller one extra if()-statement
> 
> This can occasionally happen.
> 
> 
>> and keeps the caller code simpler.
> 
> A special view on software simplicity can also lead to questionable intermediate
> function implementation, can't it?
> 

I don't really follow. But in any case I do not see anything
questionable in the current tilcdc_convert_slave_node() implementation.

> 
>> Keeping the goto labels in right order needs precision
> 
> I can agree to this view.
> 
> 
>> and can lead to subtle errors.
> 
> The management of jump labels is just another software development challenge
> as usual, isn't it?
> 

Yes. But usually it pays of to avoid complexity when possible.

> 
>> Sometimes there is no way to avoid that,
> 
> How do you think about to clarify the constraints which you imagine a bit more?
> 

If the the of_node_put() behaviour would not be specified with null
pointer as parameter, there would be such a constraint.

I am beginning to have a feeling that this discussion is not going anywhere.

> 
>> but here there is.
> 
> I disagree to this conclusion.
> 
> Would you like to care a bit more for efficiency and software correctness
> around the discussed exception handling?
> 

No, I would not. I think we have reached the bottom of this discussion.
For the moment I have more important tasks to do.

Best regards,
Jyri

[1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/free.html
