From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Wed, 08 Jan 2020 12:04:31 +0000
Subject: Re: Improving documentation for programming interfaces
Message-Id: <17931ddd-76ec-d342-912c-faed6084e863@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
 <20191220151945.GD59959@mit.edu>
In-Reply-To: <20191220151945.GD59959@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Theodore Y. Ts'o" <tytso@mit.edu>, Markus Elfring <Markus.Elfring@web.de>
Cc: linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 20.12.19 16:19, Theodore Y. Ts'o wrote:

Hi folks,

> On Fri, Dec 20, 2019 at 02:30:10PM +0100, Markus Elfring wrote:
>> Linux supports some programming interfaces. Several functions are provided
>> as usual. Their application documentation is an ongoing development challenge.
>>
>> Now I would like to clarify possibilities for the specification of desired
>> information together with data types besides properties which are handled by
>> the programming language “C” so far.

@Markus:

hmm, maybe we could add some kinda-OOP-style metadata into the type
documentation ? Or maybe extend doxygen to crossref types vs functions
operating on them.

>> It seems that no customised attributes are supported at the moment.
>> Thus I imagine to specify helpful annotations as macros.

Do you mean _attribute__(...) or comments ?

<snip>

> It's unclear to me what you are requesting/proposing?  Can you be a
> bit more concrete?

@Ted:

I guess he's thinking about some kind of meta-language for expressing
common things we know from oop-world, like ctors, dtors, getters, etc.


Maybe some doxygen experts here, who could tell what we already could
extract from existing sources ?


For start, I'd like to propose a few rules:

* consistent naming of 'release' functions (AFAIK, many of them are
  already named <foo>_put()).
* for each non-trivial (non-private) object/struct, there should be
  a corresponding release function (even if it's just an alias to
  kfree()
* consistent nameing of list-type structs, so generic macros can
  be used on the struct itself (instead just a container list header
  struct)



--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
