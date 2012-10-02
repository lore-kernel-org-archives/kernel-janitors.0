From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 12:14:43 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: Add section for subsystem shortname
Message-Id: <20121002121443.GT4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349179024-5319-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1349179024-5319-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: joe@perches.com, gregkh@linuxfoundation.org, davem@davemloft.net, arnd@arndb.de, elezegarcia@gmail.com, Julia.Lawall@lip6.fr, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 02, 2012 at 01:57:04PM +0200, Peter Senna Tschudin wrote:
> The shortname for a subsystem, that is primarly used when sending patches over E-mail, is not stored anywhere in the source code. Actually one need to dig git log or mailing list archives. There is no standard, and the Maintainer choose how to short name his/her subsystem. MAINTAINERS file is the right place for storing this information.
> 
> U is the second letter of Subsystem.
> 
> This will also enable automatic tools like scripts/get_maintainer.pl to provide the correct short name for each filename in the Kernel source tree.
> 

This is pretty useless without a script to parse it.  Also none of
subsystem names you chose as examples are correct.  Please line wrap
your commit message at 72 characters.

regards,
dan carpenter

