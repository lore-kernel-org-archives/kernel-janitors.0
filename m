From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 18 Mar 2015 13:59:10 +0000
Subject: Re: [PATCH v2] Staging: dgnc: release the lock before testing for nullity
Message-Id: <550984AE.5030802@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426684868-24402-1-git-send-email-lambert.quentin@gmail.com>
 <20150318133651.GS10964@mwanda> <550980E5.8080001@gmail.com>
 <20150318135402.GU16501@mwanda>
In-Reply-To: <20150318135402.GU16501@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Lidza Louina <lidza.louina@gmail.com>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>



On 18/03/2015 14:54, Dan Carpenter wrote:
> On Wed, Mar 18, 2015 at 02:43:01PM +0100, Quentin Lambert wrote:
>>
>> On 18/03/2015 14:36, Dan Carpenter wrote:
>>> This changelog still doesn't make sense so I took a look at the code.
>>>
>>> tty_ldisc_deref() is an unlock function.  So this is a lock ordering
>>> bug.  What makes you think the original ordering was correct?  Who
>>> reported this bug?  What are the effects of this bug?
>> I was the one who introduced the ordering change in the first place.
>> I am just trying to fix it because although nobody complained I am not
>> sure of the impact and restoring the previous control flow seems to be the
>> right thing to do.
> Your changelog should tell me this stuff.
Should I send a third version then?
> The original code is wrong.  We take "spin_lock_irqsave(&ch->ch_lock,
> flags);" before we do "ld = tty_ldisc_ref(tp);" so we should deref
> before we unlock.
>
> It's normally:
>
> lock_outer();
> lock_inner();
> unlock_inner();
> unlock_outer();
>
> On the success path we unlock first then deref and that is a mistake.
I didn't know that thank you.
> This kind of change is a bit dangerous though so it requires testing.
Ok, should I act on that? What do you advice?
> regards,
> dan carpenter

