From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 08 Jan 2020 12:40:45 +0000
Subject: Re: Improving documentation for programming interfaces
Message-Id: <748b8572-a3b3-c084-e8e3-de420f53e468@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
 <20191220151945.GD59959@mit.edu>
 <17931ddd-76ec-d342-912c-faed6084e863@metux.net>
In-Reply-To: <17931ddd-76ec-d342-912c-faed6084e863@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Enrico Weigelt <lkml@metux.net>, "Theodore Y. Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

> hmm, maybe we could add some kinda-OOP-style metadata into the type documentation ?

I hope so.


> Or maybe extend doxygen to crossref types vs functions operating on them.

An advanced cross-reference variant would be nice (besides the “Elixir”).


>>> It seems that no customised attributes are supported at the moment.
>>> Thus I imagine to specify helpful annotations as macros.
>
> Do you mean _attribute__(...) or comments ?

I propose to encode helpful information into macro calls as needed
for the C programming language.


> I guess he's thinking about some kind of meta-language for expressing
> common things we know from oop-world, like ctors, dtors, getters, etc.

This feedback fits also to my imaginations for a better taxonomy.

Regards,
Markus
