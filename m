From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 29 Aug 2017 18:50:10 +0000
Subject: Re: [PATCH 1/2] bus: arm-ccn: Check memory allocation failure
Message-Id: <0339684f-b1e6-41b7-073c-b904194fa99c@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170827100650.13236-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170827100650.13236-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Le 29/08/2017 à 10:49, Pawel Moll a écrit :
> On Sun, 2017-08-27 at 12:06 +0200, Christophe JAILLET wrote:
>> Check memory allocation failures and return -ENOMEM in such cases
>>
>> This avoids a potential NULL pointer dereference.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> This is an obvious bug, thanks for spotting and fixing it! I'll include
> this patch next time I send a pull request for CCN fixes.
>
> May I also ask how have you noticed it? Some automated tool or just
> manual code inspection?
>
> Regards
>
> Pawel
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Hi,

this has been found using coccinelle and the following script:

----------------------

// find calls to kmalloc or equivalent function
@call@
expression ptr;
position p;
@@

(
    ptr@p = kmalloc(...)
|
    ptr@p = kzalloc(...)
|
    ptr@p = kcalloc(...)
|
    ptr@p = kmemdup(...)
|
    ptr@p = kstrdup(...)
|
    ptr@p = kstrdup_const(...)
|
    ptr@p = kstrndup(...)
|
    ptr@p = kmalloc_array(...)
|
    ptr@p = devm_kmalloc(...)
|
    ptr@p = devm_kzalloc(...)
|
    ptr@p = devm_kcalloc(...)
|
    ptr@p = devm_kmalloc_array(...)
|
    ptr@p = devm_kmemdup(...)
|
    ptr@p = devm_kstrdup(...)
)


// Find ok calls with allocation failure check
//... when != ptr
@ok@
expression ptr;
position call.p;
identifier f;
@@

ptr@p = f(...);
...
(
    (ptr = NULL || ...)
|
    (ptr = 0 || ...)
|
    (ptr != NULL || ...)
|
    ((ptr) = NULL || ...)
|
    ((ptr) = 0 || ...)
|
    ((ptr) != NULL || ...)
|
    (BUG_ON(ptr = NULL))
)


// Find bad calls without any check
@depends on !ok@
expression ptr;
position call.p;
identifier f;
constant C;
@@

*  ptr@p = f(...);
    ...
(
    return -C;
|
    return ret;
|
    return err;
)

