From: Jaco Kroon <jaco@kroon.co.za>
Date: Sat, 03 Feb 2007 08:38:57 +0000
Subject: Re: [KJ] [RFC] Regarding min/max
Message-Id: <45C44A21.5050508@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45C3E402.3000307@student.ltu.se>
In-Reply-To: <45C3E402.3000307@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> On Sat, 3 Feb 2007, Richard Knutsson wrote:
>>Hi
>>
>>Regarding converting:
>>
>>	a = x < y ? x : y;
>>
>>with
>>	a = min(x, y);
>>and etc.
>>
>>What about variables in structs? It seem to not like the multiple
>>lines in min()/max(), so why not introduce something like: #define
>>__min(x,y) ((x) < (y) ? (x) : (y)) (and use __min() in min() also)?
>>Then there would be no problem to clean up in the structs + the
>>underscores should make people aware it does not type-check.
>>
>>Just a thought
>>/Richard Knutsson

from include/linux/kernel.h:

/*
 * min()/max() macros that also do
 * strict type-checking.. See the
 * "unnecessary" pointer comparison.
 */
#define min(x,y) ({ \
    typeof(x) _x = (x); \
    typeof(y) _y = (y); \
    (void) (&_x = &_y);        \
    _x < _y ? _x : _y; })

#define max(x,y) ({ \
    typeof(x) _x = (x); \
    typeof(y) _y = (y); \
    (void) (&_x = &_y);        \
    _x > _y ? _x : _y; })

So one just need to convert to using these :).

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
