From: Boaz Harrosh <bharrosh@panasas.com>
Date: Mon, 30 Jan 2012 13:45:07 +0000
Subject: Re: [patch] exofs: fix endian conversion in exofs_sync_fs()
Message-Id: <4F269EE3.9070605@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121144311.GA19025@elgon.mountain>
In-Reply-To: <20111121144311.GA19025@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/29/2012 04:29 PM, Dan Carpenter wrote:
> On Sun, Jan 29, 2012 at 05:25:33PM +0300, Dan Carpenter wrote:
>> On Mon, Nov 21, 2011 at 04:57:23PM -0800, Boaz Harrosh wrote:
>>> On 11/21/2011 06:43 AM, Dan Carpenter wrote:
>>>> fscb->s_numfiles is an __le64 field so we need to use cpu_to_le64()
>>>> to get a little endian 64 bit on big endian systems.
>>>>
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> ---
>>>> This is a static checker fix.  Untested.
>>>>
>>>
>>> Will apply. s_numfiles is never used but should be loaded
>>> correctly regardless.
>>>
>>
>> This is still the same in linux-next.
> 

Sorry will fix.

> Also Sparse warns about the following potential stack overflows.
> The kernel has an 8k stack and the upper limit on these array sizes
> are not capped.
> 
> fs/exofs/super.c:562:51: error: bad constant expression
> fs/exofs/super.c:563:38: error: bad constant expression
> 

Do you mean this code:
	struct __alloc_ore_devs_and_exofs_devs {
		/* Twice bigger table: See exofs_init_comps() and comment at
		 * exofs_read_lookup_dev_table()
		 */
=>		struct ore_dev *oreds[numdevs * 2 - 1];
=>		struct exofs_dev eds[numdevs];
	} *aoded;


If so than Sparse should be fixed. It is plain wrong. This complete
structure is kmalloc(ed) two lines below.

The only limit is, perhaps, the entire struct should not be bigger than
PAGE_SIZE but kmalloc would fail and we will not mount. That code is
fine

> regards,
> dan carpenter

Cheers
Boaz
