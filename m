From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 28 Feb 2020 08:30:27 +0000
Subject: Re: [1/2] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <efe38d09-e73d-97b3-d4be-79194ab2685f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158278834245.14966.6179457011671073018.stgit@devnote2>
 <158278835238.14966.16157216423901327777.stgit@devnote2>
 <8514c830-319b-33e9-025a-79d399674fb3@web.de>
 <20200228143528.209db45e5f0f78474ef83387@kernel.org>
In-Reply-To: <20200228143528.209db45e5f0f78474ef83387@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>> +Also, some subsystem may depend on the boot configuration, and it has own
>>> +root key.
>>
>> Would you like to explain the influence of a key hierarchy any further?
>
> Please read the example (boot time tracer) carefully :)

I find the descriptions still too terse for corresponding relationships.


>> * Can such system limits become more configurable?
>
> No.

The possibility remains to adjust the source code also for special needs.


>>> +(Note: Each key consists of words separated by dot, and value also consists
>>> +of values separated by comma. Here, each word and each value is generally
>>> +called a "node".)
>>
>> I would prefer the interpretation that nodes contain corresponding attributes.
>
> No. Node is a node. It is merely generic.

I hope that the applied ontology will be clarified a bit more.


>> How do you think about to add a link to a formal file format description?
>
> Oh, nice idea. Please contribute it :)

Did you provide it (according to a RST include directive in the subsequent
update step)?

Can it be helpful to reorder any changes for the discussed patch series?

Regards,
Markus
