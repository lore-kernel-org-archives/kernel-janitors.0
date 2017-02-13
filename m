From: walter harms <wharms@bfs.de>
Date: Mon, 13 Feb 2017 13:28:50 +0000
Subject: Re: [patch net-next] net: qcom/emac: fix a sizeof() typo
Message-Id: <58A1B492.9000103@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170213110021.GA17205@mwanda> <58A19E97.6000704@bfs.de> <23c98d90-913d-f590-2677-096bf5dc15ff@codeaurora.org>
In-Reply-To: <23c98d90-913d-f590-2677-096bf5dc15ff@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 13.02.2017 14:03, schrieb Timur Tabi:
> walter harms wrote:
>> We have a function where the argument is ignored and the rest is const ?
>>
>> emac_ethtool_get_regs_len seems the only user. So it would be fairly
>> easy to
>> move that into that function.
>>
>> @maintainer:
>> Is there a deeper logic behind this ?
> 
> I don't understand the question.


The question is: why is a simple calculation const*const
separated into a function ?

re,
 wh
