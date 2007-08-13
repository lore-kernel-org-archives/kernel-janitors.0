From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 13 Aug 2007 13:21:03 +0000
Subject: Re: [PATCH 4 of 5 ] /drivers/char/rio ioremap balancing/ returncode
Message-Id: <20070813142103.1fada65f@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070813125056.E10A0DA832@mailserver8.hushmail.com>
In-Reply-To: <20070813125056.E10A0DA832@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Patch 4 of the 5 I sent was the only one with wrapping, and that 
> wrapping existed in abundance in /drivers/char/rio/rio_linux.c file 
> long before I got there.  Several lines in that file exceed 100 
> columns, I think the "winner" was around 142.

Thats not the issue - the patch itself appears to be wrapped and mangled
and is not suitable for application.



