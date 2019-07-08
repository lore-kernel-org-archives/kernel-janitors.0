From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Mon, 08 Jul 2019 14:38:45 +0000
Subject: Re: mfd: asic3: One function call less in asic3_irq_probe()
Message-Id: <143cb102-f310-c3e4-a1fc-ac45690999fa@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
 <20190707005251.GQ17978@ZenIV.linux.org.uk>
 <4b06e2fb-a0ba-56e5-b46b-98e986e6f2fd@web.de>
 <6e8eab5f-1f5c-b3dc-6b65-96a874ec2789@metux.net>
 <b116fc90-9558-8609-d803-7d8da2b66e0a@web.de>
In-Reply-To: <b116fc90-9558-8609-d803-7d8da2b66e0a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On 08.07.19 13:50, Markus Elfring wrote:
>>> I suggest to reduce a bit of duplicate source code also at this place.
>>
>> Duplicate code (logic) or just characters ?
> 
> Both.

You could also complexity for the human reader. That's a point where
personal perception comes in, which needs to be taken into account.

> The code text size can influence this aspect in considerable ways.

It *can*, but not necessarily. I'd prefer leaving this choice to the
maintainer, as he's the one who finally needs to care about all the
code. Discussions about such choices tend to be pointless (personal
perception / taste isn't something that can be debated by argument) and
risks annoying people and waste precious brain time.

> I suggest occasionally again to reconsider consequences around a principle
> like “Don't repeat yourself”.

In general correct. But in some cases repeating a few words can make the
code actually easier to read (psychologic phenomenon - human brains work
very different from computers). This needs to be carefully weighted.

Theorettically, we could do this conversation with much less words,
using some purely logic language, similar to math formulas - but for
most people this hard to do. Therefore, let's make the code easy for
us humans and let the machines (eg. compiler) do the heavy lifting.

>> But that doesn't mean that a particular patch can be accepted
>> or not in the greater context.
> 
> Would you like to find the corresponding change acceptance out at all?

For particular change, I wouldn't really object, but I don't like it
so much either. Some your other changes IMHO do make the code prettier.

>> - it's not a technical
> 
> I got an other impression.

That's the point. Psychology / personal perception plays a big role
here. We can't deduce it by pure logic.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
