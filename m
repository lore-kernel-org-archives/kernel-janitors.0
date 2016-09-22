From: Jyri Sarha <jsarha@ti.com>
Date: Thu, 22 Sep 2016 20:22:48 +0000
Subject: Re: GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detection
Message-Id: <b22e0060-503d-ac31-fe8c-8a356145bec8@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
 <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
 <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
In-Reply-To: <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>

On 09/22/16 21:38, SF Markus Elfring wrote:
>>> The of_node_put() function was called in some cases
>>> by the tilcdc_convert_slave_node() function during error handling
>>> even if the passed variable contained a null pointer.
>>>
>>> * Adjust jump targets according to the Linux coding style convention.
>>>
>>> * Split a condition check for resource detection failures so that
>>>   each pointer from these function calls will be checked immediately.
>>>
>>>   See also background information:
>>>   Topic "CWE-754: Improper check for unusual or exceptional conditions"
>>>   Link: https://cwe.mitre.org/data/definitions/754.html
>>>
>>
>> I don't really agree with this patch.
> 
> This kind of feedback can be fine at first glance.
> 
> 
>> There is no harm in calling of_node_put() with NULL as an argument
> 
> The cost of additional function calls will be eventually not noticed
> just because they belong to an exception handling implementation so far.
> 
> 
>> and because of that there is no point in making the function more complex
> 
> There is inherent software complexity involved.
> 

I think the "if (node)" in the of_node_put() is there on purpose,
because it potentially saves the caller one extra if()-statement and
keeps the caller code simpler.

> 
>> and harder to maintain.
> 
> How do you think about to discuss this aspect a bit more?
> 

Keeping the goto labels in right order needs precision and can lead to
subtle errors. Sometimes there is no way to avoid that, but here there is.

Best regards,
Jyri
