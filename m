From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 06 Mar 2020 09:34:30 +0000
Subject: Re: [PATCH v5.1] Documentation: bootconfig: Update boot configuration documentation
Message-Id: <58f4d6b3-ce3d-d1a5-aa0f-c31c1bbec091@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ef820445-25c5-a312-57d4-25ff3b4d08cf@infradead.org>
 <158341540688.4236.11231142256496896074.stgit@devnote2>
 <f3c51b0a-2a55-6523-96e2-4f9ef0635d9f@web.de>
 <20200306105107.afba066a97db1eb12f290aff@kernel.org>
In-Reply-To: <20200306105107.afba066a97db1eb12f290aff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> If you think you have "any more" update candidates, feel free to make
> an update "patch" and send to us.

I pointed a few change possibilities out already.


> That will be the next step.

I got the impression that we are in the process of constructing another patch together
which will fix known wording weaknesses.


By the way:
I wonder about the shown version identifier.
Will the patch numbering need also further considerations?


>> …
>>> +++ b/Documentation/admin-guide/bootconfig.rst
>> …
>>> +If you think that kernel/init options become too long to write in boot-loader
>>> +configuration file or you want to comment on each option, the boot
>>> +configuration may be suitable. …
>>
>> Would you like to specify any settings in the boot configuration file
>> because the provided storage capacity would be too limited by the kernel command line?
>
> Yes.

How will affected places be improved after such an agreement?

Regards,
Markus
