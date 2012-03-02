From: Bart De Schuymer <bdschuym@pandora.be>
Date: Fri, 02 Mar 2012 21:31:23 +0000
Subject: Re: [Bridge] [PATCH 2/3] netfilter: potential null derefence.
Message-Id: <4F513C2B.6030604@pandora.be>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330593434-19275-1-git-send-email-santoshprasadnayak@gmail.com> <20120301123004.GA7250@1984>
In-Reply-To: <20120301123004.GA7250@1984>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: santosh nayak <santoshprasadnayak@gmail.com>, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, bridge@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, bart.de.schuymer@pandora.be, netfilter-devel@vger.kernel.org, shemminger@vyatta.com

Op 1/03/2012 13:30, Pablo Neira Ayuso schreef:
> On Thu, Mar 01, 2012 at 02:47:14PM +0530, santosh nayak wrote:
>> From: Santosh Nayak<santoshprasadnayak@gmail.com>
>>
>> I am getting following error.
>> " net/bridge/netfilter/ebtables.c:269 ebt_do_table()
>>    error: potential null derefence 'cs'"
>>
>>      i = cs[sp].n;  // If cs = Null then this will cause problem.
>
> Very sorry, I didn't see the out label.
>
> I'll apply this to my nf [1] once David takes my previous request for
> pulling.
>

Hi,

Has this patch been tested? Really, that code in the core firewall 
function is there for a reason, wouldn't you think?
The chainstack is only allocated when user-defined chains are used (see 
translate_table).
Never blindly trust a tool.

Bart
