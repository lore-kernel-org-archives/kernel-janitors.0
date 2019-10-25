From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 13:59:05 +0000
Subject: Re: [PATCH][next] io-wq: fix unintentional integer overflow on left shift
Message-Id: <a13505ab-52f1-b47d-7b1d-45552982fc82@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191025124315.21742-1-colin.king@canonical.com>
 <fc23061e-31ec-8a66-2b62-771121d182de@kernel.dk>
 <02517010-9244-771f-d0ce-558bbebe6a63@kernel.dk>
In-Reply-To: <02517010-9244-771f-d0ce-558bbebe6a63@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 25/10/2019 14:56, Jens Axboe wrote:
> On 10/25/19 6:54 AM, Jens Axboe wrote:
>> On 10/25/19 6:43 AM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Shifting the integer value 1U is evaluated with type unsigned int
>>> using 32-bit arithmetic and then used in an expression that expects
>>> a 64-bit value, so there is potentially an integer overflow. Fix this
>>> by using the BIT_ULL macro to perform the shift and avoid the overflow.
>>
>> Good catch, that should indeed have been 1ULL. I'll fold in your
>> fix, thanks!
> 
> BTW, this missed the same issue on the clear side of it, in
> io_worker_handle_work(). I've fixed that one up the same way.
> 
Ah, good, somehow the scanner missed that.

Colin
