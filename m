From: Jarod Wilson <jarod@wilsonet.com>
Date: Thu, 02 Dec 2010 18:55:34 +0000
Subject: Re: [PATCH] media: rc: ir-lirc-codec: fix potential integer overflow
Message-Id: <1FD24437-CC81-41A5-A28E-129166754553@wilsonet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101202045126.GA1784@bicker> <20101202150045.GA32168@redhat.com>
In-Reply-To: <20101202150045.GA32168@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Vasiliy Kulikov <segoon@openwall.com>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, =?iso-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Dec 2, 2010, at 10:00 AM, Jarod Wilson wrote:

> On Thu, Dec 02, 2010 at 07:51:26AM +0300, Dan Carpenter wrote:
>> On Fri, Nov 26, 2010 at 08:06:35PM +0300, Vasiliy Kulikov wrote:
>>> 	count = n / sizeof(int);
>>> -	if (count > LIRCBUF_SIZE || count % 2 = 0)
>>> +	if (count > LIRCBUF_SIZE || count % 2 = 0 || n % sizeof(int) != 0)
>>                                                      ^^^^^^^^^^^^^^^^^^^^
>> 
>> Wait, what?  We just checked this a couple lines before.
> 
> Bah. I'd only looked at the diff, which didn't have enough context. I
> thought that looked familiar. Indeed, this part seems to be unnecessary.
> 
>> The rest of the patch is right and a clever catch.  It would affect 
>> x86_64 systems and not i386.  This doesn't have security implications
>> does it?  You'd just catch the kmalloc() stack trace for insanely large
>> allocations.
> 
> Even on x86_64, it looks to my (relatively untrained) eye like you'd
> actually be fine. n is a size_t (so, 64-bit on x86_64). count is an int
> (so 32-bit on x86_64). We initialize count to some 64-bit value / 4, so
> at most, 16 bits, which always fits just fine in the 32-bit int, no?

Never mind, I shouldn't be allowed near computers on too little sleep.
Its been pointed out to me how incredibly incorrect and stupid what I
said above is. :)

(i.e., we're not dividing the bits by 4, we're dividing a 64-bit value
by 4, so you're still in 62-bit territory.)

/me sticks head back in sand

-- 
Jarod Wilson
jarod@wilsonet.com



