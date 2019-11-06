From: Eric Sandeen <sandeen@sandeen.net>
Date: Wed, 06 Nov 2019 16:53:20 +0000
Subject: Re: [PATCH][next] xfs: remove redundant assignment to variable error
Message-Id: <b301ff34-8848-d219-f73d-8298e7d9bff0@sandeen.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106155248.266489-1-colin.king@canonical.com>
 <20191106155631.GJ4153244@magnolia>
 <cbb99652-c6b2-c81c-128d-6d85be04fddc@canonical.com>
 <a77fff95-0591-bcca-2541-3fd68c0da908@sandeen.net>
 <a022504e-ed58-8eb4-0a38-9feae2281086@canonical.com>
In-Reply-To: <a022504e-ed58-8eb4-0a38-9feae2281086@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/6/19 10:33 AM, Colin Ian King wrote:
> On 06/11/2019 16:19, Eric Sandeen wrote:
>>
>>
>> On 11/6/19 9:59 AM, Colin Ian King wrote:
>>> On 06/11/2019 15:56, Darrick J. Wong wrote:
>>>> On Wed, Nov 06, 2019 at 03:52:48PM +0000, Colin King wrote:
>>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>>
>>>>> Variable error is being initialized with a value that is never read
>>>>> and is being re-assigned a couple of statements later on. The
>>>>> assignment is redundant and hence can be removed.
>>>>>
>>>>> Addresses-Coverity: ("Unused value")
>>>>
>>>> Er... is there a coverity id that goes with this?
>>>
>>> Unfortunately it is a private one, so it does not make sense to use it.
>>
>> If it's not in the upstream coverity scan (and AFAICT it's not),
> 
> that's because I'm using coverity with improved tuned coverage settings
> and coverity scan is just set on the default low setting.
> 
>> it makes no sense to reference coverity in the commit log.
>> It's not useful to anyone IMHO.
> 
> It's useful for tracking which bugs are being picked up with Coverity
> and the kind of bug issue. I'm trying to gather stats on static analysis
> fixes that land in linux to help catagorize the types of issues with
> fixes landing upstream.

The commit log is public.

The way you've tagged the commit really makes no sense to anyone outside
of your org.

Maybe:

Reported-by: Internal Coverity instance

or something would make more sense to the general public?

-Eric
