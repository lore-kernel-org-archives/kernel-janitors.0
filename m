From: Simon Arlott <simon@fire.lp0.eu>
Date: Sat, 21 Jul 2007 06:12:32 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <46A1A3D0.4010704@simon.arlott.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org> <46A0F282.8070103@simon.arlott.org.uk> <20070720180019.GJ14791@parisc-linux.org>
In-Reply-To: <20070720180019.GJ14791@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/07/07 19:00, Matthew Wilcox wrote:
> On Fri, Jul 20, 2007 at 06:36:02PM +0100, Simon Arlott wrote:
>> Mass
>> replacing any labels run through Lindent with space prefixes would seem
>> like a bad idea :/
> 
> We don't tend to mass-run code through Lindent.  This may or may not be
> a bad thing, but the fact is that it just doesn't happen.

I realise that, and it would be a big mess to do so - but when code is
run through it, it shouldn't modify existing good code into slightly
worse code.

-- 
Simon Arlott
