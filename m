From: Simon Arlott <simon@fire.lp0.eu>
Date: Sat, 21 Jul 2007 06:11:01 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <46A1A375.3020900@simon.arlott.org.uk>
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
>> On 20/07/07 18:07, Matthew Wilcox wrote:
>> > sed -i -e 's/^\t*      \(\w*:\)/ \1/' "$@"
>> > 
>> > which will replace the leading tabs and spaces with one space.
>> 
>> ... isn't the space thing a workaround for a "diff -p" bug?
> 
> Yes.  I like not being affected by bugs.  If you prefer to be affected
> by bugs, that's up to you.

Changing the code to fix a utility bug is madness. I think it's been
fixed too...

-- 
Simon Arlott
