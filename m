From: Bernd Petrovitsch <bernd@firmix.at>
Date: Thu, 27 Aug 2009 12:02:01 +0000
Subject: Re: memcpy
Message-Id: <1251374521.4430.4.camel@gimli.petrovitsch.priv.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4A95B4B4.3020408@uiuc.edu>
In-Reply-To: <4A95B4B4.3020408@uiuc.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mit, 2009-08-26 at 17:18 -0500, Stoyan Gaydarov wrote:
> I wanted to know what memcpy returned as a result, and if it 
> needs/should be checked. There are several places in the kernel where i 
It is IMHO agreed concensus that kernel-implementations of well-known
(and especially C-library) userspace functions have to behave the
same/similar.
Or they get another name if only to avoid confusion.

> noticed it being used but i also saw a warning about the result not 
> being used, so i wanted to know a little more about it.

Use the source, Luke.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

