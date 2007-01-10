From: Bernd Petrovitsch <bernd@firmix.at>
Date: Wed, 10 Jan 2007 10:31:21 +0000
Subject: Re: [KJ] what's the deal with using real "boolean" variables?
Message-Id: <1168425081.3028.4.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2007-01-10 at 11:17 +0100, Richard Knutsson wrote:
[...]
> 	if (foo =TRUE) {

This is IMHO ugly for any definition and implementation of boolean in C.
Write it as 
        if (foo) {
Otherwise why don't we write
        if ((foo = TRUE) = TRUE) {
?

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
