From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 14 Apr 2020 09:11:59 +0000
Subject: Re: [PATCH] media: mantis: remove redundant assignment to variable err
Message-Id: <de5e07e8-0bc7-efc5-b9cd-c0b26d9f707e@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410113913.14430-1-colin.king@canonical.com>
 <CAAEAJfCQaCCoShLPTA+EWUhMXdF6bKAxcOCj2SR5nPXMmk7LQg@mail.gmail.com>
 <20200414085922.GA1163@kadam>
In-Reply-To: <20200414085922.GA1163@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 14/04/2020 09:59, Dan Carpenter wrote:
> On Sat, Apr 11, 2020 at 07:53:51PM -0300, Ezequiel Garcia wrote:
>> There's a redundant err assignment right below here,
>> which you can also get rid of:
>>
>> -       err = mantis_frontend_power(mantis, POWER_ON);
>> +       mantis_frontend_power(mantis, POWER_ON);
>>
>> I can't test this, but calling mantis_frontend_power twice
>> is possibly redundant.
> 
> To me that code really looks like a hack-around for flakey hardware and
> I would be afraid to delete it.  But the "err =" could be removed.
> 
>>
>> Also, what's the gain from this cleanup? The driver is super
>> old, and it seems any modern compiler would be oblivious
>> of the redundant assignment.
> 
> Eventually we would like to enable that warning by default but there are
> still thousands of pointless assignments so it will take years of
> small fixes like this.  Generally cleaning up warnings is good.

They are indeed trivial fixes but can allow us to later find real
unassigned variable bugs in the future when new code gets added and does
not set these variables.

Colin
> 
> regards,
> dan carpenter
> 
