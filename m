From: "Scott Thompson" <postfail@hushmail.com>
Date: Mon, 13 Aug 2007 12:50:56 +0000
Subject: Re: [PATCH 4 of 5 ] /drivers/char/rio ioremap balancing/ returncode check
Message-Id: <20070813125056.E10A0DA832@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070813040530.9E0E9DA82E@mailserver8.hushmail.com>
In-Reply-To: <20070813040530.9E0E9DA82E@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alan@lxorguk.ukuu.org.uk
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 13 Aug 2007 06:42:35 -0400 Alan Cox 
<alan@lxorguk.ukuu.org.uk> wrote:

>Your mail client has wrapped the patches. Please resend without 
>wrapping

Much as I'd love to blame my mail client for this one...

Patch 4 of the 5 I sent was the only one with wrapping, and that 
wrapping existed in abundance in /drivers/char/rio/rio_linux.c file 
long before I got there.  Several lines in that file exceed 100 
columns, I think the "winner" was around 142.

I think tackling all the wordwrap issues would belong in a 
different patch as I'm just trying to clean up ioremap usage.  And, 
yes, I contributed *one more* wordwrap issue to the file, but when 
in Rome...

---------------------------------------
Scott Thompson / postfail@hushmail.com
---------------------------------------



