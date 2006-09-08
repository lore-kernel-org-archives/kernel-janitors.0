From: Bernd Petrovitsch <bernd@firmix.at>
Date: Fri, 08 Sep 2006 08:49:30 +0000
Subject: Re: [KJ] [PATCH] MIN/MAX cleanup
Message-Id: <1157705370.23905.15.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157631741.2452.30.camel@amol.teneoris.com>
In-Reply-To: <1157631741.2452.30.camel@amol.teneoris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2006-09-08 at 09:49 +0200, Henk Vergonet wrote:
[...]
> Should we now also write:
> 	if(uint > (unsigned int)300) {
> instead of
> 	if(uint > 300) {
> 
> Can someone explain this? 

The "int" constant 300 can be silently promoted to an "unsigned int". If
you want an "unsigned int" constant, use "300U".

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
