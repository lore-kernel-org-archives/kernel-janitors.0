From: Bernd Petrovitsch <bernd@firmix.at>
Date: Sun, 25 Mar 2007 22:35:35 +0000
Subject: Re: [KJ] [PATCH] dvb: remove coding style comments on indentation
Message-Id: <1174862136.4015.24.camel@gimli.at.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4606E766.3090100@linuxtv.org>
In-Reply-To: <4606E766.3090100@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 2007-03-25 at 17:16 -0500, Mike Isely wrote:
> The setting I know is called indent-tabs-mode, not c-indent-tabs-mode.  

It seems to me that they aer somwhat similar, If I read
http://www.emacswiki.org/cgi-bin/wiki/IndentingC.

> It's also not better or worse than c-basic-offset; it's complementary.  
> The following all work together:
[ ... concise description deleted ...]
> illustrate the relationship among those settings.  So just "eliminating" 
> c-basic-offset and replacing it with indent-tabs-mode doesn't accomplish 
> what one might expect.

Sorry, I never meant replacing but adding it to enforce the CodingStyle.
And adding "tab-width: 8" is also not wrong (and *if* there is a correct
default value for tab-width:, it is IMHO 8).

> I think it's good form to have all those settings in a source file (with 
> c-basic-offset set to 8 not four like the example above).  It's not 

/me too.

> redundant with the documented style.  It causes anyone who loads the 
> file with emacs to automatically adopt the indentation conventions 
> intended for that source file and that has to be a good thing.
> 
> I for one work in environments other than v4l-dvb, and those other 
> environments don't always have the same coding style.  To me it makes 
> perfect sense that the coding style can be encoded into the source file 
> itself.  Then I don't have to worry about manually reconfiguring my 

Yup. Actually vi/vim supports similar annotations.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
