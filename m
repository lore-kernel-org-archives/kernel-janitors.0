From: Al Viro <viro@ftp.linux.org.uk>
Date: Fri, 27 Jul 2007 12:03:32 +0000
Subject: Re: [PATCH 08/68] 0 -> NULL, for arch/m68k
Message-Id: <20070727120332.GX27237@ftp.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17213@ifs.emn.fr> <46A9CF66.90108@sophics.cz>
In-Reply-To: <46A9CF66.90108@sophics.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, geert@linux-m68k.org, zippel@linux-m68k.org, linux-m68k@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Jul 27, 2007 at 12:56:38PM +0200, Petr Stehlik wrote:

> NULL is usually used when checking for an uninitialized pointer, right?

No, we use different LARTs when you do that.
