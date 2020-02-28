From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Fri, 28 Feb 2020 03:15:35 +0000
Subject: Re: [PATCH 2/2] Documentation: bootconfig: Add EBNF syntax file
Message-Id: <20200228121535.0c0e0e67fb11f1e07ea18e4c@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <158278834245.14966.6179457011671073018.stgit@devnote2>
        <158278836196.14966.3881489301852781521.stgit@devnote2>
        <2390b729-1b0b-26b5-66bc-92e40e3467b1@web.de>
In-Reply-To: <2390b729-1b0b-26b5-66bc-92e40e3467b1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 27 Feb 2020 20:53:03 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> Thanks for such a contribution.
> 
> 
> > Add an extended Backus–Naur form (EBNF) syntax file for
> 
> Can it matter to mention the specific file format specification version
> which should be applied finally?
> 
> Would you like to refer to any standard variant?

I choose ISO/IEC 14977 : 1996(E), but it seems no good.

Don’t Use ISO/IEC 14977 Extended Backus-Naur Form (EBNF)
https://dwheeler.com/essays/dont-use-iso-14977-ebnf.html

I agree with this article. the ISO 14977 is halfway...
Not easy for human, but not good for machine too.
(at least it should support #xN as same as W3C BNF.

I'll drop it until rewriten by other standerd.

> > bootconfig so that user can logically understand how they
> 
> Wording alternative “… that users can …”?
> 
> 
> > can write correct boot configuration file.
> 
> Related development tools provide some benefits then, don't they?
> 
> 
> 
> …
> > +++ b/Documentation/admin-guide/bootconfig.ebnf
> …
> > +digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
> 
> Can the specification of such alternatives (or value ranges) become
> more compact (depending on a selected standard)?

W3C EBNF support it, ISO14977 doesn't.

> …
> > +++ b/Documentation/admin-guide/bootconfig.rst
> …
> > +Here is the boot configuration file syntax written in EBNF.
> 
> I suggest to replace the abbreviation “EBNF” by the term “extended Backus–Naur form”
> in such a sentence.

I think EBNF is enough.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
