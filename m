From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Thu, 21 Jan 2016 20:00:09 +0000
Subject: Re: [PATCH] cleancache: constify cleancache_ops structure
Message-Id: <8760ymln3q.fsf@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450904784-17139-1-git-send-email-Julia.Lawall@lip6.fr>
	<20160120222000.GA6765@char.us.oracle.com>
In-Reply-To: <20160120222000.GA6765@char.us.oracle.com> (Konrad Rzeszutek
	Wilk's message of "Wed, 20 Jan 2016 17:20:00 -0500")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org

On Wed, Jan 20 2016, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:

> On Wed, Dec 23, 2015 at 10:06:24PM +0100, Julia Lawall wrote:
>> The cleancache_ops structure is never modified, so declare it as const.
>> 
>> This also removes the __read_mostly declaration on the cleancache_ops
>> variable declaration, since it seems redundant with const.
>> 
>> Done with the help of Coccinelle.
>> 
>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>> 
>> ---
>> 
>> Not sure that the __read_mostly change is correct.  Does it apply to the
>> variable, or to what the variable points to?
>
> It should just put the structure in the right section (.rodata).
>
> Thanks for the patch!

The __read_mostly marker should probably be left there...

>>   */
>> -static struct cleancache_ops *cleancache_ops __read_mostly;
>> +static const struct cleancache_ops *cleancache_ops;
>>  
>>  /*
>>   * Counters available via /sys/kernel/debug/cleancache (if debugfs is
>> @@ -49,7 +49,7 @@ static void cleancache_register_ops_sb(struct super_block *sb, void *unused)
>>  /*
>>   * Register operations for cleancache. Returns 0 on success.
>>   */
>> -int cleancache_register_ops(struct cleancache_ops *ops)
>> +int cleancache_register_ops(const struct cleancache_ops *ops)
>>  {
>>  	if (cmpxchg(&cleancache_ops, NULL, ops))
>>  		return -EBUSY;
>>

I don't know this code, but I assume that this is mostly a one-time
thing, so once cleancache_ops gets its value assigned, it doesn't
change, and that's what the __read_mostly is about (it applies to the
object declared, not whatever it happens to point to).

(Also, the commit message is slightly inaccurate: it is
tmem_cleancache_ops which is never changed and hence declared const;
changing the various pointers to it to const is just a necessary followup).

Rasmus
