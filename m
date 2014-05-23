From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Fri, 23 May 2014 09:47:16 +0000
Subject: Re: [PATCH RFC] Remove useless return variables
Message-Id: <CAL3LdT78NA0t6i-LW8ZSBdMaZpqkO7Ht4He+4iqiKrxCZuKFPw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400379310-10214-1-git-send-email-peter.senna@gmail.com>
	<87y4xzpti4.fsf@tassilo.jf.intel.com>
	<CA+MoWDqQ552d+DGJBc0i_=AQV1ueTGQX=ie0wSM+pqqtUOr3TA@mail.gmail.com>
In-Reply-To: <CA+MoWDqQ552d+DGJBc0i_=AQV1ueTGQX=ie0wSM+pqqtUOr3TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Sun, May 18, 2014 at 5:14 AM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> Added CC: trivial@vger.kernel.org
>
> On Sun, May 18, 2014 at 7:04 AM, Andi Kleen <andi@firstfloor.org> wrote:
>> Peter Senna Tschudin <peter.senna@gmail.com> writes:
>>
>>> This patch remove variables that are initialized with a constant,
>>> are never updated, and are only used as parameter of return.
>>> Return the constant instead of using a variable.
>>
>> This ret variable pattern is pretty standard in Linux, as it makes it
>> easier to add new code that may trigger new errors
>> (using the usual "goto forest" error handling pattern)
> The average age in days of the return statements my patch changes is
> 1384, which is more than 3 years, so, in average, the plan of adding
> new code was lost...
> See: http://pastebin.com/2k13sHU2
>
>>
>> I don't see any benefit in whole-sale removing it. The compiler
>> doesn't care about it and will generate the same code in any
>> case.
> My goal is to make the code cleaner and easier to understand.
>
> Should I split this into a lot of patches?
>
>>
>> -Andi
>>
>> --
>> ak@linux.intel.com -- Speaking for myself only
>
>
>
> --
> Peter

NAK on the drivers/net/ethernet/intel/i40e/i40e_dcb.c change because I
have patches currently in my queue that make the return variable
necessary.

-- 
Cheers,
Jeff
