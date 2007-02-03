From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sat, 03 Feb 2007 19:01:41 +0000
Subject: Re: [KJ] [RFC] Regarding min/max
Message-Id: <45C4DC15.9050308@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45C3E402.3000307@student.ltu.se>
In-Reply-To: <45C3E402.3000307@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Jaco Kroon wrote:
> Robert P. J. Day wrote:
>   
>> On Sat, 3 Feb 2007, Richard Knutsson wrote:
>>     
>>> Hi
>>>
>>> Regarding converting:
>>>
>>> 	a = x < y ? x : y;
>>>
>>> with
>>> 	a = min(x, y);
>>> and etc.
>>>
>>> What about variables in structs? It seem to not like the multiple
>>> lines in min()/max(), so why not introduce something like: #define
>>> __min(x,y) ((x) < (y) ? (x) : (y)) (and use __min() in min() also)?
>>> Then there would be no problem to clean up in the structs + the
>>> underscores should make people aware it does not type-check.
>>>
>>> Just a thought
>>> /Richard Knutsson
>>>       
>
> from include/linux/kernel.h:
>
> /*
>  * min()/max() macros that also do
>  * strict type-checking.. See the
>  * "unnecessary" pointer comparison.
>  */
> #define min(x,y) ({ \
>     typeof(x) _x = (x); \
>     typeof(y) _y = (y); \
>     (void) (&_x = &_y);        \
>     _x < _y ? _x : _y; })
>
> #define max(x,y) ({ \
>     typeof(x) _x = (x); \
>     typeof(y) _y = (y); \
>     (void) (&_x = &_y);        \
>     _x > _y ? _x : _y; })
>
> So one just need to convert to using these :).
>
> Jaco
>   
Hmm, seems I pushed the "Reply" instead of "Reply all"-button when 
answering Randy.
I tried to recreate the compile-failure (was some time ago since it 
happened) when using min()/max() in a struct but it happily compiled it 
so (thankfully) you are correct, just need to use min()/max(). :)

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
