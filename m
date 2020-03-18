From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 18 Mar 2020 16:18:52 +0000
Subject: Re: [PATCH] bnx2x: fix spelling mistake "pauseable" -> "pausable"
Message-Id: <4920d5ae-a865-9445-3ebe-1683e668a1f8@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200317182921.482606-1-colin.king@canonical.com>
 <8d9544fe6d413cdd600504e48f301e023b99e17b.camel@perches.com>
 <7ce6d58f-a2d0-7173-0163-f1e3b5f93e65@canonical.com>
 <1bcfc53c523f120a4cf0f19490de506c5704d306.camel@perches.com>
In-Reply-To: <1bcfc53c523f120a4cf0f19490de506c5704d306.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 18/03/2020 16:13, Joe Perches wrote:
> On Wed, 2020-03-18 at 09:16 +0000, Colin Ian King wrote:
>> On 18/03/2020 03:37, Joe Perches wrote:
>>> On Tue, 2020-03-17 at 18:29 +0000, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Bulk rename of variables and literal strings. No functional
>>>> changes.
>>>
>>> I'm not sure either spelling is a "real" word and
>>> pauseable seems more intelligible and less likely
>>> to be intended to be a typo of "possible" to me.
>>
>> It's indeed of marginal benefit. However..
>>
>> https://www.yourdictionary.com/pausable
> 
> Then again there's this:
> https://www.spellcheck.net/misspelled-words/pausable
> 
> Correct spelling for PAUSABLE
>         
>             We think the word pausable is a misspelling.
> 
> and
> 
> https://www.anagrammer.com/crossword/answer/pausable
> 
> The word PAUSABLE is NOT valid in any word game. (Sorry, you cannot play
> PAUSABLE in Scrabble, Words With Friends etc) 
>     

OK, lets NAK this fix :-)  Apologies for the noise.

Colin
